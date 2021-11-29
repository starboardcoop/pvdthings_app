import 'package:flutter/material.dart';
import 'package:pvd_things_app/models/thing.api.dart';
import 'package:pvd_things_app/models/thing.dart';
import 'package:pvd_things_app/views/search.dart';
import 'package:pvd_things_app/views/widgets/thing_card.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  late List<Thing> _things;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getThings();
  }

  Future<void> getThings() async {
    _things = await ThingApi.getThings();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PVD Things"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchView()),
            ),
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _things.length,
              itemBuilder: (context, index) => ThingCard(thing: _things[index]),
            ),
    );
  }
}
