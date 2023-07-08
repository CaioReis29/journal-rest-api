import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/journal_services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddJournalScreen extends StatelessWidget {

  final Journal journal;
  final bool isEditing;
  final TextEditingController _contentController = TextEditingController();

  AddJournalScreen({ 
    Key? key, 
    required this.journal,
    required this.isEditing,
    }): super(key: key);

   @override
   Widget build(BuildContext context) {
    _contentController.text = journal.content;
       return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(WeekDay(journal.createdAt).toString(),
          ),
          actions: [
            IconButton(
              onPressed: (){
                registerJournal(context);
              }, 
              icon: const Icon(Icons.check),
              ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _contentController,
            keyboardType: TextInputType.multiline,
            style: const TextStyle(
              fontSize: 18,
            ),
            expands: true,
            minLines: null,
            maxLines: null,
          ),
        ),
       );
  }

  registerJournal(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString("accessToken");
      if(token != null) {
        String content = _contentController.text;

          journal.content = content;

          JournalService service = JournalService();

          if(isEditing) {
          service.register(journal, token)
          .then((value) {
          Navigator.pop(context, value);
          });
          
          } else {
            service.edit(journal.id, journal, token).then((value) {
              Navigator.pop(context, value);
            });
          }
      }
    });

 

  }
}