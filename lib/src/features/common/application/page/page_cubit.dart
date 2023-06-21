import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_state.dart';

const kAnimationDuration = Duration(milliseconds: 300);
const kCurve = Curves.easeInOut;

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(const PageState.init()) {
    init();
  }

  final PageController pageController = PageController();

  void init() {
    pageController.addListener(_pageChange);
    emit(PageState(controller: pageController, page: 0));
  }

  void next() {
    if (!pageController.hasClients) {
      return;
    }

    pageController.nextPage(duration: kAnimationDuration, curve: kCurve);
  }

  void previous() {
    if (!pageController.hasClients) {
      return;
    }

    pageController.previousPage(duration: kAnimationDuration, curve: kCurve);
  }

  void onPageChanged(int page) {
    emit(state.copyWith(page: page));
  }

  void _pageChange() {
    if (!pageController.hasClients) {
      return;
    }
    onPageChanged(pageController.page?.toInt() ?? 1);
  }

  @override
  Future<void> close() async {
    pageController
      ..removeListener(_pageChange)
      ..dispose();
    await super.close();
  }
}
