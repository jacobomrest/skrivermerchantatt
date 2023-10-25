import 'package:flutter/material.dart';
import 'package:flutter_table/src/components/tables/table.dart';
import 'package:flutter_table/src/components/tables/table_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Table Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: CustomTable(
          dataTable: tableData,
          headers: headers,
          types: types,
        ));
  }
}
