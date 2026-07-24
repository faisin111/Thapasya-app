enum Role { student, teacher }

class AuthState {
  final bool loading;
  final bool success;
  final String? error;
  final Role role;

  AuthState({
    this.loading = false,
    this.success = false,
    this.error,
    this.role = Role.student,
  });

  AuthState copyWithin({
    bool? loading,
    bool? success,
    String? error,
    Role? role,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      success: success ?? this.success,
      error: error ?? this.error,
      role: role ?? this.role,
    );
  }
}
