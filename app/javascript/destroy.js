function destroy (){
  const submit = document.getElementById("destroy");
  submit.addEventListener("click", () => {
    alert("削除しました！");
  });
};

window.addEventListener('load', destroy);