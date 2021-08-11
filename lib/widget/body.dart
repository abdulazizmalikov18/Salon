import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imtihon1/dataBase/dataku.dart';
import 'package:imtihon1/pageList/reference.dart';
import 'package:imtihon1/widget/heder.dart';

import 'cardleble.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
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
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HederPage(),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  CardLabel(
                    lightText: 'Popular in ',
                    boldText: 'Warsaw',
                  ),
                  Container(
                    height: size.height * 0.28,
                    margin: EdgeInsets.only(top: 20),
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
                                  margin: EdgeInsets.only(left: 10,right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                salon.salon![index].img!
                                          ),),
                                        ),
                                        width: 180,
                                        height: 120,
                                        // child: FadeInImage.assetNetwork(
                                        //   placeholder:
                                        //       'assets/gif/loading-icegif-1.gif',
                                        //   image: salon.salon![index].img != ''
                                        //       ? salon.salon![index].img!
                                        //       : "https://www.google.com/url?sa=i&url=https%3A%2F%2Fdribbble.com%2Fshots%2F4814970-Quick-idea-for-loading-gif&psig=AOvVaw0GgDG-lpU2VpzyfmvRBFVD&ust=1628082773644000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNix1I_3lPICFQAAAAAdAAAAABA9",
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          "${salon.salon![index].name}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "${salon.salon![index].km}",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          "⭐️${salon.salon![index].num}",
                                          style: TextStyle(fontSize: 12),
                                        ),
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
                  CardLabel(
                    lightText: 'Nails. ',
                    boldText: 'Top Services',
                  ),
                  Container(
                    height: size.height * 0.28,
                    margin: EdgeInsets.only(top: 20),
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
                                  margin: EdgeInsets.only(left: 10,right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                salon.salon![index].img!
                                            ),),
                                        ),
                                        width: 180,
                                        height: 120,
                                        // child: FadeInImage.assetNetwork(
                                        //   placeholder:
                                        //       'assets/gif/loading-icegif-1.gif',
                                        //   image: salon.salon![index].img != ''
                                        //       ? salon.salon![index].img!
                                        //       : "https://www.google.com/url?sa=i&url=https%3A%2F%2Fdribbble.com%2Fshots%2F4814970-Quick-idea-for-loading-gif&psig=AOvVaw0GgDG-lpU2VpzyfmvRBFVD&ust=1628082773644000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNix1I_3lPICFQAAAAAdAAAAABA9",
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          "${salon.salon![index].name}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "${salon.salon![index].km}",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          "⭐️${salon.salon![index].num}",
                                          style: TextStyle(fontSize: 12),
                                        ),
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
                ],
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
