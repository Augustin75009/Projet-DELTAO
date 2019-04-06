import "bootstrap";
import "plugins/flatpickr"
import { initSlick } from '../plugins/slick';
import { updateQuantityUp } from '../plugins/narrow';
import {selectLesson} from '../plugins/home';
import {infoAnimation} from '../plugins/card';
import {phoneNumber} from '../plugins/phoneNumber';
import {tabFocus} from '../plugins/tab';
import {activedFilter} from '../plugins/activedFilter';
import {modifyWebsite} from '../plugins/open-widget';



initSlick();
// updateQuantityUp();
selectLesson();
infoAnimation();

if(document.location.href.match('lessons/')) {
  phoneNumber();
}

if(document.location.href.match('query')) {
  activedFilter();
}

modifyWebsite();
// tabFocus();



