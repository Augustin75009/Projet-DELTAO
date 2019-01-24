const phoneButton = document.querySelector('.button-show-phone');

const phoneNumber = () => {
  phoneButton.addEventListener('click', (event) => {
    phoneButton.innerHTML = "06 63 48 79 81";
    phoneButton.style.cursor = "text"
    phoneButton.style.background = "#DBDBDB"
    phoneButton.style.color = "rgb(210, 139, 128)"
    phoneButton.style.fontWeight = "bold"
  });
}

export {phoneNumber}
