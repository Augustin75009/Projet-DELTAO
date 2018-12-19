import $ from 'jquery'
import slick from 'slick-carousel'
import 'slick-carousel/slick/slick.css'
import 'slick-carousel/slick/slick-theme.css'



const initSlick = () => {
 $(document).ready(function(){
      $('.list-carrousel').slick();
    });
}


export { initSlick }
