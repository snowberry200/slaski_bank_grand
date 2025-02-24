import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slaski/layout/layout.dart';
import 'package:slaski/presentation/widget/history.dart';

class PersonalAccountView extends StatefulWidget {
  const PersonalAccountView({super.key});

  @override
  State<PersonalAccountView> createState() => _PersonalAccountViewState();
}

class _PersonalAccountViewState extends State<PersonalAccountView> {
  //total sum of amount Deposited
  num sumOfAmounts() {
    num sum = 0;
    for (int i = 0; i < histories.length; i++) {
      sum += histories[i]['amount'];
    }
    return sum;
  }

  late List<Map<String, dynamic>> histories;
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    histories = List.of(transactionHistory);
  }

  @override
  Widget build(BuildContext context) {
    NumberFormat formattNumber = NumberFormat('#,000.00');
    return Scaffold(
        backgroundColor: Colors.orange.withValues(alpha: 0.6),
        body: Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 0),
            child: Container(
              color: Colors.blueGrey,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    height: 90,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 13, 74, 124)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              textHeightBehavior: TextHeightBehavior(),
                              softWrap: false,
                              'Current Account',
                              style: TextStyle(
                                  color: CupertinoColors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, right: 20),
                          child: Column(
                            children: [
                              Text(
                                'Available Balance',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 202, 202, 202)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text("\u{2191}",
                                      style: TextStyle(color: Colors.green)),
                                  SizedBox(width: 5),
                                  Text(
                                    "\u20AC ${formattNumber.format(sumOfAmounts()).toString()}",
                                    style: TextStyle(
                                        letterSpacing: 1.5,
                                        wordSpacing: 1.5,
                                        fontSize: 14,
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                          color: CupertinoColors.label,
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: buildDataTable(),
                              ),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )));
  }

  Widget buildDataTable() {
    final List<String> columns = ['Date', 'Credit', 'Amount'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.height,
          child: DataTable(
              border: TableBorder(),
              columnSpacing: 80,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                  border: Border.all(
                      color: const Color.fromARGB(255, 223, 236, 235),
                      width: 2)),
              horizontalMargin: 10,
              //columnSpacing: 0,
              headingRowColor: WidgetStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 223, 236, 235)),
              dataRowMinHeight: 30,
              dataTextStyle: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              columns: getColumn([...columns]),
              rows: getRows([...histories])),
        ),
      ],
    );
  }

  List<DataColumn> getColumn(List<String> columns) => [
        ...columns.map((column) {
          return DataColumn(
              label: Text(column,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 19,
                      fontStyle: FontStyle.italic)));
        })
      ].toList();

  List<DataRow> getRows(List<dynamic> histories) => histories.map((history) {
        final List<dynamic> cells = <dynamic>[
          history['date'].toString(),
          history['credit'].toString(),
          history['amount'].toString(),
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) => cells.map((dynamic cell) {
        return DataCell(Text(
          cell,
          style: TextStyle(
              fontSize: Layout.isMobile(context) ? 12 : 16,
              color: Colors.blueGrey),
        ));
      }).toList();
}
