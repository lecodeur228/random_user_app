import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardWidget extends StatelessWidget {
  final String userName;
  final String profileImageUrl;
  final int codepostal;
  final String dateTime;
  const CardWidget(
      {required this.userName,
      super.key,
      required this.profileImageUrl,
      required this.codepostal, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              image: DecorationImage(
                                  image: NetworkImage(profileImageUrl)),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        const Gap(10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const Gap(10),
                            Text(
                              codepostal.toString(),
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Gap(10),
                     Text(
                      dateTime.toString(),
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w300),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Color(0xFFF2F2F2), shape: BoxShape.circle),
                child: const Icon(Icons.call)),
          ],
        ),
      ),
    );
  }
}
