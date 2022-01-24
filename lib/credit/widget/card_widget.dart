import 'package:credit_card_validate/credit_card_validate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safepass/credit/model/card.dart';
import 'package:string_extensions/string_extensions.dart';

class CreditCreditWidget extends StatelessWidget {
  CreditCreditWidget({
    Key? key,
    required this.credit,
    required this.index,
  }) : super(key: key);

  final Credit credit;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index

    return Column(
      children: [
        Container(
          color: Colors.black,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.29,
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
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
                    height: MediaQuery.of(context).size.height * 0.29,
                    width: MediaQuery.of(context).size.width * .95,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // height: 60,
                              width: 60,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
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
                                    Image.asset("assets/cardtype/discover.png")
                                  ]
                                ],
                              ),
                            ),
                            const Text(
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
                          height: 28.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "  ****  ****  **** " +
                                  credit.cardnumber
                                      .substring(credit.cardnumber.length - 5),
                              style: const TextStyle(
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
                          children: const [
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
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF707070)),
                            ),
                            Text(
                              credit.expiry,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
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
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  /// To return different height for different widgets
}
