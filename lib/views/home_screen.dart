import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paywall_challenge/cubits/button_switch/button_switch_cubit.dart';
import 'package:paywall_challenge/widgets/custom_button.dart';
import 'package:paywall_challenge/widgets/free_trial_widget.dart';
import 'package:paywall_challenge/extensions/context_extension.dart';
import '../widgets/carousel/carousel.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 66, right: 16, left: 16),
      child: Column(
        children: [
          _buildTitleRow(context),
          SizedBox(
            height: context.dynamicHeight(80), //apply custom dynamic height
          ),
          const CarouselWidget(), //build Paywall-Carousel Widget
          SizedBox(
            height: context.dynamicHeight(81),
          ),
          _buildHeadline(context),

          /// By wrapping these widgets by BlocBuilder,
          /// only the state-related UI will rerender upon state changes (button state)
          /// This is superior to setState() method and other state-management
          /// since it minimizes rendering
          BlocBuilder<ButtonSwitchCubit, ButtonSwitchState>(
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: context.dynamicHeight(48)),
                  FreeTrialWidget(
                    isSwitchOn: state.isFreeTrialEnabled,
                  ),
                  SizedBox(height: context.dynamicHeight(16)),
                  CustomButton(
                    isSwitchOn: state.isFreeTrialEnabled,
                  ),
                  SizedBox(height: context.dynamicHeight(16)),
                  Text(
                      state.isFreeTrialEnabled
                          ? '7 days for free, then \$2,99/Month'
                          : '\$2,99/Month',
                      style: Theme.of(context).textTheme.subtitle1),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline(BuildContext context) {
    return Column(
      children: [
        Text(
          'Get Full Access',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 4,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'Cancel Anytime,',
              style: Theme.of(context).textTheme.subtitle1),
          TextSpan(
              text: ' We\'ll still love you,',
              style: Theme.of(context).textTheme.subtitle1?.apply(
                    color: const Color(
                        0xFFB2B2B8), //same textTheme, different color
                  )),
        ])),
      ],
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Already Purchased?',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.apply(color: Colors.white),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 32,
            width: 32,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: const Icon(
              Icons.close,
              color: Colors.black,
              size: 14,
            ),
          ),
        )
      ],
    );
  }
}
