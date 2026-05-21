document.addEventListener("DOMContentLoaded", function () {
    setupProductTabs();
    setupViewToggle();
});

function setupProductTabs() {
    const tabContainer = document.querySelector("[data-tabs]");

    if (!tabContainer) {
        return;
    }

    const buttons = tabContainer.querySelectorAll("[data-tab-target]");
    const panels = document.querySelectorAll("[data-tab-panel]");

    buttons.forEach(function (button) {
        button.addEventListener("click", function () {
            const targetName = button.getAttribute("data-tab-target");

            buttons.forEach(function (item) {
                item.classList.remove("active");
            });

            panels.forEach(function (panel) {
                panel.classList.remove("active");
            });

            button.classList.add("active");

            const activePanel = document.querySelector('[data-tab-panel="' + targetName + '"]');

            if (activePanel) {
                activePanel.classList.add("active");
            }
        
        });
    });
}

function setupViewToggle() {
    const toggle = document.querySelector("[data-view-toggle]");
    const grid = document.querySelector(".collection-grid");

    if (!toggle || !grid) {
        return;
    }

    toggle.addEventListener("click", function () {
        grid.classList.toggle("compact-view");
    });
}