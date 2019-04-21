const modify = document.querySelector('#modify-website');
const modifyA = document.querySelector('#modifyA');

const modifyWebsite = () => {

  modify.addEventListener('click', function() {
      modifyA.classList.toggle("show-widget");
  });
}

export {modifyWebsite}
