const reservation = document.querySelector('.reservation');
const reservation_box = document.querySelector('.reservation_box');
const closeBtn = document.querySelector('.date_setting > button');

const show = () => {
  reservation_box.classList.add('show');
}
const close = () => {
  reservation_box.classList.remove('show');
}

reservation.addEventListener('click', show);
closeBtn.addEventListener('click', close);