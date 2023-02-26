// ignore_for_file: unused_import, prefer_const_constructors

import 'package:api13/Api%20Services/apiservices.dart';
import 'package:api13/Model/prodeuctapimodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ApiMainScreen extends StatefulWidget {
  const ApiMainScreen({super.key});

  @override
  State<ApiMainScreen> createState() => _ApiMainScreenState();
}

class _ApiMainScreenState extends State<ApiMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Of Products"),
      ),
      body: FutureBuilder(
        future: getProduct(),
        builder: (context, AsyncSnapshot shanpshot) {
          if (!shanpshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> product = shanpshot.data;
            return ListView.builder(
                itemCount: product.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        product[index].thumbnail,
                        width: 100,
                      ),
                      title: Text(product[index].brand),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Expanded(
                            child: Text(
                              product[index].description,
                              style: TextStyle(),
                            ),
                          ),
                          Text(product[index].price.toString()),
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
