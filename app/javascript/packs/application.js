import "bootstrap";
// import "plugins/flatpickr"
import { initSlick } from '../plugins/slick';
import { updateQuantityUp } from '../plugins/narrow';
import {selectLesson} from '../plugins/home';
import {infoAnimation} from '../plugins/card';
import {phoneNumber} from '../plugins/phoneNumber';
import {tabFocus} from '../plugins/tab';
import {activedFilter} from '../plugins/activedFilter';
import {modifyWebsite} from '../plugins/open-widget';
import {navbar} from '../plugins/navbar';
import {scroll} from '../plugins/scroll';
import {alert} from '../plugins/alert';


initSlick();
// updateQuantityUp();
tabFocus();
selectLesson();
// infoAnimation();
navbar();
//parallaxScroll();

if(document.location.href.match('query')) {
  activedFilter();
}

if(document.location.href.match('/lessons')) {
  phoneNumber();
}


alert();
scroll();
modifyWebsite();



