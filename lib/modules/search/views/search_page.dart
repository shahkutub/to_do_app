import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listtodo_get/model/task_data.dart';
import 'package:listtodo_get/modules/home/controllers/home_controller.dart';
import 'package:listtodo_get/modules/search/controllers/search_controller.dart';


class SearchPage extends StatelessWidget {
  final SearchController _taskController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text("Todo App"),
      actions: <Widget>[
      // IconButton(
      //   icon: Icon(Icons.search),
      //   onPressed: () {
      //
      //   },
      // )

    ],
    ),
      body:  Container(
        margin: EdgeInsets.all(10),
    //padding: EdgeInsets.only(top: 25,bottom: 25),
    //alignment: Alignment.centerLeft,
    child: Autocomplete<TaskData>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return _taskController.taskData.value
            .where((TaskData county) => county.title.toLowerCase()
            .startsWith(textEditingValue.text.toLowerCase())
        )
            .toList();
      },
      displayStringForOption: (TaskData option) => option.title,
      fieldViewBuilder: (
          BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted
          ) {
        return Container(
          //padding: EdgeInsets.only(top: 25,bottom: 25),
          //height:45,
          //width: 100,
          child: TextField(
            controller: fieldTextEditingController,
            focusNode: fieldFocusNode,
            style: const TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              labelText: "Task",
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.blueAccent)
              ),
              hintText: 'Input ',
              suffixIcon: IconButton(
                onPressed: (){
                  fieldTextEditingController.clear();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                icon: Icon(Icons.clear),
              ),

            ),
          ),
        );


      },

      onSelected: (TaskData selection) {
        // _taskController.itemName.value = selection.name!+" (generic name"+selection.generic_name.toString()+")";
        // FocusManager.instance.primaryFocus?.unfocus();
        // print('Selected: ${selection.name}');
      },


    )

      )
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add todo'),
            content: TextField(
              controller: _taskController.addTaskController,
              textInputAction: TextInputAction.done,
              //keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Enter your todo"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Submit'),
                onPressed: () {
                  _taskController.addData();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

}
