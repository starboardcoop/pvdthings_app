import 'package:flutter/material.dart';
import 'package:pvd_things_app/models/thing.dart';

class ThingCard extends StatelessWidget {
  final Thing thing;

  const ThingCard({required this.thing});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  thing.name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  child: Text(
                    thing.location ?? "Wanted",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(45)),
                  ),
                ),
              ],
            ),
            Image.network(
              thing.image!,
              height: 86,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      ),
    );
  }
}
