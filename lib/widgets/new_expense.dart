import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class NewExpese extends StatefulWidget {
  const NewExpese({super.key, required this.onAddExpence});

  final void Function(Expense expense) onAddExpence;

  @override
  State<NewExpese> createState() => _NewExpeseState();
}

class _NewExpeseState extends State<NewExpese> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final formatter = DateFormat().add_yMd();
  DateTime? _selectDate;
  Category _selectedCategory = Category.travel;
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('cansel'),
                ),
                TextField(
                  controller: _titleController,
                  maxLength: 25,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixText: '\$',
                          label: Text('Amount'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      _selectDate == null
                          ? 'No date Selected'
                          : formatter.format(_selectDate!),
                    ),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final firstDate =  DateTime(now.year - 1, now.month, now.day);
                        final lastDate =  DateTime(now.year +1,now.month,now.day);
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: firstDate,
                          lastDate: lastDate,
                        );
                        setState(() {
                          _selectDate = pickedDate;
                          log(_selectDate.toString());
                        });
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.name.toUpperCase()),
                                ))
                            .toList(),
                        onChanged: (newCat) {
                          if (newCat == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = newCat;
                          });
                        }),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          final enteredAmount =
                              double.tryParse(_amountController.text);
                          final isAmountInvalid =
                              enteredAmount == null || enteredAmount <= 0;

                          if (isAmountInvalid ||
                              _selectDate == null ||
                              _titleController.text.trim().isEmpty) {
                            Platform.isIOS
                                ? showCupertinoDialog(
                                    context: context,
                                    builder: (ctx) => CupertinoAlertDialog(
                                      title: const Text('Invalid input'),
                                      content: const Text(
                                          'your are mother fucker enter a right amount or title asshole'),
                                      actions: [
                                        TextButton(
                                            onPressed: () => Navigator.pop(ctx),
                                            child: const Text('Okay'))
                                      ],
                                    ),
                                  )
                                : showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text('Invalid input'),
                                      content: const Text(
                                          'your are mother fucker enter a right amount or title asshole'),
                                      actions: [
                                        TextButton(
                                            onPressed: () => Navigator.pop(ctx),
                                            child: const Text('Okay'))
                                      ],
                                    ),
                                  );
                          } else {
                            widget.onAddExpence(
                              Expense(
                                  category: _selectedCategory,
                                  title: _titleController.text,
                                  amount: enteredAmount,
                                  date: _selectDate!),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Save Expanse'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
