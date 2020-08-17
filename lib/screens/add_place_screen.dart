import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  static const String id = 'add_place_screen';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // with this we can remove the mainAxisAlignment as Expanded takes all the space needed
            child: Column(
              children: [],
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            onPressed: () {},
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize
                .shrinkWrap, // remove extra space around a button
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
