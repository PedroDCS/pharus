

enum ModalStatusEnum {
  initial,
  loading,
  success,
  failure,
}

extension PageStatusX on ModalStatusEnum {
  bool get isinitial => this == ModalStatusEnum.initial;
  bool get isLoading => this == ModalStatusEnum.loading;
  bool get isSuccess => this == ModalStatusEnum.success;
  bool get isFailure => this == ModalStatusEnum.failure;
}

