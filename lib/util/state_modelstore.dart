import 'dart:async';

class StateModelStore<ViewState, Event> {
  final StreamController _stateController = StreamController<ViewState>();
  Stream<ViewState> get viewState => _stateController.stream.map((state) => state);
  ViewState _currentState;
  
  final StreamController _eventController = StreamController<Event>();
  Stream<Event> get events => _eventController.stream.map((event) => event);

  StateModelStore(ViewState initialState) : _currentState = initialState {
    _stateController.sink.add(initialState);
  }

  processState(ViewState Function(ViewState) stateChange) {
    _currentState = stateChange(_currentState);
    _stateController.sink.add(_currentState);
  }

  processEvent(Event event) {
    _eventController.sink.add(event);
  }

  dispose() {
    _stateController.close();
    _eventController.close();
  }
}
