const banner = document.querySelector(".banner");

const parallaxScroll = () => {
  window.addEventListener("scroll", function() {
    console.log(window.pageYOffset);
    const offset = window.pageYOffset;
    banner.style.backgroundPositionY = offset * 0.35 + "px";
  });
}

export {parallaxScroll}
