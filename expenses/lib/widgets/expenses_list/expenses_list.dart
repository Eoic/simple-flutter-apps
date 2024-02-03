import '../../models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expenses/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensesList({
    required this.expenses,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpenseItem(expenses[index]);
      },
    );
  }
}