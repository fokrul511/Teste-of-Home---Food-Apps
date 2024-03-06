import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List teamList = [
      "Farjana Akter Jui",
      "Kamrun Laila",
      "Srabonti Sinha",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Team Members"),
      ),
      body: ListView.builder(
        itemCount: teamList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Card(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const CircleAvatar(
                          minRadius: 50,
                          child: Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          teamList[index],
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Computer Engineer",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Moulvibazar Polytechnic Institute",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
