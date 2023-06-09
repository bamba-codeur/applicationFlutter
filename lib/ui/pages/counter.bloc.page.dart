

import 'package:app1/bloc/counter.bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget{
  const CounterBlocPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Bloc"),

      ),
      body: Center(
        child: BlocBuilder<CounterBloc,CounterState>(

          builder: (context,state){
            if(state is CounterSuccessState || state is CounterInitialState){
              return Text(
                "Counter Value => ${state.counter}",
                style: Theme.of(context).textTheme.headline5,
              );
            }else if(state is CounterErrorState){
              return Column(
                children:[
                Text(
                "Counter Value => {$state.counter}",
                style: Theme.of(context).textTheme.headline5,
              ),
                Text(
                state.errorMsg,
                style: Theme.of(context).textTheme.headline6,
              ),
                ]
              );
            }else{
              return Container();
            }
          },
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            heroTag: "dec",
            onPressed: (){
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
          child: Icon(Icons.remove),

          ),
          SizedBox(width: 6,),
          FloatingActionButton(
            heroTag: "inc",
            onPressed: (){
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
          child: Icon(Icons.add),

          ),
        ]
      ),

    );
  }

}
