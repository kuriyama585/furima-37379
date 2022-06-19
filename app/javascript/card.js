const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };
    // 生成したFormDataオブジェクトから、クレジットカードに関する情報を取得し、
    // 変数cardに代入するオブジェクトとして定義しています。
    // "order[number]"などは、以下のように各フォームのname属性の値のこと
    
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // debugger;
        // ↑処理を止める記述でbinding pryと同じ意味である
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      // 上記記述内容がviewファイルと紐づくのでそれに合わせてviewファイルも合わせる必要がある。
      // 処理のため名前を合わせる必要がある

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);