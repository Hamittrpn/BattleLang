import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_language/product/widget/product_dropdown_widget.dart';

import '../../../core/constants/app/app_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../product/network/product_network_manager.dart';
import '../../../product/widget/center_loading_widget.dart';
import '../../../product/widget/product_card_widget.dart';
import '../cubit/test_cubit.dart';
import '../service/test_service.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  void _listenScroll(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent) {
        context.read<TestCubit>().fetchNewItems();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestCubit(TestService(ProductNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          actions: [_loadingCenter()],
          title: _dropdownProject(),
          centerTitle: false,
        ),
        body: _bodyListView(context),
      ),
    );
  }

  Widget _dropdownProject() {
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        return ProductDropdown(
          items: state.categories ?? [],
          onSelected: (String data) {
            context.read<TestCubit>().selectedCategories(data);
          },
        );
      },
    );
  }

  Widget _bodyListView(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalDefaultScreen,
      child: BlocConsumer<TestCubit, TestState>(
        listener: (context, state) {
          if (state.isInitial) {
            _listenScroll(context);
          }
        },
        builder: (context, state) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.selectItems?.length ?? kZero.toInt(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ProductCard(model: state.selectItems?[index]),
                  state.selectItems!.isNotEmpty &&
                          index == state.selectItems!.length - 1
                      ? const LoadingCenter()
                      : const SizedBox.shrink(),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _loadingCenter() {
    return BlocSelector<TestCubit, TestState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state ? kOne : kZero,
          duration: context.lowDuration,
          child: const LoadingCenter(),
        );
      },
    );
  }
}
