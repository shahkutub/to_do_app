import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../database/database_fetch.dart';
import '../../../model/task_data.dart';


class HomeController extends GetxController {
  var taskData = List<TaskData>().obs;
  TextEditingController addTaskController;
  dynamic argumentData = Get.arguments;


  @override
  Future<void> onInit() async {
    await GetStorage.init();
    GetStorage().write("onboard", "true");
    addTaskController = TextEditingController();
    //taskData.clear();
    _getData();
    super.onInit();
  }

  Future<void> _getData() async{
    taskData.clear();
    DatabaseHelper.instance.queryAllRows().then((value) {
      value.forEach((element) {
        print(element['id']);
        taskData.add(TaskData(id: element['id'], title: element['title']));
      });
    });
  }

  void addData() async {
    await DatabaseHelper.instance
        .insert(TaskData(title: addTaskController.text));
    // taskData.insert(
    //     0, TaskData(id: taskData.length, title: addTaskController.text));
    addTaskController.clear();
    _getData();
  }

  Future<void> insert_task_ToLocalDB() async {

    Map<String, dynamic> row = {
      //DatabaseHelper.date: formattedDate
      DatabaseHelper.columnTitle: addTaskController.text
    };
    await DatabaseHelper.instance.insert_task(row);
    // var localdataSize = await dbHelper.getAllPatientSerial();
    // print('localdataSize: ${localdataSize.length}');


  }

  void deleteTask(int id) async {
    await DatabaseHelper.instance.delete(id);

    taskData.removeWhere((element) => element.id == id);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    //_getData();
  }
}
