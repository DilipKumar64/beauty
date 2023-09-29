// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'admin_pannel_bloc.dart';

class AdminPannelState extends Equatable {
  final List<File?> pathList;
  final File? logoPath;
  const AdminPannelState(
      {this.pathList = const [null, null, null, null], this.logoPath});

  @override
  List<Object?> get props => [pathList, logoPath];

  AdminPannelState copyWith({
    List<File?>? pathList,
    File? logoPath,
  }) {
    return AdminPannelState(
      pathList: pathList ?? this.pathList,
      logoPath: logoPath ?? this.logoPath,
    );
  }
}

class AdminPannelInitial extends AdminPannelState {}

class AdminPannelErrorState extends AdminPannelState {
  final String errorMessage;

  const AdminPannelErrorState({required this.errorMessage});
}
