class JRcvCtrl {
  // data props
  String id;
  String topic;
  int code;
  String text;
  String ts;
  JCtrlParams _params;

  // controll props
  bool hasParams;

  JRcvCtrl() {
    hasParams = false;
  }

  void DecodeFromMap(dynamic ctrl) {
    id = ctrl['id'];
    topic = ctrl['topic'];
    code = ctrl['code'];
    text = ctrl['text'];
    ts = ctrl['ts'];

    if (ctrl['params'] != null) {
      hasParams = true;
      _params = JCtrlParams();
      _params.DecodeFromDynamic(ctrl['params']);
    }
  }

  JCtrlParams GetCtrlParamsData() {
    return _params;
  }
}

class JCtrlParams {
  String build;
  int maxFileUploadSize;
  int maxMessageSize;
  int maxSubscriberCount;
  int maxTagCount;
  int maxTagLength;
  int minTagLength;
  String ver;
  String authlvl;
  String expires;
  String token;
  String user;
  int count;
  String what;
  String url;
  int seq;

  void DecodeFromDynamic(dynamic paramInfo) {
    maxFileUploadSize = paramInfo['maxFileUploadSize'];
    build = paramInfo['build'];
    maxMessageSize = paramInfo['maxMessageSize'];
    maxSubscriberCount = paramInfo['maxSubscriberCount'];
    maxTagCount = paramInfo['maxTagCount'];
    maxTagLength = paramInfo['maxTagLength'];
    minTagLength = paramInfo['minTagLength'];
    ver = paramInfo['ver'];
    authlvl = paramInfo['authlvl'];
    expires = paramInfo['expires'];
    token = paramInfo['token'];
    user = paramInfo['user'];
    what = paramInfo['what'];
    count = paramInfo['count'];
    url = paramInfo['url'];
    seq = paramInfo['seq'];
  }
}
