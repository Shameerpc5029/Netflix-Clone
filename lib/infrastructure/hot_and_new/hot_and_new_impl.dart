import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflix_app/domain/hot_and_new_resp/model/hot_and_new_resp.dart';
import 'package:netflix_app/domain/search/model/search_resp/search_resp.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplementation implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovie);
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewTv);
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
