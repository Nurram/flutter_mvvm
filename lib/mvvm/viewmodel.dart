import 'package:flutter_mvvm/mvvm/observer.dart';

abstract class EventViewModel {
  final List<EventObserver> _observers = List.empty(growable: true);

  subscribe(EventObserver o) {
    if (_observers.contains(o)) return;

    _observers.add(o);
  }

  bool unsubscribe(EventObserver o) {
    if (_observers.contains(o)) {
      _observers.remove(o);
      return true;
    } else {
      return false;
    }
  }

  notify(ViewEvent event) {
    for (var element in _observers) {
      element.notify(event);
    }
  }
}
