import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  String? _selectedPaymentType;
  final List<Map<String, dynamic>> _paymentTypes = [
    {'value': 'Credit Card', 'icon': Icons.credit_card, 'text': 'Credit Card'},
    {'value': 'Cash on Delivery', 'icon': Icons.attach_money, 'text': 'Cash'},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingsWidet(h1: "Checkout details", alignment: Alignment.center),
        // Full Name TextField
        const TextField(
          decoration: InputDecoration(
            hintText: 'Full Name',
            border: UnderlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        // Address TextField
        const TextField(
          decoration: InputDecoration(
            hintText: 'Address',
            border: UnderlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        // Mobile Number TextField
        const TextField(
          decoration: InputDecoration(
            hintText: 'Mobile Number',
            border: UnderlineInputBorder(),
          ),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 32.0),
        // Payment Type Dropdown
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            hintText: 'Payment Type',
            border: UnderlineInputBorder(),
          ),
          items: _paymentTypes.map((paymentType) {
            return DropdownMenuItem<String>(
              value: paymentType['value'],
              child: Row(
                children: [
                  Icon(paymentType['icon']),
                  const SizedBox(width: 8.0),
                  Text(paymentType['text']),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedPaymentType = value;
            });
          },
          value: _selectedPaymentType,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: size.height * .04,
            vertical: size.height * .04,
          ),
          child: ElevatedButtonWidget(
              buttonSize: null, function: () {}, buttonText: "Place order"),
        )
      ],
    );
  }
}
