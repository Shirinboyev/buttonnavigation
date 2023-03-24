import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  int scale = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('images/tasbeeh.png'))
      ),
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text('Tasbeeh')),backgroundColor: Colors.green,),
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('$scale',style: TextStyle(fontSize: 100),),
            if(scale < 33 && scale >= 0)
            Text('SubhanAllah',style: TextStyle(fontSize: 20)),
            if(scale < 66 && scale >= 33)
            Text('Alhamdulillah',style: TextStyle(fontSize: 20)),
                  if(scale < 99 && scale >= 66 )
            Text('Allohu Akbar',style: TextStyle(fontSize: 20)),
             if(scale < 100 && scale >= 99 )
            Text("""               La Ilaha Illalohu,
              Wahdahula Sharika Lahu ,
              Lahul-Mulku Wa Lahul-Hamdu,
              Wa Huwa'AlaKulli  Sha'in Qadir
              """,style: TextStyle(fontSize: 20)),
           
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                     ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(100, 100),backgroundColor: Colors.grey),
                  onPressed: (){
                  setState(() {
                    if(scale != 0){
                      scale -=1;
                    }
                  });
                }, child: Text('—',style: TextStyle(fontSize: 50),)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(100, 100),backgroundColor: Colors.green),
                  onPressed: (){
                  setState(() {
                    scale +=1;
                  });
                }, child: Icon(Icons.add,size: 50,)),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(100,100),backgroundColor: Colors.red),
                  onPressed: (){
                  setState(() {
                    scale = 0;
                  });
                }, child: Text('reset',style: TextStyle(fontSize: 25))),
              ],
            )
          ],
        ),
      ),
    );
  }
}