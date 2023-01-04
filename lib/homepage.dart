import 'dart:convert';

import 'package:application_1/models/model2.dart';
import 'package:application_1/postscreen.dart';
import 'package:application_1/widgets.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> lis = [];
  List<String> formvalue = [];

  JsonDecoder json = const JsonDecoder();

  String val =
      '{"title":"form title","desc":"form desc","fields":[{"label":"first Name","type":"textbox","validations":[{"length":{"greaterThan":10}}]},{"label":"last Name","type":"textbox","validations":[{"length":{"greaterThan":10}}]},{"label":"Price","type":"slider","range": {"max":50000, "min": 200},"Validations":[{"max":50000}, {"min": 200}, {"required":true}]},{"label":"city","type":"dropdown","validations":[{"required":true}],"values":[{"label":"New Delhi", "value":"1"},{"label":"Mumbai", "value":"2"}]}],"submitButtonText":"Send","cancelButtonText":"GoBack","submitButtonAPI":"https://api.benam.me/api/form/submit"}';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Dynamic Form")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: FetchWidget(Form1.fromJson(jsonDecode(val))),
          ),
        ),
      ),
    );
  }

  Widget FetchWidget(Form1 form) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (form.fields[index].type == "textbox") {
                lis.add(CustomTextField(
                    label1: form.fields[index].label!,
                    len: form.fields[index].validations!.length));
                //  CustomTextField(
                //     label1: form.fields[index].label!,
                //     len: form.fields[index].validations!.length);
                return lis[lis.length - 1];
              } else if (form.fields[index].type == "dropdown") {
                lis.add(CustomDropDownButton(
                    // setitem: form.fields[index].values![0].label,
                    items: form.fields[index].values!));
                //  CustomTextField(
                //     label1: form.fields[index].label!,
                //     len: form.fields[index].validations!.length);
                return lis[lis.length - 1];

                // return CustomDropDownButton(
                //     // setitem: form.fields[index].values![0].label,
                //     items: form.fields[index].values!);
              } else if (form.fields[index].type == "slider") {
                print("Pulkit");
                //print(form.fields[index].range!.min);
                //return Container();

                lis.add(CustomSlider(
                    min: form.fields[index].range!.min.toDouble(),
                    max: form.fields[index].range!.max.toDouble(),
                    selectedvalue: form.fields[index].range!.min.toDouble()));
                return lis[lis.length - 1];
              } else {
                return Container(
                  decoration: const BoxDecoration(color: Colors.red),
                );
              }
            },
            itemCount: form.fields.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    for (var element in lis) {
                      if (element is CustomTextField) {
                        formvalue.add((element).selectedvalue.toString());
                        print(formvalue[formvalue.length - 1]);

                        print((element).selectedvalue);
                      }
                      if (element is CustomDropDownButton) {
                        formvalue.add((element).selectedvalue.toString());
                        print(formvalue[formvalue.length - 1]);

                        print((element).selectedvalue);
                      }
                      if (element is CustomSlider) {
                        formvalue.add((element).selectedvalue.toString());
                        print(formvalue[formvalue.length - 1]);
                        print((element).selectedvalue);
                      }
                    }
                    sendData(formvalue, form.submitButtonAPI!);
                  },
                  child: Text(form.submitButtonText!)),
              ElevatedButton(
                  onPressed: () {}, child: Text(form.cancelButtonText!))
            ],
          ),
        ),
      ],
    );
  }

  Future<String> sendData(List<String> formdata, String url) async {
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        formdata,
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PostScreen()),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      throw Exception('Form data failed to post');
    }
  }
}
