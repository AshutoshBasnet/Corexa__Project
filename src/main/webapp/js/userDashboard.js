document.addEventListener("DOMContentLoaded", function () {
    const editToggle = document.getElementById("editToggle");
    const cancelEdit = document.getElementById("cancelEdit");
    const profileFormPanel = document.getElementById("profileFormPanel");
    const profileView = document.getElementById("profileView");
    const profilePicture = document.getElementById("profilePicture");
    const previewImage = document.getElementById("previewImage");

    if (editToggle && profileFormPanel && profileView) {
        editToggle.addEventListener("click", function () {
            profileView.classList.add("is-hidden");
            profileFormPanel.classList.remove("is-hidden");
            editToggle.classList.add("is-hidden");
        });
    }

    if (cancelEdit && profileFormPanel && profileView && editToggle) {
        cancelEdit.addEventListener("click", function () {
            profileFormPanel.classList.add("is-hidden");
            profileView.classList.remove("is-hidden");
            editToggle.classList.remove("is-hidden");
        });
    }

    if (profilePicture && previewImage) {
        profilePicture.addEventListener("change", function (event) {
            const file = event.target.files && event.target.files[0];

            if (!file) {
                return;
            }

            previewImage.src = URL.createObjectURL(file);
        });
    }
});