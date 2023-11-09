part of 'home_page_bloc.dart';

class HomePageState {
  final int carouselIndex;
  const HomePageState({required this.carouselIndex});

  HomePageState copyWith({
    int? carouselIndex,
  }) {
    return HomePageState(
      carouselIndex: carouselIndex ?? this.carouselIndex,
    );
  }
}
