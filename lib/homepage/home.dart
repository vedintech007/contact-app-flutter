import 'package:flutter/material.dart';
import 'package:vanilla_contact_app/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts Home"),
      ),
      body: ValueListenableBuilder(
        valueListenable: ContactBook(),
        builder: (context, value, child) {
          final contacts = value;
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (BuildContext context, int index) {
              final contact = contacts[index];
              return Dismissible(
                onDismissed: (direction) {
                  ContactBook().remove(contact: contact);
                },
                key: ValueKey(contact.id),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.white,
                    elevation: 2,
                    child: ListTile(
                      title: Text(contact.name),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Contact",
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).pushNamed('/new-contact');
        },
      ),
    );
  }
}
