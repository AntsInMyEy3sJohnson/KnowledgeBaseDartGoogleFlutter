import 'package:chapter_11_examples/bloc_pattern/demo_page_using_bloc.dart';
import 'package:chapter_11_examples/bloc_pattern/demo_page_using_bloc_listener.dart';
import 'package:chapter_11_examples/passing_state_with_provider/counter_model.dart';
import 'package:chapter_11_examples/passing_state_with_provider/demo_page_using_provider.dart';
import 'package:chapter_11_examples/persisting_state_with_hydrated_bloc/theme_bloc.dart';
import 'package:chapter_11_examples/persisting_state_with_hydrated_bloc/theme_chooser.dart';
import 'package:chapter_11_examples/simple_state_management_with_cubit/counter_cubit.dart';
import 'package:chapter_11_examples/simple_state_management_with_cubit/cubit_demo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // The BlocObserver is very useful in cases where things happening within
  // Blocs need to be logged or analyzed. The BlocObserver passively observes; it
  // cannot interact with any state.
  // The below implies that there is one Observer for all Blocs within the
  // entire app.
  Bloc.observer = GenericObserver();
  await _initHydratedBloc();
  runApp(const MyApp());
}

Future<void> _initHydratedBloc() async {
  // Necessary for storing state with HydratedBloc
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Note to self: MUST NOT FORGET 'CONST' CONSTRUCTOR!
      // home: const DemoPage(),
      // home: const ProviderHome(),
      // home: const BlocHome(),
      // home: const BlocWithListenerHome(),
      // home: const ThemeBlocHome(),
      home: const CounterCubitHome(),
    );
  }
}

class CounterCubitHome extends StatelessWidget {
  const CounterCubitHome();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (_) => CounterCubit(),
      child: const CubitDemoPage(),
    );
  }
}

class ThemeBlocHome extends StatelessWidget {
  const ThemeBlocHome();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: const ThemeChooser(),
    );
  }
}

class BlocWithListenerHome extends StatelessWidget {
  const BlocWithListenerHome();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBlocWithEventEnum>(
      create: (_) => CounterBlocWithEventEnum(),
      child: const DemoPageUsingBlocListener(),
    );
  }
}

class BlocHome extends StatelessWidget {
  const BlocHome();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CounterBlocWithEventEnum>(
            create: (_) => CounterBlocWithEventEnum()),
        BlocProvider<CounterBlocWithEventClass>(
            create: (_) => CounterBlocWithEventClass()),
      ],
      child: const DemoPageUsingBloc(),
    );
  }
}

class ProviderHome extends StatelessWidget {
  const ProviderHome();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      // By doing this, 'DemoPageUsingProvider' becomes a
      // listener to the invocations of 'notifyListeners()'
      // within the model class
      child: const DemoPageUsingProvider(),
    );
  }
}
