import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todomust_app/utils/custom_appbar.dart';

import '../controllers/todo_controller.dart';

class TodoView extends StatelessWidget {
  TodoView({super.key});
  final TodoController todoController = Get.find<TodoController>();
  final newTaskController = TextEditingController();
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'todo'.tr),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Text(args, style: TextStyle(color: Colors.grey.withOpacity(0.70))),
          Expanded(
            child: Obx(
              () => todoController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.yellow),
                    )
                  : todoController.filterListTodo.isEmpty
                  ? Center(child: Text('no_task_available'.tr))
                  : ListView.builder(
                      itemCount: todoController.filterListTodo.length,
                      itemBuilder: (context, index) {
                        final todo = todoController.filterListTodo[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 10,
                          ),
                          child: Slidable(
                            endActionPane: ActionPane(
                              motion: StretchMotion(),
                              children: [
                                SlidableAction(
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundColor: Colors.blueAccent,
                                  onPressed: (_) {
                                    newTaskController.text = todo.task;
                                    buildDefaultDialog(
                                      newTaskController,
                                      todoController,
                                      'Edit task',
                                      'Save',
                                      'Enter new task',
                                      () {
                                        todoController.editToDo(
                                          index,
                                          newTaskController.text,
                                        );
                                        Get.back();
                                        newTaskController.clear();
                                      },
                                    );
                                  },
                                  icon: Icons.edit,
                                ),
                                SlidableAction(
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundColor: Colors.redAccent,
                                  onPressed: (_) {
                                    todoController.deleteToDo(index);
                                  },
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: Container(
                              // alignment: Alignment.center,
                              width: Get.width,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.green,
                                      side: BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                      activeColor: Colors.yellow,
                                      value: todo.isCompleted.value,
                                      onChanged: (value) {
                                        todoController.checkedChange(
                                          value!,
                                          index,
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20.0,
                                        ),
                                        child: Text(
                                          todo.task,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            decorationColor: Colors.red
                                                .withOpacity(0.8),
                                            decorationStyle:
                                                TextDecorationStyle.wavy,
                                            decorationThickness: 1.5,
                                            decoration: todo.isCompleted.value
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                            fontStyle: todo.isCompleted.value
                                                ? FontStyle.italic
                                                : FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                    ),

                                    todo.isCompleted.value
                                        ? Icon(
                                            Icons.thumb_up,
                                            color: Colors.purple,
                                          )
                                        : SizedBox.shrink(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellow,
        onPressed: () {
          buildDefaultDialog(
            newTaskController,
            todoController,
            'New task',
            'Add',
            'Enter new task',
            () {
              todoController.addToDo(newTaskController.text, args.toString());
              newTaskController.clear();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> buildDefaultDialog(
    TextEditingController newTaskController,
    TodoController todoController,
    String title,
    String buttonTitle,
    String? hintText,
    VoidCallback onPressed,
  ) {
    return Get.defaultDialog(
      backgroundColor: Colors.yellow,
      title: title,
      titleStyle: TextStyle(color: Colors.black),
      content: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: newTaskController,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(buttonTitle),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        newTaskController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text('Cancel'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
