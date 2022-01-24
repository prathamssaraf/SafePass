import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/credit_card_validator.dart';

class CreditFormWidget extends StatelessWidget {
  final String? cvv;
  final int? number;
  final String? name;
  final String? cardnumber;
  final String? expiry;
  final ValueChanged<String> onChangedCvv;
  final ValueChanged<String> onChangedName;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedCardnumber;
  final ValueChanged<String> onChangedExpiry;

  const CreditFormWidget({
    Key? key,
    this.cvv = '',
    this.name = '',
    this.number = 0,
    this.cardnumber = '',
    this.expiry = '',
    required this.onChangedCvv,
    required this.onChangedName,
    required this.onChangedNumber,
    required this.onChangedCardnumber,
    required this.onChangedExpiry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              buildCreditnumber(),
              const Divider(
                thickness: 3,
                color: Colors.white54,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(child: buildExpiry()),
                  const Spacer(),
                  Expanded(child: buildCVV()),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: const Divider(
                      thickness: 3,
                      color: Colors.white54,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 110,
                    child: const Divider(
                      thickness: 3,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              buildName(),
              const Divider(
                thickness: 3,
                color: Colors.white54,
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      );

  Widget buildCreditnumber() => TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(19),
          CreditCardNumberInputFormatter(),
        ],
        maxLines: 1,
        initialValue: cardnumber,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Card Number',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedCardnumber,
      );

  Widget buildExpiry() => TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [CreditCardExpirationDateFormatter()],
        maxLines: 1,
        initialValue: expiry,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Expiry Date',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (creditnumber) =>
            creditnumber != null && creditnumber.isEmpty
                ? 'The date cannot be empty'
                : null,
        onChanged: onChangedExpiry,
      );

  Widget buildCVV() => TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [CreditCardCvcInputFormatter()],
        maxLines: 1,
        initialValue: cvv,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'CVV',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (creditnumber) =>
            creditnumber != null && creditnumber.isEmpty
                ? 'The description cannot be empty'
                : null,
        onChanged: onChangedCvv,
      );

  Widget buildName() => TextFormField(
        textCapitalization: TextCapitalization.sentences,
        maxLines: 1,
        initialValue: name,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Name',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (creditnumber) =>
            creditnumber != null && creditnumber.isEmpty
                ? 'The description cannot be empty'
                : null,
        onChanged: onChangedName,
      );
}
