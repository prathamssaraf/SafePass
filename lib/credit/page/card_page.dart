import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:safepass/Password/page/notes_page.dart';
import 'package:safepass/credit/db/card_database.dart';
import 'package:safepass/credit/model/card.dart';
import 'package:safepass/credit/page/edit_card_page.dart';
import 'package:safepass/credit/page/card_detail_page.dart';
import 'package:safepass/credit/widget/card_widget.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  late List<Credit> credits;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshCredits();
  }

  @override
  void dispose() {
    CreditDatabase.instance.close();

    super.dispose();
  }

  Future refreshCredits() async {
    setState(() => isLoading = true);

    this.credits = await CreditDatabase.instance.readAllCredits();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Credits',
          style: TextStyle(fontSize: 24),
        ),
        actions: [SizedBox(width: 12)],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : credits.isEmpty
                ? Container(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Text(
                          "Saving\nmakes life easier.",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          " Tap the bottom right button to save a Card.",
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Image.asset("assets/images/cardpageblack.png"),
                      ],
                    ),
                  )
                : Container(color: Colors.black, child: buildCredits()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddEditCreditPage()),
          );

          refreshCredits();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          color: Colors.black,
          height: 55,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardPage()),
                  );
                },
                icon: Image.asset(
                  "assets/icons/cardicon.png",
                  height: 1000,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Spacer(),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotesPage()),
                  );
                },
                icon: Image.asset(
                  "assets/icons/passwordicon.png",
                  fit: BoxFit.fitHeight,
                  height: 38,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ));

  Widget buildCredits() => ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: credits.length,
        itemBuilder: (context, index) {
          final credit = credits[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreditDetailPage(creditId: credit.id!),
              ));
              refreshCredits();
            },
            child: CreditCreditWidget(credit: credit, index: index),
          );
        },
      );
}
