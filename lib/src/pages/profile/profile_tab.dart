import 'package:curso_flutter_greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:curso_flutter_greengrocer/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuario'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            readOnly: true,
            icon: Icons.email,
            label: 'Email',
            initialValue: appData.user.email,
          ),
          CustomTextField(
            readOnly: true,
            icon: Icons.person,
            label: 'Nome',
            initialValue: appData.user.name,
          ),
          CustomTextField(
            readOnly: true,
            icon: Icons.phone,
            label: 'Celular',
            initialValue: appData.user.phone,
          ),
          CustomTextField(
            readOnly: true,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
            initialValue: appData.user.cpf,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text('Atualizar senha'),
            ),
          )
        ],
      ),
    );
  }

  updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Atualização de Senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock,
                      label: 'Senha atual',
                    ),
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock_outlined,
                      label: 'Nova senha',
                    ),
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock_outline,
                      label: 'Confirmar nova senha',
                    ),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Atualizar'),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
