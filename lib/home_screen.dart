import 'DocInfoPage.dart';
import 'colorScheme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: HomeScreen(),
      routes: {
        '/DocInfoPage' : (context)=>DocInfoPage(),
      },
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  static const String id = 'home_screen';
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CustomPaint(
              painter: pathPainter(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 30,
                  ),
                  actions: <Widget>[
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [getStartedColorStart, getStartedColorEnd],
                              stops: [0,1]
                          )
                      ),
                      child: Center(
                        child: Text("C", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Select a Doctor", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                      Text("Chief Homeopathic Doctors", style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 500,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              createDocWidget("doc1.png", "Sara Roshni"),
                              createDocWidget("doc2.png", "Abdul Hakeem"),
                              createDocWidget("doc3.png", "Farzana Barkat"),
                              createDocWidget("doc1.png", "Ayesha Urooj"),
                              createDocWidget("doc2.png", "Molvi Faraz"),
                              createDocWidget("doc3.png", "Hina Qaiser"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container createDocWidget(String imgName, String docName)
  {
    return Container(
      child: InkWell(
        child: Container(

          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: docContentBgColor,
          ),
          child: Flexible(
            child: Container(
              padding: EdgeInsets.all(7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/docprofile/$imgName'),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Dr. $docName", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                      SizedBox(height: 5,),
                      Container(
                        width: 250,
                        height: 50,
                        child: Text("A brief about the doctor to be added here.", style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        onTap: openDocInfo,
      ),
    );
  }
  void openDocInfo()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>DocInfoPage()));
  }
}

class pathPainter extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.color = path2Color;

    Path path = new Path();
    path.moveTo(0, 0);
    path.lineTo(size.width*0.3, 0);
    path.quadraticBezierTo(size.width*0.5, size.height*0.03, size.width*0.42, size.height*0.17);
    path.quadraticBezierTo(size.width*0.35, size.height*0.32, 0, size.height*0.29);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}