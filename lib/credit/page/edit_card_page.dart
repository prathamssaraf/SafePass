import 'package:flutter/material.dart';
import 'package:safepass/credit/db/card_database.dart';
import 'package:safepass/credit/model/card.dart';
import 'package:safepass/credit/widget/card_form_widget.dart';

class AddEditCreditPage extends StatefulWidget {
  final Credit? credit;

  const AddEditCreditPage({
    Key? key,
    this.credit,
  }) : super(key: key);
  @override
  _AddEditCreditPageState createState() => _AddEditCreditPageState();
}

class _AddEditCreditPageState extends State<AddEditCreditPage> {
  final _formKey = GlobalKey<FormState>();
  late String cvv;
  late String name;
  late int number;
  late String cardnumber;
  late String expiry;

  @override
  void initState() {
    super.initState();

    cvv = widget.credit?.cvv ?? '';
    name = widget.credit?.name ?? '';
    number = widget.credit?.number ?? 0;
    cardnumber = widget.credit?.cardnumber ?? '';
    expiry = widget.credit?.expiry ?? '';
  }

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CreditFormWidget(
                cvv: cvv,
                name: name,
                number: number,
                cardnumber: cardnumber,
                expiry: expiry,
                onChangedCvv: (cvv) => setState(() => this.cvv = cvv),
                onChangedNumber: (number) =>
                    setState(() => this.number = number),
                onChangedCardnumber: (cardnumber) =>
                    setState(() => this.cardnumber = cardnumber),
                onChangedExpiry: (expiry) =>
                    setState(() => this.expiry = expiry),
                onChangedName: (name) => setState(() => this.name = name),
              ),
              buildButton(),
            ],
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = cardnumber.isNotEmpty && expiry.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? Colors.deepPurple : Colors.grey.shade700,
          textStyle: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              fontFamily: "ProximaSoft"),
          padding: const EdgeInsets.symmetric(horizontal: 138, vertical: 17),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
        onPressed: addOrUpdateCredit,
        child: const Text('Save'),
      ),
    );
  }

  void addOrUpdateCredit() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.credit != null;

      if (isUpdating) {
        await updateCredit();
      } else {
        await addCredit();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateCredit() async {
    final credit = widget.credit!.copy(
      cvv: cvv,
      name: name,
      number: number,
      cardnumber: cardnumber,
      expiry: expiry,
    );

    await CreditDatabase.instance.update(credit);
  }

  Future addCredit() async {
    final credit = Credit(
      cardnumber: cardnumber,
      cvv: cvv,
      name: name,
      number: number,
      expiry: expiry,
      createdTime: DateTime.now(),
    );

    await CreditDatabase.instance.create(credit);
  }
}
