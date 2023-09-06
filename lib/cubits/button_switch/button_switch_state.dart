part of 'button_switch_cubit.dart';

// class the encircles the relevant state to our business logic in the cubit,
// in this case the button switch state only holds an on (true) or off (false) state
@immutable
class ButtonSwitchState {
  final bool isFreeTrialEnabled;

  const ButtonSwitchState(
      {this.isFreeTrialEnabled = false}); //default (initial) false
}
