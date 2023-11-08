
import 'one-time-event.dart';

OneTimeEvent<T> createOneTimeEvent<T>(T value) {
  return OneTimeEvent(value);
}