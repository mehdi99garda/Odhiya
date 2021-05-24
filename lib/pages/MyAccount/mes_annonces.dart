import 'package:first_flutter_app/pages/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MesAnnonces extends StatefulWidget {
  @override
  _MesAnnoncesState createState() => _MesAnnoncesState();
}

class _MesAnnoncesState extends State<MesAnnonces> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(7),
            child: Center(
              child: Text(
                Home.lang_ar
                    ? 'انقر فوق الإعلان للتعديل'
                    : "Cliquer sur l'annonce pour modifier",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _buildCardAnnonce('images/chevre1.jpg', 'chevre', '1500'),
          _buildCardAnnonce('images/chevre2.jpg', 'chevre', '1500'),
          _buildCardAnnonce('images/cow1.jpg', 'vache', '1500'),
          _buildCardAnnonce('images/mouton1.jpg', 'mouton', '1500'),
          _buildCardAnnonce('images/mouton2.jpg', 'mouton', '1500'),
        ],
      ),
    );
  }

  Widget _buildCardAnnonce(String imgPath, String title, String price) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'update_annonce');
      },
      child: Card(
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Ink.image(
                image: AssetImage(imgPath),
                height: 110,
                width: 140,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 20),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width - 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      price + (Home.lang_ar ? ' د.م ' : ' DH'),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                child: MaterialButton(
                  minWidth: 20,
                  elevation: 0,
                  color: Colors.white,
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.teal,
                    size: 40,
                  ),
                  shape: CircleBorder(),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                              title: Text(
                                  'Do you want to delete this Ad forever ?'),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('No',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.blue))),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Ok',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.blue))),
                              ],
                            ));
                  },
                ),
              ),
            ],
          )),
    );
  }
}
