import 'package:intl/intl.dart';

DateFormat formattedDate = DateFormat.yMMMd();

final List<Map<String, dynamic>> transactionHistory = [
  {
    'date': formattedDate.format(DateTime(2007, 10, 10, 10, 00, 00)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('50000.00')
  },
  {
    "date": formattedDate.format(DateTime(2008, 09, 08)),
    "credit": 'credit: ING Bank',
    "amount": double.tryParse('15000.00')
  },
  {
    'date': formattedDate.format(DateTime(2009, 08, 09)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('90000.00')
  },
  {
    'date': formattedDate.format(DateTime(2011, 07, 06)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('10000.00')
  },
  {
    'date': formattedDate.format(DateTime(2012, 02, 14)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('70000.00')
  },
  {
    'date': formattedDate.format(DateTime(2012, 10, 10)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('80000.00')
  },
  {
    'date': formattedDate.format(DateTime(2013, 09, 05)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('50000.00')
  },
  {
    'date': formattedDate.format(DateTime(2014, 05, 09)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('90000.00')
  },
  {
    'date': formattedDate.format(DateTime(2015, 06, 07)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('20000.00')
  },
  {
    'date': formattedDate.format(DateTime(2017, 02, 14)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('90000.00')
  },
  {
    'date': formattedDate.format(DateTime(2023, 05, 16)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('100000.00'),
  },
  {
    'date': formattedDate.format(DateTime(2023, 06, 17)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('100000.00')
  },
  {
    'date': formattedDate.format(DateTime(2024, 08, 09)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('11000.00')
  },
  {
    'date': formattedDate.format(DateTime(2024, 11, 12)),
    'credit': 'credit: ING Bank',
    'amount': double.tryParse('245000.00')
  },
];

// <ColumnModule>[
//   ColumnModule(
//       date: '10 / 10 / 07',
//       credit: 'credit: ING Bank',
//       amount: '\u20AC 50,000.00'),
//   ColumnModule(
//     date: '05 / 09 / 08',
//     credit: 'credit: ING Bank',
//     amount: '\u20AC 15,000.00',
//   ),
//   ColumnModule(
//       date: '05 / 09 / 09',
//       credit: 'credit: ING Bank',
//       amount: '\u20AC 90,000.00'),
//   ColumnModule(
//       date: '07 / 06 / 11',
//       credit: 'credit: ING Bank',
//       amount: '\u20AC 10,000.00'),
//   ColumnModule(
//       date: '02 / 14 / 12',
//       credit: 'credit: ING Bank',
//       amount: '\u20AC 70,000.00'),
//   ColumnModule(
//       date: '10 / 10 / 12',
//       credit: 'credit: ING Bank',
//       amount: '\u20AC 80,000.00'),
//   ColumnModule(
//       date: '05 / 09 / 13',
//       credit: 'credit: ING Bank',
//       amount: '\u20AC 50,000.00'),
//   ColumnModule(
//       date: '05 / 09 / 14',
//       credit: 'credit: ING Bank',
//       amount: '\u20AC 90,000.00'),
//   ColumnModule(
//       date: '07 / 06 / 15',
//       credit: 'credit: ING Bank',
//       amount: '\u20AC 20,000.00'),
//   ColumnModule(
//       date: '02 / 14 / 17',
//       credit: 'credit: ING Bank',
//       amount: '\u20AC 90,000.00'),
//   ColumnModule(
//       date: '05 / 16 / 23',
//       credit: 'credit: ING Bank',
//       amount: '\u20AC 100,000.00'),
//   ColumnModule(
//       date: '05 / 17 / 23',
//       credit: 'credit: ING Bank',
//       amount: '\u20AC 100,000.00'),
