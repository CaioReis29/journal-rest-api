import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';


class AddJournalScreen extends StatelessWidget {

  final Journal journal;
  const AddJournalScreen({ super.key, required this.journal });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("${WeekDay(journal.createdAt.weekday).long.toLowerCase()}, ${journal.createdAt.day} / ${journal.createdAt.month} / ${journal.createdAt.year}",
          ),
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.check),
              ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.multiline,
            style: TextStyle(
              fontSize: 24,
            ),
            expands: true,
            minLines: null,
            maxLines: null,
          ),
        ),
       );
  }
}