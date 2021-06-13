import 'package:blocpattern/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SecondScreen extends StatefulWidget {
  SecondScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {


 

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
              Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state.wasIncremented == true) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Incremented"),
              duration: Duration(microseconds: 300),
            ));
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("DEcremented"),
              duration: Duration(microseconds: 300),
            ));
          }
                },
                builder: (context, state) {
                  return BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(
                        state.counterValue.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
