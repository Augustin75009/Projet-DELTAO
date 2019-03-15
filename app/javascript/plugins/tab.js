const tabList = document.querySelector('.infos-list');
// const footer = document.querySelector('.footer');

const tabFocus = () => {
  tabList.addEventListener('click', function(e) {
    window.scrollTo(0,document.body.scrollHeight);
    // tabList.scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"});
  })
}


export {tabFocus}
