import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'

const alert = () => {
  const CGV = document.querySelector('#select-cgv');
  CGV.addEventListener('click', function() {
    Swal.fire({
      title: 'Condition général de vente',
      text: "Après avoir effectué une réservation en ligne ou réalisé une inscription à  l'atelier en versant un acompte, vous avez une semaine pour annuler votre achat. Ce délai passé aucun remboursement ne pourra être envisagé. Toute année, semestre ou trimestre commencé ne peut être remboursé.",
      type: 'warning'
    });
  });
}


export { alert }
