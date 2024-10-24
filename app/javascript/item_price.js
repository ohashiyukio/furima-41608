const price = () => {


  const priceInput = document.getElementById("item-price");
  const taxDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  // 金額入力時のイベントリスナー
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    if (inputValue >= 300 && inputValue <= 9999999) {  // 金額の範囲チェック
      // 販売手数料（10%）
      const taxAmount = Math.floor(inputValue * 0.1);
      taxDisplay.textContent = taxAmount;

      // 販売利益（90%）
      const profitAmount = Math.floor(inputValue - taxAmount);
      profitDisplay.textContent = profitAmount;
    } else {
      // 入力が無効な場合は手数料と利益を空欄にする
      taxDisplay.textContent = '';
      profitDisplay.textContent = '';
    }
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);