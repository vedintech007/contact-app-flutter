import 'package:flutter/material.dart';
import 'package:vanilla_contact_app/add_contact/add_contact_view.dart';
import 'package:vanilla_contact_app/constants/routes.dart';
import 'package:vanilla_contact_app/homepage/home.dart';
import 'package:vanilla_contact_app/models/contact_model.dart';
import 'package:vanilla_contact_app/widgets/dismiss_keyboard.dart';

void main() {
  runApp(
    DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Contact App",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: routes,
      ),
    ),
  );
}

class ContactBook extends ValueNotifier<List<Contact>> {
  // singleton pattern for contact book
  ContactBook._sharedInstance() : super([]);
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  // array to store the contacts
  // final List<Contact> _contacts = [];

  int get length => value.length;

  void add({required Contact contact}) {
    // final ValueNotifier notifier;
    // value.add(contact);
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
  }

  void remove({required Contact contact}) {
    // _contacts.remove(contact);
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }

  Contact? contact({required int atIndex}) => value.length > atIndex ? value[atIndex] : null;
}
