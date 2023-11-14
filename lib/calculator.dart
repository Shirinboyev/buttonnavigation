import 'package:flutter/material.dart';
import 'package:tasbeeh/main.dart';
class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _MyAppState();
}

class _MyAppState extends State<Calculator> {
  TextEditingController controller = TextEditingController();

  Widget exp(
    String b, [
    Color colo = Colors.amber,
  ]) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: colo,
            fixedSize: Size(70, 70),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
            textStyle: TextStyle(color: Colors.black)),
        onPressed: () {
          if (controller.text[controller.text.length - 1] == 'x') {
            controller.text =
                controller.text.substring(0, controller.text.length - 1);
          } else if (controller.text[controller.text.length - 1] == '/') {
            controller.text =
                controller.text.substring(0, controller.text.length - 1);
          } else if (controller.text[controller.text.length - 1] == '+') {
            controller.text =
                controller.text.substring(0, controller.text.length - 1);
          } else if (controller.text[controller.text.length - 1] == '-') {
            controller.text =
                controller.text.substring(0, controller.text.length - 1);
          } else if (controller.text[controller.text.length - 1] == '%') {
            controller.text =
                controller.text.substring(0, controller.text.length - 1);
          }
          controller.text += b;
        },
        child: Text(
          b,
          style: TextStyle(fontSize: 30),
        ));
  }

  Widget wid(String a, [Color col = Colors.black]) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: col,
            fixedSize: Size(70, 70),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(70))),
        onPressed: () {
          controller.text += a;
        },
        child: Text(
          a,
          style: TextStyle(fontSize: 25),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
            title: Center(child: Text('CALCULATOR')),
            backgroundColor: Colors.brown,
          ),
         drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 4, 25, 32),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      fixedSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Tasbeeh()));
                  },
                  child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color:  Color.fromARGB(255, 186, 117, 92),
                    borderRadius: BorderRadius.circular(200)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Tasbeeh Page", style: TextStyle(color: Colors.black),),
                    ],
                  )),
                )
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 97, 82, 81),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: TextField(
                    style: TextStyle(fontSize: 40, color: Colors.white),
                    textAlign: TextAlign.end,
                    readOnly: true,
                    controller: controller,
                    decoration: InputDecoration(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            fixedSize: Size(70, 70),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70))),
                        onPressed: () {
                          controller.text = controller.text.substring(0,
                              controller.text.length - controller.text.length);
                        },
                        child: Text(
                          'AC',
                          style: TextStyle(fontSize: 20),
                        )),
                    exp(
                      '%',
                      Colors.transparent,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            fixedSize: Size(70, 70),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70))),
                        onPressed: () {
                          controller.text = controller.text
                              .substring(0, controller.text.length - 1);
                        },
                        child: Text(
                          'C',
                          style: TextStyle(fontSize: 20),
                        )),
                    exp('x')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    wid('7'),
                    wid('8'),
                    wid('9'),
                    exp('/'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [wid('4'), wid('5'), wid('6'), exp('+')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [wid('1'), wid('2'), wid('3'), exp('-')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    wid('.', Colors.transparent),
                    wid('0'),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          fixedSize: Size(155, 70),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70))),
                      onPressed: () {
                        String exp = '+-x/%';
                        List<int> ind = [];
                        //amallarni indexini olish
                        for (int i = 0; i < controller.text.length; i++) {
                          if (exp.contains(controller.text[i])) {
                            ind.add(i);
                          }
                        }
                        // raqamlarni olish
                        List<num> numbers = [];
                        int q = 0;
                        for (int i in ind) {
                          numbers
                              .add(num.parse(controller.text.substring(q, i)));
                          q = i + 1;
                        }
                        numbers.add(
                            num.parse(controller.text.substring(ind.last + 1)));

                        for (int i = 0; i < ind.length; i++) {
                          if (controller.text[ind[i]] == 'x') {
                            numbers[i] = numbers[i] * numbers[i + 1];
                            numbers.removeAt(i + 1);
                            ind.removeAt(i);
                            i--;
                          } else if (controller.text[ind[i]] == '/') {
                            numbers[i] = numbers[i] / numbers[i + 1];
                            numbers.removeAt(i + 1);
                            ind.removeAt(i);
                            i--;
                          }
                        }

                        for (int i = 0; i < ind.length; i++) {
                          if (controller.text[ind[i]] == '+') {
                            numbers[i] = numbers[i] + numbers[i + 1];
                            numbers.removeAt(i + 1);
                            ind.removeAt(i);
                            i--;
                          } else if (controller.text[ind[i]] == '-') {
                            numbers[i] = numbers[i] - numbers[i + 1];
                            numbers.removeAt(i + 1);
                            ind.removeAt(i);
                            i--;
                          }
                        }
                        for (int i = 0; i < ind.length; i++) {
                          if (controller.text[ind[i]] == '%') {
                            numbers[i] = numbers[i] % numbers[i + 1];
                            numbers.removeAt(i + 1);
                            ind.removeAt(i);
                            i--;
                          }
                        }

                        controller.text = numbers[0].toStringAsFixed(2);
                      },
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
