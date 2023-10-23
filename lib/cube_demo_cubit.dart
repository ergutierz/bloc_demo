import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cube_demo_state.dart';

class CubeDemoCubit extends Cubit<CubeDemoState> {
  CubeDemoCubit() : super(CubeDemoInitial());
}
