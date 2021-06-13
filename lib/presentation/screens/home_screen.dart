import 'package:blocpattern/constants/enums.dart';
import 'package:blocpattern/logic/cubit/counter_cubit.dart';
import 'package:blocpattern/logic/cubit/internet_cubit.dart';
import 'package:blocpattern/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);
  final String title;
  final String color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text("Wifi");
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text("Mobile");
                } else if (state is InternetDisconnected) {
                  return Text("Disconnected");
                }
                return CircularProgressIndicator();
              }),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Incremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Decremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'BRR, NEGATIVE ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue % 2 == 0) {
                    return Text(
                      'YAAAY ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue == 5) {
                    return Text(
                      'HMM, NUMBER 5',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                },
              )
            ],
          ),
        ));
  }
}

// Text(
//   'You have pushed the button this many times:',
// ),
// BlocConsumer<CounterCubit, CounterState>(
//   listener: (context, state) {
//     // TODO: implement listener
//     if (state.wasIncremented == true) {
//       Scaffold.of(context).showSnackBar(SnackBar(
//         content: Text("Incremented"),
//         duration: Duration(microseconds: 300),
//       ));
//     } else {
//       Scaffold.of(context).showSnackBar(SnackBar(
//         content: Text("DEcremented"),
//         duration: Duration(microseconds: 300),
//       ));
//     }
//   },
//   builder: (context, state) {
//     return BlocBuilder<CounterCubit, CounterState>(
//       builder: (context, state) {
//         return Text(
//           state.counterValue.toString(),
//           style: Theme.of(context).textTheme.headline4,
//         );
//       },
//     );
//   },
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     FloatingActionButton(
//       onPressed: () {
//         BlocProvider.of<CounterCubit>(context).decrement();
//       },
//       tooltip: 'Decrement',
//       child: Icon(Icons.remove),
//     ),
//     FloatingActionButton(
//       onPressed: () {
//         BlocProvider.of<CounterCubit>(context).increment();
//       },
//       tooltip: 'Increment',
//       child: Icon(Icons.add),
//     ),
//   ],
// ),
// MaterialButton(
//     onPressed: () => Navigator.pushNamed(context, '/second'),
//     child: Text("Second")),
// MaterialButton(
//     onPressed: () => Navigator.pushNamed(context, '/third'),
//     child: Text("Third"))
