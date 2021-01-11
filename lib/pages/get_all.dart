import 'package:flutter/material.dart';
import 'package:pdp_network/services/network1.dart';
import 'package:pdp_network/models/post.dart';


class GetAll extends StatefulWidget {
  @override
  _GetAllState createState() => _GetAllState();
}

class _GetAllState extends State<GetAll> {
  String data;


  // void _apiGetAll(){
  //   Network1.GET(Network1.API_LIST, Network1.paramsEmpty()).then((response) => {
  //     _showResponse(response),
  //   });
  // }

  void _apiPostCreate(Post post){
    Network1.POST(Network1.API_CREATE, Network1.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }
  void _showResponse(String datee) {
    setState(() {
      data = datee;
    });
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    var post = Post(employeeName:"test",employeeSalary: 123, employeeAge: 23);
    _apiPostCreate(post);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Text(data != null ? data : "no connected"),
          ),
        ),
      ),

    );
  }
}
