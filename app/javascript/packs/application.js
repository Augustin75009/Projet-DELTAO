import "bootstrap";
import { initSlick } from '../plugins/slick';
import { updateQuantityUp } from '../plugins/narrow';
// import {} from '../plugins/show';
import {selectLesson} from '../plugins/home';
import {infoAnimation} from '../plugins/card';
import {eventSticked} from '../plugins/eventSticked';
import {phoneNumber} from '../plugins/phoneNumber';
import {tabFocus} from '../plugins/tab';

initSlick();
// updateQuantityUp();
selectLesson();
infoAnimation();

if(document.location.href.match('lessons/')) {
  phoneNumber();
}

// tabFocus();

if(document.location.href.match('lessons')) {
  eventSticked();
}



