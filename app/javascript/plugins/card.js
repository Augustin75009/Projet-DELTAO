const cards = document.querySelectorAll('.card-dispatch-lesson');

const infoAnimation = () => {
 cards.forEach((card) => {
  const info = card.childNodes[2].childNodes[0].childNodes[5];
    card.addEventListener('mouseover', (event) => {
      info.style.animation = "infoUp 0.2s 1 forwards"
    });
    card.addEventListener('mouseout', (event) => {
      info.style.animation = "infoDown 0.2s 1 forwards"
    });
  });
}

export {infoAnimation}
