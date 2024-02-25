import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();

final dateFormatter = DateFormat.yMMMMd();

enum Category {
  food,
  travel,
  leisure,
  work,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String getFormattedDate() {
    return dateFormatter.format(date);
  }

  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  }) : id = uuid.v4();
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(
      {required List<Expense> allExpenses, required this.category})
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();

  double get totalExpenses {
    double total = 0;

    for (final expense in expenses) {
      total += expense.amount;
    }

    return total;
  }
}
