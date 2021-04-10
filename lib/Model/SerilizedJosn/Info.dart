class JRcvInfo {
  String topic;
  String from;
  String what;
  int seq;

  void DecodeFromMap(dynamic info) {
    topic = info['topic'];
    from = info['from'];
    what = info['what'];
    seq = info['seq'];
  }
}
