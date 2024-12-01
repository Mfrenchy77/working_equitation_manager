// ignore_for_file: constant_identifier_names

part of 'show_form_cubit.dart';

enum ShowType {
  Licensed,
  Schooling,
  Championship,
}

abstract class ShowFormState extends Equatable {
  final Show? show;

  const ShowFormState({this.show});

  @override
  List<Object?> get props => [show];
}

class ShowFormInitial extends ShowFormState {
  const ShowFormInitial() : super(show: null);
}

class ShowFormTypeSelected extends ShowFormState {
  const ShowFormTypeSelected(Show show) : super(show: show);
}

class ShowFormNextStep extends ShowFormState {
  const ShowFormNextStep(Show show) : super(show: show);
}
