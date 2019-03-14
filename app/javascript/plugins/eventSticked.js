// const height = document.querySelector('.lessons-overview');
const events = document.querySelector('.events');
const navbar = document.querySelector('#header');
const body = document.querySelector('body');
const footer = document.querySelector('.footer');


const eventSticked = () => {
  // const targetHeight = height.clientHeight;
  const navbarHeight = navbar.clientHeight;
  const eventHeight = events.clientHeight;
  const bodyHeight = body.clientHeight;
  // const footerHeight = footer.clientHeight;
  window.addEventListener('scroll', function(e) {
    // console.log(body.clientHeight)
    // console.log(window.scrollY)
    if ( window.innerWidth > 550 ) {
      if ((window.scrollY > (bodyHeight - eventHeight)) && ( window.innerHeight < (700) )) {
        // events.classList.add("sticked")
        events.setAttribute("style", `position: relative; bottom: ${-(bodyHeight - eventHeight - 340)}px`);
      } else if (window.scrollY > navbarHeight) {
        events.classList.add("sticked")
        events.setAttribute("style", `top: ${window.scrollY - navbarHeight}px`);
      } else {
        events.classList.remove("sticked")
      }
    }
  })
}


export {eventSticked}
