import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/locator.dart';
import 'core/firebase/setup_firebase.dart';
import 'features/app/presentation/app.dart';
import 'features/app/presentation/app_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupFirebase();
  await locator.initLocator();

  runApp(
    BlocProvider<AppBloc>(
      create: (context) => locator.get(),
      child: const App(),
    ),
  );
}
