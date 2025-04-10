import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      CurrencyConverterMaterialPageState();
}

class CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  final Map<String, double> exchangeRates = {
    'INR': 81,    // Indian Rupee
    'EUR': 0.92,  // Euro
    'GBP': 0.78,  // British Pound
    'JPY': 130.5, // Japanese Yen
  };
  String selectedCurrency = 'INR';

  void convert() {
    setState(() {
      if (textEditingController.text.isEmpty) {
        result = 0;
      } else {
        try {
          double amount = double.parse(textEditingController.text);
          result = amount * exchangeRates[selectedCurrency]!;
        } catch (e) {
          result = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 3.0,
        style: BorderStyle.solid,
        color: Color(0xFFE0F2F1),
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return Scaffold(
      backgroundColor: Color(0xFF004D40),
      appBar: AppBar(
        backgroundColor: Color(0xFF004D40),
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold , color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF26A69A),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                     BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Text(
                  '$selectedCurrency ${result.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                child: DropdownButton<String>(
                  value: selectedCurrency,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCurrency = newValue!;
                    });
                  },
                  items: exchangeRates.keys.map((currency) {
                    return DropdownMenuItem(
                      value: currency,
                      child: Text(
                        currency,
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  }).toList(),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  underline: const SizedBox(),
                ),
              ),
              TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter Amount in USD',
                  hintStyle: const TextStyle(color: Colors.black54),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: convert,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB0BEC5),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5, //
                  shadowColor: Colors.black26,
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

