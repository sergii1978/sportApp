# sportApp
ruby sinatra app

# 🧩 Non-Functional Requirements (NFR) for Fitness Club Website

## 1. Performance

* Homepage load time must not exceed 2 seconds on a 10 Mbps connection.
* Images must be optimized to a maximum of 500 KB each and support WebP format if possible.
* Browser caching should be enabled for all static assets (CSS, JS, images).

## 2. Security

* Admin login is protected via secure session authentication.
* Inputs must be properly escaped to prevent XSS attacks.
* All POST requests are protected against CSRF.
* File upload only accepts valid image types (JPEG, PNG, WebP).

## 3. Scalability

* Codebase should be modular and maintainable.
* Deployment-ready for platforms like Heroku, Render, or Docker.
* SQLite for development; PostgreSQL in production.

## 4. Usability

* Fully responsive design for mobile, tablet, and desktop screens.
* Easy-to-use UI with intuitive navigation.
* Font Awesome icons used for enhanced UX.
* Theme toggle available (light/dark mode).

## 5. Localization

* Full bilingual support: English (en) and Ukrainian (uk).
* Translations managed through YAML files: `en.yml`, `uk.yml`.
* System allows adding more languages with minimal effort.

## 6. SEO & Accessibility

* Proper meta tags for SEO (`title`, `description`, `lang`, `viewport`).
* Robots.txt and sitemap.xml are configured.
* All images include `alt` attributes; semantic HTML is used.

## 7. Maintainability

* Project follows MVC structure (Models, Views, Controllers).
* Clear folder and file organization.
* All templates extend a shared `layout.erb`.
* Content (articles, images, comments) can be added through forms.

---

This README file documents the non-functional expectations and best practices to ensure long-term maintainability and user satisfaction for the fitness club web application built with Sinatra and Bootstrap 5.
