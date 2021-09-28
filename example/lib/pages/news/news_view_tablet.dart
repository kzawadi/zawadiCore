import 'package:designsys/designsys.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zawadi_design/pages/news/view_model.dart/news_viewmodel.dart';

class NewsViewTablet extends StatelessWidget {
  const NewsViewTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsViewModel>.reactive(
      onModelReady: (model) => model.futureToRun,
      viewModelBuilder: () => NewsViewModel(),
      builder: (context, model, child) => ZawadiScaffold(
        appBar: AppBar(
          title: Text(
            "Tablet View",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: model.isBusy
              ? Loading()
              : Text(
                  model.dataReady ? model.data!.first.content! : "NO DATA YET"),
        ),
      ),
    );
  }
}
