import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 5,
                    child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Já tem cadastro?",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Faça seu login e make the change_",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    Expanded(flex: 2, child: Text("Informe seu email:")),
                    Expanded(flex: 3, child: Text("Email")),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    Expanded(flex: 2, child: Text("Informe sua senha:")),
                    Expanded(flex: 3, child: Text("Senha")),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 151, 67, 225))),
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                  )),
              Expanded(child: Container()),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                alignment: Alignment.center,
                child: const Text(
                  "Esqueci minha senha",
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                alignment: Alignment.center,
                child: const Text(
                  "Criar conta",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ));
  }
}