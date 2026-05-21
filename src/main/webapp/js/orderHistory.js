document.addEventListener("DOMContentLoaded", function () {
    const deleteForms = document.querySelectorAll(".delete-form");

    deleteForms.forEach(function (form) {
        form.addEventListener("submit", function (event) {
            const confirmed = confirm(
                "Are you sure you want to delete this order? This action cannot be undone."
            );

            if (!confirmed) {
                event.preventDefault();
            }
        });
    });
});