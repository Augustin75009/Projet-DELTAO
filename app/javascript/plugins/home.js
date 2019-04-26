const buttons = document.querySelectorAll('.overview-button');
const background = document.querySelector('.lessons-overview');
const content = document.querySelector('.overview-content');


const selectLesson = () => {
 buttons.forEach((button) => {
    button.addEventListener('mouseover', (event) => {
    let course = button.innerText;
    let lastClass = background.classList[1];
    buttons.forEach((buttonremove) => {
      let upperLast = buttonremove.classList[1];
      buttonremove.classList.remove(upperLast);
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
      content.childNodes[1].innerHTML =
      "<h3>Cours enfants</h3><p>Découvrir le modelage avec d'autres enfants ou en famille"
    }
    if (course === "Cours adultes") {
      background.classList.add('background2');
      button.classList.add('upper');
      content.childNodes[1].innerHTML =
      "<h3>Cours adultes</h3><p>Description du cours .... <br>....... <br>.... ......</p>"
    }
    if (course === "Découverte") {
      background.classList.add('background3');
      button.classList.add('upper');
      content.childNodes[1].innerHTML =
      "<h3>Cours découverte</h3><p>Description du cours .... <br>....... <br>.... ......</p>"
    }
    if (course === "Atelier libre") {
      background.classList.add('background4');
      button.classList.add('upper');
      content.childNodes[1].innerHTML =
      "<h3>Atleier libre</h3><p>Description du cours .... <br>....... <br>.... ......</p>"
    }
    if (course === "Stage") {
      background.classList.add('background5');
      button.classList.add('upper');
      content.childNodes[1].innerHTML =
      "<h3>Stage</h3><p>Description du cours .... <br>....... <br>... ......</p>"
    }
    });
  });
}

export {selectLesson}
