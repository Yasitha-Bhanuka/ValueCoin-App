import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map rates;

  const DetailsPage({super.key, required this.rates});

  @override
  Widget build(BuildContext context) {
    List _currencies = rates.keys.toList();
    List _rates = rates.values.toList();
    return Scaffold(
        body: SafeArea(
      child: ListView.builder(
          itemCount: _currencies.length,
          itemBuilder: (context, index) {
            String _currency =
                _currencies.elementAt(index).toString().toUpperCase();
            String _exchangeRate = _rates.elementAt(index).toString();
            return ListTile(
              title: Text("$_currency: $_exchangeRate",
                  style: const TextStyle(fontSize: 20.0, color: Colors.white)),
            );
          }),
    ));
  }
}
