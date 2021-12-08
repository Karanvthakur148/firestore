import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  final List<dynamic>? connections;

  const Contacts({Key? key, required this.connections}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.connections!.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Text(
                    '${widget.connections![index]['names'][0]['givenName']}'),
                Text(
                    '${widget.connections![index]['names'][0]['metadata']["source"].toString()}'),

              ],
            );

          }),
    );
  }
}
