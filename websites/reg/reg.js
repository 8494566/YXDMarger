(function () {
  var capImg = document.getElementById('cap');
  if (capImg) {
    capImg.onclick = function () {
      this.src = '/register/captcha.ashx?t=' + Date.now();
    };
  }
  var f = document.forms[0];
  if (f) {
    f.onsubmit = function () {
      var b = document.getElementById('btn');
      if (b) {
        b.disabled = true;
        b.innerHTML = '提 交 中...';
        setTimeout(function () {
          b.disabled = false;
          b.innerHTML = '立 即 注 册';
        }, 6000);
      }
      return true;
    };
  }
})();
