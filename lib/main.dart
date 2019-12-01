import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//Class State here
var textInput = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: TextField(
        decoration: InputDecoration(
            hintText: 'hh : mm',
            contentPadding: const EdgeInsets.all(15.0),
            border: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(25.0))),
            filled: false),
        style: TextStyle(fontSize: 24),
        controller: textInput,
        readOnly: true,
        onTap: () {
          DatePicker.showTimePicker(context, showTitleActions: true,
              onConfirm: (time) {
            setState(() {
              textInput.text = DateFormat("kk:mm").format(time);
            });
          }, currentTime: DateTime.now(), locale: LocaleType.it);
        },
      )),
    );
  }
}
