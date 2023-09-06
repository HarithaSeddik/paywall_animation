import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'button_switch_state.dart';

//Cubit (Bloc) class for handling the business logic, managing/emitting the correct app states
// This Cubit class is dedicated to the Button Switch state and relevant UI
class ButtonSwitchCubit extends Cubit<ButtonSwitchState> {
  ButtonSwitchCubit() : super(const ButtonSwitchState());
  //This public method is accessed from the widget
  toggleButtonState() {
    // emit a new state with the boolean toggled
    emit(ButtonSwitchState(isFreeTrialEnabled: !state.isFreeTrialEnabled));
  }
}
