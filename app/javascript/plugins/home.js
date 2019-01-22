const buttons = document.querySelectorAll('.overview-button')
const background = document.querySelector('.lessons-overview')

const selectLesson = () => {
 buttons.forEach((button) => {
    button.addEventListener('click', (event) => {
    let course = button.innerText;
    let lastClass = background.classList[1];
    buttons.forEach((buttonremove) => {
      let upperLast = button.classList[1]
      if (typeof upperLast != "undefined") {
        buttonremove.classList.remove(upperLast)
      }
    });
    if (typeof lastClass != "undefined") {
      background.classList.remove(lastClass)
    }
    if (course === "Cours enfants"){
      background.classList.add('background1');
      button.classList.add('upper');
    }
    if (course === "Cours adultes") {
      background.classList.add('background2');
      button.classList.add('upper');
    }
    if (course === "Découverte") {
      background.classList.add('background3');
      button.classList.add('upper');
    }
    if (course === "Atelier libre") {
      background.classList.add('background4');
      button.classList.add('upper');
    }
    if (course === "Spéciaux*") {
      background.classList.add('background5');
      button.classList.add('upper');
    }
    });
  });
}

export {selectLesson}
