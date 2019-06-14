const buttons = document.querySelectorAll('.overview-button');
const background = document.querySelector('.lessons-overview');
const content = document.querySelector('.overview-content');
const selectors = document.querySelector('.overview-selectors');
var innerwidth = window.innerWidth;


const selectLesson = () => {
 buttons.forEach((button) => {
    button.addEventListener('mouseover', (event) => {
    let workshop = button.innerText;
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
    if (workshop === "Enfants"){
      background.classList.add('background5');
      button.classList.add('upper');
      content.childNodes[1].innerHTML =
      "<h3>Atelier enfants</h3><p>Vos enfants découvrent le modelage avec d'autres ou en famille. Ils déploient leur créativité à travers les différentes « situations » proposées, et explorent l'argile dans tous ses états."
    }
    if (workshop === "Adultes") {
      background.classList.add('background5');
      button.classList.add('upper');
      content.childNodes[1].innerHTML =
      "<h3>Atelier adultes</h3><p>Par groupe de 4-5 personnes , vous découvrez votre créativité en vivant les « situations » de modelage proposées. Vous apprenez les techniques et les gestes pour créer en terre de faïence ou de grès. Vous voyez peu à peu se dessiner votre « fil rouge créatif ».</p>"
    }
    if (workshop === "Découverte") {
      background.classList.add('background5');
      button.classList.add('upper');
      content.childNodes[1].innerHTML =
      "<h3>Atelier découverte</h3><p>Au cours d'une séance ou d'un mini-stage, vous tournez ou vous modelez. Vous découvrez la matière et les gestes pour sa mise en forme. Vous réalisez le potentiel de vos mains et de votre créativité."
    }
    if (workshop === "Atelier libre") {
      background.classList.add('background5');
      button.classList.add('upper');
      content.childNodes[1].innerHTML =
      "<h3>Atelier libre</h3><p>Vous savez déjà tourner et vous souhaitez progresser en répétant les gestes de manière autonome. Vous pouvez réserver l'atelier et choisir un forfait d'heures."
    }
    if (workshop === "Stages") {
      background.classList.add('background5');
      button.classList.add('upper');
      content.childNodes[1].innerHTML =
      "<h3>Stages</h3><p>Au fil de l'année, différents stages et séjours vous sont proposés à l'atelier ou à la campagne."
    }
    });


    if (innerWidth < 550 ) {
      const size = buttons[0].clientWidth;
      const offset = innerwidth / 2;
      console.log(offset)
      selectors.addEventListener('scroll', (event) => {
          // console.log(event.currentTarget.scrollLeft)
        if (event.currentTarget.scrollLeft < 20) {
          background.classList.add('background5');
          buttons[0].classList.add('upper');
          buttons[1].classList.remove('upper');
          content.childNodes[1].innerHTML =
          "<h3>Atelier adultes</h3><p>Par groupe de 4-5 personnes , vous découvrez votre créativité en vivant les « situations » de modelage proposées. Vous apprenez les techniques et les gestes pour créer en terre de faïence ou de grès. Vous voyez peu à peu se dessiner votre « fil rouge créatif ».</p>"
        }
        if (event.currentTarget.scrollLeft > 20) {
          background.classList.add('background5');
          buttons[1].classList.add('upper');
          buttons[0].classList.remove('upper');
          buttons[2].classList.remove('upper');
          content.childNodes[1].innerHTML =
          "<h3>Atelier découverte</h3><p>Au cours d'une séance ou d'un mini-stage, vous tournez ou vous modelez. Vous découvrez la matière et les gestes pour sa mise en forme. Vous réalisez le potentiel de vos mains et de votre créativité."
        }
        if (event.currentTarget.scrollLeft > size) {
          background.classList.add('background5');
          buttons[2].classList.add('upper');
          buttons[1].classList.remove('upper');
          buttons[3].classList.remove('upper');
          content.childNodes[1].innerHTML =
          "<h3>Atelier enfants</h3><p>Vos enfants découvrent le modelage avec d'autres ou en famille. Ils déploient leur créativité à travers les différentes « situations » proposées, et explorent l'argile dans tous ses états."
        }
        if (event.currentTarget.scrollLeft > (2 * size)) {
          background.classList.add('background5');
          buttons[3].classList.add('upper');
          buttons[2].classList.remove('upper');
          buttons[4].classList.remove('upper');
          content.childNodes[1].innerHTML =
          "<h3>Atleier libre</h3><p>Vous savez déjà tourner et vous souhaitez progresser en répétant les gestes de manière autonome. Vous pouvez réserver l'atelier et choisir un forfait d'heures."
        }
        if (event.currentTarget.scrollLeft > (2.5 * size)) {
          background.classList.add('background5');
          buttons[4].classList.add('upper');
          buttons[3].classList.remove('upper');
          content.childNodes[1].innerHTML =
          "<h3>Stages</h3><p>Au fil de l'année, différents stages et séjours vous sont proposés à l'atelier ou à la campagne."
        }
      })
    }



  });
}

export {selectLesson}
