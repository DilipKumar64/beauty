part of 'admin_pannel_bloc.dart';

class AdminPannelEvent extends Equatable {
  const AdminPannelEvent();

  @override
  List<Object> get props => [];
}

class SelectServiceLogoEvent extends AdminPannelEvent {}

class AddPictureEvent extends AdminPannelEvent {
  final int index;

  const AddPictureEvent({required this.index});
}

class AddServiceEvent extends AdminPannelEvent {
  final String name;
  final String description;
  final BuildContext context;

  const AddServiceEvent({
    required this.name,
    required this.description,
    required this.context,
  });
}
