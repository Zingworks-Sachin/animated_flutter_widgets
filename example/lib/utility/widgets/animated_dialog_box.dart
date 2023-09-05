import 'package:animated_flutter_widgets/page_transitions/page_transition_animation.dart';
import 'package:animated_flutter_widgets/enums/enums.dart';
import 'package:example/animation/animated_grid_view.dart';
import 'package:example/animation/animated_list_view.dart';
import 'package:example/utility/color.dart';
import 'package:example/utility/enums.dart';
import 'package:flutter/material.dart';


class AnimatedDialogBox extends StatefulWidget {
  final String title;
  final ListType? listType;
  final TextStyle? titleTextStyle;
  final List<Widget>? actions;

  const AnimatedDialogBox({Key? key, required this.title, this.titleTextStyle, this.listType, this.actions}) : super(key: key);

  @override
  State<AnimatedDialogBox> createState() => _AnimatedDialogBoxState();
}

class _AnimatedDialogBoxState extends State<AnimatedDialogBox> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    /// TODO: implement initState
    super.initState();
    /// Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    /// Create a curved animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    /// Start the animation
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                title: Center(child: Text(widget.title)),
                titleTextStyle: TextStyle(color: ColorUtility.magenta,fontSize: 22,fontWeight: FontWeight.bold),
                alignment: Alignment.center,
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: widget.actions ?? <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtility.magenta
                      ),
                      onPressed: () {
                        if(widget.listType == ListType.listView){
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedListView(scrollWidgetAnimationType:ScrollWidgetAnimationType.bounce)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(scrollWidgetAnimationType:ScrollWidgetAnimationType.bounce)),
                          );
                        }
                      },
                      child: const Text(
                        'Bounce Animation', textAlign: TextAlign.center,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtility.magenta
                      ),
                      onPressed: () {
                        if(widget.listType == ListType.listView){
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedListView(scrollWidgetAnimationType: ScrollWidgetAnimationType.fadeOut)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(scrollWidgetAnimationType: ScrollWidgetAnimationType.fadeOut)),
                          );
                        }
                      },
                      child: const Text(
                        'Fade Out Animation', textAlign: TextAlign.center,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtility.magenta
                      ),
                      onPressed: () {
                        if(widget.listType == ListType.listView){
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedListView(scrollWidgetAnimationType:ScrollWidgetAnimationType.scaleOut)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(scrollWidgetAnimationType:ScrollWidgetAnimationType.scaleOut)),
                          );
                        }
                      },
                      child: const Text(
                        'Scale Out Animation', textAlign: TextAlign.center,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtility.magenta
                      ),
                      onPressed: () {
                        if(widget.listType == ListType.listView){
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedListView(scrollWidgetAnimationType:ScrollWidgetAnimationType.waterFall)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(scrollWidgetAnimationType:ScrollWidgetAnimationType.waterFall)),
                          );
                        }
                      },
                      child: const Text('Water Fall Animation', textAlign: TextAlign.center,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtility.magenta
                      ),
                      onPressed: () {
                        if(widget.listType == ListType.listView){
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedListView(scrollWidgetAnimationType:ScrollWidgetAnimationType.leftScale)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(scrollWidgetAnimationType:ScrollWidgetAnimationType.leftScale)),
                          );
                        }
                      },
                      child: const Text(
                        'Left Scale Animation', textAlign: TextAlign.center,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtility.magenta
                      ),
                      onPressed: () {
                        if(widget.listType == ListType.listView){
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedListView(scrollWidgetAnimationType:ScrollWidgetAnimationType.rightScale)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(scrollWidgetAnimationType:ScrollWidgetAnimationType.rightScale)),
                          );
                        }
                      },
                      child: const Text(
                        'Right Scale Animation', textAlign: TextAlign.center,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtility.magenta
                      ),
                      onPressed: () {
                        if(widget.listType == ListType.listView){
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedListView(scrollWidgetAnimationType:ScrollWidgetAnimationType.listColored)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(scrollWidgetAnimationType:ScrollWidgetAnimationType.listColored)),
                          );
                        }
                      },
                      child: const Text(
                        'List Colored Animation', textAlign: TextAlign.center,),
                    ),
                  ),
                ]
            ),
          );
        },
      ),
    );
  }
}
