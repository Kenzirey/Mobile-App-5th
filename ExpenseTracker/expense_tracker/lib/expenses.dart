import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Devil Mushroom',
      amount: 666,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
        title: 'Furry Suit',
        amount: 15000,
        date: DateTime.now(),
        category: Category.hobby),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Char goes here'),
          Text('Expenses List goes here'),
        ],
      ),
    );
  }
}
