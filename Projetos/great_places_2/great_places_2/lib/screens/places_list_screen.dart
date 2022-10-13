import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/greate_places.dart';
import '../utils/app_routes.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Lugares'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatePlaces>(context, listen: false).loadPlaces(),
        builder: (
          (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<GreatePlaces>(
                child: const Center(child: Text('Nenhum local cadastrado!')),
                builder: (ctx, greatPlaces, ch) => greatPlaces.itemsCount == 0
                    ? ch!
                    : ListView.builder(
                        itemCount: greatPlaces.itemsCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatPlaces.getItemByIndex(i).image,
                            ),
                          ),
                          title: Text(
                            greatPlaces.getItemByIndex(i).title,
                          ),
                          onTap: () {},
                        ),
                      ),
              )
              ),
      ),
    );
  }
}
