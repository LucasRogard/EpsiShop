import 'package:epsi_shop/bo/article.dart';
import 'package:epsi_shop/bo/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panier"),
        actions: [
          IconButton(
              onPressed: ()=>context.go('/cart'),
              icon: Badge(
                  label: Text("${context.watch<Cart>().listArticles.length}"),
                  child: Icon(Icons.shopping_cart)))
        ],
      ),
      body: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget? child) {
          return cart.listArticles.isEmpty ?
          EmptyCart() : ListCart(listArticles: cart.listArticles,prixEuro:cart.getTotalPrice(),intPrixEuro:cart.getIntTotalPrice());
        },
      )
    );
  }
}

class ListCart extends StatelessWidget {
  final List<Article> listArticles;
  final String prixEuro;
  final int intPrixEuro;


  const ListCart({super.key, required this.listArticles, required this.prixEuro, required this.intPrixEuro});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Votre panier total est de"),
          Text(prixEuro, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      Flexible(
        child: ListView.builder(
                itemCount: listArticles.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: ()=> context.go('/details/${index}'),
                  title: Text(listArticles[index].nom),
                  subtitle: Text(listArticles[index].getPrixEuro()),
                  leading: Image.network(
                    listArticles[index].image,
                    width: 80,
                  ),
                  trailing: TextButton(
                    child: Text("REMOVE"),
                    onPressed: () {
                      context.read<Cart>().remove(listArticles[index]);
                    },
                  ),
                )
            ),
      ),
      ElevatedButton(
          onPressed: () => context.go("/cart/payement"),
          child: Text("Procéder au paiement"))
    ],
  );
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Spacer(),
          Text("Votre panier est actuellement vide"),
          Icon(Icons.image),
          Spacer(),
        ],
      ),
    );
  }
}

