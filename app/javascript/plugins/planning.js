import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'

const planning = () => {
  const planning = document.querySelector('#select-planning-nav');
  const planningFooter = document.querySelector('#select-planning');
  planning.addEventListener('click', function() {
    const h = window.innerHeight - 280;
    const Toast = Swal.mixin({
      confirmButtonColor: '#c28d65',
    });
    Toast.fire({
      imageUrl: 'https://res.cloudinary.com/dw7nokc0j/image/upload/v1566398052/Group.png',
      width: 1200,
      imageHeight: h,
      animation: false
    });
  })
  planningFooter.addEventListener('click', function() {
    const h = window.innerHeight - 280;
    const Toast = Swal.mixin({
      confirmButtonColor: '#c28d65',
    });
    Toast.fire({
      imageUrl: 'https://res.cloudinary.com/dw7nokc0j/image/upload/v1566398052/Group.png',
      width: 1200,
      imageHeight: h,
      animation: false
    });
  })
}


export { planning }
