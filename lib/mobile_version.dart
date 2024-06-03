import 'package:flutter/material.dart';

class MobileService extends StatefulWidget {
  const MobileService({super.key});

  @override
  State<MobileService> createState() => _MobileServiceState();
}

class _MobileServiceState extends State<MobileService> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _number = TextEditingController();

  List<ContactList> contactList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              child: TextField(
                controller: _name,
                decoration: const InputDecoration(
                  labelText: 'Person Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: TextField(
                controller: _number,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addPerson,
                child: Text('Add'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17)),
                                  backgroundColor: const Color(0xff667C89),
                                  title: const Text(
                                    "Warning!",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: const Text(
                                    "Are you sure about Deleting this phone number from your contact list?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  actions: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.cancel_sharp),
                                      color: Colors.white,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(
                                          () {
                                            contactList.removeAt(i);
                                          },
                                        );
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.delete),
                                      color: Colors.white,
                                    )
                                  ],
                                );
                              });
                        },
                        leading: const Icon(Icons.person),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(contactList[i].name),
                            Text(contactList[i].number)
                          ],
                        ),
                        trailing: const Icon(Icons.phone),
                      ),
                    );
                  },
                  itemCount: contactList.length),
            )
          ],
        ),
      ),
    );
  }

  void _addPerson() {
    ContactList contact = ContactList(name: _name.text, number: _number.text);
    contactList.add(contact);
    setState(() {});
  }
}

class ContactList {
  final String name, number;
  ContactList({required this.name, required this.number});
}
