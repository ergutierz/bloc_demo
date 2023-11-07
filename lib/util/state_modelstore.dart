import 'dart:async';

class StateModelStore<ViewState, Event> {
  final _stateController = StreamController<ViewState>.broadcast();
  Stream<ViewState> get viewState => _stateController.stream;
  ViewState _currentState;
  
  final _eventController = StreamController<Event>.broadcast();
  Stream<Event> get events => _eventController.stream;

  StateModelStore(ViewState initialState) : _currentState = initialState {
    _stateController.add(initialState);
  }

  processState(ViewState Function(ViewState) stateChange) {
    _currentState = stateChange(_currentState);
    _stateController.add(_currentState);
  }

  processEvent(Event event) {
    _eventController.add(event);
  }

  dispose() {
    _stateController.close();
    _eventController.close();
  }
}
