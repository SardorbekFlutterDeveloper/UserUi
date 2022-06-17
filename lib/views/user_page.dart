import 'package:exam_test/models/user_model.dart';
import 'package:exam_test/service/user_service.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserModelState();
}

class _UserModelState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:  IconButton(
          
         
          color: Colors.grey, icon:  Icon(Icons.list_outlined), onPressed: () { 
            Drawer(
              child: Container(),
            );
           },
        ),
        title: const Text(
          "Contacts",
          style: TextStyle(color: Colors.grey, fontSize: 33.0),
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            child: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ServiceUser.getUsersinHive(),
        builder: (context, AsyncSnapshot<UserModel> snap) {
          if (!snap.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snap.hasError) {
            return Center(
              child: Text("Error: ${snap.error}"),
            );
          } else {
            var data = snap.data!;

            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                     
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      child: CircleAvatar(
                        radius: 44.0,
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/men/${index}.jpg"),
                      ),
                    ),
                  ),
                  title: Text("Name: ${data.name}}"),
                  subtitle: Text(
                      "End Data: ${data.company!.catchPhrase.toString()}"),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(
          Icons.edit,
          color: Colors.grey,
        ),
      ),
    );
  }
}
