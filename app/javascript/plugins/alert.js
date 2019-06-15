import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'

const alert = () => {
  const CGV = document.querySelector('#select-cgv');
  CGV.addEventListener('click', function() {
    const Toast = Swal.mixin({
      padding: '20px',
      confirmButtonColor: '#c28d65',
    });
    Toast.fire({
      text: "Après avoir effectué une réservation en ligne ou réalisé une inscription à  l'atelier en versant un acompte, vous avez une semaine pour annuler votre achat. Ce délai passé aucun remboursement ne pourra être envisagé. Toute année, semestre ou trimestre commencé ne peut être remboursé.",
      title: "Condition général de vente",
      type: 'info'
    });
  // const test = Toast.getConfirmButton();
  // console.log(test)
  // test.addEventListener('click', function() {
  //   window.location.href = "http://stackoverflow.com";
  // });
  })
}


export { alert }
