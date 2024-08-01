import 'package:appointment_app/new_features/screen/admin_panel/appointment/tabs/approved_tab/admin_approved_tab.dart';
import 'package:appointment_app/new_features/screen/admin_panel/appointment/tabs/cancelled_tab/admin_cancelled_tab.dart';
import 'package:appointment_app/new_features/screen/admin_panel/appointment/tabs/completed_tabs/admin_completed_tab.dart';
import 'package:appointment_app/new_features/screen/admin_panel/appointment/tabs/expired_tabs/admin_expired_tab.dart';
import 'package:appointment_app/new_features/screen/admin_panel/appointment/tabs/request_tab/admin_request_tab.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../widget/admin_chat/admin_custom_chat_button.dart';
import '../widget/appbar/admin_custom_app_bar.dart';

class AdminPanelHomeScreen extends StatefulWidget {
  const AdminPanelHomeScreen({super.key});

  @override
  State<AdminPanelHomeScreen> createState() => _AdminPanelHomeScreenState();
}

class _AdminPanelHomeScreenState extends State<AdminPanelHomeScreen> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: TColors.secondary,
        appBar: AdminCustomAppBar(
          backgroundColor: TColors.light,
          showBackgroundColor: false,
          showIcon: true,
          isDrawer: true,
          isNotification: true,
          isEdit: false,
          title: Text(
            'Appointments',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          isCenterTitle: true,
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(TColors.primary),
                ),
              )
            : Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: TColors.light,
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.shade400, width: 1))),
                    padding: const EdgeInsets.only(bottom: 10),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(25)),
                      child: TabBar(
                        labelPadding: EdgeInsets.zero,
                        dividerHeight: 0,
                        padding: EdgeInsets.zero,
                        indicatorPadding:
                            const EdgeInsets.symmetric(horizontal: -20),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: TColors.primary.withOpacity(0.5),
                        ),
                        unselectedLabelColor: TColors.black,
                        splashBorderRadius: BorderRadius.circular(25),
                        labelColor: Colors.white,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(fontSizeDelta: -3),
                        isScrollable: false,
                        tabs: const [
                          Tab(
                            child: Text('Requests'),
                          ),
                          Tab(
                            child: Text('Approved'),
                          ),
                          Tab(
                            child: Text('Completed'),
                          ),
                          Tab(
                            child: Text('Expired'),
                          ),
                          Tab(
                            child: Text('Cancelled'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        /// -- 1st tab
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: AdminRequestTab(),
                          ),
                        ),

                        /// -- 2nd tab
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: AdminApprovedTab(),
                          ),
                        ),

                        /// -- 3rd tab
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: AdminCompletedTab(),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: AdminExpiredTab(),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: AdminCancelledTab(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        floatingActionButton: const AdminCustomChatButton(),
      ),
    );
  }
}
