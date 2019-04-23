const copyMailId = document.querySelectorAll('.copiable');

copyMailId.forEach(copyText => {
    copyText.addEventListener('click', () => {
        const selection = window.getSelection();
        const range = document.createRange();
        range.selectNodeContents(copyText);
        selection.removeAllRanges();
        selection.addRange(range);

        try {
            document.execCommand('copy');
            selection.removeAllRanges();
            document.querySelector(".copied-box").classList.add("showBox");

            setTimeout(() => {
              document.querySelector(".copied-box").classList.remove("showBox");
            }, 4000);
        } catch (e) {
            copyText.textContent = 'Couldn\'t copy, hit Ctrl+C!';

            setTimeout(() => {
            }, 1200);
        }
    });
});
