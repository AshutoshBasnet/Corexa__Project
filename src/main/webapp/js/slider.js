document.addEventListener("DOMContentLoaded", function () {
    const slider = document.querySelector(".hero-slider, .slider");
    if (!slider) return;

    const slideTrack = slider.querySelector(".slide");
    if (!slideTrack) return;

    const originalSlides = Array.from(slideTrack.querySelectorAll("img"));
    if (originalSlides.length <= 1) return;

    const dots = Array.from(slider.querySelectorAll(".hero-dots span"));
    const nextBtn = slider.querySelector(".hero-arrow-right");
    const prevBtn = slider.querySelector(".hero-arrow-left");

    let currentIndex = 0;
    let isMoving = false;
    let autoSlide;

    const firstClone = originalSlides[0].cloneNode(true);
    slideTrack.appendChild(firstClone);

    const allSlides = Array.from(slideTrack.querySelectorAll("img"));

    slideTrack.style.display = "flex";
    slideTrack.style.transition = "transform 900ms cubic-bezier(0.22, 1, 0.36, 1)";
    slideTrack.style.willChange = "transform";

    allSlides.forEach(function (img) {
        img.style.flex = "0 0 100%";
        img.style.width = "100%";
    });

    function getSlideWidth() {
        return slider.offsetWidth;
    }

    function updateDots() {
        if (!dots.length) return;

        dots.forEach(function (dot, index) {
            dot.classList.toggle("active", index === currentIndex % originalSlides.length);
        });
    }

    function moveToSlide(index, smooth = true) {
        if (smooth) {
            slideTrack.style.transition = "transform 900ms cubic-bezier(0.22, 1, 0.36, 1)";
        } else {
            slideTrack.style.transition = "none";
        }

        slideTrack.style.transform = "translate3d(-" + index * getSlideWidth() + "px, 0, 0)";
        updateDots();
    }

    function nextSlide() {
        if (isMoving) return;

        isMoving = true;
        currentIndex++;
        moveToSlide(currentIndex, true);
    }

    function prevSlide() {
        if (isMoving) return;

        isMoving = true;

        if (currentIndex === 0) {
            currentIndex = originalSlides.length;
            moveToSlide(currentIndex, false);

            requestAnimationFrame(function () {
                requestAnimationFrame(function () {
                    currentIndex--;
                    moveToSlide(currentIndex, true);
                });
            });
        } else {
            currentIndex--;
            moveToSlide(currentIndex, true);
        }
    }

    slideTrack.addEventListener("transitionend", function () {
        if (currentIndex === originalSlides.length) {
            currentIndex = 0;
            moveToSlide(currentIndex, false);
        }

        isMoving = false;
        updateDots();
    });

    function startAutoSlide() {
        autoSlide = setInterval(nextSlide, 4500);
    }

    function resetAutoSlide() {
        clearInterval(autoSlide);
        startAutoSlide();
    }

    if (nextBtn) {
        nextBtn.addEventListener("click", function () {
            nextSlide();
            resetAutoSlide();
        });
    }

    if (prevBtn) {
        prevBtn.addEventListener("click", function () {
            prevSlide();
            resetAutoSlide();
        });
    }

    dots.forEach(function (dot, index) {
        dot.addEventListener("click", function () {
            if (isMoving) return;

            currentIndex = index;
            moveToSlide(currentIndex, true);
            resetAutoSlide();
        });
    });

    window.addEventListener("resize", function () {
        moveToSlide(currentIndex, false);
    });

    slider.addEventListener("mouseenter", function () {
        clearInterval(autoSlide);
    });

    slider.addEventListener("mouseleave", function () {
        startAutoSlide();
    });

    moveToSlide(0, false);
    startAutoSlide();
});