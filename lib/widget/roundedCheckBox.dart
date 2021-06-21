import 'package:flutter/material.dart';
import 'package:hampayam_chat/StateManagement/CreateGrpProvider/CreateGrpProvider.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class RoundedCheckBox extends StatelessWidget {
  List<bool> value;
  int index;
  RoundedCheckBox({this.value, this.index});

  @override
  Widget build(BuildContext context) {
    CreateGrpProvider createGrpProvider = Provider.of(context);
    var size = MediaQuery.of(context).size.width;
    return RoundCheckBox(
      isChecked: value[index],
      onTap: (selected) {
        createGrpProvider.changeValue(selected, index);
      },
    );
  }
}
