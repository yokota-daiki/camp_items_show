const swiper = new Swiper('.swiper', {
  loop: true,
  spaceBetween: 30,
  effect: "fade",
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
  pagination: {
    el: ".swiper-pagination",
    type: 'bullets',
    clickable: true,
  },
});