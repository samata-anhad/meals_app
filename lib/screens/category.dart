import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/category_grid_items.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Number Of Category')),
      body: GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //how many coloumn will be there
          childAspectRatio:
              3 / 2, // How much size will be there between the columns
          crossAxisSpacing: 20, // Horizontal Spacing
          mainAxisSpacing: 20, // Vertical Spacing
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItems(
              category: category,
            ), // we can use map insted of for in loop
        ],
      ),
    );
  }
}
