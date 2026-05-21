document.addEventListener("DOMContentLoaded", function () {
    const removeForms = document.querySelectorAll(".remove-form");

    removeForms.forEach(function (form) {
        form.addEventListener("submit", function (event) {
            const confirmed = confirm(
                "Are you sure you want to remove this item from your wishlist?"
            );

            if (!confirmed) {
                event.preventDefault();
            }
        });
    });
});