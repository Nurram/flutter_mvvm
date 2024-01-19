abstract class EventObserver {
  void notify(ViewEvent event);
}

abstract class ViewEvent {
  String qualifier;

  ViewEvent({required this.qualifier});

  @override
  String toString() {
    return 'ViewEvent{qualifier: $qualifier}';
  }
}

class LoadingEvent extends ViewEvent {
  bool isLoading;

  LoadingEvent({required this.isLoading}) : super(qualifier: "LoadingEvent");
}
