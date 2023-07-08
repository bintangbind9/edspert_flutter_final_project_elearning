import '../../data/model/banner.dart';

abstract class BannerRepository {
  Future<List<Banner>> getBanners({int? limit});
}