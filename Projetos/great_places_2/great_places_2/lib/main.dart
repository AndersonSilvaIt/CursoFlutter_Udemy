import 'package:flutter/material.dart';
import 'package:great_places_2/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';
import 'providers/greate_places.dart';
import 'screens/place_form_screen.dart';
import 'screens/places_list_screen.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatePlaces(),
      child: MaterialApp(
        title: 'Greate Places',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.indigo,
            secondary: Colors.amber,
          ),
        ),
        home: const PlacesListScreen(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => const PlaceFormScreen(),
          AppRoutes.PLACE_DETAIL: (ctx) => const PlaceDetailScreen(),
        },
      ),
    );
  }
}

