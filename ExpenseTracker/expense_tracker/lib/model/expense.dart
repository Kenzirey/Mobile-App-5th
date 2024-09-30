import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
  hobby,
}

/// Maps categories to their respective icons.
const categoryIcons = {
  Category.food: Icons.lunch_dining_rounded,
  Category.travel: Icons.flight_land_outlined,
  Category.leisure: Icons.headphones_outlined,
  Category.work: Icons.work,
  Category.hobby: Icons.home_max_outlined,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return dateFormatter.format(date);
  }
}

/// For building a chart, we need a bucket (container for data) for every category,
/// so we can sum up all the expenses that belong to a category and display in the chart.
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      // sum += expense.amount;
      sum = sum + expense.amount;
    }

    return sum;
  }
}
