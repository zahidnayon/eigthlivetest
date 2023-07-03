import 'package:flutter/material.dart';

void main() {
  runApp(ContactApp());
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}

class ContactApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'Zahid',
      email: 'zahid@example.com',
      phoneNumber: '1234567890',
    ),
    Contact(
      name: 'Hossain',
      email: 'hossain@example.com',
      phoneNumber: '0987654321',
    ),
    Contact(
      name: 'Nayon',
      email: 'nayon@example.com',
      phoneNumber: '9876543210',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact List'),
        ),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(contacts[index].name),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ContactDetails(contact: contacts[index]);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  final Contact contact;

  ContactDetails({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Name: ${contact.name}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Text('Email: ${contact.email}'),
            SizedBox(height: 8),
            Text('Phone: ${contact.phoneNumber}'),
          ],
        ),
      ),
    );
  }
}
