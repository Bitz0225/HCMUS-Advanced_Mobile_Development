import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lettutor/common/config/loading_event.dart';
import 'package:lettutor/common/config/navigation_event.dart';
import 'package:lettutor/core/base_widget/cubit/navigation_bloc.dart';
import 'package:lettutor/core/widget_cubit/widget_state.dart';

typedef ParseJsonFunction<T> = T Function(Map<String, dynamic> jsonData);

abstract class WidgetCubit<State extends WidgetState>
    extends HydratedCubit<State> {
  WidgetCubit({required State initialState, required this.parseJsonFunction})
      : super(initialState);

  ParseJsonFunction parseJsonFunction;
  Object? _args;

  Object? get args => _args;

  set args(Object? value) {
    _args = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  Future<void> init();

  Future<void> onApiError(Object e) async {}

  final _loadingController = StreamController<LoadingEvent>.broadcast();

  Stream<LoadingEvent> get loadingStream =>
      _loadingController.stream.distinct();

  void showLoading({String? message}) {
    _loadingController.add(LoadingEvent(isLoading: true, message: message));
  }

  void hideLoading() {
    if (!isClosed) {
      _loadingController.add(const LoadingEvent(isLoading: false));
    }
  }

  NavigationBloc? navigationController;

  // Future<T?> getData<T extends BaseOutput>(ApiCallerFunction apiCallerFunction,
  //     {bool showErrorToast = true,
  //       bool showLoading = false,
  //     }) async {
  //   if (showLoading) {
  //     this.showLoading();
  //   }
  //   return fetchApi(apiCallerFunction, showErrorToast: showErrorToast);
  // }
  //
  // Future<T?> submitData<T extends BaseOutput>(
  //     ApiCallerFunction? apiCallerFunction,
  //     {String? loadingMessage = 'Vui lòng chờ....',
  //       bool showErrorToast = true}) async {
  //   showLoading(message: loadingMessage);
  //   return fetchApi(apiCallerFunction, showErrorToast: showErrorToast);
  // }
  //
  // //port to listen error in background isolate
  //
  // Future<T?> fetchApi<T extends BaseOutput>(
  //     ApiCallerFunction? apiCallerFunction,
  //     {bool showErrorToast = true}) async {
  //   try {
  //     final response = await apiCallerFunction!();
  //     if (response is T) {
  //       return response;
  //     } else {
  //       return parseJsonFunction(response);
  //     }
  //   } catch (e) {
  //     if (showErrorToast) {
  //       onApiError(e);
  //     }
  //     return null;
  //   } finally {
  //     hideLoading();
  //   }
  // }

  void showSnackBar(String message, {SnackBarType snackBarType = SnackBarType.error}) {
    navigationController?.add(ShowSnackBarEvent(message, type: snackBarType));
  }

  @override
  Future<void> close() async {
    await _loadingController.close();

    stream.drain();

    super.close();
  }

  @override
  State? fromJson(Map<String, dynamic> json) {
    try {
      return parseJsonFunction(json) as State;
    } catch (e) {
      clear();
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(state) {
    return state.toJson();
  }

  // function to control navigation

  void pushRoute(PageRouteInfo route, {OnNavigationFailure? onFailure}) {
    navigationController?.add(PushRouteEvent(route, onNavigationFailure: onFailure));
  }

  void replaceRoute(PageRouteInfo route, {OnNavigationFailure? onFailure}) {
    navigationController?.add(ReplaceRouteEvent(route, onNavigationFailure: onFailure));
  }

  void popRoute<T extends Object?>([T? result]) {
    navigationController?.add(PopEvent(result: result));
  }

  void replaceAll(List<PageRouteInfo> routes) {
    navigationController?.add(ReplaceAllEvent(routes));
  }

  void popUntil(RoutePredicate predicate) {
    navigationController?.add(PopUntilEvent(predicate: predicate));
  }

  void popUntilRouteWithName(String name) {
    navigationController?.add(PopUntilWithNameEvent(name));
  }

  void navigateTo(PageRouteInfo route, {OnNavigationFailure? onFailure}) {
    navigationController?.add(NavigateToEvent(route, onFailure: onFailure));
  }

  void navigateNamedTo(String path,
      {bool includePrefixMatches = false, OnNavigationFailure? onFailure}) {
    navigationController?.add(NavigateNamedToEvent(path,
        includePrefixMatches: includePrefixMatches, onFailure: onFailure));
  }

  void removeWhere(RouteDataPredicate predicate, {bool notify = true}) {
    navigationController?.add(RemoveWhereEvent(predicate, notify: notify));
  }
}
