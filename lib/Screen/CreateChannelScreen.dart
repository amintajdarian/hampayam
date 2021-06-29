import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/Messenging/HampayamClient.dart';
import 'package:hampayam_chat/Screen/chatScreen/ChlChat/ChlChatScreen.dart';
import 'package:hampayam_chat/StateManagement/CreateChannelProvider/CreateChannelProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/translations/locale_keys.g.dart';
import 'package:hampayam_chat/widget/modelSheetSelector.dart';
import 'package:hampayam_chat/widget/setDataAppBar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class CreateChannel extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  GlobalKey<ScaffoldState> _key = GlobalKey(); // add this

  @override
  Widget build(BuildContext context) {
    var _sizeH = MediaQuery.of(context).size.height;
    var _sizeW = MediaQuery.of(context).size.width;
    ProfileProvider profileProvider = Provider.of(context);
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_sizeH / 10),
        child: SetDataAppBar.customAppBar(
            _sizeH, LocaleKeys.DrawerCreatChl.tr(), _key, context,
            subtitle: 'add Subject'),
      ),
      body: Consumer<CreateChannelProvider>(builder: (context, value, child) {
        return Container(
          height: _sizeH / 3,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: _sizeH / 45, right: _sizeH / 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _sizeW / 6,
                        height: _sizeH / 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: new LinearGradient(colors: [
                            Color(0xFF33D6F2),
                            Color(0xFF4DAAED),
                          ]),
                        ),
                        child: InkWell(
                          onTap: () {
                            showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                controller: ModalScrollController.of(context),
                                child: ModalFit(_sizeW),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundImage: value.getImage != null
                                ? Image(
                                    image: CachedNetworkImageProvider(
                                    HttpConnection.fileUrl(
                                        IORouter.ipAddress, value.imageFile),
                                    headers: HttpConnection.setHeader(
                                        IORouter.apiKey,
                                        profileProvider.getToken),
                                  )).image
                                : null,
                            radius: 30.0,
                            child: Icon(
                              Typicons.camera_outline,
                              color: Colors.white,
                              size: _sizeW / 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: _sizeW / 20),
                      Container(
                          alignment: Alignment.center,
                          height: _sizeH,
                          width: _sizeW / 1.5,
                          child: TextField(
                            controller: controller,
                            autofocus: true,
                            maxLength: 20,
                            style: TextStyle(fontSize: _sizeW / 25),
                            decoration: new InputDecoration(
                              errorStyle: value.getTextEmpty
                                  ? TextStyle(
                                      fontSize: _sizeW / 25, color: Colors.red)
                                  : TextStyle(
                                      fontSize: _sizeW / 25,
                                      color: Colors.black),
                              errorText: value.getTextEmpty
                                  ? 'please enter your Chl Name'
                                  : null,
                              hintText: "type Channel subject here ... ",
                              labelStyle:
                                  new TextStyle(color: const Color(0xFF424242)),
                            ),
                            onChanged: (select) {
                              value.setChlName(select);
                            },
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  width: _sizeW / 8,
                  height: _sizeH / 15,
                  child: FloatingActionButton(
                    child: Icon(FontAwesome5.check),
                    onPressed: () {
                      IORouter.activePage = 'chat';
                      value.emptyValidator(controller.text);
                      if (!value.getTextEmpty) {
                        if (value.getImage != null)
                          HampayamClient.createChannel(
                              controller.text, 24, context,
                              photo: value.getImage);
                        else
                          HampayamClient.createChannel(
                              controller.text, 24, context);
                        value.setCreated(true);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ChlChatScreen(),
                          ),
                        );
                      }
                    },
                    backgroundColor: Colors.green,
                  ),
                ),
                right: _sizeW / 10,
                bottom: -1 * _sizeW / 30,
              ),
            ],
          ),
        );
      }),
    );
  }
}
