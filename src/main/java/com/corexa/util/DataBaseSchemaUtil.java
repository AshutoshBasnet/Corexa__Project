package com.corexa.util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBaseSchemaUtil {

	private DataBaseSchemaUtil() {
	}

	public static boolean ensureAccountStatusColumn(Connection connection) {
		if (connection == null) {
			return false;
		}

		try {
			if (hasColumn(connection, "user", "account_status")) {
				return true;
			}

			try (Statement statement = connection.createStatement()) {
				statement.executeUpdate(
						"ALTER TABLE user ADD COLUMN account_status VARCHAR(20) NOT NULL DEFAULT 'PENDING'");
				statement.executeUpdate("UPDATE user SET account_status = 'APPROVED' WHERE userRole = 'admin'");
			}

			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean hasColumn(Connection connection, String tableName, String columnName) throws SQLException {
		DatabaseMetaData metadata = connection.getMetaData();
		try (ResultSet columns = metadata.getColumns(connection.getCatalog(), null, tableName, columnName)) {
			if (columns.next()) {
				return true;
			}
		}

		try (ResultSet columns = metadata.getColumns(connection.getCatalog(), null, tableName, columnName.toLowerCase())) {
			return columns.next();
		}
	}
}
