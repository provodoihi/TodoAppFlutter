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
                  if (index == 0) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          color: Colors.lightBlueAccent,
                          child: const Text(
                            "Singapore Forecast",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          color: Colors.greenAccent,
                          child: Text(
                            "Day ${state.weather.forecast[index].day}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        _card(
                          state.weather.forecast[0].temperature,
                          state.weather.description,
                          state.weather.forecast[0].wind,
                        ),
                      ],
                    );
                  }
                  return _card(
                    state.weather.forecast[index].temperature,
                    state.weather.description,
                    state.weather.forecast[index].wind,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      color: Colors.greenAccent,
                      child: Text(
                        "Day ${int.parse(state.weather.forecast[index].day)+1}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.weather.forecast.length,
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
        trailing: Text("Wind: $wind" ?? "Wind Speed Here"),
      ),
    );
  }
}
