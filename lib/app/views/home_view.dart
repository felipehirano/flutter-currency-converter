import 'package:conversor_moeda/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../components/currency_box.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController  = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 30, left: 30, right: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
             children: [
              const SizedBox(
                width: 150,
                height: 150,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/conversor.jpeg'),
                ),
              ),
              const SizedBox(height: 50),
              CurrencyBox(
                items: homeController.currencies,
                selectedItem: homeController.toCurrency, 
                controller: toText,
                onChanged: (model) {
                  setState(() {
                    homeController.toCurrency = model!;
                  });
                },
              ),
              const SizedBox(height: 10),
              CurrencyBox(
                items: homeController.currencies, 
                selectedItem: homeController.fromCurrency, 
                controller: fromText,
                onChanged: (model) {
                  setState(() {
                    homeController.fromCurrency = model!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, // Background color
                ),
                onPressed: () {
                  homeController.convert();
                },
                child: const Text('CONVERTER'),
              ),
             ],
            ),
          ),
        ),
      )
    );
  }
}