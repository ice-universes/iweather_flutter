const Map<int, String> cnWeek = {
  1: '一',
  2: '二',
  3: '三',
  4: '四',
  5: '五',
  6: '六',
  7: '日',
};

String week(DateTime dt, {String lang = 'zh_cn'}) {
  int w = dt.weekday;

  switch (lang) {
    case 'zh_cn':
      return cnWeek[w]!;
    default:
      return cnWeek[w]!;
  }
}
