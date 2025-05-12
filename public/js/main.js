// Галерея – відкриття модального вікна
document.addEventListener("DOMContentLoaded", function () {
  const modal = document.getElementById("imageModal");
  const modalImg = document.getElementById("modalImage");
  const caption = document.getElementById("modalCaption");

  document.querySelectorAll(".gallery-grid img").forEach(img => {
    img.addEventListener("click", () => {
      modal.style.display = "block";
      modalImg.src = img.src;
      caption.innerText = img.alt || "Зображення";
    });
  });

  document.getElementById("modalClose").addEventListener("click", () => {
    modal.style.display = "none";
  });

  window.addEventListener("click", (e) => {
    if (e.target === modal) {
      modal.style.display = "none";
    }
  });
});

// Плавна прокрутка
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener("click", function (e) {
    const target = document.querySelector(this.getAttribute("href"));
    if (target) {
      e.preventDefault();
      target.scrollIntoView({
        behavior: "smooth"
      });
    }
  });
});
