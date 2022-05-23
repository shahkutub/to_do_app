import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';

import '../../../database/database_fetch.dart';
import '../../../model/task_data.dart';


class DetailsController extends GetxController {
  var taskData = List<TaskData>().obs;
  var task = TaskData().obs;
  TextEditingController addTaskController;
  dynamic argumentData = Get.arguments;
  @override
  void onInit() {
    addTaskController = TextEditingController();
    _getData();
    super.onInit();
  }

  void _getData() {
    taskData.clear();
    print('arg: '+argumentData[0]['id'].toString());
    DatabaseHelper.instance.querySingleData(argumentData[0]['id']).then((value) {
      value.forEach((element) {

        print( 'element: '+element['id'].toString());
        taskData.add(TaskData(id: element['id'], title: element['title']));
      });
    });
    // DatabaseHelper.instance.queryAllRows().then((value) {
    //   value.forEach((element) {
    //     taskData.add(TaskData(id: element['id'], title: element['title']));
    //   });
    // });
  }

  void addData() async {
    await DatabaseHelper.instance
        .insert(TaskData(title: addTaskController.text));
    taskData.insert(
        0, TaskData(id: taskData.length, title: addTaskController.text));
    addTaskController.clear();

  }

  void deleteTask(int id) async {
    await DatabaseHelper.instance.delete(id);

    taskData.removeWhere((element) => element.id == id);
  }

  void updateTask(int id) async {
    Map<String, dynamic> row = {
      //DatabaseHelper.columnId: argumentData[0]['id'],
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnTitle: addTaskController.text,

    };
    await DatabaseHelper.instance.update(row);

    _getData();

    //taskData.removeWhere((element) => element.id == id);
  }
}
