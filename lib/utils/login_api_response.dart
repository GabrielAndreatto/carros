class LoginApiResponse<T> {
  bool ok;
  String msg;
  T result;

  LoginApiResponse.ok(this.result) {
    ok = true;
  }
  LoginApiResponse.error(this.msg) {
    ok = false;
  }
}
