import 'package:flutter/material.dart';

import './dummy_data.dart';
import './recipts_item.dart';

class CategoryDetails extends StatelessWidget {
  static const routeName = '/cat_details';
  @override
  Widget build(BuildContext context) {

    final routeArgs =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final filteredCat = DUMMY_RECIPTS.where((recipt) {
      return recipt.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return ReciptsItems(
            title: filteredCat[index].title,
            imageUrl: filteredCat[index].imageUrl,
            duration: filteredCat[index].duration,
            complexity: filteredCat[index].complexity,
            affordability: filteredCat[index].affordability, id: '',
          );
        },
        itemCount: filteredCat.length,
      )
    );
  }
}
