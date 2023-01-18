import 'package:bilgi_test/data.dart';
import 'package:flutter/material.dart';

import 'consts.dart';

void main() => runApp(BilgiTest());

class BilgiTest extends StatelessWidget {
  const BilgiTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: const Text(
            "Bilgi Testi",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontStyle: FontStyle.italic),
          ),
        ),
        backgroundColor: Color(0xff13005A),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SoruBilgi(),
          ),
        ),
      ),
    );
  }
}

class SoruBilgi extends StatefulWidget {
  const SoruBilgi({Key? key}) : super(key: key);

  @override
  State<SoruBilgi> createState() => _SoruBilgiState();
}

class _SoruBilgiState extends State<SoruBilgi> {
  buttonF(bool selectedButton) {
    if (data.endCheck() == true) {
      //alertDialog
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Test Bitti"),
              content: Text("Testi yeniden başlatmak için sıfırlaya tıklayın"),
              actions: [
                TextButton(
                  child: Text("Sıfırla"),
                  onPressed: () {
                    setState(() {
                      trueFalse = [];
                      data.resetIndex();
                      Navigator.of(context).pop();
                    });

                  },
                ),
              ],
            );
          }
          );

    }
    else {
      setState(() {
        if (data.getAnswer() == selectedButton) {
          trueFalse.add(kTrue);
        } else {
          trueFalse.add(kFalse);
        }
        data.indexArttir();
      });
    }
  }

  Data data = new Data();

  List<Widget> trueFalse = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Center(
              child: Text(
                data.getText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 25),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 15,
          spacing: 15,
          direction: Axis.horizontal,
          children: trueFalse,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                        padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                      ),
                      onPressed: () {
                        buttonF(true);
                      },
                      child: Icon(
                        Icons.thumb_up_alt_sharp,
                        size: 35,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
                        padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                      ),
                      onPressed: () {
                        buttonF(false);
                      },
                      child: Icon(
                        Icons.thumb_down_alt_sharp,
                        size: 35,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
