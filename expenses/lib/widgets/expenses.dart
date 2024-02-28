import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/chart/chart.dart';
import 'package:expenses/widgets/expenses_list/expenses_list.dart';
import 'package:expenses/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenses = [
    Expense(
      title: 'Flutter course',
      amount: 19.99,
      category: Category.work,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Cinema',
      amount: 9.99,
      category: Category.leisure,
      date: DateTime.now(),
    ),
  ];

  void _handleExpenseAdd(Expense expense) {
    setState(() => expenses.add(expense));
  }

  void _handleExpenseRemove(Expense expense) {
    final index = expenses.indexOf(expense);
    setState(() => expenses.remove(expense));

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              expenses.insert(index, expense);
            });
          },
        ),
        content: const Text('Expense deleted.'),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return NewExpense(
          handleExpenseAdd: _handleExpenseAdd,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var isWide = MediaQuery.of(context).size.width >= 600;

    Widget mainContent = const Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.check,
          size: 32,
        ),
        SizedBox(
          width: 8,
        ),
        Text('No expenses yet.'),
      ]),
    );

    if (expenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: expenses,
        handleExpenseRemove: _handleExpenseRemove,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Chart(expenses: expenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Chart(expenses: expenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
