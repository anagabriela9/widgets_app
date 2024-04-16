import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';
  
  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();
    
    final snackbar = SnackBar(
      content: const Text('Holaaaaa'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar( snackbar );
  }

// BUILDER QUIERE DECIR QUE SE VA A CONSTRUIR EN TIEMPO DE EJECUCIÓN

  void openDialog( BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
      title: const Text('¿Estás seguro?'),
      content: const Text('Qui dolore voluptate sint sint labore Lorem. Tempor dolore laborum aliqua excepteur qui anim. Quis exercitation laboris sint exercitation aute veniam nisi ad quis nostrud anim ad. Aliquip ex culpa officia esse cillum ipsum excepteur. Excepteur exercitation nisi est voluptate excepteur dolore laboris aute sunt non officia id dolor.'),
      actions: [
        TextButton(onPressed: () => context.pop() , child: const Text('Cancelar')),
        FilledButton(onPressed: () => context.pop() , child: const Text('Aceptar')),
      ],
      ),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Lorem ipsum dolor sit amet, consectetur adipiscing.Velit dolor aliquip officia veniam anim do eiusmod aute est. Pariatur enim excepteur proident incididunt velit voluptate incididunt aliqua adipisicing reprehenderit laboris anim magna officia. Deserunt consectetur consectetur consequat deserunt adipisicing. Do do est enim sunt occaecat pariatur et.')
                  ]);

              }, child: const Text('Licencias usadas')),

            FilledButton.tonal(
              onPressed: () => openDialog(context), child: const Text('Mostrar diálogo'))
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar Snackbar'),
        onPressed: () => showCustomSnackbar(context), // necesita el buildcontext
      ),
    );
  }
}