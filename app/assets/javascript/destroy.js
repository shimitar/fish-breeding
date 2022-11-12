function destroy (){
  const submit = document.getElementById("destroy");
  debugger
  submit.addEventListener("click", () => {
    alert("削除しました！");
  });
};

window.addEventListener('load', destroy);