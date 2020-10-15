import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_completed_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_in_progress_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_pending_jobs_model.dart';
import 'package:bonyeza_kazi/src/presentation/favourites_page/my_favourites_page.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class JobsPendingDetailsPage extends StatelessWidget {
  const JobsPendingDetailsPage(
      {Key key, @required this.title, @required this.listPendingJobs})
      : super(key: key);
  final String title;
  final List<PendingJob> listPendingJobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Txt(this.title, style: kAppBarTxtStyle),
          centerTitle: true,
          backgroundColor: kBlueBackgroundColor,
          elevation: 10.h,
        ),
        body: listPendingJobs.length != 0
            ? ListView.builder(
                itemCount: listPendingJobs.length,
                itemBuilder: (context, index) {
                  final pendingJob = listPendingJobs[index];
                  return ListTile(
                    title: Text(
                      pendingJob.workTitle,
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(pendingJob.location,
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.black54)),
                  );
                })
            : NoJobsFound(typeOfJob: 'pending jobs'));
  }
}

class JobsInProgressDetailsPage extends StatelessWidget {
  const JobsInProgressDetailsPage(
      {Key key, @required this.title, @required this.inProgressJobs})
      : super(key: key);
  final String title;
  final List<InProgressJob> inProgressJobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Txt(this.title, style: kAppBarTxtStyle),
        centerTitle: true,
        backgroundColor: kBlueBackgroundColor,
        elevation: 10.h,
      ),
      body: inProgressJobs.length != 0
          ? ListView.builder(
              itemCount: inProgressJobs.length,
              itemBuilder: (context, index) {
                final inProgressJob = inProgressJobs[index];
                return ListTile(
                  title: Text(
                    inProgressJob.workTitle,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(inProgressJob.location,
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54)),
                );
              },
            )
          : NoJobsFound(typeOfJob: 'jobs in progress'),
    );
  }
}

class JobsCompletedDetailsPage extends StatelessWidget {
  const JobsCompletedDetailsPage(
      {Key key, @required this.title, @required this.completedJobs})
      : super(key: key);
  final String title;
  final List<CompletedJob> completedJobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Txt(this.title, style: kAppBarTxtStyle),
          centerTitle: true,
          backgroundColor: kBlueBackgroundColor,
          elevation: 3.h,
        ),
        body: completedJobs.length != 0
            ? ListView.builder(
                itemCount: completedJobs.length,
                itemBuilder: (context, index) {
                  final completedJob = completedJobs[index];
                  return ListTile(
                    title: Text(
                      completedJob.workTitle,
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(completedJob.location,
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.black54)),
                  );
                })
            : NoJobsFound(typeOfJob: 'jobs completed'));
  }
}

class NoJobsFound extends StatelessWidget {
  const NoJobsFound({Key key, @required this.typeOfJob}) : super(key: key);
  final String typeOfJob;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(LineAwesomeIcons.dropbox, size: 200.sp, color: Color(0xFFA8AEC0)),
        Txt(
          'No $typeOfJob found!',
          style: TxtStyle()
            ..textAlign.center()
            ..fontFamily('Avenir')
            ..fontWeight(FontWeight.w800)
            ..fontSize(27.sp)
            ..textColor(
              Color(0xFF7F869A),
            ),
        ),
      ],
    ));
  }
}
