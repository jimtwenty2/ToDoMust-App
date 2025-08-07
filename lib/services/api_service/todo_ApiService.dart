import 'package:get/get.dart';

class TodoApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://192.168.1.6:3000';
    httpClient.timeout = Duration(seconds: 10);

    // TODO: implement onInit
    super.onInit();
  }

  Future<Response> getTodos() => get('/todo');

  Future<Response> newTodo(Map<String, dynamic> data) {
    return post('/todo', data);
  }

  Future<Response> deleteTodo(String id) {
    return delete('/todo/$id');
  }

  Future<Response> editTodo(String id, Map<String, dynamic> data) {
    return put('/todo/$id', data);
  }

  Future<Response> editTodoStatus(String id, Map<String, dynamic> data) {
    return put('/todo/$id', data);
  }
}
