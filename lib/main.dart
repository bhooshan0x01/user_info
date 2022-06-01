import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'calls.dart';
import 'model.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),
      },
    ),
  );
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late Future<Album> futureAlbum;
  late Future<User> futureUser;
  @override
  void initState() {
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Fetch Public API'),
  //       ),
  //       body: Center(
  //         child: FutureBuilder<Album>(
  //           future: futureAlbum,
  //           builder: (context, snapshot) {
  //             if (snapshot.hasData) {
  //               return Text(snapshot.data!.title);
  //             } else if (snapshot.hasError) {
  //               return Text('${snapshot.error}');
  //             }

  //             return const CircularProgressIndicator();
  //           },
  //         ),
  //       ));
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Fetch Public API'),
  //     ),
  //     body: ListView.builder(
  //       itemCount: 10,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Center(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: <Widget>[
  //               Card(
  //                 child: Column(
  //                   children: <Widget>[
  //                     Container(
  //                         padding: const EdgeInsets.all(20.0),
  //                         child: FutureBuilder<User>(
  //                           future: futureUser,
  //                           builder: (context, snapshot) {
  //                             if (snapshot.hasData) {
  //                               return Text(snapshot.data!.name);
  //                             } else if (snapshot.hasError) {
  //                               return Text('${snapshot.error}');
  //                             }
  //                             return const CircularProgressIndicator();
  //                           },
  //                         ))
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Fetch Public APIs"),
      ),
      body: _buildBody(context),
    );
  }
}

FutureBuilder<List<User>> _buildBody(BuildContext context) {
  final HttpService httpService = HttpService();
  return FutureBuilder<List<User>>(
    future: httpService.fetchUsers(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final List<User> users = snapshot.data ?? [];
        return _buildUsers(context, users);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

ListView _buildUsers(BuildContext context, List<User> users) {
  return ListView.builder(
    itemCount: users.length,
    padding: EdgeInsets.all(12.0),
    itemBuilder: (context, index) {
      return Card(
        elevation: 4,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: selectIcon(index),
              title: Text(
                users[index].name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(users[index].email),
                  Text(users[index].address.values.elementAt(3))
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Icon selectIcon(int index) {
  Set<dynamic> icons = {
    Icons.face,
    Icons.face_outlined,
    Icons.person,
    Icons.person_outlined,
    Icons.tag_faces
  };
  int index = Random().nextInt(5);

  return Icon(icons.elementAt(index));
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
