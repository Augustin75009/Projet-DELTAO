const modify = document.querySelector('#modify-website');
const modifyA = document.querySelector('#modifyA');
const modifyB = document.querySelector('#modifyB');
const modifyC = document.querySelector('#modifyC');

const modifyWebsite = () => {

  modify.addEventListener('click', function() {
      modifyA.classList.toggle("show-widget");
      // modifyB.classList.toggle("show-widget");
      // modifyC.classList.toggle("show-widget");
  });
}

export {modifyWebsite}
