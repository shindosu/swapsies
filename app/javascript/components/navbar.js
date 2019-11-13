const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {

    window.addEventListener('scroll', () => {
      if (window.scrollY >= 120) {

        navbar.classList.add('navbar-lewagon-white');
        console.log("class white added")
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        console.log("class white removed")

      }
    });
  }
}

export { initUpdateNavbarOnScroll };
