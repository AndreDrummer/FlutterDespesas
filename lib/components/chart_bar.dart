import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double value;
  final double percentage;
  final String label;

  ChartBar({
    @required this.label,
    @required this.value,
    @required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('${value.toStringAsFixed(2)}')),
        SizedBox(height: 5),
        Container(
            height: 60,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            )),
        SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}
