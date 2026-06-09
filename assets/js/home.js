// Lightweight recommendations carousel: scroll-snap track + dots + prev/next.
(function () {
  const track = document.getElementById("recs-track");
  const dotsContainer = document.getElementById("recs-dots");
  const prevBtn = document.getElementById("recs-prev");
  const nextBtn = document.getElementById("recs-next");

  if (!track) return;

  const slides = Array.from(track.querySelectorAll(".recs-slide"));
  if (slides.length === 0) return;

  let current = 0;

  const dots = slides.map((_, i) => {
    const dot = document.createElement("button");
    dot.className = "recs-dot" + (i === 0 ? " is-active" : "");
    dot.setAttribute("aria-label", "Go to slide " + (i + 1));
    dot.addEventListener("click", () => scrollToIndex(i));
    dotsContainer && dotsContainer.appendChild(dot);
    return dot;
  });

  function setActive(index) {
    current = index;
    dots.forEach((dot, i) => dot.classList.toggle("is-active", i === index));
  }

  function scrollToIndex(index) {
    const clamped = Math.max(0, Math.min(index, slides.length - 1));
    track.scrollTo({ left: slides[clamped].offsetLeft, behavior: "smooth" });
    setActive(clamped);
  }

  prevBtn &&
    prevBtn.addEventListener("click", () =>
      scrollToIndex(current === 0 ? slides.length - 1 : current - 1)
    );
  nextBtn &&
    nextBtn.addEventListener("click", () =>
      scrollToIndex(current === slides.length - 1 ? 0 : current + 1)
    );

  // Keep dots in sync when the user swipes/scrolls manually.
  let scrollTimer = null;
  track.addEventListener("scroll", () => {
    if (scrollTimer) window.clearTimeout(scrollTimer);
    scrollTimer = window.setTimeout(() => {
      const index = Math.round(track.scrollLeft / track.clientWidth);
      setActive(Math.max(0, Math.min(index, slides.length - 1)));
    }, 80);
  });
})();
