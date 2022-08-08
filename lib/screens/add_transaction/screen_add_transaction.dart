import 'package:flutter/material.dart';
import 'package:money_manager_flutter/db/category/category_db.dart';
import 'package:money_manager_flutter/modals/category/category_model.dart';

class ScreenAddTransaction extends StatefulWidget{
  static const routeName = 'add-transaction';
  const ScreenAddTransaction({Key? key}) : super(key: key);

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategoryType;
  CategoryModel? _selectedCategoryModel;
  /*
  Purpose
  Date
  Amount
  Income/Expense
  CategoryType
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'purpose',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Amount',
                ),
              ),
              TextButton.icon(onPressed: ()async{
                final _selectedDateTemp = await showDatePicker(
                    context: context,
                   initialDate: DateTime.now(),
                   firstDate: DateTime.now().subtract(Duration(days: 30)),
                   lastDate: DateTime.now(),
                );
                if(_selectedDateTemp == null){
                  return;
                }else{
                  print(_selectedDateTemp.toString());
                  setState(() {
                    _selectedDate = _selectedDateTemp;
                  });
                }
              },
                  icon: Icon(Icons.calendar_today),
                label: Text(_selectedDate == null ? 'Select Date': _selectedDate!.toString()),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: CategoryType.income,
                          groupValue: CategoryType.income,
                          onChanged: (newValue) {

                          }),
                      Text('Income'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: CategoryType.expense ,
                          groupValue: CategoryType.expense,
                          onChanged: (newValue) {
                          }),
                      Text('Expense'),
                    ],
                  ),
                ],
              ),
             DropdownButton(
               hint: Text('Select Category'),
                 items: CategoryDB().expenseCategoryListListener.value.map((e) {
                   return DropdownMenuItem(
                     value: e.id,
                       child: Text(e.name),
                   );
                 }).toList(),
                 onChanged: (selectedValue){
                   print(selectedValue);
                 }),
              Center(
                child: ElevatedButton(onPressed: (){

                },
                child: Text('SUBMIT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}