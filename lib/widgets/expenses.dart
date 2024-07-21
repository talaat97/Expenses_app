import 'package:expenses_app/widgets/chart/chart.dart';
import 'package:expenses_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expanses_list/expanses_list.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  final List<Expense> _regusterExpenses = [
    Expense(
        category: Category.food,
        title: 'test1 ',
        amount: 25.56456,
        date: DateTime.now()),
    Expense(
        category: Category.leisure,
        title: 'test2 ',
        amount: 41.9494,
        date: DateTime.now()),
    Expense(
        category: Category.travel,
        title: 'test3 ',
        amount: 57.744,
        date: DateTime.now())
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _regusterExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _regusterExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Expenses Tricker'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) => NewExpese(onAddExpence: _addExpense));
              }),
        ],
      ),
      body: Center(
          child: width < 600
              ? Column(
                  children: [
                    Expanded(child: Chart(expenses: _regusterExpenses)),
                    Expanded(
                      child: ExpensesList(
                        onRemoveExpence: _removeExpense,
                        regusterExpenses: _regusterExpenses,
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: Chart(expenses: _regusterExpenses)),
                    Expanded(
                      child: ExpensesList(
                        onRemoveExpence: _removeExpense,
                        regusterExpenses: _regusterExpenses,
                      ),
                    ),
                  ],
                )),
    );
  }
}
