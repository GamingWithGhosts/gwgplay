class AuthenticatedUser {
  String name;
  String firstName;
  String lastName;
  String emailID;
  String imageURL;
  String tokenID;
  String authType;

  AuthenticatedUser(String _name, String _firstName, String _lastName,
      String _emailID, String _imageURL, String _tokenID, String _loginStatus) {
    name = _name;
    firstName = _firstName;
    lastName = _lastName;
    emailID = _emailID;
    imageURL = _imageURL;
    tokenID = _tokenID;
    authType = _loginStatus;
  }

  factory AuthenticatedUser.fromCSV(String strCSV) {
    List<String> authenticatedUser = strCSV.split(new RegExp(',\\s+'));
    return new AuthenticatedUser(
        authenticatedUser[0],
        authenticatedUser[1],
        authenticatedUser[2],
        authenticatedUser[3],
        authenticatedUser[4],
        authenticatedUser[5],
        authenticatedUser[6]);
  }

  factory AuthenticatedUser.fromAuthenticatedUser(
      AuthenticatedUser authenticatedUser) {
    return new AuthenticatedUser(
        authenticatedUser.name,
        authenticatedUser.firstName,
        authenticatedUser.lastName,
        authenticatedUser.emailID,
        authenticatedUser.imageURL,
        authenticatedUser.tokenID,
        authenticatedUser.authType);
  }

  @override
  String toString() {
    return '${this.name}, ${this.firstName}, ${this.lastName}, ${this.emailID}, ${this.imageURL}, ${this.tokenID}, ${this.authType}';
  }
}