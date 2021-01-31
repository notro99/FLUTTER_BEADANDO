class ProfileRoutePath {
  final int id;
  final bool isUnknown;
  final bool isProfile;
  final bool isCart;

  ProfileRoutePath.home()
      : id = null,
        isUnknown = false,
        isProfile = false,
        isCart = false;

  ProfileRoutePath.order(this.id)
      : isUnknown = false,
        isProfile = false,
        isCart = false;

  ProfileRoutePath.unknown()
      : id = null,
        isUnknown = true,
        isProfile = false,
        isCart = false;

  ProfileRoutePath.profile()
      : id = null,
        isUnknown = false,
        isProfile = true,
        isCart = false;

  ProfileRoutePath.cart()
      : id = null,
        isUnknown = false,
        isProfile = false,
        isCart = true;

  bool get isHomePage => id == null && !isProfile;

  bool get isOrderPage => id != null && !isProfile;
}
