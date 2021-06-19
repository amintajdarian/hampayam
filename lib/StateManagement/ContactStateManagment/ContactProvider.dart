import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class ContactProvide extends ChangeNotifier {
  List<JSubscriptionData> contacts = [];
  List<JSubscriptionData> contactsFiltered = [];

  List<JSubscriptionData> get getConcact => contacts;
  List<JSubscriptionData> get getConcactFilter => contactsFiltered;
  void setContact(List<JSubscriptionData> searchData) {
    this.contacts = searchData;
    notifyListeners();
  }

  void filterContacts(List<JSubscriptionData> contacts, TextEditingController searchController) {
    if (searchController.text.isNotEmpty) {
      contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String contactName = contact.public.fn.toLowerCase();
        if (searchTerm == contactName.substring(0, searchTerm.length)) {
          return true;
        }
        return false;
      });
    }

    contactsFiltered = contacts;
    notifyListeners();
  }
}
