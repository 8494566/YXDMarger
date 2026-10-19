function payFill(v) {
  var el = document.querySelector('input[name="amount"]');
  if (!el) return;
  el.value = (v > 0) ? v : '';
  el.focus();
}

function payBusy() {
  var b = document.getElementById('sub');
  if (b) {
    b.disabled = true;
    b.innerHTML = '处 理 中...';
    setTimeout(function () { b.disabled = false; b.innerHTML = '我 已 付 款'; }, 8000);
  }
  return true;
}

// 购买礼包：把表单切成 createpack 模式并提交
function payBuyPack(id) {
  var f = document.forms[0];
  if (!f) return false;
  var a = document.getElementById('hidact');
  var p = document.getElementById('packid');
  if (a) a.value = 'createpack';
  if (p) p.value = id;
  var b = document.getElementById('sub');
  if (b) { b.disabled = true; b.innerHTML = '提 交 中...'; }
  f.submit();
  return false;
}
