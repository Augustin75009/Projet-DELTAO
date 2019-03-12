const height = document.querySelector('.lessons-overview');
const events = document.querySelector('.events');
const navbar = document.querySelector('#header');

const eventSticked = () => {
  const targetHeight = height.clientHeight;
  const navbarHeight = navbar.clientHeight;
  window.addEventListener('scroll', function(e) {
    if (window.scrollY > targetHeight) {
      events.classList.add("sticked")
      events.setAttribute("style", `top: ${window.scrollY - targetHeight}px`);
    } else {
      events.classList.remove("sticked")
    }
  })
}


export {eventSticked}
