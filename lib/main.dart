import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/di/di.dart';
import 'core/firebase/setup_firebase.dart';
import 'features/app/presentation/app.dart';
import 'features/app/presentation/bloc/app_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupFirebase();
  await GetIt.I.initDi(await SharedPreferences.getInstance());

  runApp(
    BlocProvider<AppBloc>(
      create: (context) => GetIt.I<AppBloc>(),
      child: const App(),
    ),
  );
}
