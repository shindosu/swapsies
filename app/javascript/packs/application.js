import "bootstrap";
import 'components/modal'
import './styles'
import { initUpdateNavbarOnScroll } from 'components/navbar';
import { initNavbarLogo } from 'components/navbarLogo';

initUpdateNavbarOnScroll();
initNavbarLogo();

import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2(); // (~ document.querySelectorAll)
  console.log('inside initSelect2')
};
$(initSelect2);
console.log('some stuff')
