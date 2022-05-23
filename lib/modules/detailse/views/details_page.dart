import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listtodo_get/modules/detailse/controllers/details_controller.dart';
import 'package:listtodo_get/modules/home/controllers/home_controller.dart';
import 'package:listtodo_get/routes/app_pages.dart';


class DetailsPage extends StatelessWidget {
  final DetailsController _taskController = Get.put(DetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text("Details"),

    ),

      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[

            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: _taskController.taskData.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Text(_taskController.taskData[index].title),
                      // trailing: IconButton(
                      //     icon: Icon(Icons.delete),
                      //     onPressed: () => _taskController
                      //         .deleteTask(_taskController.taskData[index].id)),
                    ),
                  )),
            ),
          ],
        ),
      ),
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
