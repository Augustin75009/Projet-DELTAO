const updateQuantityUp = () => {
 document.querySelector('.narrow-input').addEventListener('click', (event) => {
  event.preventDefault();
  const value = event.currentTarget.value
  console.log(value)
  // // fetch('https://api.github.com/orgs/lewagon/repos')
  //   .then(response => response.json())
  //   .then((data) => {
  //     // Do something with the response
  //   });
  });
}


// const updateQuantityUp = () => {
//   document.querySelector('.narrow-input').addEventListener('click', (event) => {
//   fetch("http://localhost:3000/cart_items", {
//     method: "POST",
//     body: event.currentTarget.value
//   })
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data); // Look at local_names.default
//     });
// });
// }

export { updateQuantityUp }
