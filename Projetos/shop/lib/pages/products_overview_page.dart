import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import '../components/product_grid.dart';

enum FilterOptios { Favorite, All }

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptios.Favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptios.All,
                child: Text('Todos'),
              )
            ],
            onSelected: (FilterOptios selectedValue) {
              if (selectedValue == FilterOptios.Favorite) {
                provider.showFavoritesOnly();
              } else {
                provider.showAll();
              }
            },
          )
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
