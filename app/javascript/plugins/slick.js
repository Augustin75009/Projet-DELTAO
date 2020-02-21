import $ from 'jquery'
import slick from 'slick-carousel'
import 'slick-carousel/slick/slick.css'
import 'slick-carousel/slick/slick-theme.css'

// save : <i class="fas fa-chevron-circle-right slick"></i>



const initSlick = () => {
 $(document).ready(function(){
      $('.list-carrousel').slick({
        adaptiveHeight: true,
        prevArrow: '<button type="button" class="slick-prev"></button>',
        nextArrow: '<button type="button" class="slick-next"></button>'
      });
    });
}


export { initSlick }
