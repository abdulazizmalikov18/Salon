import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:imtihon1/dataBase/dataku.dart';
import 'package:imtihon1/main.dart';

import '../constants.dart';

class Reference extends StatefulWidget {
  var kelganM;
  Salon? rasm;
  var data;

  Reference({this.kelganM, this.data, Key? key}) : super(key: key);

  @override
  _ReferenceState createState() => _ReferenceState();
}

class _ReferenceState extends State<Reference> {
  Future<Salon>? dataFromInternetVariable;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataFromInternetVariable = dataFromInternet();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizeHeader = size.height * 0.3;
    var data;
    return Scaffold(
      body: SizedBox(
        height: 300,
        child: Stack(
          children: [
            Container(
              color: kPrimaryColor,
              width: size.width,
              height: sizeHeader,
              child: Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MyHomePage();
                                },
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.download,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 150,
              child: Container(
                width: size.width,
                height: size.height * 0.28,
                child: FutureBuilder<Salon>(
                  future: dataFromInternetVariable,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final Salon salon = snapshot.data!;

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: salon.salon!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Reference(
                                      kelganM: salon.salon![index].name,
                                      data: snapshot.data,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            salon.salon![index].img!),
                                      ),
                                    ),
                                    width: 180,
                                    height: 120,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }

                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Future<Salon> dataFromInternet() async {
    String json = await rootBundle.loadString("assets/json/datam.json");

    return Salon.fromJson(jsonDecode(json));
  }
}
