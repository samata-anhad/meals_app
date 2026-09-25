import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key, required this.meal, required this.onToggleFavourite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),
      actions: [
        IconButton(onPressed: (){
          onToggleFavourite(meal);
        },
        icon: const Icon(Icons.star)),

      ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
               'Ingridiants',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color:Theme.of(context).colorScheme.primary,
               ),
            ),
            const SizedBox(height:14),
            for(final ingridiants in meal.ingredients)
            Text(
              ingridiants,
               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color:Theme.of(context).colorScheme.onSurface,)
            ),
            const SizedBox(height:14),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
               child: Text(
                 'Steps',
                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:Theme.of(context).colorScheme.primary,
                 ),
                         ),
             ),
            const SizedBox(height:14),
            for(final steps in meal.steps)
            Text(
              steps,
               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color:Theme.of(context).colorScheme.onSurface,)
            ),
          ],
        ),
      ),
    );
  }
}
