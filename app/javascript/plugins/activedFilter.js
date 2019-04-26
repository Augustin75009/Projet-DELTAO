const filter = document.querySelector('.actived-filter');
const filterButton = document.querySelectorAll('.filter-button');

const activedFilter = () => {
  filter.innerHTML = "<a href='/lessons'>Tous les cours</a>"
  filterButton.forEach((f, index) => {
    if (document.location.href.match(`query${index+1}`)) {
      f.classList.add("actived")
    }
  })
}


export {activedFilter}
