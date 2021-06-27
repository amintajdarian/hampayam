import 'package:flutter/cupertino.dart';
import 'package:hampayam_chat/Model/Primitives/SubscriptionData.dart';

class ContactProvide extends ChangeNotifier {
  List<JSubscriptionData> contacts = [];
  List<JSubscriptionData> contactsFiltered = [];
  bool readContact = false;

  List<JSubscriptionData> get getConcact => contacts;
  List<JSubscriptionData> get getConcactFilter => contactsFiltered;
  bool get getReadContact => readContact;
  void setContact(List<JSubscriptionData> searchData) {
    this.contacts = searchData;
    notifyListeners();
  }

  void filterContacts(List<JSubscriptionData> contacts,
      TextEditingController searchController) {
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

  changeReadContact(bool change) {
    this.readContact = change;
    notifyListeners();
  }

  void reset() {
    contacts.clear();
    contactsFiltered.clear();
    readContact = false;
  }
}
