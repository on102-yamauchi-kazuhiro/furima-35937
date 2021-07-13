const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const form = document.getElementById("charge-form");
    const formData = new FormData(form);

    const card = {
      number: formData.get("order_address[card_number]"),
      exp_month: formData.get("order_address[expire_month]"),
      exp_year: `20${formData.get("order_address[expire_year]")}`,
      cvc: formData.get("order_address[card_cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      console.log
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);