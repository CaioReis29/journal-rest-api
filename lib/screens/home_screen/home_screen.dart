import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/constants/constants.dart';
import 'package:flutter_webapi_first_course/screens/commom/exception_dialog.dart';
import 'package:flutter_webapi_first_course/screens/home_screen/widgets/home_screen_list.dart';
import 'package:flutter_webapi_first_course/services/journal_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/logout.dart';
import '../../models/journal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // O último dia apresentado na lista
  DateTime currentDay = DateTime.now();

  // Tamanho da lista
  int windowPage = 10;

  // A base de dados mostrada na lista
  Map<String, Journal> database = {};

  final ScrollController _listScrollController = ScrollController();

  JournalService service = JournalService();

  int? userId;
  String? userToken;

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantsColors.primaryColor,
        title: Text(
          "${currentDay.day}  /  ${currentDay.month}  /  ${currentDay.year}",
        ),
        actions: [
          IconButton(
            onPressed: () => refresh(), 
            icon: const Icon(Icons.refresh)
            ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () => logout(context),
              title: const Text(
                'Sair',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
                ),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  shape: BoxShape.circle
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.black87,
                ),
              ),
            )
          ],
        ),
      ),
      body: (userId != null && userToken != null) ? 
      ListView(
        controller: _listScrollController,
        children: generateListJournalCards(
          token: userToken!,
          userId: userId!,
          refreshFunction: refresh,
          windowPage: windowPage,
          currentDay: currentDay,
          database: database,
        ),
      ) 
      : const Center(child: CircularProgressIndicator(),)
    );
  }

  void refresh() async{
    SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString("accessToken");
      String? email = prefs.getString("email");
      int? id = prefs.getInt("id");

      if(token != null && email != null && id != null) {
        setState(() {
          userId = id;
          userToken = token;
        });
          service.getAll(id: id.toString(), token: token).then((List<Journal> listJournal) {
            setState(() {
            database = {};
            for (Journal journal in listJournal) {
              database[journal.id] = journal;
            }
          });
          });
      } else {
        Navigator.pushReplacementNamed(context, "login");
      }
    }).catchError((error) {
      logout(context);
    },
    test: (error) => error is TokenNotValidException,
    ).catchError((error) {
      var innerError = error as HttpException;
        showExceptionDialog(context, content: innerError.message);
    },
    test: (error) => error is HttpException,
    );

  }

  }

