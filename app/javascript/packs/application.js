import "bootstrap";
import { initUpdateNavbarOnScroll } from 'components/navbar';
import 'components/modal'
import './styles'
initUpdateNavbarOnScroll();

import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2(); // (~ document.querySelectorAll)
  console.log('inside initSelect2')
};
$(initSelect2);
console.log('some stuff')
