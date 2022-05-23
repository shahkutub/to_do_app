import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listtodo_get/model/task_data.dart';
import 'package:listtodo_get/modules/detailse/controllers/details_controller.dart';
import 'package:listtodo_get/modules/home/controllers/home_controller.dart';
import 'package:listtodo_get/routes/app_pages.dart';


class DetailsPage extends StatelessWidget {
  final DetailsController _taskController = Get.put(DetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //Get.offAllNamed(Routes.HOME);
              final HomeController homeController = Get.find();
              homeController.onInit();
              Get.back(result: "Data after returning to first page");
            }),
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
                      trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () =>

                            _displayDialog(context,_taskController.taskData[index])
                        ),// icon-1
                        IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _taskController
                                .deleteTask(_taskController.taskData[index].id)),// icon-2
                      ],
                    ),

                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _displayDialog(BuildContext context,TaskData taskData) async {
    _taskController.addTaskController.text = taskData.title;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update todo'),
            content: TextField(
              controller: _taskController.addTaskController,
              textInputAction: TextInputAction.done,
              //keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: taskData.title),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Submit'),
                onPressed: () {
                  _taskController.updateTask(taskData.id);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

}
