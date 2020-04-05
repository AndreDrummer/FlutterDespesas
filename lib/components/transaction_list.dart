import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    'Não há transações',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover),
                  )
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  final tr = transactions[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            height: 20,
                            child: FittedBox(
                              child: Text("R\$${tr.value.toStringAsFixed(2)}"),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        "${tr.title}",
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                      trailing: IconButton(
                        onPressed: () => onRemove(tr.id),
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
