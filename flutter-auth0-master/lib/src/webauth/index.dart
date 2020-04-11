part of auth0_auth;

const MethodChannel auth0Channel =
    const MethodChannel('io.flutter.plugins/auth0');
var platformName = Platform.isAndroid ? 'android' : 'ios';

Future<String> callbackUri(String domain) async {
  var bundleIdentifier = await auth0Channel.invokeMethod('bundleIdentifier');
  return '$bundleIdentifier://$domain/$platformName/$bundleIdentifier/callback';
}

/*
 * Helper to perform Auth against Auth0 hosted login page
 *
 * It will use `/authorize` endpoint of the Authorization Server (AS)
 * with Code Grant and Proof Key for Challenge Exchange (PKCE).
 *
 * @export
 * @class WebAuth
 * [ref link]: https://auth0.com/docs/api-auth/grant/authorization-code-pkce
 */
class WebAuth {
  final Auth0Auth client;
  final String domain;
  final String clientId;

  WebAuth(this.client)
      : this.domain = client.client.domain,
        this.clientId = client.clientId;

  /*
   * Starts the AuthN/AuthZ transaction against the AS in the in-app browser.
   *
   * In iOS it will use `SFSafariViewController` and in Android Chrome Custom Tabs.
   *
   * To learn more about how to customize the authorize call, check the Universal Login Page
   * article at https://auth0.com/docs/hosted-pages/login
   *
   * @param {Object} parameters options to send
   * @param {String} [options.audience] identifier of Resource Server (RS) to be included as audience (aud claim) of the issued access token
   * @param {String} [options.scope] scopes requested for the issued tokens. e.g. `openid profile`
   * @returns {Future}
   * [ref link]: https://auth0.com/docs/api/authentication#authorize-client
   *
   * @memberof WebAuth
   */
  Future<Map> authorize(dynamic options) async {
    return await auth0Channel
        .invokeMethod('parameters')
        .then((dynamic params) async {
      var redirectUri = await callbackUri(this.domain);

      dynamic tmpParams = Map.from(options)
        ..addAll({
          'clientId': this.clientId,
          'responseType': 'code',
          'redirectUri': redirectUri,
        });

      dynamic query = Map.from(options)
        // ..addAll({'protocol': 'oauth2'})
        ..addAll(params);
      var authorizeUrl = this.client.authorizeUrl(query, tmpParams);

      //var tmpUrl =
      //  "https://auth.mantu.com/login?state=g6Fo2SBGdE43Mm9DNUprSER0ZlY4SVRrT3A4NDFESGJPZ2xIQ6N0aWTZIGhZY2kyNFZMYzBjaXBpZmFkd1VxQXl2U2lwbHVMVkJvo2NpZNkgRHN1ZnZ3dzRXUkY5WE9VNFBOdkFkanNwcE5EaHZCZkw&client_id=Dsufvww4WRF9XOU4PNvAdjsppNDhvBfL&protocol=oauth2&response_type=code&nonce=LlSiS_EM_7xIypnKowQtCg&code_challenge=85tgJ-g00E7zWXILDCS83R3p15EH5J6UTV27j4WoB0k&code_challenge_method=S256&scope=openid%20profile%20email&redirect_uri=com.mantu.techshareapp%3A%2F%2Fauth.mantu.com%2Fandroid%2Fcom.mantu.techshareapp%2Fcallback&auth0Client=eyJuYW1lIjoib2lkYy1uZXQiLCJ2ZXJzaW9uIjoiMy4xLjAiLCJlbnYiOnsicGxhdGZvcm0iOiJ4YW1hcmluLWFuZHJvaWQifX0%3D";
      return await auth0Channel
          .invokeMethod('authorize', authorizeUrl)
          .then((accessToken) async {
        return await this.client.exchange({
          'code': accessToken,
          'verifier': params['verifier'],
          'redirectUri': redirectUri
        });
      });
    });
  }

  /*
   *  Removes Auth0 session and optionally remove the Identity Provider session.
   *
   *  In iOS it will use `SFSafariViewController` and in Android Chrome Custom Tabs.
   *
   * @param {Object} parameters parameters to send
   * @param {Bool} federated Optionally remove the IdP session.
   * @returns {Future}
   * [ref link]: https://auth0.com/docs/logout
   *
   * @memberof WebAuth
   */
  clearSession({bool federated = false}) async {
    var payload = Map.from({
      'clientId': this.clientId,
      'returnTo': await callbackUri(this.domain)
    });

    if (federated) {
      payload['federated'] = federated.toString();
    }

    var logoutUrl = this.client.logoutUrl(payload);
    return auth0Channel.invokeMethod('authorize', logoutUrl);
  }
}
