import 'package:flutter/material.dart';
import 'package:flutter_table/src/widgets/tables/table.dart';
import 'package:flutter_table/src/widgets/tables/table_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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
          chartValues: chartValues,
        ));
  }
}
