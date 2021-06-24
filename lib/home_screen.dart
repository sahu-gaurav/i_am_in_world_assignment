import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int numberOfRefresh = 0;
  List<int> spendAmountList = List();
  List spendPercentageList = List();
  List<String> dateOne = ['Feb 15', 'Mar 25', 'Apr 5', 'May 15', 'May 27'];
  List<String> dateTwo = ['Feb 5', 'Mar 15', 'Apr 20', 'Apr 25', 'May 20'];
  List<String> dateThree = ['May 16', 'Mar 13', 'Apr 26', 'Feb 14', 'May 3'];
  List transactionData1 = [
    'Moblie Home Delears',
    'TaxiCabs and Limousines',
    'Miscellaneous Apparel',
    'Accessory Shopping',
    'Recharge'
  ];
  List transactionData2 = [
    'Miscellaneous Apparel',
    'Moblie Home Delears',
    'Accessory Shopping',
    'TaxiCabs and Limousines',
    'Recharge'
  ];
  List transactionData3 = [
    'TaxiCabs and Limousines',
    'Accessory Shopping',
    'Moblie Home Delears',
    'Recharge',
    'Miscellaneous Apparel'
  ];
  List<String> timeOne = [
    '4:20 AM',
    '11:05 AM',
    '1:20 PM',
    '3:00 PM',
    '4:20 PM'
  ];
  List<String> timeTwo = [
    '9:20 AM',
    '10:35 AM',
    '12:20 PM',
    '3:20 PM',
    '6:20 AM'
  ];
  List<String> timeThree = [
    '10:45 AM',
    '12:30 PM',
    '2:35 PM',
    '4:20 PM',
    '7:15 PM'
  ];

  int fifthNumber = 0;
  List<Color> colors = [
    Color.fromARGB(255, 97, 82, 228),
    Color.fromARGB(255, 18, 156, 186),
    Color.fromARGB(255, 243, 140, 115),
    Color.fromARGB(255, 97, 82, 228),
    Color.fromARGB(255, 25, 139, 227),
  ];
  @override
  void initState() {
    super.initState();
    generateRandomNumbers();
    // var rng = new Random();
    // for (var i = 0; i < 10; i++) {
    //   print(rng.nextInt(100));
    // }
  }

  generateRandomNumbers() {
    var rng = new Random();
    for (var i = 0; i < 4; i++) {
      print(rng.nextInt(1000) + 100);
      int value = rng.nextInt(1000) + 100;
      spendAmountList.add(value);
    }
    var sum = 0;
    spendAmountList.forEach((e) => sum += e);
    print('sum: $sum');
    fifthNumber = 10000 - sum;
    print('fifthNumber: $fifthNumber');
    spendAmountList.add(fifthNumber);
    print(spendAmountList);
    spendAmountList.sort((b, a) => a.compareTo(b));
    print(spendAmountList);
    generatePercentage();
  }

  generatePercentage() {
    spendAmountList.forEach((element) {
      double c = 0;
      String value;
      c = (element / 10000) * 100;
      value = c.toStringAsFixed(2);
      print(value);
      spendPercentageList.add(value);
      print(spendPercentageList);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 30, 49),
      body: RefreshIndicator(
        onRefresh: () async {
          // setState(() {});
          spendAmountList.clear();
          spendPercentageList.clear();
          if (numberOfRefresh <= 2) {
            numberOfRefresh += 1;
            print(numberOfRefresh);
          }
          if (numberOfRefresh == 3) {
            numberOfRefresh = 0;
          }

          generateRandomNumbers();
          return;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Card(
                  color: Color.fromARGB(255, 36, 41, 71),
                  elevation: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Card Balance',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '₹0',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'PAYMENT CATEGORIES',
                style: TextStyle(
                  color: Color.fromARGB(255, 136, 154, 174),
                ),
              ),
            ),
            (spendAmountList.isEmpty)
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 250,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: colors[index],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: GridTile(
                              header: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 10),
                                    child: (numberOfRefresh == 0)
                                        ? Text(
                                            transactionData1[index],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ),
                                          )
                                        : (numberOfRefresh == 1)
                                            ? Text(
                                                transactionData2[index],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                ),
                                              )
                                            : Text(
                                                transactionData3[index],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                ),
                                              ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: (numberOfRefresh == 0)
                                        ? Text(
                                            'Last Payment ${dateOne[index]}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          )
                                        : (numberOfRefresh == 1)
                                            ? Text(
                                                'Last Payment ${dateTwo[index]}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              )
                                            : Text(
                                                'Last Payment ${dateThree[index]}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                  )
                                ],
                              ),
                              child: Container(),
                              footer: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      '₹${spendAmountList[index]}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      spendPercentageList[index] + '%',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 10),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'LATEST TRANSACTIONS',
                      style: TextStyle(
                        color: Color.fromARGB(255, 136, 154, 174),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Show All',
                      style: TextStyle(
                        color: Color.fromARGB(255, 136, 154, 174),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: Color.fromARGB(255, 136, 154, 174),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: new BoxDecoration(
                              color: Color.fromARGB(255, 36, 41, 71),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              CupertinoIcons.arrow_right_arrow_left,
                              color: Colors.white,
                            ),
                          ),
                          title: (numberOfRefresh == 0)
                              ? Text(
                                  transactionData1[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )
                              : (numberOfRefresh == 1)
                                  ? Text(
                                      transactionData2[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    )
                                  : Text(
                                      transactionData3[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                          subtitle: (numberOfRefresh == 0)
                              ? Text(
                                  '${dateOne[index]} 2021',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 136, 154, 174),
                                    fontSize: 15,
                                  ),
                                )
                              : (numberOfRefresh == 1)
                                  ? Text(
                                      '${dateTwo[index]} 2021',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 136, 154, 174),
                                        fontSize: 15,
                                      ),
                                    )
                                  : Text(
                                      '${dateThree[index]} 2021',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 136, 154, 174),
                                        fontSize: 15,
                                      ),
                                    ),
                          trailing: Column(
                            children: [
                              (numberOfRefresh == 0)
                                  ? Text(
                                      '\n₹${ spendAmountList[index]}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    )
                                  : (numberOfRefresh == 1)
                                      ? Text(
                                          '\n₹${ spendAmountList[index]}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        )
                                      : Text(
                                          '\n₹${ spendAmountList[index]}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                              (numberOfRefresh == 0)
                                  ? Text(
                                      timeOne[index],
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 136, 154, 174),
                                        fontSize: 15,
                                      ),
                                    )
                                  : (numberOfRefresh == 1)
                                      ? Text(
                                          timeTwo[index],
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 136, 154, 174),
                                            fontSize: 15,
                                          ),
                                        )
                                      : Text(
                                          timeThree[index],
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 136, 154, 174),
                                            fontSize: 15,
                                          ),
                                        ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 136, 154, 174),
                          height: 1,
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
