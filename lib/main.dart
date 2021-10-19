import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_emp_project/repository/model/employeeListNode.dart';
import 'package:retrofit_emp_project/repository/retrofit/api_client.dart';

import 'Utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// to set the root of app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'API Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("All Employee"),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Icon(Icons.cancel),
        backgroundColor: Colors.green,
      ),
    );
  }

  // build list view & manage states
  FutureBuilder<ResponseData> _buildBody(BuildContext context) {
    final client = ApiClient(
        Dio(BaseOptions(contentType: "application/x-www-form-urlencoded")));
    return FutureBuilder<ResponseData>(
      future: client.getEmp('1'),
      builder: (context, snapshot) {
        print("Data: ${snapshot.data}");
        if (snapshot.connectionState == ConnectionState.done) {
          final ResponseData employee = snapshot.data!;
          return _buildListView(context, employee);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // build list view & its tile
  Widget _buildListView(BuildContext context, ResponseData employee) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: employee.employee_list_nodes.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
                color: Color(0xFFFFFFFD),
                elevation: 5,
                margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'http://202.40.190.117:8082/ERAHRMAPPS/EmployeeImageS?id=' +
                                    employee.employee_list_nodes[index]
                                        ['employee_code']),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ((employee.employee_list_nodes[index]
                                          ['employee_name']) !=
                                      null)
                                  ? Text(employee.employee_list_nodes[index]
                                      ['employee_name'])
                                  : Text(""),

                              ((employee.employee_list_nodes[index]
                                          ['email']) !=
                                      null)
                                  ? Text(employee.employee_list_nodes[index]
                                      ['email'])
                                  : Text(""),

                              ((employee.employee_list_nodes[index]
                                          ['mobile']) !=
                                      null)
                                  ? Text(employee.employee_list_nodes[index]
                                      ['mobile'])
                                  : Text(""),

                              ((employee.employee_list_nodes[index]
                                          ['designation']) !=
                                      null)
                                  ? Text(employee.employee_list_nodes[index]
                                      ['designation'])
                                  : Text(""),

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Positioned(
                          top: 5.0,
                          right: 0.0,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'images/blood.png',
                                  height: 20,
                                  width: 20,
                                ),
                                Text(Utils.decodeEmpty(
                                    employee.employee_list_nodes[index]
                                        ['blood_group'])),
                                //Text('AB+')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      child: ListView(
                        // mainAxisSize: MainAxisSize.min,
                        // crossAxisAlignment:
                        // CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Container(
                              child: ((employee.employee_list_nodes[index]
                              ['employee_name']) !=
                                  null)
                                  ? Text(employee.employee_list_nodes[index]
                              ['employee_name'],style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.bold))
                                  : Text(""),


                            ),
                          ),
                          Divider(
                            color: Colors.blue,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                                child: CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(
                                  'http://202.40.190.117:8082/ERAHRMAPPS/EmployeeImageS?id=' +
                                      Utils.decodeEmpty(
                                          employee.employee_list_nodes[index]
                                              ['employee_code'])),
                            )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              child: ((employee.employee_list_nodes[index]
                              ['mobile']) !=
                                  null)
                                  ? Text(employee.employee_list_nodes[index]
                              ['mobile'],style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.bold))
                                  : Text(""),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              child: ((employee.employee_list_nodes[index]
                              ['email']) !=
                                  null)
                                  ? Text(employee.employee_list_nodes[index]
                              ['email'],style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.bold))
                                  : Text(""),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(255, 12, 12, 12),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      print("Ok Button Pressed New");

                                      //launch("tel:${Utils.decodeEmpty(employee.employee_list_nodes[index]['mobile'])}");

                                      // notificationStatusChange(Global.userId, _allNotificationNew.notificationNodes[index].slNo)
                                      //     .then((allNotification) {
                                      //   setState(() {
                                      //
                                      //     _notificationsStatusChange= notificationsStatusChange;
                                      //
                                      //     print("Ok Button Pressed New");
                                      //
                                      //   });
                                      // });
                                    },
                                    child: Text('Call'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          );
        });

    //   ListView.builder(
    //   itemBuilder: (context, index) {
    //     return Card(
    //       child: ListTile(
    //         leading: Icon(
    //           Icons.account_box,
    //           color: Colors.green,
    //           size: 50,
    //         ),
    //         title:  ((employee.employee_list_nodes[index]['employee_name'])!= null) ? Text(
    //           employee.employee_list_nodes
    //           [index]['employee_name'],
    //           style: TextStyle(fontSize: 20),
    //         ) : Text(
    //           "",
    //           style: TextStyle(fontSize: 20),
    //         ),
    //         subtitle: ((employee.employee_list_nodes[index]['email'])!= null) ? Text(
    //           employee.employee_list_nodes
    //           [index]['email'],
    //           style: TextStyle(fontSize: 20),
    //         ) : Text(
    //           "",
    //           style: TextStyle(fontSize: 20),
    //         ),
    //       ),
    //     );
    //   },
    //   itemCount: employee.employee_list_nodes.length,
    // );
  }
}
