const header = document.querySelector('.header.is-absolute');
const logoLink = document.querySelector('.logo__link');
const logo = document.querySelector('.logo');
const items = document.querySelectorAll('.menu__product__item');
const dropdown = document.querySelector('.dropdown');

var height = window.top.innerHeight;
console.log(dropdown.childNodes[1].attributes.src)

const navbar = () => {

  if(document.location.href.match('lessons') || document.location.href.match('cart') || document.location.href.match('events') || window.innerWidth < 550 ) {
    header.classList.remove('transparent')
    logo.classList.remove('transparent')
    logoLink.classList.remove('transparent')
    items.forEach((item) => {
      item.classList.remove('transparent')
    })
    dropdown.classList.remove('transparent')
  } else {
    header.classList.add('transparent')
    logo.classList.add('transparent')
    logoLink.classList.add('transparent')
    items.forEach((item) => {
      item.classList.add('transparent')
    })
    dropdown.classList.add('transparent')
  }

  document.addEventListener('scroll', (event) => {
    if(document.location.href.match('lessons') || document.location.href.match('cart') || document.location.href.match('events') || window.innerWidth < 550 || window.pageYOffset > 475) {
      header.classList.remove('transparent')
      logo.classList.remove('transparent')
      logoLink.classList.remove('transparent')
      items.forEach((item) => {
        item.classList.remove('transparent')
      })
      dropdown.classList.remove('transparent')
    } else {
      header.classList.add('transparent')
      logo.classList.add('transparent')
      logoLink.classList.add('transparent')
      items.forEach((item) => {
        item.classList.add('transparent')
      })
      dropdown.classList.add('transparent')
    }
  })
}

export {navbar}
