function check() {
  console.log('check function called');  // 追加
  if (window.confirm('本当に削除しますか？')) {
    return true;
  } else {
    window.alert('キャンセルされました');
    return false;
  }
}

// この関数をグローバルに公開します
window.check = check;