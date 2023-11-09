part of 'home_page_bloc.dart';

sealed class HomePageEvent {
  const HomePageEvent();
}

class ChangeCarouselIndex extends HomePageEvent {
  final int currentIndex;
  const ChangeCarouselIndex(this.currentIndex);
}
