// Navbar click to show
let navBar = document.querySelector('.header__navbar');
navBar.onclick = function(e) {
    this.classList.toggle('menu-openned');
    document.querySelector('.header__logo').classList.toggle('menu-openned');
    document.querySelector('.header__menu').classList.toggle('active');
};

// Scroll Header
window.onscroll = () => {
    if (document.documentElement.scrollTop > 10) {
        document.querySelector(".header").classList.add('active');
    } else {
        document.querySelector(".header").classList.remove('active');
    }

    // if (document.documentElement.scrollTop > 700) {
    //     document.querySelector(".backToTop").classList = "backToTop active";
    // } else {
    //     document.querySelector(".backToTop").classList = "backToTop";
    // }
}