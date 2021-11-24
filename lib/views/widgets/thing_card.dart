import 'package:flutter/material.dart';
import 'package:pvd_things_app/models/thing.dart';
import 'package:pvd_things_app/color_generator.dart';

class ThingCard extends StatelessWidget {
  final Thing thing;

  const ThingCard({Key? key, required this.thing}) : super(key: key);

  String get _tag => thing.location ?? "Wanted";

  Color _tagColor(String tag) {
    if (tag == "Wanted") return Colors.black;
    return ColorGenerator.generate(tag);
  }

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
                    _tag,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  decoration: BoxDecoration(
                    color: _tagColor(_tag),
                    borderRadius: const BorderRadius.all(Radius.circular(45)),
                  ),
                ),
              ],
            ),
            Image.network(thing.image!, height: 86),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      ),
    );
  }
}
