import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Model/Primitives/Description.dart';
import 'package:hampayam_chat/Model/Primitives/PublicData.dart';
import 'package:hampayam_chat/Model/Primitives/Subscription.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/MsgClient.dart';
import 'package:hampayam_chat/Model/SeserilizedJson/Set.dart';

class GroupChannelSettings {
  static void changeName(String topic, String name) {
    String newId = IORouter.generateRandomKey();
    JPublicData publicData = JPublicData(fn: name);
    Description description = Description(publicData: publicData);
    JSndSet jSndSet = JSndSet(id: newId, topic: topic, desc: description);
    MsgClient sendSet = MsgClient(jSndSet: jSndSet);
    IORouter.sendMap(sendSet.toJson());
  }

  static void addMember(String topic, String user) {
    Subscription subscription = Subscription(user: user);
    JSndSet sndSet = JSndSet(id: IORouter.generateRandomKey(), topic: topic, sub: subscription);
    MsgClient sendSet = MsgClient(jSndSet: sndSet);
    IORouter.sendMap(sendSet.toJson());
  }
}
