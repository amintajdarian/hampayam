class JTextEntityData {
  String mime;
  String val;
  String ref;
  int width;
  int height;
  String name;
  int size;

  void DecodeFromMap(dataInfo) {
    mime = dataInfo['mime'];
    val = dataInfo['val'];
    ref = dataInfo['ref'];
    width = dataInfo['width'];
    height = dataInfo['height'];
    name = dataInfo['name'];
    size = dataInfo['size'];
  }
}
