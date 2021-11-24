import 'package:flutter/material.dart';
import 'package:pvd_things_app/models/thing.api.dart';
import 'package:pvd_things_app/models/thing.dart';
import 'package:pvd_things_app/views/widgets/thing_card.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  Icon searchIcon = const Icon(Icons.search);
  Widget title = const Text("The Things");

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

  void _toggleSearch() {
    setState(() {
      if (searchIcon.icon == Icons.search) {
        searchIcon = const Icon(Icons.cancel);
        title = const ListTile(
          leading: Icon(
            Icons.search,
            color: Colors.white,
            size: 28,
          ),
          title: TextField(
            decoration: InputDecoration(
              hintText: "Start typing...",
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.white),
          ),
        );
      } else {
        searchIcon = const Icon(Icons.search);
        title = const Text("The Things");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: searchIcon,
            onPressed: _toggleSearch,
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
