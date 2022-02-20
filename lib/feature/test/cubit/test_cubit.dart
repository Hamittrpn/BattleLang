import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_language/core/constants/app/app_constants.dart';

import '../model/product_model.dart';
import '../service/test_service_interface.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit(this.testService) : super(const TestState(isInitial: true)) {
    _initialComplete();
  }
  final ITestService testService;

  Future<void> _initialComplete() async {
    await Future.microtask(
      () => emit(const TestState(isInitial: true)),
    );
    await Future.wait([fetchAllItems(), fetchAllCategories()]);
    emit(state.copyWith(selectItems: state.items));
  }

  Future<void> fetchAllItems() async {
    _changeLoading();
    final response = await testService.fetchAllProducts();

    emit(state.copyWith(items: response ?? []));
    _changeLoading();
  }

  Future<void> fetchAllCategories() async {
    final response = await testService.fetchAllCategories();
    emit(state.copyWith(categories: response));
  }

  void selectedCategories(String data) {
    emit(state.copyWith(
        selectItems: state.items
            ?.where((element) => element.category == data)
            .toList()));
  }

  Future<void> fetchNewItems() async {
    if (state.isLoading ?? false) return;
    _changeLoading();

    int _pageNumber = (state.pageNumber ?? kOne.toInt());
    final response =
        await testService.fetchAllProducts(count: ++_pageNumber * 5);
    _changeLoading();
    emit(state.copyWith(items: response, pageNumber: _pageNumber));
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
