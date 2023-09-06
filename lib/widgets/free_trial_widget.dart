import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paywall_challenge/cubits/button_switch/button_switch_cubit.dart';

class FreeTrialWidget extends StatelessWidget {
  const FreeTrialWidget({
    Key? key,
    required this.isSwitchOn,
  }) : super(key: key);

  final bool isSwitchOn;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 32,
        right: 14,
      ),
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.transparent,
          border: Border.all(width: 2, color: const Color(0xFF303036))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isSwitchOn
              ? Text(
                  'Free Trial Enabled',
                  style: Theme.of(context).textTheme.subtitle2,
                )
              : _buildText(context),
          CupertinoSwitch(
            value: isSwitchOn,
            onChanged: (_) => {
              BlocProvider.of<ButtonSwitchCubit>(context).toggleButtonState(),
            },
            trackColor: const Color(0xFF74747B),
          )
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Not sure yet?',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          'Enable free trial',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.apply(color: const Color(0xFFB2B2B8)),
        ),
      ],
    );
  }
}
