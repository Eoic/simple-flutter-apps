import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMMMMd();

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) handleExpenseAdd;

  const NewExpense({required this.handleExpenseAdd, super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _openDatePicker() async {
    final DateTime currentDate = DateTime.now();
    final DateTime currentSelectedDate =
        _selectedDate == null ? DateTime.now() : _selectedDate!;
    final firstDate =
        DateTime(currentDate.year - 1, currentDate.month, currentDate.day);

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: currentSelectedDate,
      firstDate: firstDate,
      lastDate: currentDate,
    );

    setState(() => _selectedDate = selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                TextField(
                  maxLength: 100,
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text('Amount'),
                          prefixText: '€',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _selectedDate == null
                                ? 'No date selected'
                                : dateFormatter.format(_selectedDate!),
                          ),
                          IconButton(
                            onPressed: _openDatePicker,
                            icon: const Icon(Icons.calendar_month),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (element) => DropdownMenuItem(
                              value: element,
                              child: Text(element.name.toUpperCase()),
                            ),
                          )
                          .toList(),
                      onChanged: (dynamic item) {
                        setState(() => _selectedCategory = item);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: _submitExpense,
                      child: const Text('Save'),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimaryContainer,
                        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.errorContainer,
                      ),
                      child: const Text('Cancel'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitExpense() {
    final amount = double.tryParse(_amountController.text);
    final isTitleInvalid = _titleController.text.trim().isEmpty;
    final isAmountInvalid =
        amount == null || amount.isInfinite || amount.isNegative;
    final isDateInvalid = _selectedDate == null;

    if (isTitleInvalid || isAmountInvalid || isDateInvalid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.error,
              color: Colors.red,
            ),
            title: const Text('Invalid input'),
            content: const Text(
                'Please make sure title, amount and date values are correct.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Understood'),
              )
            ],
          );
        },
      );

      return;
    }

    final expense = Expense(
      title: _titleController.text.trim(),
      amount: amount,
      category: _selectedCategory,
      date: _selectedDate!,
    );

    widget.handleExpenseAdd(expense);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
