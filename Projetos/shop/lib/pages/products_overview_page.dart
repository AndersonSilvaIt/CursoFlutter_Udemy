import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/badge.dart';
import '../components/product_grid.dart';
import '../models/cart.dart';

enum FilterOptios { Favorite, All }

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<ProductList>(context);

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
              setState(() {
                if (selectedValue == FilterOptios.Favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });

              /*if (selectedValue == FilterOptios.Favorite) {
                //provider.showFavoritesOnly();
              } else {
                //provider.showAll();
              }*/
            },
          ),
          Consumer<Cart>(
            // se eu passar o child pra cá, o que sempre irá alterar é o value, esse child aqui, ficará sempre fixo
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) => Badge(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          )
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
