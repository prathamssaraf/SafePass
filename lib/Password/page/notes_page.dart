import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:safepass/credit/page/card_page.dart';
import 'package:safepass/Password/db/notes_database.dart';
import 'package:safepass/Password/model/note.dart';
import 'package:safepass/Password/page/edit_note_page.dart';
import 'package:safepass/Password/page/note_detail_page.dart';
import 'package:safepass/Password/widget/note_card_widget.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text(
          'Password',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        actions: const [SizedBox(width: 12)],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : notes.isEmpty
                ? Container(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13,
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
                          " Tap the bottom right button to save a password.",
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Image.asset("assets/images/homepage.png"),
                      ],
                    ),
                  )
                : Container(color: Colors.black, child: buildNotes()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddEditNotePage()),
          );

          refreshNotes();
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
              SizedBox(
                width: 20,
              ),
              Spacer(),
              SizedBox(
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

  Widget buildNotes() => StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8),
        itemCount: notes.length,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteDetailPage(noteId: note.id!),
              ));

              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
}
