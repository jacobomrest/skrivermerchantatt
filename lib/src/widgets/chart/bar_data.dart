import 'package:flutter_table/src/widgets/chart/individual_bar.dart';

class BarData {
  final double janAmount;
  final double febAmount;
  final double marchAmount;
  final double apAmount;
  final double mayAmount;
  final double junAmount;
  final double julAmount;
  final double augAmount;
  final double sepAmount;
  final double octAmount;
  final double novAmount;
  final double decAmount;


  BarData(
      {required this.janAmount,
      required this.febAmount,
      required this.marchAmount,
      required this.apAmount,
      required this.mayAmount,
      required this.junAmount,
      required this.julAmount,
      required this.augAmount,
      required this.sepAmount,
      required this.octAmount,
      required this.novAmount,
      required this.decAmount});

      List<IndividualBar>barData = [];

      void initializedBarData () {
        barData= [
          IndividualBar(x: 0, y: janAmount),
          IndividualBar(x: 1, y: febAmount),
          IndividualBar(x: 2, y: marchAmount),
          IndividualBar(x: 3, y: apAmount),
          IndividualBar(x: 4, y: mayAmount),
          IndividualBar(x: 5, y: junAmount),
          IndividualBar(x: 6, y: julAmount),
          IndividualBar(x: 7, y: augAmount),
          IndividualBar(x: 8, y: sepAmount),
          IndividualBar(x: 9, y: octAmount),
          IndividualBar(x: 10, y: novAmount),
          IndividualBar(x: 11, y: decAmount),

        ];
      }
}
