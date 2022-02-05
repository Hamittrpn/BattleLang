import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../model/challenge.dart';

const _initalPage = 3.0;

class ChallengesView extends StatefulWidget {
  const ChallengesView({Key? key}) : super(key: key);

  @override
  State<ChallengesView> createState() => _ChallengesViewState();
}

class _ChallengesViewState extends State<ChallengesView> {
  final _challengePageController =
      PageController(viewportFraction: 0.35, initialPage: _initalPage.toInt());

  final _pageTextController = PageController(initialPage: _initalPage.toInt());
  double _currentPage = _initalPage;
  double _textPage = _initalPage;

  void _challengeScrollListener() {
    setState(() {
      _currentPage = _challengePageController.page!;
    });
  }

  void _textScrollListener() {
    _textPage = _currentPage;
  }

  @override
  void initState() {
    _challengePageController.addListener(_challengeScrollListener);
    _pageTextController.addListener(_textScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _challengePageController.removeListener(_challengeScrollListener);
    _pageTextController.removeListener(_textScrollListener);
    _challengePageController.dispose();
    _pageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.secondaryVariant,
      body: buildBody(context),
    );
  }

  Stack buildBody(BuildContext context) {
    return buildBottomShadowStack(context);
  }

  Stack buildBottomShadowStack(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20,
          right: 20,
          bottom: -context.screenHeight * 0.22,
          height: context.screenHeight * 0.3,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.brown,
                  blurRadius: 90,
                  offset: Offset.zero,
                  spreadRadius: 60,
                ),
              ],
            ),
          ),
        ),
        buildImagePageView(context),
        buildTitleAndDescPageView(context),
      ],
    );
  }

  Transform buildImagePageView(BuildContext context) {
    return Transform.scale(
      scale: 1.7,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: context.normalValue + 20),
        child: PageView.builder(
          controller: _challengePageController,
          itemCount: challenges.length + 1,
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            if (value < challenges.length) {
              _pageTextController.animateToPage(
                value,
                duration: context.lowDuration,
                curve: Curves.easeOut,
              );
            }
          },
          itemBuilder: (context, index) {
            if (index == 0) {
              return const SizedBox.shrink();
            }
            final challenge = challenges[index - 1];
            final result = _currentPage - index + 1;
            final value = -0.4 * result + 1;
            final opacity = value.clamp(0.0, 1.0);

            return Padding(
              padding: EdgeInsets.only(bottom: context.mediumValue),
              child: Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(
                      0.0, context.screenHeight / 2.6 * (1 - value).abs())
                  ..scale(value),
                child: Opacity(
                  opacity: opacity,
                  child: Image.asset(
                    challenge.image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Positioned buildTitleAndDescPageView(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      right: 0,
      height: 100,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageTextController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: challenges.length,
              itemBuilder: (context, index) {
                final opacity = (1 - (index - _textPage).abs()).clamp(0.0, 1.0);
                return Opacity(
                    opacity: opacity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.screenWidth * 0.2),
                      child: Text(
                        challenges[index].name,
                        style: context.textTheme.headline4,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ));
              },
            ),
          ),
          buildTextAnimatedSwitcher(context),
        ],
      ),
    );
  }

  AnimatedSwitcher buildTextAnimatedSwitcher(BuildContext context) {
    return AnimatedSwitcher(
      duration: context.lowDuration,
      child: Text(
        challenges[_currentPage.toInt()].description,
        style: context.textTheme.bodyText1,
      ),
      key: Key(challenges[_currentPage.toInt()].name),
    );
  }
}
