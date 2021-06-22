import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/StateManagement/CreateGrpProvider/CreateGrpProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/widget/createGroupWidget/modelSheetSelector.dart';
import 'package:hampayam_chat/widget/setDataAppBar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SetImageScreen extends StatefulWidget {
  @override
  _SetImageScreenState createState() => _SetImageScreenState();
}

class _SetImageScreenState extends State<SetImageScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _sizeW = MediaQuery.of(context).size.width;
    GlobalKey<ScaffoldState> _key = GlobalKey(); // add this
    ProfileProvider profileProvider = Provider.of(context);
    var _sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _key,
      appBar: PreferredSize(child: SetDataAppBar.customAppBar(_sizeH, 'new Group', _key, context, subtitle: 'add Subject'), preferredSize: Size.fromHeight(_sizeH / 10)),
      body: Consumer<CreateGrpProvider>(builder: (context, value, child) {
        return Container(
          height: _sizeH / 3,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.only(left: _sizeH / 45, right: _sizeH / 45),
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
                                    HttpConnection.fileUrl(IORouter.ipAddress, value.imageFile),
                                    headers: HttpConnection.setHeader(IORouter.apiKey, profileProvider.getToken),
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
                        child: TextFormField(
                          autofocus: true,
                          maxLength: 20,
                          style: TextStyle(fontSize: _sizeW / 25),
                          decoration: new InputDecoration(
                            hintText: "type group subject here ... ",
                            labelStyle: new TextStyle(color: const Color(0xFF424242)),
                          ),
                        ),
                      ),
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
                    onPressed: () {},
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
