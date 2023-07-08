import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/banner_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/banner.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/banner_repository.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDataSource bannerRemoteDataSource;

  BannerRepositoryImpl({required this.bannerRemoteDataSource});

  @override
  Future<List<Banner>> getBanners({int? limit}) async =>
      await bannerRemoteDataSource.getBanners(limit: limit);
}