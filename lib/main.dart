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

/// extend the contact book app with ValueNotifier with the value type we
/// managing which is a List of contact
class ContactBook extends ValueNotifier<List<Contact>> {
  // singleton pattern for contact book
  ContactBook._sharedInstance() : super([]); // super([]) means we manage an empty list
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  // array to store the contacts
  // final List<Contact> _contacts = [];
  /// our super the ValueNotifier contains a value variable by default which is a List of our contact
  /// so we no longer need to use the _contacts to access or store the contacts
  /// more info on the ValueNotifier docs

  int get length => value.length;

  void add({required Contact contact}) {
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
  }

  void remove({required Contact contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }

  Contact? contact({required int atIndex}) => value.length > atIndex ? value[atIndex] : null;
}
