import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'enter your name',
                  labelText: 'name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'enter your password',
                  labelText: 'password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  print(nameController.text);
                  print(passwordController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Home Screen'),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            textColor: Colors.white,
            color: Colors.blue,
            child: const Text('Back'),
          ),
        ],
      )),
    );
  }
}
