import 'package:expenses_app/widgets/expanses_list/expenses_iteam.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required List<Expense> regusterExpenses,
    required this.onRemoveExpence,
  }) : expenses = regusterExpenses;

  final void Function(Expense expense) onRemoveExpence;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.7),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) => onRemoveExpence(expenses[index]),
        child: ExpensesIteam(
          expense: expenses[index],
        ),
      ),
      itemCount: expenses.length,
    );
  }
}
