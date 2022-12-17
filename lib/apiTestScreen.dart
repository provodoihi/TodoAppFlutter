import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/api_bloc.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiBloc(),
      child: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Api Test"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ApiBloc>().add(ApiCall());
        },
        child: BlocBuilder<ApiBloc, ApiState>(
          builder: (context, state) {
            if (state is ApiInitial) {
              return const Center(
                child: Text("Press Button to get Weather Data"),
              );
            } else if (state is ApiLoad) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ApiLoadSuccess) {
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return _card(
                    state.weather.temperature,
                    state.weather.description,
                    state.weather.wind,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      color: Colors.greenAccent,
                      child: const Text(
                        "Singapore",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 5,
              );
            } else {
              return const Center(
                child: Text("Error getting data"),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ApiBloc>().add(ApiCall());
        },
        child: const Icon(Icons.downloading),
      ),
    );
  }

  Card _card(String? temperature, String? description, String? wind) {
    return Card(
      child: ListTile(
        title: Text(temperature ?? "Temperature Here"),
        subtitle: Text(description ?? "Weather Condition Here"),
        leading: description == "Partly cloudy"
            ? const Icon(Icons.cloud)
            : const Icon(Icons.sunny),
        trailing: Text(wind ?? "Wind Speed Here"),
      ),
    );
  }
}
