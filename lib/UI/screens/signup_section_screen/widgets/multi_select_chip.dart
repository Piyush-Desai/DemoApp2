import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demoapp/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:demoapp/infrastructure/commons/constants/color_constants.dart';
import 'package:demoapp/infrastructure/models/responses/interest_field_list_model.dart';

class MultiSelectBottomSheet extends StatefulWidget {
  final controller;

  final Function(bool)? onSelected;

  const MultiSelectBottomSheet(
      {Key? key, this.onSelected, required this.controller})
      : super(key: key);

  @override
  _MultiSelectBottomSheetState createState() => _MultiSelectBottomSheetState();
}

class _MultiSelectBottomSheetState extends State<MultiSelectBottomSheet> {
  RxList<InterestFieldList> interestFieldDataModelList =
      <InterestFieldList>[].obs;

  @override
  void initState() {
    // TODO: implement initState
    interestFieldDataModelList.value =
        widget.controller.interestFieldDataModelList.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        color: ColorConstants.textFormFieldBorderColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close)),
              HeadlineBodyOneBaseWidget(
                title: "select_categories".tr,
                maxline: 1,
                fontWeight: FontWeight.w500,
                textOverflow: TextOverflow.ellipsis,
                fontSize: 14,
              ),
              InkWell(
                onTap: () {
                  widget.controller.idInterestFieldList.clear();
                  widget.controller.interestFieldList.clear();
                  widget.controller.addSelectedInterestFieldValue(
                      interestFieldDataModelList);
                  Get.back();
                },
                child: HeadlineBodyOneBaseWidget(
                    title: "done".tr,
                    maxline: 1,
                    fontWeight: FontWeight.w500,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: 14),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              primary: true,
              shrinkWrap: true,
              children: [
                Obx(
                  () => Wrap(
                    children: buildChoiceList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildChoiceList() {
    List<Widget> choices = <Widget>[];
    for (var item in interestFieldDataModelList.value) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          backgroundColor:
              item.isSelected ?? false ? ColorConstants.blueColor : null,
          label: Text(
            widget.controller.getInterestFieldName(interestFieldList: item.obs),
            //item.name!,
            maxLines: 2,
            style: const TextStyle(color: ColorConstants.blackTextColor),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          selected: item.isSelected ?? false,
          onSelected: (selected) {
            widget.controller.setSelectedItem(item: item);
            interestFieldDataModelList.refresh();
          },
        ),
      ));
    }
    return choices;
  }
}
