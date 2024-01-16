import 'dart:convert';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/failure_model.dart';
import 'package:lettutor/core/network/network_manager.dart';

typedef ParseJsonFunction<OutputType> = OutputType Function(
    Map<String, dynamic> jsonData);

class BaseRepository {
  late NetworkManager _networkManager;
  final String serviceName;

  BaseRepository(this.serviceName) {
    _networkManager = getIt<NetworkManager>();
  }

  Future<DataState<T>> get<T>(
      {required String path,
      required ParseJsonFunction<T> parseJsonFunction,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _networkManager.get(serviceName + path,
          queryParameters: queryParameters);
      if (response.statusCode == 200) {
        final parser = ResultParser<T>(
            response.data as Map<String, dynamic>? ?? {}, parseJsonFunction);
        final data = await parser.parseInBackground();
        return DataSuccess<T>(data);
      } else {
        final parser = ResultParser<FailureModel>(
            response.data as Map<String, dynamic>? ?? {},
            FailureModel.fromJson);
        throw Exception((await parser.parseInBackground()).message);
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  Future<DataState<T>> post<T>(
      {required String path,
      required ParseJsonFunction<T> parseJsonFunction,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? data}) async {
    try {
      final response = await _networkManager.post(serviceName + path,
          queryParameters: queryParameters, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final parser = ResultParser<T>(
            response.data as Map<String, dynamic>? ?? {}, parseJsonFunction);
        final data = await parser.parseInBackground();
        return DataSuccess<T>(data);
      } else {
        final parser = ResultParser<FailureModel>(
            response.data as Map<String, dynamic>? ?? {},
            FailureModel.fromJson);
        throw Exception((await parser.parseInBackground()).message);
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  Future<DataState<T>> put<T>(
      {required String path,
      required ParseJsonFunction<T> parseJsonFunction,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? data}) async {
    try {
      final response = await _networkManager.put(serviceName + path,
          queryParameters: queryParameters, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final parser = ResultParser<T>(
            response.data as Map<String, dynamic>? ?? {}, parseJsonFunction);
        final data = await parser.parseInBackground();
        return DataSuccess<T>(data);
      } else {
        final parser = ResultParser<FailureModel>(
            response.data as Map<String, dynamic>? ?? {},
            FailureModel.fromJson);
        throw Exception((await parser.parseInBackground()).message);
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  Future<DataState<T>> requestFormData<T>({
    required String path,
    required ParseJsonFunction<T> parseJsonFunction,
    FormData? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _networkManager.requestFormData(
        serviceName + path,
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parser = ResultParser<T>(
            response.data as Map<String, dynamic>? ?? {}, parseJsonFunction);
        final data = await parser.parseInBackground();
        return DataSuccess<T>(data);
      } else {
        final parser = ResultParser<FailureModel>(
            response.data as Map<String, dynamic>? ?? {},
            FailureModel.fromJson);
        throw Exception((await parser.parseInBackground()).message);
      }
    } on DioException catch (e) {
      throw DataError(e);
    }
  }

  Future<DataState<T>> delete<T>({
    required String path,
    required ParseJsonFunction<T> parseJsonFunction,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _networkManager.delete(
        serviceName + path,
        queryParameters: queryParameters,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final parser = ResultParser<T>(
            response.data as Map<String, dynamic>? ?? {}, parseJsonFunction);
        final data = await parser.parseInBackground();
        return DataSuccess<T>(data);
      } else {
        final parser = ResultParser<FailureModel>(
            response.data as Map<String, dynamic>? ?? {},
            FailureModel.fromJson);
        throw Exception((await parser.parseInBackground()).message);
      }
    } on DioException catch (e) {
      throw DataError(e);
    }
  }
}

class ResultParser<OutputType> {
  ResultParser(this.json, this.parseJsonFunction);

  final Map<String, dynamic> json;
  final ParseJsonFunction<OutputType> parseJsonFunction;

  Future<OutputType> parseInBackground() async {
    // final completer = Completer<OutputType>();
    final receivePort = ReceivePort();
    final errorPort = ReceivePort()
      ..listen((message) {
        throw Exception(message);
      });
    await Isolate.spawn(_decodeAndParseJson, receivePort.sendPort,
        onError: errorPort.sendPort);

    return await receivePort.first as OutputType;
  }

  Future<void> _decodeAndParseJson(SendPort sendPort) async {
    final output = parseJsonFunction.call(json);
    sendPort.send(output);
    try {
      final output = parseJsonFunction.call(json);
      sendPort.send(output);
    } catch (exception) {
      sendPort.send(exception);
    }
    Isolate.exit();
  }
}
