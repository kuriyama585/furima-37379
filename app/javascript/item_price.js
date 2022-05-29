window.addEventListener('load', () => {
  // イベント発火のメソッド　ロードしたら動く
const priceInput = document.getElementById("item-price");
// 入力される数字の場所のIDを表示する。
priceInput.addEventListener("input", () => {
  // 入力しらたイベント発火
   const inputValue = priceInput.value;
  //  金額を変数宣言を行う場所

const addTaxDom = document.getElementById("add-tax-price");
// 計算された数字のIDを打たないといけない
addTaxDom.innerHTML = Math.floor(priceInput.value*0.1)
// 小数点切り捨てのメソッドに数式を混ぜて表示
const addTax = document.getElementById("profit");
addTax.innerHTML = Math.floor(priceInput.value*0.9)
})
})

// 基本の流れ
// 要素を取る
// 処理
// 結果出力