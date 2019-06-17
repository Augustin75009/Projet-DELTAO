import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'

const planning = () => {
  const planning = document.querySelector('#select-planning-nav');
  planning.addEventListener('click', function() {
    const Toast = Swal.mixin({
      confirmButtonColor: '#c28d65',
    });
    Toast.fire({
      imageUrl: 'https://res.cloudinary.com/dw7nokc0j/image/upload/v1560761290/PLANNING-rentre%CC%81e-16-1.png',
      width: 1200,
      imageHeight: 600,
      animation: false
    });
  })
}


export { planning }
