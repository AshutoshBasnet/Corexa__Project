document.addEventListener("DOMContentLoaded", function () {
    setupMobileMenu();
    setupTabs();
    setupCollectionViewToggle();
    setupAdminFormToggles();
    setupAdminProductFilters();
    setupConfirmLinks();
    setupTableExport();
});

function setupMobileMenu() {
    var toggle = document.querySelector("[data-mobile-menu-toggle]");
    var nav = document.querySelector("[data-mobile-menu]");

    if (!toggle || !nav) {
        return;
    }

    toggle.addEventListener("click", function () {
        var isOpen = nav.classList.toggle("is-open");
        toggle.setAttribute("aria-expanded", isOpen ? "true" : "false");
    });
}

function setupTabs() {
    var tabGroups = document.querySelectorAll("[data-tabs]");

    tabGroups.forEach(function (group) {
        var buttons = group.querySelectorAll("[data-tab-target]");
        var scope = group.getAttribute("data-tabs");
        var panels = document.querySelectorAll('[data-tab-panel][data-tab-scope="' + scope + '"]');

        buttons.forEach(function (button) {
            button.addEventListener("click", function () {
                var targetName = button.getAttribute("data-tab-target");

                buttons.forEach(function (item) {
                    item.classList.remove("is-active");
                });

                panels.forEach(function (panel) {
                    panel.classList.remove("is-active");
                });

                button.classList.add("is-active");

                var activePanel = document.querySelector('[data-tab-panel="' + targetName + '"][data-tab-scope="' + scope + '"]');
                if (activePanel) {
                    activePanel.classList.add("is-active");
                }
            });
        });
    });
}

function setupCollectionViewToggle() {
    var toggle = document.querySelector("[data-view-toggle]");
    var grid = document.querySelector("[data-collection-grid]");

    if (!toggle || !grid) {
        return;
    }

    toggle.addEventListener("click", function () {
        var isCompact = grid.classList.toggle("is-compact");
        toggle.classList.toggle("is-active", isCompact);
    });
}

function setupAdminFormToggles() {
    var toggles = document.querySelectorAll("[data-toggle-target]");

    toggles.forEach(function (toggle) {
        toggle.addEventListener("click", function () {
            var targetId = toggle.getAttribute("data-toggle-target");
            var panel = document.getElementById(targetId);

            if (!panel) {
                return;
            }

            panel.classList.toggle("is-open");
            toggle.classList.toggle("is-active", panel.classList.contains("is-open"));

            if (panel.classList.contains("is-open")) {
                panel.scrollIntoView({ behavior: "smooth", block: "start" });
            }
        });
    });
}

function setupAdminProductFilters() {
    var search = document.querySelector("[data-product-search]");
    var category = document.querySelector("[data-product-category-filter]");
    var rows = document.querySelectorAll("[data-product-row]");

    if (!rows.length) {
        return;
    }

    function applyFilters() {
        var searchTerm = search ? search.value.toLowerCase().trim() : "";
        var categoryTerm = category ? category.value.toLowerCase().trim() : "";

        rows.forEach(function (row) {
            var name = (row.getAttribute("data-name") || "").toLowerCase();
            var rowCategory = (row.getAttribute("data-category") || "").toLowerCase();
            var matchesSearch = !searchTerm || name.indexOf(searchTerm) !== -1 || rowCategory.indexOf(searchTerm) !== -1;
            var matchesCategory = !categoryTerm || rowCategory === categoryTerm;

            row.hidden = !(matchesSearch && matchesCategory);
        });
    }

    if (search) {
        search.addEventListener("input", applyFilters);
    }

    if (category) {
        category.addEventListener("change", applyFilters);
    }
}

function setupConfirmLinks() {
    var links = document.querySelectorAll("[data-confirm]");

    links.forEach(function (link) {
        link.addEventListener("click", function (event) {
            var message = link.getAttribute("data-confirm");

            if (message && !window.confirm(message)) {
                event.preventDefault();
            }
        });
    });
}

function setupTableExport() {
    var button = document.querySelector("[data-export-table]");
    var table = document.querySelector("[data-export-source]");

    if (!button || !table) {
        return;
    }

    button.addEventListener("click", function () {
        var rows = Array.prototype.slice.call(table.querySelectorAll("tr"));
        var csv = rows.map(function (row) {
            var cells = Array.prototype.slice.call(row.querySelectorAll("th, td"));

            return cells
                .slice(0, 6)
                .map(function (cell) {
                    return '"' + cell.textContent.replace(/\s+/g, " ").trim().replace(/"/g, '""') + '"';
                })
                .join(",");
        }).join("\n");

        var blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
        var link = document.createElement("a");
        link.href = URL.createObjectURL(blob);
        link.download = "corexa-inventory.csv";
        link.click();
        URL.revokeObjectURL(link.href);
    });
}
