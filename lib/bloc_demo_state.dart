part of 'bloc_demo_bloc.dart';

abstract class DemoState extends Equatable {
  const DemoState();
}

class DemoInitial extends DemoState {
  @override
  List<Object> get props => [];
}
