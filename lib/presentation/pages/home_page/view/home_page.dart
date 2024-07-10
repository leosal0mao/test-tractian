import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tractian/dependency_injection.dart';
import 'package:test_tractian/domain/usecases/get_all_companies.dart';
import 'package:test_tractian/presentation/constants/colors.dart';
import 'package:test_tractian/presentation/widgets/company_button.dart';

import '../bloc/home_page_bloc.dart';

//PAGE
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeBloc = getIt.get<HomePageBloc>();

  @override
  void initState() {
    homeBloc.add(const GetCompaniesEvent());
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageBloc(
        getAllCompanies: context.read<GetAllCompanies>(),
      )..add(const GetCompaniesEvent()),
      child: HomeContent(homeBloc: homeBloc),
    );
  }
}

//VIEW
class HomeContent extends StatelessWidget {
  final HomePageBloc homeBloc;
  const HomeContent({super.key, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    var status = homeBloc.state.status;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deepBlue,
        title:
            Text('TRACTIAN', style: TextStyle(color: AppColors.whiteTextColor)),
        centerTitle: true,
      ),
      body: status == HomePageStatus.initial
          ? const Center(child: CircularProgressIndicator())
          : _Content(homeBloc: homeBloc),
    );
  }
}

//CONTENT
class _Content extends StatefulWidget {
  final HomePageBloc homeBloc;
  const _Content({required this.homeBloc});

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    var companyList = widget.homeBloc.state.companies;

    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 30),
        padding:
            const EdgeInsets.only(top: 32, bottom: 32, left: 24, right: 24),
        itemCount: companyList.length,
        itemBuilder: (BuildContext context, int i) {
          return CompanyButton(
            text: companyList[i].name!,
            onPressed: () {
              print(companyList[i].id);
            },
          );
        });
  }
}
