import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  // It's good practice to add a const constructor for widgets
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  // Form key for validation (optional but good practice)
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final _fullNameController = TextEditingController();
  final _policyNumberController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  // Checkbox states
  bool _agreeToTerms = false;
  bool _subscribeToNewsletter = false;
  bool _allowDataProcessing = false; // Example: Personal data processing consent

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    _fullNameController.dispose();
    _policyNumberController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    // Basic validation example
    if (_formKey.currentState?.validate() ?? false) {
      if (!_agreeToTerms) {
        // Show a snackbar or dialog if terms are not agreed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(
              'Пожалуйста, согласитесь с условиями использования')),
        );
        return;
      }
      if (!_allowDataProcessing) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(
              'Пожалуйста, дайте согласие на обработку персональных данных')),
        );
        return;
      }

      // If all checks pass, proceed with registration logic
      String fullName = _fullNameController.text;
      String policyNumber = _policyNumberController.text;
      String phoneNumber = _phoneNumberController.text;
      String password = _passwordController.text;

      print('Регистрация...');
      print('ФИО: $fullName');
      print('Номер полиса: $policyNumber');
      print('Телефон: $phoneNumber');
      print('Пароль: $password');
      print('Согласен с условиями: $_agreeToTerms');
      print('Подписаться на новости: $_subscribeToNewsletter');
      print('Согласие на обработку данных: $_allowDataProcessing');

      // Here you would typically send data to a backend, navigate to another screen, etc.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Регистрация успешно начата!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: RichText(
            text: const TextSpan(
              text: 'Гор', // Gor
              style: TextStyle(
                color: Colors.green, // Adjusted color for GorZdrav
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Здрав', // Zdrav
                  style: TextStyle(
                    color: Colors.blue, // Adjusted color
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        // backgroundColor: Colors.white, // Optional: if you want a white app bar
        // elevation: 1, // Optional: add a slight shadow
      ),
      body: SingleChildScrollView( // Added for scrollability if content overflows
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // Make button full width
            children: [
              const Text(
                'Регистрация в ГорЗдрав',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ФИО полностью',
                  hintText: 'Иванов Иван Иванович',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value
                      .trim()
                      .isEmpty) {
                    return 'Пожалуйста, введите ваше ФИО';
                  }
                  if (value
                      .trim()
                      .split(' ')
                      .length < 2) {
                    return 'Пожалуйста, введите хотя бы имя и фамилию';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _policyNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Номер полиса ОМС',
                  hintText: '16-значный номер',
                  prefixIcon: Icon(Icons.medical_services_outlined),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите номер полиса';
                  }
                  // Add more specific validation for policy number if needed
                  if (value
                      .replaceAll(RegExp(r'[^0-9]'), '')
                      .length != 16) {
                    return 'Номер полиса должен состоять из 16 цифр';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Номер телефона',
                  hintText: '+7 (XXX) XXX-XX-XX',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите номер телефона';
                  }
                  // Basic phone validation (can be more complex)
                  if (!RegExp(r'^\+?[0-9\s\(\)-]{10,}$').hasMatch(value)) {
                    return 'Введите корректный номер телефона';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Пароль',
                  hintText: 'Не менее 8 символов',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                obscureText: true, // Hides password input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, придумайте пароль';
                  }
                  if (value.length < 8) {
                    return 'Пароль должен быть не менее 8 символов';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // --- Checkboxes ---
              CheckboxListTile(
                title: const Text(
                    'Я согласен(на) с условиями использования сервиса'),
                value: _agreeToTerms,
                onChanged: (bool? newValue) {
                  setState(() {
                    _agreeToTerms = newValue ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                // Checkbox on the left
                activeColor: Colors.blue,
                contentPadding: EdgeInsets.zero, // Remove default padding
              ),
              CheckboxListTile(
                title: const Text(
                    'Я даю согласие на обработку моих персональных данных'),
                value: _allowDataProcessing,
                onChanged: (bool? newValue) {
                  setState(() {
                    _allowDataProcessing = newValue ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                title: const Text(
                    'Подписаться на новостную рассылку и уведомления'),
                value: _subscribeToNewsletter,
                onChanged: (bool? newValue) {
                  setState(() {
                    _subscribeToNewsletter = newValue ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 30),
              ElevatedButton( // Changed from TextButton for better visual hierarchy
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Зарегистрироваться'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}