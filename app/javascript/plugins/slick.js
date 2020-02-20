import $ from 'jquery'
import slick from 'slick-carousel'
import 'slick-carousel/slick/slick.css'
import 'slick-carousel/slick/slick-theme.css'



const initSlick = () => {
 $(document).ready(function(){
      $('.list-carrousel').slick({
        adaptiveHeight: true,
        prevArrow: '<button type="button" class="slick-prev"><i class="fas fa-chevron-circle-left slick"></i></button>',
        nextArrow: '<button type="button" class="slick-next"><i class="fas fa-chevron-circle-right slick"></i></button>'
      });
    });
}


export { initSlick }
