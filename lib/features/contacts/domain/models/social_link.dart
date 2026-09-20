import 'package:equatable/equatable.dart';

final class SocialLink extends Equatable {
  const SocialLink({required this.svgPath, required this.url});

  final String svgPath;
  final String url;

  @override
  List<Object> get props => [svgPath, url];
}
