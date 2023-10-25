import 'package:flutter/material.dart';
import 'package:flutter_table/src/components/tables/table_data.dart';

class CustomTable extends StatefulWidget {
  final List<Map<String, dynamic>> dataTable;
  final List<Map<String, String>> headers;
  final List<String> types;

  CustomTable(
      {super.key,
      required this.dataTable,
      required this.headers,
      required this.types});

  bool isAscending = true;

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Row(
              children: widget.headers.map((header) {
                final index = headers.indexOf(header);
                final isEven = index % 2 == 0;

                return Container(
                  height: 64,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        spreadRadius: 0,
                      ),
                    ],
                    color: isEven
                        ? const Color.fromARGB(255, 241, 240, 240)
                        : const Color.fromARGB(250, 250, 250, 250),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        header['value'] ?? '',
                        style: _customHeaderTextStyle,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (index == headers.length - 1)
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.isAscending = !widget.isAscending;
                              if (widget.isAscending) {
                                widget.dataTable.sort((a, b) =>
                                    '${a['price']}'.compareTo('${b['price']}'));
                              } else {
                                widget.dataTable.sort((a, b) =>
                                    '${b['price']}'.compareTo('${a['price']}'));
                              }
                            });
                          },
                          icon: Icon(
                            widget.isAscending
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                          ),
                        )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          TableRows(
            dataTable: widget.dataTable,
          )
        ],
      ),
    );
  }
}

class TableRows extends StatelessWidget {
  final List<Map<String, dynamic>> dataTable;

  const TableRows({
    super.key,
    required this.dataTable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dataTable.map((individualData) {
        return Row(children: [
          Container(
            height: 64,
            width: 150,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey),
                  left: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  individualData['company'] as String,
                  style: _cellTextStyle,
                ),
              ],
            ),
          ),
          Container(
            height: 64,
            width: 150,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  individualData['type'] as String,
                  style: _cellTextStyle,
                ),
              ],
            ),
          ),
          Container(
            height: 64,
            width: 150,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  individualData['SKU'] as String,
                  style: _cellTextStyle,
                ),
              ],
            ),
          ),
          Container(
            height: 64,
            width: 150,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  individualData['contact'] as String,
                  style: _cellTextStyle,
                ),
              ],
            ),
          ),
          Container(
            height: 64,
            width: 150,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${individualData['price']}',
                  style: _cellTextStyle,
                ),
              ],
            ),
          )
        ]);
      }).toList(),
    );
  }
}

const TextStyle _customHeaderTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: Colors.black,
);

const TextStyle _cellTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: Colors.black,
);
