import 'package:coffee_shop/common/routes/routes.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_home/widgets/search_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<Coffee> data;

  CustomSearchDelegate(this.data);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, "");
          } else {
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(CupertinoIcons.back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Coffee> results = data
        .where((e) =>
            e.flavor.toString().toLowerCase().contains(query.toLowerCase()) ||
            e.id.toString().toLowerCase().contains(query.toLowerCase()) ||
            e.name.toString().toLowerCase().contains(query.toLowerCase()) ||
            e.price.toString().toLowerCase().contains(query.toLowerCase()) ||
            e.type.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var coffee = results[index];
        return InkWell(
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.detail, arguments: coffee),
          child: buildSearchItem(context, results[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Coffee> results = data
        .where((e) =>
            e.flavor.toString().toLowerCase().contains(query.toLowerCase()) ||
            e.id.toString().toLowerCase().contains(query.toLowerCase()) ||
            e.name.toString().toLowerCase().contains(query.toLowerCase()) ||
            e.price.toString().toLowerCase().contains(query.toLowerCase()) ||
            e.type.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var coffee = results[index];

        return InkWell(
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.detail, arguments: coffee),
          child: buildSearchItem(context, results[index]),
        );
      },
    );
  }
}
