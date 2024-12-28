import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedgates_task/core/di/service_locator.dart';
import 'package:linkedgates_task/features/home/presentation/controllers/get%20products%20cubit/get_products_cubit.dart';
import 'package:linkedgates_task/features/home/presentation/controllers/get%20products%20cubit/get_products_states.dart';
import 'package:linkedgates_task/features/home/presentation/widgets/desktop_layout.dart';
import 'package:linkedgates_task/features/home/presentation/widgets/mobile_layout.dart';
import 'package:linkedgates_task/features/home/presentation/widgets/skeletonizer_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> handleRefresh(BuildContext context) async {
    await BlocProvider.of<GetProductsCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => sl<GetProductsCubit>(),
        child: BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, state) {
            if (state is GetProductsLoading) {
              return RefreshIndicator(
                onRefresh: () => handleRefresh(context),
                child: ListView.separated(
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    return SkeletonizerHolder();
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 15),
                  itemCount: 10,
                ),
              );
            }
            if (state is GetProductsOnFailure) {
              return RefreshIndicator(
                onRefresh: () => handleRefresh(context),
                child: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.message,
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            IconButton(
                              onPressed: () {
                                handleRefresh(context);
                              },
                              icon: Icon(Icons.refresh),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is GetProductsOnSuccess) {
              return RefreshIndicator(
                onRefresh: () => handleRefresh(context),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    bool isWideScreen = constraints.maxWidth > 750;

                    if (isWideScreen) {
                      return DesktopLayout(
                        state: state,
                      );
                    } else {
                      return MobileLayout(
                        state: state,
                      );
                    }
                  },
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () => handleRefresh(context),
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: const Center(
                      child: Text('Unexpected state, please try again later.'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
