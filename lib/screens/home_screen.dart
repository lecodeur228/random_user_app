import 'package:contact_app/services/api_service.dart';
import 'package:contact_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? userData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Map<String, dynamic>? data = await ApiService.getUserData();
      setState(() {
        userData = data;
      });
    } catch (e) {
      print("Erreur lors de la récupération des données : $e");
    }
  }

  String convertFormatDate(String dateString) {
    // Analyse la chaîne de date
    DateTime parsedDate = DateTime.parse(dateString);

    // Formate la date dans un format lisible
    String formattedDate =
        "${parsedDate.day}/${parsedDate.month}/${parsedDate.year}";

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Gap(10),
              Row(
                children: [
                  const Text(
                    "CALLS",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.search_outlined)),
                ],
              ),
              const Gap(10),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Today's Call",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
              const Gap(15),
              Expanded(
                child: ListView.builder(
                  itemCount: userData != null ? userData!["results"].length : 0,
                  itemBuilder: (BuildContext context, int index) {
                    if (userData != null) {
                      Map<String, dynamic> items = userData!["results"][index];
                      String date =
                          convertFormatDate(items["registered"]["date"]);
                      return CardWidget(
                        userName: items["name"]["first"],
                        profileImageUrl: items["picture"]["large"],
                        codepostal: 21555,
                        dateTime: date,
                      );
                    }
                    return Container(); // Ou un widget vide si userData est null
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
