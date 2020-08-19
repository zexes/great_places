import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddPlaceScreen.id);
            },
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Got no Places Yet, Start Adding some'),
              RaisedButton.icon(
                onPressed: () =>
                    Navigator.pushNamed(context, AddPlaceScreen.id),
                icon: Icon(Icons.add),
                label: const Text('Add Place'),
                color: Theme.of(context).accentColor,
                elevation: 2,
              )
            ],
          ),
        ),
        builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
            ? ch //returns child if < 0
            : ListView.separated(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: FileImage(greatPlaces.items[i].image),
                  ),
                  title: Text(greatPlaces.items[i].title),
                  onTap: () {
                    //Go to detail page
                  },
                ),
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 20.0,
                ),
              ),
      ),
    );
  }
}
