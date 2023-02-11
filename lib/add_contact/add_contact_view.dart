import 'package:flutter/material.dart';
import 'package:vanilla_contact_app/main.dart';
import 'package:vanilla_contact_app/models/contact_model.dart';

class NewContactView extends StatefulWidget {
  const NewContactView({super.key});

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 70),
            const Icon(
              Icons.contact_phone_outlined,
              size: 90,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter a new contact name here...",
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffb4b4b4),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.red),
                  gapPadding: 10,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width / 1.1, 50),
                backgroundColor: const Color(0xFFF84706),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                final contact = Contact(name: _controller.text);

                ContactBook().add(contact: contact);
                Navigator.of(context).pop();
              },
              child: const Text("Add Contact"),
            ),
          ],
        ),
      ),
    );
  }
}
