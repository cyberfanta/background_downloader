import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/static_data/static_data_query_urls.dart';
import '../../domain/entities/entity.dart';
import '../models/multi_part/start_chunks.dart';
import '../models/multi_part/status_chunks.dart';
import '../models/status_body/status_body.dart';
import 'local_data.dart';

Map<String, String> _headers = {
  'Content-Type': 'application/json; charset=utf-8',
};

final Map<String, String> _defaultHeaders = {
  'Content-Type': 'application/json; charset=utf-8',
};

class ApiSource {
  ApiSource()
    : _dio = Dio(
        BaseOptions(
          headers: _defaultHeaders,
          connectTimeout: Duration(milliseconds: 10000),
          receiveTimeout: Duration(milliseconds: 10000),
        ),
      );

  final Dio _dio;

  // GET Request
  Future<StatusBody> getQuery(String url, CancelToken? cancelToken) async {
    try {
      Response response = await _dio.get(url, cancelToken: cancelToken);

      return StatusBody(
        statusCode: response.statusCode ?? 500,
        body: response.data,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return StatusBody(statusCode: 500, body: 'Error inesperado: $e');
    }
  }

  // POST Request
  Future<StatusBody> postQuery(
    String url,
    CancelToken? cancelToken, [
    Map<String, dynamic>? body,
  ]) async {
    try {
      Response response = await _dio.post(
        url,
        cancelToken: cancelToken,
        data: body,
      );

      return StatusBody(
        statusCode: response.statusCode ?? 500,
        body: response.data.toString(),
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return StatusBody(statusCode: 500, body: 'Error inesperado: $e');
    }
  }

  // PUT Request
  Future<StatusBody> putQuery(
    String url,
    CancelToken? cancelToken, [
    Map<String, dynamic>? body,
  ]) async {
    try {
      Response response = await _dio.put(
        url,
        cancelToken: cancelToken,
        data: body,
      );

      return StatusBody(
        statusCode: response.statusCode ?? 500,
        body: response.data.toString(),
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return StatusBody(statusCode: 500, body: 'Error inesperado: $e');
    }
  }

  // PATCH Request
  Future<StatusBody> patchQuery(
    String url,
    CancelToken? cancelToken, [
    Map<String, dynamic>? body,
  ]) async {
    try {
      Response response = await _dio.patch(
        url,
        cancelToken: cancelToken,
        data: body,
      );

      return StatusBody(
        statusCode: response.statusCode ?? 500,
        body: response.data.toString(),
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return StatusBody(statusCode: 500, body: 'Error inesperado: $e');
    }
  }

  // DELETE Request
  Future<StatusBody> deleteQuery(
    String url,
    CancelToken? cancelToken, [
    Map<String, dynamic>? body,
  ]) async {
    try {
      Response response = await _dio.delete(
        url,
        cancelToken: cancelToken,
        data: body,
      );

      return StatusBody(
        statusCode: response.statusCode ?? 500,
        body: response.data.toString(),
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return StatusBody(statusCode: 500, body: 'Error inesperado: $e');
    }
  }

  StatusBody _handleDioError(DioException e) {
    if (CancelToken.isCancel(e)) {
      return StatusBody(statusCode: 499, body: 'Error: Petición cancelada.');
    }

    if (e.type == DioExceptionType.connectionTimeout) {
      return StatusBody(
        statusCode: 500,
        body: 'Error: Tiempo de conexión agotado.',
      );
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return StatusBody(
        statusCode: 500,
        body: 'Error: Tiempo de recepción agotado.',
      );
    } else if (e.type == DioExceptionType.unknown) {
      return StatusBody(
        statusCode: e.response?.statusCode ?? 500,
        body: 'Error HTTP: ${e.response?.statusMessage ?? "Desconocido"}',
      );
    } else if (e.type == DioExceptionType.connectionError) {
      return StatusBody(
        statusCode: 500,
        body: 'Error de conexión: Verifica tu red.',
      );
    } else {
      return StatusBody(
        statusCode: 500,
        body: 'Error inesperado: ${e.message}',
      );
    }
  }

  // Future<StatusChunks> postBinaryMultipartWithChunks(
  //   BuildContext context,
  //   String url,
  //   web.File file,
  //   LocalData localData,
  //   CancelToken? cancelToken,
  // ) async {
  //   List<StartChunks> chunkResults = [];
  //
  //   Dio dio = Dio();
  //
  //   Options options = Options(headers: _headers);
  //
  //   final reader = web.FileReader();
  //
  //   int chunkSize = 90;
  //   int chunkInBytes = chunkSize * 1024 * 1024;
  //   int totalChunks = (file.size / chunkInBytes).ceil();
  //
  //   for (int chunkIndex = 0; chunkIndex < totalChunks; chunkIndex++) {
  //     int start = chunkIndex * chunkInBytes;
  //     int end =
  //         (start + chunkInBytes > file.size) ? file.size : start + chunkInBytes;
  //
  //     reader.readAsArrayBuffer(file.slice(start, end));
  //     await reader.onLoadEnd.first;
  //
  //     Uint8List chunk = (reader.result as ByteBuffer).asUint8List();
  //
  //     String chunkName = "partNumber_${chunkIndex + 1}";
  //
  //     FormData formData = FormData.fromMap({
  //       'file': MultipartFile.fromBytes(chunk, filename: chunkName),
  //     });
  //
  //     String uri = "$url&partNumber=${chunkIndex + 1}";
  //
  //     double progress = chunkIndex / totalChunks;
  //
  //     try {
  //       Response response = await dio.post(
  //         uri,
  //         data: formData,
  //         options: options,
  //         cancelToken: cancelToken,
  //         onSendProgress: (int sent, int total) {
  //           double uploadProgress = sent / total / totalChunks;
  //           double totalProgress = progress + uploadProgress;
  //         },
  //       );
  //     } on DioException catch (e) {
  //       if (CancelToken.isCancel(e)) {
  //         return StatusChunks(statusCode: 499, body: []);
  //       }
  //
  //       return StatusChunks(statusCode: 500, body: []);
  //     }
  //   }
  //
  //   return StatusChunks(statusCode: 201, body: chunkResults);
  // }

  void setBearerToken(String token) {
    _headers['Authorization'] = 'Bearer $token';
  }

  void resetBearerToken() {
    _headers = _defaultHeaders;
  }
}
