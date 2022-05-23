import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listtodo_get/modules/home/controllers/home_controller.dart';
import 'package:listtodo_get/routes/app_pages.dart';


class HomePage extends GetView<HomeController> {
  //final HomeController _taskController = Get.put(HomeController());
  //final HomeController _taskController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    //Get.find<HomeController>();
    return Scaffold(
      appBar:AppBar(
      title: Text("Todo App"),
      actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          Get.toNamed(Routes.SEARCH);
        },
      )

    ],
    ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          _displayDialog(context);
        },
        label: const Text(''),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[

            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.taskData.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Text(controller.taskData[index].title),
                      trailing: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          // onPressed: () => _taskController
                          //     .deleteTask(_taskController.taskData[index].id)
                        onPressed: () {
                          Get.toNamed(Routes.DETAILS, arguments: [
                            {"id": controller.taskData[index].id}
                          ]);
                        },
                      ),
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
              controller: controller.addTaskController,
              textInputAction: TextInputAction.done,
              //keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Enter your todo"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Submit'),
                onPressed: () {
                  controller.addData();
                  //_taskController.insert_task_ToLocalDB();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

}
