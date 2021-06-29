import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/user_bloc.dart';
import 'package:flutter_app/src/model/users_response.dart';
import 'package:flutter_app/src/screens/home/user_item.dart';
import 'package:flutter_app/src/theme/color.dart';
import 'package:flutter_app/src/utils/connectivity_checker.dart';
import 'package:flutter_app/src/utils/strings.dart';
import 'package:flutter_app/src/widget/loading/loader.dart';
import 'package:flutter_app/src/widget/text/text_bold.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserBloc _userBloc = UserBloc();
  ScrollController _controller = ScrollController();
  final _scrollThreshold = 100.0;
  List<UsersResponse> listResponse = [];
  int page = 1;
  bool isPageLoad = false;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    fetchUsers(page);
    observeUserData();
    loadMoreData();
  }

  observeUserData() {
    _userBloc.users.listen((listUsers) {
      if (listUsers != null) {
        listResponse.addAll(listUsers);
      } else {
        isLastPage = true;
      }
      isPageLoad = true;
      setState(() {});
    });
  }

  loadMoreData() async {
    if (await ConnectivityChecker.isConnectionAvailable()) {
      _controller?.addListener(() {
        final maxScroll = _controller.position.maxScrollExtent;
        final currentScroll = _controller.position.pixels;
        if (maxScroll - currentScroll <= _scrollThreshold && isPageLoad) {
          isPageLoad = false;
          if (!isLastPage) {
            page++;
            fetchUsers(page);
          }
        }
      });
    }
  }

  fetchUsers(int page) {
    _userBloc.fetchUsers(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color_FFFFFF,
      appBar: AppBar(
        title: Text(Strings.homeAppBarTitle),
      ),
      body: SafeArea(
        child: Container(
          child: RefreshIndicator(
            onRefresh: () {
              page = 1;
              return _userBloc.fetchUsers(page);
            },
            child: ListView.builder(
              controller: _controller,
              itemBuilder: (context, index) {
                if (index == (listResponse.length)) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: getProgressLoading(),
                  );
                } else {
                  return UserItem(listResponse[index]);
                }
              },
              itemCount: listResponse.length + 1,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userBloc.dispose();
    super.dispose();
  }

  getProgressLoading() {
    if (isLastPage) {
      return SizedBox(
        height: 24,
      );
    } else {
      return Loader(
        margin: const EdgeInsets.only(top: 24, bottom: 24),
      );
    }
  }
}
