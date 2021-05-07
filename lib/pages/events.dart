import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('مناسبات', style: TextStyle(color: Colors.black)),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            color: Colors.white,
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: [
                CardEvent('images/mariage.jpg', 'زواج', 'link'),
                CardEvent('images/aqiqaa.jpg', 'عقيقة', 'link'),
                CardEvent('images/happybirthday.jpg', 'عيد ميلاد', 'link'),
                CardEvent('images/party.jpg', 'حفلة', 'link'),
                CardEvent('images/charite.jpg', 'عمل خيري', 'link'),
                CardEvent('images/takharoj.jpg', 'تخرج', 'link'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CardEvent(String imgpath, String name, String link) {
    return Container(
      //height: MediaQuery.of(context).size.height / 5,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(imgpath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                bottom: 10,
                left: 10,
                right: 10,
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black.withOpacity(0.3),
                        fontSize: 22),
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.of(context).pushNamed(link);
          }),
    );
  }
}
