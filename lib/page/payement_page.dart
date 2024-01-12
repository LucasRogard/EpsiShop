import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PayementPage extends StatelessWidget {
  final int intPrixEuro;
  const PayementPage({super.key,  this.intPrixEuro =0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finalisation de la commande"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Recapitulatif(intPrixEuro: intPrixEuro),
            Text("Adresse de livraison", style: TextStyle(fontWeight: FontWeight.bold)),
            Adresse(),
            Text("Méthode de paiement", style: TextStyle(fontWeight: FontWeight.bold)),
            Methode(),
            Spacer(),
            Text("Si vous cliquez sur confirmer ça confirme"),
            ElevatedButton(
                onPressed: null,
                child: Text("Procéder au paiement"))
          ],
        ),
      ),
    );
  }
}

class Methode extends StatefulWidget {
  const Methode({
    Key? key,
  }) : super(key: key);

  @override
  _Methode createState() => _Methode();
}


class _Methode extends State<Methode> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MethodCard(FontAwesomeIcons.ccApplePay, 0),
        MethodCard(FontAwesomeIcons.ccVisa, 1),
        MethodCard(FontAwesomeIcons.ccMastercard, 2),
        MethodCard(FontAwesomeIcons.ccPaypal, 3),
      ],
    );
  }

  Widget MethodCard(IconData iconData, int selected) {
    return
      Badge(
        label: Icon(Icons.check, size: 16,),
        isLabelVisible: selectedIndex == selected ? true : false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
                color: selectedIndex == selected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline),
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: FaIcon(iconData, size: 48),
              onPressed: () {
                setState(() {
                  selectedIndex = selected;
                });
              },
            ),
          ),
        ),
      );
  }
}

class Adresse extends StatelessWidget {
  const Adresse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Manu Chao", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text("8 rue des coquelicots")
              ],
            ),
            Row(
              children: [
                Text("44200 Nantes")
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Recapitulatif extends StatelessWidget {
  const Recapitulatif({
    super.key,
    required this.intPrixEuro,
  });

  final int intPrixEuro;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Récapitulatif de votre commande", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sous-Total"),
                Text("${intPrixEuro/100}€")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Vous économisez", style: TextStyle(color: Colors.green)),
                Text("Nada", style: TextStyle(color: Colors.green))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TVA"),
                Text("${intPrixEuro/500}€")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total"),
                Text("${intPrixEuro/100*1.2}€")
              ],
            )
          ],
        ),
      ),
    );
  }
}
