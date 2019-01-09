const updateQuantityUp = () => {
 document.querySelector('.narrow-input').addEventListener('click', (event) => {
  event.preventDefault();
  const value = event.currentTarget.value;
  // console.log("hello")
  });
}

export {updateQuantityUp}

// function updateQuantity(data) {
//   const quantity = document.querySelector('.quantity-item');
//   // const value = quantity.value;
//   console.log("hello");
//   // const amount = document.querySelector('.infos-item');
//   const value = data;
//   console.log(value)
//   // newReviewForm.innerHTML = innerHTML;
// }


// // form.addEventListener("submit", (event) => {
// //   event.preventDefault();
// //   // const data = {author: amount.value};
// //   // updateQuantity(data);
// //   console.log("hello")
// // });

// updateQuantity("<%= j render 'cart_items/variable', cart_item: cart_item %>");

// // refresh.addEventListener("click", updateQuantity)

