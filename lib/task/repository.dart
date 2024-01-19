import 'package:flutter_mvvm/task/model.dart';

class TaskRepository {
  final _tasks = <Task>[
    Task(
        id: 0,
        title: 'Study MVVM',
        description:
            'In order to avoid ugly state management librares and collect continuously technical debt, I should study proper state management patterns',
        done: false)
  ];

  addTask(Task task) {
    task.id = _tasks.length;
    _tasks.add(task);
  }

  removeTask(Task task) {
    _tasks.remove(task);
  }

  void updateTask(Task task) {
    _tasks[_tasks.indexWhere((element) => element.id == task.id)] = task;
  }

  Future<List<Task>> loadTasks() async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(_tasks);
  }
}
