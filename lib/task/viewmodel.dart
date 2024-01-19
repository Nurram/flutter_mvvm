import 'package:flutter_mvvm/mvvm/observer.dart';
import 'package:flutter_mvvm/mvvm/viewmodel.dart';
import 'package:flutter_mvvm/task/repository.dart';

import 'model.dart';

class TaskViewModel extends EventViewModel {
  TaskRepository repository;

  TaskViewModel({required this.repository});

  loadTask() async {
    notify(LoadingEvent(isLoading: true));

    final tasks = await repository.loadTasks();
    notify(TasksLoadedEvent(tasks: tasks));
    notify(LoadingEvent(isLoading: false));
  }

  void createTask(String title, String description) {
    notify(LoadingEvent(isLoading: true));

    notify(TaskCreatedEvent());
    notify(LoadingEvent(isLoading: false));
  }
}

class TasksLoadedEvent extends ViewEvent {
  final List<Task> tasks;

  TasksLoadedEvent({required this.tasks}) : super(qualifier: "TasksLoadedEvent");
}

class TaskCreatedEvent extends ViewEvent {
  TaskCreatedEvent() : super(qualifier: "TaskCreatedEvent");
}
