import 'package:flutter/material.dart';
import 'package:flutter_table/src/widgets/chart/bar_graph.dart';
import 'package:flutter_table/src/widgets/tables/table_data.dart';

class CustomTable extends StatefulWidget {
  final List<Map<String, dynamic>> dataTable;
  final List<Map<String, String>> headers;
  final List chartValues;

  const CustomTable({
    super.key,
    required this.dataTable,
    required this.headers,
    required this.chartValues,
  });

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  // double screenWidth = MediaQuery.of(context).size.width;
  bool isAscendant = false;

  void updateParentState() {
    print(isAscendant);
    setState(() {
      isAscendant = !isAscendant;
      if (isAscendant) {
        widget.dataTable
            .sort((a, b) => '${a['caseAmount']}'.compareTo('${b['caseAmount']}'));
      } else {
        widget.dataTable
            .sort((a, b) => '${b['caseAmount']}'.compareTo('${a['caseAmount']}'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text('RDR Metrics', style: _customTitleTextStyle),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(children: [
                const Text(
                  'Money Per Month (Random Example)',
                  style: _cellTextStyle,
                ),
                SizedBox(
                    height: 200,
                    width: 450,
                    child: MyBarGraph(
                      chartValues: widget.chartValues,
                    ))
              ]),
            ),
            const SizedBox(
              height: 35,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text('RDR Reports', style: _customTitleTextStyle),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Row(
              children: widget.headers.map((header) {
                final index = headers.indexOf(header);

                return HeaderCell(
                  callback: updateParentState,
                  headerInfo: header,
                  index: index,
                  dataTable: widget.dataTable,
                );
              }).toList(),
            ),
            TableRows(
              dataTable: widget.dataTable,
            )
          ],
        ),
      ),
    );
  }
}

class HeaderCell extends StatefulWidget {
  final Map<String, String> headerInfo;
  final List<Map<String, dynamic>> dataTable;
  final int index;
  final VoidCallback callback;

  HeaderCell(
      {super.key,
      required this.headerInfo,
      required this.index,
      required this.dataTable,
      required this.callback});

  @override
  State<HeaderCell> createState() => _HeaderCellState();
}

class _HeaderCellState extends State<HeaderCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 150,
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.black, width: 2),
            top: BorderSide(color: Colors.black, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.headerInfo['value'] ?? '',
            style: _customHeaderTextStyle,
          ),
          if (widget.index == 1)
            IconButton(
                onPressed: () {
                  widget.callback();
                },
                icon: const Icon(Icons.sort_outlined))
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
        final index = dataTable.indexOf(individualData);
        final isLastIndex = index == dataTable.length - 1;
        return Row(children: [
          SingleCell(
              rowInfo: individualData['card'] ?? '', isLastIndex: isLastIndex),
          SingleCell(
            rowInfo: '${individualData['caseAmount']}',
            isLastIndex: isLastIndex,
          ),
          SingleCell(
            rowInfo: individualData['currency'] ?? '',
            isLastIndex: isLastIndex,
          ),
          SingleCell(
            rowInfo: individualData['paymentType'] ?? '',
            isLastIndex: isLastIndex,
          ),
          SingleCell(
            rowInfo: individualData['reasonCode'] ?? '',
            isLastIndex: isLastIndex,
          ),
          SingleCell(
            rowInfo: individualData['status'] ?? '',
            isLastIndex: isLastIndex,
          ),
          SingleCell(
            rowInfo: individualData['statusCode'] ?? '',
            isLastIndex: isLastIndex,
          ),
          SingleCell(
            rowInfo: individualData['ruleType'] ?? '',
            isLastIndex: isLastIndex,
          ),
          SingleCell(
            rowInfo: individualData['ruleName'] ?? '',
            isLastIndex: isLastIndex,
          ),
        ]);
      }).toList(),
    );
  }
}

class SingleCell extends StatelessWidget {
  final String rowInfo;
  final bool isLastIndex;
  const SingleCell(
      {super.key, required this.rowInfo, required this.isLastIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: !isLastIndex ? Colors.grey : Colors.transparent, width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rowInfo,
            style: _cellTextStyle,
          ),
        ],
      ),
    );
  }
}

const TextStyle _customHeaderTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Colors.black,
    decoration: TextDecoration.none);

const TextStyle _customTitleTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 35,
    color: Colors.black,
    decoration: TextDecoration.none);

const TextStyle _cellTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: Colors.black,
    decoration: TextDecoration.none);
