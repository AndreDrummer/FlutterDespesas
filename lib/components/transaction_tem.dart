import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class TransactionItem extends StatefulWidget {
  
  final Transaction tr;
  final void Function(String) onRemove; 
  
  const TransactionItem({
    Key key,
    @required this.tr,
    @required this.onRemove,
  }) : super(key: key);  

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  
  Color _background;

  static const colors = [
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];
  
  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(6);
    _background = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _background,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              height: 20,
              child: FittedBox(
                child: Text("R\$${widget.tr.value.toStringAsFixed(2)}"),
              ),
            ),
          ),
        ),
        title: Text(
          "${widget.tr.title}",
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(DateFormat('d MMM y').format(widget.tr.date)),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: Icon(Icons.delete),
                label: Text(
                  "Excluir",
                ),
                textColor: Theme.of(context).errorColor
              )
            : IconButton(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}