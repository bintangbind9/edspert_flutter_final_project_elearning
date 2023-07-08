import 'package:edspert_flutter_final_project_elearning/domain/repository/banner_repository.dart';

import '../../../data/model/banner.dart';

class GetBannersUseCase {
  final BannerRepository repository;

  GetBannersUseCase({required this.repository});

  Future<List<Banner>> call({int? limit}) async => await repository.getBanners(limit: limit);
}