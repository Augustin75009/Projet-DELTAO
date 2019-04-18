const infos = document.querySelectorAll('.infos-list li');
const tablist = document.querySelectorAll('.infos-dispatch-content span');

const tabFocus = () => {
    infos.forEach((f, index) => {
      f.addEventListener('click', function(e) {
        infos.forEach((ff, index) => {
          ff.classList.remove('selected-tab')
        });
        tablist.forEach((t) => {
          t.classList.remove("infos-show")
        });
        infos[index].classList.add("selected-tab")
        tablist[index].classList.add("infos-show")
      });
    });
}


export {tabFocus}
