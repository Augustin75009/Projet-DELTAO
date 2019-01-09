const updateQuantityUp = () => {
 document.querySelector('.narrow-input').addEventListener('click', (event) => {
  event.preventDefault();
  const value = event.currentTarget.value;
  console.log(value)
  });
}

export {updateQuantityUp}
