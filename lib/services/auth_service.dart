// Simple in-memory AuthService for demo purposes.
// Replace with Firebase/Auth backend for production.

class AuthService {
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();

  // Simple in-memory users storage: email -> {username, password}
  final Map<String, Map<String, String>> _users = {};
  String? _currentEmail;

  void init() {
    // optionally seed a user for testing
    _users.putIfAbsent('test@example.com', () => {
          'username': 'TestUser',
          'password': 'password123',
        });
  }

  Future<bool> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300)); // simulate latency
    if (_users.containsKey(email)) return false;
    _users[email] = {'username': username, 'password': password};
    _currentEmail = email;
    return true;
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final user = _users[email];
    if (user == null) return false;
    if (user['password'] != password) return false;
    _currentEmail = email;
    return true;
  }

  String? getCurrentUsername() {
    if (_currentEmail == null) return null;
    return _users[_currentEmail]?['username'];
  }

  bool get isSignedIn => _currentEmail != null;

  void signOut() {
    _currentEmail = null;
  }
}
