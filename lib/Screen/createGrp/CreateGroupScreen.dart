import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hampayam_chat/Screen/createGrp/SetImageScreen.dart';
import 'package:hampayam_chat/StateManagement/ContactStateManagment/ContactProvider.dart';
import 'package:hampayam_chat/StateManagement/CreateGrpProvider/CreateGrpProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/translations/locale_keys.g.dart';
import 'package:hampayam_chat/widget/createGroupWidget/ItemContact.dart';
import 'package:hampayam_chat/widget/createGroupWidget/customAppBar.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';

class CreateGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _sizeH = MediaQuery.of(context).size.height;
    var _sizeW = MediaQuery.of(context).size.width;
    GlobalKey<ScaffoldState> _key = GlobalKey(); // add this
    ProfileProvider profileProvider = Provider.of(context);
    CreateGrpProvider createGrpProvider = Provider.of(context);
    return Scaffold(
        key: _key,
        appBar: PreferredSize(preferredSize: Size.fromHeight(_sizeH / 10), child: GrpCustomAppbar.customAppBar(_sizeH, LocaleKeys.DrawerCreatGrp.tr(), _key, context)),
        body: Consumer2<ContactProvide, CreateGrpProvider>(builder: (context, value1, value2, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ListView(
                padding: EdgeInsets.only(top: 20),
                children: ItemContact.listOfContact(value1.getConcact, _sizeH, context, profileProvider.getToken),
              ),
            ),
          );
        }),
        floatingActionButton: Visibility(
          visible: createGrpProvider.getfloatingBtn,
          child: Padding(
            padding: EdgeInsets.only(left: _sizeW / 1.35, bottom: _sizeW / 30),
            child: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: FloatingActionButton(
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.arrow_forward,
                    size: 40,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: new LinearGradient(
                        colors: [
                          Color(0xFF33D6F2),
                          Color(0xFF4DAAED),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                ),
                onPressed: () {
                  if (createGrpProvider.getdataAdded.length > 0) {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => SetDataScreen(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ));
  }
}
