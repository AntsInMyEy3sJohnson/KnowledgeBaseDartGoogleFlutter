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

// Short summary of best practices about state management...
// ... using Provider
// * Use 'Consumer<T>' wherever possible because it enables rebuilding only the
// widgets that actually require a rebuild.
// * 'Provider.of<T>(context)' should be avoided inside 'build()' methods as it will
// rebuild all of the widget's children, even those that don't need to be rebuilt.
// * Making use of 'MultiProvider' is a good means to make code more readable in
// case multiple providers are to be used within and below the same widget.
// * Prefer using extensions methods introduced by Provider to the 'BuildContext'
// class (for example: 'context.watch<T>()') over the more elaborate static methods
// on the Provider class.
// ... using BLoC
// * Use 'context.bloc<T>()' rather than 'BlocProvider.of<T>(context)' (so, again,
// prefer using extension methods)
// * A 'BlocBuilder<T>()' should contain only the widgets that actually need to
// rebuild in order to respond to some change.
// * Make use of 'BlocConsumer<B, S>' instead of nesting 'BlocBuilder' and
// 'BlocListener'.
// * 'ReplayBloc' or 'ReplayBlocMixin' are a great option to introduce undo and
// redo actions to the app's blocs.
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

// Some best practices for using BLoC:
// * Nesting a 'BlocBuilder' inside a 'BlocListener' is not a problem, it's just a
// lot of code to write. Therefore, if one needs to rebuild the UI and listen to
// state changes, one will be better of using a 'BlocConsumer'. In all other cases,
// making use of 'BlocBuilder' and 'BlocListener' is absolutely fine.
// * The content of a bloc's child should be moved to a separate widget so there's
// a chance to initialize the child widget using a 'const' constructor.
// * Use a 'MultiBlocProvider' if more than one bloc is required within the same
// widget.
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
