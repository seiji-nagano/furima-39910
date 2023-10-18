window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(inputValue * 0.1);
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.round(inputValue - (inputValue * 0.1));
  })
});