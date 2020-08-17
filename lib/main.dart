import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import './screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GreatPlaces>(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.deepPurple, //  <-- dark color
              textTheme: ButtonTextTheme
                  .primary, //  <-- this auto selects the right color
            )),
        home: PlacesListScreen(),
        routes: {AddPlaceScreen.id: (ctx) => AddPlaceScreen()},
      ),
    );
  }
}
