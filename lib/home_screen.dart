import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dio dio = Dio();
  String url = 'https://fakestoreapi.com/products';
  List<dynamic>dataModel =[];
  @override
  void initState() {
    super.initState();
    getData();
  }
     buildGridView() async {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GridView.builder(
              shrinkWrap:true ,
              itemCount: dataModel.length,
              padding:EdgeInsets.zero,
              physics: ClampingScrollPhysics(),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            childAspectRatio: 2/3,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
          ),
          itemBuilder:
          (context , index){
            return ( dataModel[index]);
          }),
        ],
      ),
    );

  }

  Future<List<dynamic>> getData() async {
    Response response = await dio.get(url);
    print(response.data);
    print(response.statusCode);
  dataModel=response.data.map((product) =>ProductModel.fromJson(product)).toList();
    return dataModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getData(),
          builder: (
                  (context, snapshot) {
                return snapshot.hasError
                    ? Center(
                  child: Text('OOPS,Some Thing Went Wrong'),
                )
                    : snapshot.hasData
                    ? buildGridView()
                    : Center(
                  child: CircularProgressIndicator(),
                );
              }
          ),
        ),
      ),
    );
  }
  }
