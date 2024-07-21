import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesIteam extends StatelessWidget {
  const ExpensesIteam({required this.expense, super.key});

  final Expense expense;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style:Theme.of(context).textTheme.titleLarge ,),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    //icon ->category
                   Icon(categoryIcon[expense.category]),
                    const SizedBox(width: 5),
                    Text(expense.formateDate),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}