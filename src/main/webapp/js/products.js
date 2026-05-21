document.addEventListener("DOMContentLoaded", function () {
    const toggleButton = document.getElementById("toggleProductForm");
    const cancelButton = document.getElementById("cancelProductForm");
    const formPanel = document.getElementById("addProductForm");
    const deleteLinks = document.querySelectorAll(".product-delete-link");

    function showForm() {
        if (!formPanel) {
            return;
        }

        formPanel.classList.remove("is-hidden");

        setTimeout(function () {
            formPanel.scrollIntoView({
                behavior: "smooth",
                block: "start"
            });
        }, 100);
    }

    function hideForm() {
        if (!formPanel) {
            return;
        }

        formPanel.classList.add("is-hidden");
    }

    if (toggleButton && formPanel) {
        toggleButton.addEventListener("click", function () {
            if (formPanel.classList.contains("is-hidden")) {
                showForm();
            } else {
                hideForm();
            }
        });
    }

    if (cancelButton) {
        cancelButton.addEventListener("click", function () {
            hideForm();
        });
    }

    if (formPanel && !formPanel.classList.contains("is-hidden")) {
        setTimeout(function () {
            formPanel.scrollIntoView({
                behavior: "smooth",
                block: "start"
            });
        }, 250);
    }

    deleteLinks.forEach(function (link) {
        link.addEventListener("click", function (event) {
            const confirmed = confirm("Are you sure you want to delete this product?");

            if (!confirmed) {
                event.preventDefault();
            }
        });
    });
});