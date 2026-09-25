import 'package:flutter/material.dart';

class MealDrawer extends StatelessWidget {
  const MealDrawer({super.key, required this.onSelectFavourite});

  final void Function(String identifier) onSelectFavourite;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer
                      .withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Padding(padding: EdgeInsetsGeometry.all(2)),
                Text(
                  " Lets! Eat",
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 20,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              "Restaurents",
              style: Theme.of(context).textTheme.titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              onSelectFavourite('Restaurents');
            },
          ),

          ListTile(
            leading: Icon(
              Icons.settings,
              size: 20,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              onSelectFavourite('filters');
            },
          ),
        ],
      ),
    );
  }
}
