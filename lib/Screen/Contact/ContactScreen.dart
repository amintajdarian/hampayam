import 'package:flutter/material.dart';
import 'package:hampayam_chat/StateManagement/ContactStateManagment/ContactProvider.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/widget/ContactDataAppBar.dart';
import 'package:hampayam_chat/widget/chatWidget/itemContactWithNoCheckBox.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _sizeH = MediaQuery.of(context).size.height;
    GlobalKey<ScaffoldState> _key = GlobalKey(); // add this
    ProfileProvider profileProvider = Provider.of(context);

    return Scaffold(
      key: _key,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(_sizeH / 10),
          child: ContactAppBar.customAppBar(_sizeH, 'contacts', _key, context)),
      body: Consumer<ContactProvide>(builder: (context, value1, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              padding: EdgeInsets.only(top: 20),
              children: ItemContactNCH.listOfContact(
                  value1.getConcact, _sizeH, context, profileProvider.getToken),
            ),
          ),
        );
      }),
    );
  }
}
