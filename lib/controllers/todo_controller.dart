import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todomust_app/services/api_service/todo_ApiService.dart';
import '../models/todo.model.dart';
import '../utils/custom_snackbar.dart';

class TodoController extends GetxController {
  // Observable variables
  RxBool isLoading = false.obs;
  RxList<TodoModel> mainListTodo = <TodoModel>[].obs;
  RxList<TodoModel> filterListTodo = <TodoModel>[].obs;
  final todoApiService = Get.put(TodoApiService());

  @override
  void onInit() {
    getTodo();
    // TODO: implement onInit
    super.onInit();
  }

  // getTodo() method --> Get all todos from the API end point
  Future<void> getTodo() async {
    try {
      isLoading(true);
      final response = await todoApiService.getTodos();
      if (response.statusCode == 200) {
        final data = (response.body) as List;
        mainListTodo.assignAll(data.map((e) => TodoModel.fromJson(e)));
        // SAME AS THIS :
        // mainListTodo.value = data
        //     .map((element) => TodoModel.fromJson(element))
        //     .toList();
      } else {
        // LOGIC For statusCode != 200
      }
    } catch (e) {
      customSnackbar(title: 'Error', msg: 'Error occur', color: Colors.red);
    } finally {
      isLoading(false);
    }
  }

  // checkedChange(value,indexInFiltered) method --> Checkbox onChange & update data
  void checkedChange(bool value, int indexInFiltered) {
    filterListTodo[indexInFiltered].isCompleted.value = value;
    editToDoStatus(indexInFiltered, value);
  }

  // addToDo(newTask,date) method --> Add new task
  void addToDo(String task, String date) async {
    try {
      var newId = DateTime.now().millisecondsSinceEpoch; // radom id
      final newTask = TodoModel(
        id: newId.toString(),
        task: task,
        date: date,
        isCompleted: false,
      );
      final response = await todoApiService.newTodo(newTask.toJson());
      if (response.statusCode == 201) {
        // statusCode for POST is 201
        await getTodo();
        Get.back();
        customSnackbar(title: 'Add task', msg: 'New task added successfully !');
        filterListByDate(date);
      } else {
        // LOGIC For statusCode != 201
      }
    } catch (e) {
      // ERROR HERE
      // customSnackbar(title: 'Error', msg: 'Error occur', color: Colors.red);
    }
  }

  // deleteToDo(indexInFiltered) method --> Delete existing task
  void deleteToDo(int indexInFiltered) async {
    final item = filterListTodo[indexInFiltered];
    try {
      final response = await todoApiService.deleteTodo(item.id);
      if (response.statusCode == 200) {
        customSnackbar(title: 'Delete', msg: 'Task deleted successfully');
        await getTodo();
        filterListByDate(item.date);
      } else {
        // LOGIC For statusCode != 200
      }
    } catch (e) {
      // ERROR HERE
      // customSnackbar(title: 'Error', msg: 'Error occur', color: Colors.red);
    }
  }

  // deleteToDo(indexInFiltered,newTask) method --> Update existing task
  void editToDo(int indexInFiltered, String newTask) async {
    final editedTodo = filterListTodo[indexInFiltered];
    final data = TodoModel(
      id: editedTodo.id,
      task: newTask,
      date: editedTodo.date,
      isCompleted: editedTodo.isCompleted.value,
    );
    try {
      final response = await todoApiService.editTodo(
        editedTodo.id,
        data.toJson(),
      );
      if (response.statusCode == 200) {
        customSnackbar(
          title: 'Update task',
          msg: 'Task updated successfully !',
        );
        await getTodo();
        filterListByDate(editedTodo.date);
      }
    } catch (e) {
      // ERROR HERE
      // customSnackbar(title: 'Error', msg: 'Error occur', color: Colors.red);
    }
  }

  // editToDoStatus(indexInFiltered,isComplete) method --> Update isComplete value when Checkbox changed
  void editToDoStatus(int indexInFiltered, bool isComplete) async {
    final editedTodo = filterListTodo[indexInFiltered];
    final data = TodoModel(
      id: editedTodo.id,
      task: editedTodo.task,
      date: editedTodo.date,
      isCompleted: isComplete,
    );
    try {
      await todoApiService.editTodo(editedTodo.id, data.toJson());
    } catch (e) {
      // ERROR HERE
      // customSnackbar(title: 'Error', msg: 'Error occur', color: Colors.red);
    }
  }

  // new list of data , filter by date
  void filterListByDate(String date) async {
    filterListTodo.assignAll(
      mainListTodo.where((todo) => todo.date == date).toList(),
    );
    // filterListTodo.value = mainListTodo
    //     .where((todo) => todo.date == date)
    //     .toList();
  }
}
