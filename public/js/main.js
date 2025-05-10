document.addEventListener('DOMContentLoaded', function () {
  // Зміна теми (темна/світла)
  const themeToggleButton = document.getElementById('themeToggle');
  if (themeToggleButton) {
    themeToggleButton.addEventListener('click', function () {
      document.body.classList.toggle('dark-theme');
    });
  }

  // Ініціалізація слайдера (Bootstrap Carousel)
  const galleryCarousel = document.getElementById('galleryCarousel');
  if (galleryCarousel) {
    new bootstrap.Carousel(galleryCarousel, {
      interval: 2000, // автоматичне перемикання кожні 2 секунди
      ride: 'carousel'
    });
  }

  // Відкриття Lightbox для перегляду великих зображень
  const lightboxModal = document.getElementById('lightboxModal');
  const lightboxImage = document.getElementById('lightboxImage');
  document.querySelectorAll('[data-bs-toggle="modal"]').forEach(link => {
    link.addEventListener('click', function () {
      const imgSrc = this.getAttribute('data-img');
      lightboxImage.setAttribute('src', imgSrc);
    });
  });

  // Форма коментарів
  const commentForm = document.querySelector('form[action="/comments"]');
  if (commentForm) {
    commentForm.addEventListener('submit', function (event) {
      event.preventDefault();

      const author = commentForm.querySelector('[name="author"]').value;
      const body = commentForm.querySelector('[name="body"]').value;

      // Сюди може бути доданий AJAX-запит для відправки даних на сервер
      alert(`Comment by ${author}: ${body}`);
    });
  }
});
