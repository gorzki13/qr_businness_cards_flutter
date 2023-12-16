import 'package:flutter/material.dart';
import 'Scanner.dart';
import 'UserCardView.dart';
import 'models/QrData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QrBusinessCardScanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'QrBusinessCardScanner', key: Key("QrBusinnesscardScanner")),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);
  List<QrData> scannedCodes = [];
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.scannedCodes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${widget.scannedCodes[index].name} ${widget.scannedCodes[index].surname}"),
                  subtitle: Text("${widget.scannedCodes[index].email} ${widget.scannedCodes[index].phoneNumber}"),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final QrData result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scanner()),
              );

              // Check if the result is not null and add it to the list
              if (result != null) {
                setState(() {
                  widget.scannedCodes.add(result);
                });
              }
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.qr_code),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserCardView()),
              );
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}