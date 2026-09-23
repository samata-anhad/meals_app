import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
     // This is the Constructor Functions Where The Parameters are used only the below type
  });

  final String id; // the type of Datatypes Uses In This Class
  final String title;
  final Color color;
}
