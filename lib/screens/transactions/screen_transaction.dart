import 'package:flutter/material.dart';
class ScreenTransaction extends StatelessWidget{
  const ScreenTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      padding: const EdgeInsets.all(10.0),
        itemBuilder: (ctx, index) {
          return const Card(
            elevation: 0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 50,
                  child: Text('12 \n DEC',textAlign: TextAlign.center)),
              title: Text('RS 10000/-') ,
              subtitle: Text('Travel'),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return SizedBox(height: 10);
        },
        itemCount: 10);
  }

}