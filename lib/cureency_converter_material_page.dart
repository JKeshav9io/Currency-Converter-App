import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Required for kDebugMode

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key}); // Constructor with a constant key.

  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage> {
  final TextEditingController _controller = TextEditingController(); // Controller for input text field.
  double? _convertedAmount; // Holds the converted currency value.
  final double _conversionRate = 86.61;// Example conversion rate from USD to INR.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter App"), // Title displayed in the app bar.
        backgroundColor: Colors.white54, // Light grey background for the app bar.
      ),
      backgroundColor: Colors.blueGrey, // Background color of the entire page.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers the children vertically.
          children: [
            // Display the converted amount or placeholder text.
            Text(
              _convertedAmount != null
                  ? "₹${_convertedAmount!.toStringAsFixed(2)}" // Display result with 2 decimal places.
                  : "0", // Placeholder text.
              style: const TextStyle(
                color: Colors.white, // White text color.
                fontWeight: FontWeight.bold, // Bold font style.
                fontSize: 35, // Font size of the text.
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0), // Padding around the text field.
              child: TextField(
                controller: _controller, // Connects the input to the controller.
                decoration: InputDecoration(
                  hintText: "Please Enter The Amount In USD...", // Placeholder text.
                  hintStyle: const TextStyle(color: Colors.grey), // Grey color for hint text.
                  prefixIcon: const Icon(
                    Icons.monetization_on_outlined, // Icon showing a currency symbol.
                    color: Colors.blue, // Blue icon color.
                  ),
                  filled: true, // Enables background color for the text field.
                  fillColor: Colors.white, // Background color for the text field.
                  contentPadding: const EdgeInsets.symmetric(vertical: 15), // Padding inside the field.

                  // Default rounded border for the text field.
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.5), // Grey border.
                    borderRadius: BorderRadius.all(Radius.circular(70)), // Rounded corners.
                  ),

                  // Border style when the text field is focused.
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0), // Blue border when focused.
                    borderRadius: BorderRadius.all(Radius.circular(70)),
                  ),
                ),
                keyboardType: TextInputType.number, // Restricts input to numerical values.
              ),
            ),
            const SizedBox(height: 20), // Adds vertical spacing between the text field and the button.
            // Button to trigger the currency conversion.
            TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  try {
                    final double amountInUSD = double.parse(_controller.text); // Parse input as a double.
                    setState(() {
                      _convertedAmount = amountInUSD * _conversionRate; // Calculate converted value.
                    });
                  } catch (e) {
                    if (kDebugMode) {
                      print("Invalid input: $e"); // Log error for invalid input.
                    }
                    setState(() {
                      _convertedAmount = null; // Reset the conversion result on error.
                    });
                  }
                } else {
                  setState(() {
                    _convertedAmount = null; // Reset the conversion result if input is empty.
                  });
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue, // Blue background color for the button.
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Padding inside the button.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners for the button.
                ),
              ),
              child: const Text(
                "Convert", // Button label text.
                style: TextStyle(
                  color: Colors.white, // White text color for the button label.
                  fontSize: 18, // Font size for the button label.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
