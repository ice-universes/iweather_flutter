class WaringItem {
  late List<String>? type; // 预警类型
  late String? sender; // 预警发布单位'
  late String? event; // 事件名称
  late DateTime? start;
  late DateTime? end;
  late String? description; // 预警内容

  WaringItem({
    this.type,
    this.sender,
    this.event,
    int? start,
    int? end,
    this.description,
  }) {
    this.start =
        start == null ? null : DateTime.fromMillisecondsSinceEpoch(start * 1000);
    this.end = end == null ? null : DateTime.fromMillisecondsSinceEpoch(end * 1000);
  }
}
