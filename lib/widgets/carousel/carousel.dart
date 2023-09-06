import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:paywall_challenge/extensions/context_extension.dart';
import 'package:paywall_challenge/widgets/carousel/carousel_item.dart';
import 'package:paywall_challenge/widgets/carousel/model/carousel_model.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  //Storing a list of CarouselItemModels to be mapped into widgets
  List<CarouselItemModel> carouselModel = [
    CarouselItemModel(
        imageUrl: 'assets/all_collections.jpg',
        imageCaption: 'All collections'),
    CarouselItemModel(
        imageUrl: 'assets/features.jpg', imageCaption: 'Unique Stickers'),
    CarouselItemModel(
        imageUrl: 'assets/fonts.jpg', imageCaption: 'Additional Fonts'),
    CarouselItemModel(
        imageUrl: 'assets/stickers.jpg', imageCaption: 'All Features'),
  ];

  @override
  void initState() {
    super.initState();

    /// WidgetsBinding.instance connects Flutter engine to the widgets,
    /// This method schedules a callback to run at the end (post) of the current frame.
    /// These post-frame callbacks cannot be unregistered and are called exactly once.
    /// In here we connect our animation method to this callback called in initState
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      animateToOffset(_infiniteController.offset, (5 * 4), _infiniteController);
    });
  }

  //RECURSIVE ANIMATION FUNCTION
  animateToOffset(
      double offset, int seconds, ScrollController scrollController) {
    scrollController
        .animateTo(
      //animate to the offset
      offset,
      duration: Duration(seconds: seconds),
      curve: Curves.linear,
    ) // once we reach the end, call the animation again, and give '4 x screenWidth' amount of extra pixels as an offset
        .then((value) {
      animateToOffset(offset + (context.figmaScreenWidth * 4), seconds,
          scrollController); //Recursively call the method
    });
  }

  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: context.dynamicHeight(232),
            //create an infinite list view
            child: InfiniteListView.builder(
              //only allow scrollController to scroll, not the user
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _infiniteController,
              itemBuilder: (context, index) {
                // reset the index at each length of items
                // e.g 0,1,2,3,4 ..0,1....
                final i = index % carouselModel.length;
                return Row(
                  children: [
                    //Map over the carouselModel list, to create the ListView
                    CarouselItem(
                        imageUrl: carouselModel[i].imageUrl,
                        imageCaption: carouselModel[i].imageCaption),
                    SizedBox(
                      width: context.dynamicWidth(16),
                    )
                  ],
                );
              },
            )),
      ],
    );
  }
}
