import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thecontactproject/controllers/add_contact.dart';

import '../controllers/get_contacts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List results = [];
  @override
  void initState() {
    super.initState();
    showAll();
  }

  showAll() async {
    results = await GetContacts().getAll();
    print("Final results - $results");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("All Contacts"),
        ),
      ),
      body: results == null
          ? const Center(child: Text("loading"))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                var first_name = results[index]["firstname"];
                var last_name = results[index]["lastname"];
                var email = results[index]["email"];
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          offset: Offset(
                            1.0,
                            2.0,
                          ),
                          blurRadius: 2.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ]),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(first_name),
                          SizedBox(
                            width: 10,
                          ),
                          Text(last_name),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(email),
                    ],
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("clicked");
          var results = await AddContact().addAContact();
          print("Res results - $results");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
