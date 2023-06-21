import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../models/store_reviews_model.dart';
import '../../../../views/extensions/space_xy_extension.dart';

class ReviewsList extends StatelessWidget {
  final List<StoreReviewsModel> storeReviews;
  const ReviewsList({
    required this.storeReviews,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: storeReviews.length,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          delay: const Duration(microseconds: 80),
          child: SlideAnimation(
            duration: const Duration(microseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            horizontalOffset: 30,
            verticalOffset: 300.0,
            child: FadeInAnimation(
              duration: const Duration(milliseconds: 3000),
              curve: Curves.fastLinearToSlowEaseIn,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      offset: const Offset(0, 3),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      storeReviews[index].userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(.6),
                      ),
                    ),
                    3.0.spaceY,
                    Text(
                      storeReviews[index].reviewText,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    6.0.spaceY,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${storeReviews[index].rating.toString()} Star',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(.6),
                          ),
                        ),
                        Text(
                          storeReviews[index].createDate,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
