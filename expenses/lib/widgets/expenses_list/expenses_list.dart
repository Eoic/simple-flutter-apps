import '../../models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expenses/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  final void Function(Expense expense) handleExpenseRemove;

  final List<Expense> expenses;

  const ExpensesList({
    required this.expenses,
    required this.handleExpenseRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey(index),
          background: Container(
            color: Theme.of(context).colorScheme.errorContainer,
            margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          ),
          child: ExpenseItem(expenses[index]),
          onDismissed: (DismissDirection direction) {
            handleExpenseRemove(expenses[index]);
          },
        );
      },
    );
  }
}