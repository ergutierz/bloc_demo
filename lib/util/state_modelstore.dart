import 'dart:async';

class StateModelStore<ViewState, Event> {
  final StreamController _viewState = StreamController<ViewState>();
  Stream<ViewState> get viewState => _viewState.stream.map((state) => state);
  ViewState _currentState;

  final _events = StreamController.broadcast();
  Stream<Event> get events => _events.stream.map((event) => event);

  StateModelStore(ViewState initialState) : _currentState = initialState {
    _viewState.sink.add(initialState);
  }

  processState(ViewState Function(ViewState) stateChange) {
    _currentState = stateChange(_currentState);
    _viewState.sink.add(_currentState);
  }

  processEvent(Event event) {
    _events.add(event);
  }

  dispose() {
    _viewState.close();
    _events.close();
  }
}
