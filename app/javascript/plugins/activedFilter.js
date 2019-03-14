const filter = document.querySelector('.actived-filter');
const filterButton = document.querySelectorAll('.filter-button');

const activedFilter = () => {
  filter.innerHTML = "<div class='delete-filter'><a href='/lessons'>-</a></div>Supprimer le filtre"
  filterButton.forEach((f, index) => {
    if (document.location.href.match(`query${index+1}`)) {
      f.classList.add("actived")
    }
  })
}


export {activedFilter}
