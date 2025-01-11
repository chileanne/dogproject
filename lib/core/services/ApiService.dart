

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:dogproject/data/models/favouriteModel.dart';

import '../constants/api_constants.dart';

class ApiService{
 static final fb = FirebaseFirestore.instance;

  static final _options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: Duration(seconds: 30) ,
    receiveTimeout: Duration(seconds: 30),
    responseType: ResponseType.json,
    //contentType: ContentType.json

  );

  // dio instance
  final Dio _dio = Dio(_options)..interceptors.add(LogInterceptor(
    request: false,
    requestHeader: false,
    requestBody: false,
    responseHeader: false,
    responseBody: true,

  ));

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        RequestOptions? requestOptions,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {

      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }







//FIREBASE:----------------------------------------------------------------------
  Future<Future<DocumentReference<Map<String, dynamic>>>> bookMarkFavourite ({required String dogImage}) async{
    return fb.collection(ApiConstants.favouriteApi).add({
      "imagePath": dogImage,
      "timestamp":FieldValue.serverTimestamp()
    });
  }



  Future<List<QueryDocumentSnapshot<FavouriteModel>>> getFavourites() async {
    final dataRef = fb.collection(ApiConstants.favouriteApi).orderBy("timestamp",descending: true).withConverter<FavouriteModel>(
      fromFirestore: (snapshot, _) => FavouriteModel.fromJson(snapshot.data()!),
      toFirestore: (c, _) => c.toJson(),
    );

    List<QueryDocumentSnapshot<FavouriteModel>> data = await dataRef.get().then((snapshot) => snapshot.docs);
    return data;

  }




}