import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#sortable');
  if (list) {
    Sortable.create(list, {
      ghostClass: "ghost",
      animation: 150,
    });
  }
};

export { initSortable };