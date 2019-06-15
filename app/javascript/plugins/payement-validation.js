import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'

const validation = () => {
  const Toast = Swal.mixin({
    margin: '0px',
  });
  Toast.fire({
    position: 'center',
    type: 'success',
    title: 'Réservation prise en compte',
    showConfirmButton: false,
    timer: 2000
  })
}


export { validation }
