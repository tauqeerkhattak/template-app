import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/ui/common/theme_bloc/theme_bloc.dart';
import 'package:template_app/ui/common/theme_bloc/theme_events.dart';
import 'package:template_app/ui/common/widgets/error_view.dart';
import 'package:template_app/ui/common/widgets/loader.dart';
import 'package:template_app/ui/pages/home/bloc/home_bloc.dart';
import 'package:template_app/ui/pages/home/bloc/home_events.dart';
import 'package:template_app/ui/pages/home/bloc/home_states.dart';
import 'package:template_app/utils/theme_utils.dart';

import '../../../models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HomeBloc>(context).add(
        GetProductsHomeEvent(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildThemeButton(context),
      appBar: AppBar(
        title: Text(
          'Home page',
          style: AppTheme.text(context).titleMedium,
        ),
      ),
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildThemeButton(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, value) {
        return FloatingActionButton.extended(
          onPressed: () {},
          label: Row(
            children: [
              Text(
                'Dark Mode',
                style: AppTheme.text(context).titleMedium,
              ),
              const SizedBox(
                width: 10,
              ),
              Switch(
                value: value == ThemeMode.dark,
                onChanged: (value) {
                  if (value) {
                    BlocProvider.of<ThemeBloc>(context).add(
                      ChangeThemeEvent(ThemeMode.dark),
                    );
                  } else {
                    BlocProvider.of<ThemeBloc>(context).add(
                      ChangeThemeEvent(ThemeMode.light),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: BlocProvider.of<HomeBloc>(context),
      builder: (context, state) {
        if (state is LoadingHomeState) {
          return const Loader();
        } else if (state is ErrorHomeState) {
          return ErrorView(
            error: state.message,
            onReload: () => BlocProvider.of<HomeBloc>(context).add(
              GetProductsHomeEvent(),
            ),
          );
        } else if (state is SuccessHomeState) {
          return _buildProducts(state.products);
        } else {
          return const Loader();
        }
      },
    );
  }

  Widget _buildProducts(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          child: ListTile(
            leading: Image.network(
              product.image,
              width: 60,
              height: 60,
            ),
            title: Text(
              product.title,
            ),
            subtitle: Text(
              product.category,
            ),
          ),
        );
      },
    );
  }
}
