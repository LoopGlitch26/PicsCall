import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllContacts();
  }

  getAllContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    setState(() {
      contacts = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("PicsCall"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = contacts[index];
                      return ListTile(
                        title: Text(contact.displayName),
                        subtitle: Text(contact.phones.elementAt(0).value),
                        leading: (contact.avatar != null &&
                                contact.avatar.length > 0)
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(contact.avatar),
                              )
                            : CircleAvatar(
                                child: Text(contact.initials()),
                              ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
