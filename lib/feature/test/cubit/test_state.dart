part of 'test_cubit.dart';

class TestState extends Equatable {
  const TestState(
      {this.items,
      this.selectItems,
      this.isLoading,
      this.categories,
      this.isInitial = false,
      this.pageNumber});

  final List<ProductModel>? items;
  final List<ProductModel>? selectItems;
  final bool? isLoading;
  final List<String>? categories;
  final bool isInitial;
  final int? pageNumber;

  @override
  List<Object?> get props =>
      [items, isLoading, categories, pageNumber, selectItems];

  TestState copyWith(
      {List<ProductModel>? items,
      List<ProductModel>? selectItems,
      bool? isLoading,
      List<String>? categories,
      int? pageNumber}) {
    return TestState(
      items: items ?? this.items,
      selectItems: selectItems ?? this.selectItems,
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }
}
