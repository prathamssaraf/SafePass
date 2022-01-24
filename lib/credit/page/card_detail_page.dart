import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safepass/credit/db/card_database.dart';
import 'package:safepass/credit/model/card.dart';
import 'package:safepass/credit/page/edit_card_page.dart';
import 'package:string_extensions/string_extensions.dart';
import 'package:credit_card_validate/credit_card_validate.dart';

class CreditDetailPage extends StatefulWidget {
  final int creditId;

  const CreditDetailPage({
    Key? key,
    required this.creditId,
  }) : super(key: key);

  @override
  _CreditDetailPageState createState() => _CreditDetailPageState();
}

class _CreditDetailPageState extends State<CreditDetailPage> {
  late Credit credit;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshCredit();
  }

  Future refreshCredit() async {
    setState(() => isLoading = true);

    this.credit = await CreditDatabase.instance.readCredit(widget.creditId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(32, 20, 32, 26),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: Offset(0, 1))
                          ]),
                      width: MediaQuery.of(context).size.width * .9,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 60,
                                child: Column(
                                  children: [
                                    if (CreditCardValidator.identifyCardBrand(
                                            credit.cardnumber) ==
                                        "visa") ...[
                                      Image.asset("assets/cardtype/visa.png")
                                    ] else if (CreditCardValidator
                                            .identifyCardBrand(
                                                credit.cardnumber) ==
                                        "master_card") ...[
                                      Image.asset(
                                          "assets/cardtype/master_card.png")
                                    ] else if (CreditCardValidator
                                            .identifyCardBrand(
                                                credit.cardnumber) ==
                                        "american_express") ...[
                                      Image.asset(
                                          "assets/cardtype/american_express.png")
                                    ] else if (CreditCardValidator
                                            .identifyCardBrand(
                                                credit.cardnumber) ==
                                        "discover") ...[
                                      Image.asset(
                                          "assets/cardtype/discover.png")
                                    ]
                                  ],
                                ),
                              ),
                              Text(
                                "SafePass",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF707070)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                credit.cardnumber,
                                style: TextStyle(
                                    fontSize: 23.8,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF707070)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "CARD HOLDER",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Roboto",
                                    color: Color(0xFF707070)),
                              ),
                              Text(
                                "VALID THRU",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: "Roboto",
                                    color: Color(0xFF707070)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${credit.name.toTitleCase}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                    color: Color(0xFF707070)),
                              ),
                              Text(
                                credit.expiry,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                    color: Color(0xFF707070)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: Offset(0, 1))
                          ]),
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .265,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.933,
                                height: 40,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.533,
                                height: 40,
                                color: Colors.blueGrey[200],
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.233,
                                    ),
                                    Text(
                                      "  *********" + "${credit.cvv}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "  SafePass",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                    color: Color(0xFF707070)),
                              ),
                              Text(
                                "Authorized Signature    ",
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                    color: Color(0xFF707070)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditCreditPage(credit: credit),
        ));

        refreshCredit();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await CreditDatabase.instance.delete(widget.creditId);

          Navigator.of(context).pop();
        },
      );
}
