const phoneButton = document.querySelector('.button-show-phone');

const phoneNumber = () => {
    phoneButton.addEventListener('click', (event) => {
      phoneButton.innerHTML = "06 63 48 79 81";
      phoneButton.style.cursor = "text"
      phoneButton.style.background = "#DBDBDB"
      phoneButton.style.color = "rgb(210, 139, 128)"
      phoneButton.style.fontWeight = "bold"

      // const selection = window.getSelection();
      // const range = document.createRange();
      // range.selectNodeContents(copyText);
      // selection.removeAllRanges();
      // selection.addRange(range);

      // try {
      //     document.execCommand('copy');
      //     selection.removeAllRanges();
      //     document.querySelector(".copied-box").classList.add("showBox");

      //     setTimeout(() => {
      //       document.querySelector(".copied-box").classList.remove("showBox");
      //     }, 4000);
      // } catch (e) {
      //     copyText.textContent = 'Couldn\'t copy, hit Ctrl+C!';

      //     setTimeout(() => {
      //     }, 1200);
      // }
    });
}

export {phoneNumber}
