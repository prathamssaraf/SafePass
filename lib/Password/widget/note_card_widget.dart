import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safepass/Password/model/note.dart';
import 'package:octo_image/octo_image.dart';
import 'package:flutter_icons/flutter_icons.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);
    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: 100),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: OctoImage(
                    image: AssetImage(
                        "assets/logo/${note.title.toLowerCase()}.png"),
                    errorBuilder: OctoError.icon(
                      icon: Icons.circle,
                      color: Colors.deepPurple,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                const Spacer(),
                Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  time,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }

  // String getImage(String image) {
  //   String img;
  //   try {
  //     img = 'assets/images/${note.title.toLowerCase()}.png';
  //   } catch (e) {
  //     img = 'assets/images/default.png';
  //   }
  //   return img;
  // }
}
