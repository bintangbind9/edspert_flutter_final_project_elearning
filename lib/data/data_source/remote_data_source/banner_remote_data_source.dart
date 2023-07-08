import 'package:edspert_flutter_final_project_elearning/domain/service/dio_client.dart';
import 'package:flutter/foundation.dart';

import '../../../core/constants/urls.dart';
import '../../model/banner.dart';
import '../../model/banner_list_response.dart';

class BannerRemoteDataSource {
  final DioClient dioClient;

  BannerRemoteDataSource({required this.dioClient});

  Future<List<Banner>> getBanners({int? limit}) async {
    try {
      Map<String, dynamic>? queryParams;
      if (limit != null) {
        queryParams = {"limit": limit};
      }
      final result =
          await dioClient.get(Urls.banners, queryParameters: queryParams);

      BannerListResponse res = BannerListResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getBanners: $e, $stackTrace');
      }
      return [];
    }
  }
}
