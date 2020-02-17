import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'

const alert = () => {
  const cgv = document.getElementById('cgv-wrapper');
  const planning = document.getElementById('planning-wrapper');
  const selectCgv = document.getElementById('select-cgv')
  const selectPlanning = document.getElementById('select-planning-nav')
  cgv.addEventListener('click', function() {
    cgv.toggleAttribute('hidden')
  })
  selectCgv.addEventListener('click', function() {
    cgv.toggleAttribute('hidden')
  })
  planning.addEventListener('click', function() {
    planning.toggleAttribute('hidden')
  })
  selectPlanning.addEventListener('click', function() {
    planning.toggleAttribute('hidden')
  })
}

    // const Toast = Swal.mixin({
    //   padding: '30px',
    //   confirmButtonColor: '#c28d65',
    // });
    // Toast.fire({
    //   html: "<br><p style='font-size: 14px'>Après avoir effectué une réservation en ligne ou réalisé une inscription à  l'atelier en versant un acompte, vous avez une semaine pour annuler votre achat. Ce délai passé aucun remboursement ne pourra être envisagé. Toute année, semestre ou trimestre commencé ne peut être remboursé.</p>",
    //   title: "Condition général de vente",
    //   type: 'info',
    //   animation: false
    // });
  // const test = Toast.getConfirmButton();
  // console.log(test)
  // test.addEventListener('click', function() {
  //   window.location.href = "http://stackoverflow.com";
  // });
  // })


export { alert }
