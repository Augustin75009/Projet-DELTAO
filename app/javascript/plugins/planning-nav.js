import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'

const planningNav = () => {
  const planning = document.querySelector('#select-planning-nav-burger');
  const planningFooter = document.querySelector('#select-planning');
  planning.addEventListener('click', function() {
    const h = window.innerHeight - 280;
    const Toast = Swal.mixin({
      confirmButtonColor: '#c28d65',
    });
    Toast.fire({
      imageUrl: 'https://res.cloudinary.com/dw7nokc0j/image/upload/v1561629524/Capture_d_e%CC%81cran_2019-06-27_a%CC%80_11.58.01.png',
      width: 1400,
      imageHeight: 200,
      animation: false
    });
  })
  planningFooter.addEventListener('click', function() {
    const h = window.innerHeight - 280;
    const Toast = Swal.mixin({
      confirmButtonColor: '#c28d65',
    });
    Toast.fire({
      imageUrl: 'https://res.cloudinary.com/dw7nokc0j/image/upload/v1561629524/Capture_d_e%CC%81cran_2019-06-27_a%CC%80_11.58.01.png',
      width: 1400,
      imageHeight: 200,
      animation: false
    });
  })
}


export { planningNav }

