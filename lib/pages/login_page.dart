import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '/stores/login_store.dart';
import '/app_theme.dart';
import 'base_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get<LoginStore>();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _onForgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Em desenvolvimento')),
    );
  }

  void _navigateToUserList() => Modular.to.navigate('user_list');
  void _navigateToJson() => Modular.to.navigate('/user_json');
  void _navigateToJsonFailure() => Modular.to.navigate('/user_json_failure');

  @override
  Widget build(BuildContext context) {
    return BasePage(
      applyBackground: true,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Login',
                    style: AppTheme.displayLarge,
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Observer(builder: (_) {
                          return TextField(
                            onChanged: store.setEmail,
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _emailFocus,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.2),
                              hintText: 'Digite seu email corporativo',
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(Icons.email_outlined, color: Colors.white),
                              suffixIcon: store.email.isEmpty
                                  ? null
                                  : (store.isEmailValid
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : const Icon(Icons.error, color: Colors.red)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 16),
                        Observer(builder: (_) {
                          return TextField(
                            onChanged: store.setPassword,
                            obscureText: !store.passwordVisible,
                            focusNode: _passwordFocus,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.2),
                              hintText: 'Sua senha secreta',
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(Icons.lock_outlined, color: Colors.white),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  store.passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                onPressed: store.togglePasswordVisibility,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 24),
                        Observer(builder: (_) {
                          return SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: store.isFormValid && !store.isLoading
                                  ? () async {
                                await store.login();
                              }
                                  : null,
                              style: AppTheme.primaryButtonStyle,
                              child: store.isLoading
                                  ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                                ),
                              )
                                  : const Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: _onForgotPassword,
                          child: Text(
                            'Esqueceu a senha?',
                            style: AppTheme.bodyLarge.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: MediaQuery.of(context).size.height / 2 - 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNavButton(Icons.people_alt, 'Users', _navigateToUserList),
                const SizedBox(height: 16),
                _buildNavButton(Icons.data_object, 'JSON', _navigateToJson),
                const SizedBox(height: 16),
                _buildNavButton(Icons.error_outline, 'JSON Error', _navigateToJsonFailure),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData icon, String tooltip, VoidCallback onPressed) {
    return Tooltip(
      message: tooltip,
      child: FloatingActionButton(
        heroTag: tooltip,
        mini: true,
        backgroundColor: Colors.white.withOpacity(0.2),
        foregroundColor: Colors.white,
        elevation: 0,
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}