part of 'page_cubit.dart';

class PageState extends Equatable {
  const PageState({required this.controller, required this.page});

  const PageState.init()
      : controller = null,
        page = 0;

  PageState copyWith({int? page}) {
    return PageState(
      controller: controller,
      page: page ?? this.page,
    );
  }

  final PageController? controller;
  final int page;

  @override
  List<Object?> get props => [
    controller,
    page,
  ];
}
