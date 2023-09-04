import 'package:animated_widgets/animations/page_transition_animation.dart';
import 'package:animated_widgets/enums/enums.dart';
import 'package:example/animation/animated_grid_view.dart';
import 'package:example/animation/animated_list_view.dart';
import 'package:example/utility/color.dart';
import 'package:example/utility/enums.dart';
import 'package:flutter/material.dart';


class AnimatedDialogBox extends StatefulWidget {
  final String title;
  final ListType listType;
  final TextStyle? titleTextStyle;
  const AnimatedDialogBox({Key? key, required this.title, this.titleTextStyle, required this.listType}) : super(key: key);

  @override
  State<AnimatedDialogBox> createState() => _AnimatedDialogBoxState();
}

class _AnimatedDialogBoxState extends State<AnimatedDialogBox> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;


  Widget animatedDialogBox(BuildContext context) {
    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Create a curved animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _controller.forward();

    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: AlertDialog(
                title: const Center(child: Text('ListView Animations')),
                titleTextStyle: TextStyle(color: ColorUtility.magenta,fontSize: 25,fontWeight: FontWeight.bold),
                alignment: Alignment.center,
                // content: const Text('This is an animated dialog box.'),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtility.magenta
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType: CollectionAnimationType.fadeOut)),
                        );
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
                        Navigator.push(
                          context,
                          PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.stepAnimation)),
                        );
                      },
                      child: const Text('Step Animation', textAlign: TextAlign.center,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtility.magenta
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.leftScaleAnimation)),
                        );
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
                        Navigator.push(
                          context,
                          PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.scaleLoad)),
                        );
                      },
                      child: const Text(
                        'Lazy Scale Animation', textAlign: TextAlign.center,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtility.magenta
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.rightScaleAnimation)),
                        );
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
                        Navigator.push(
                          context,
                          PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.colorChange)),
                        );
                      },
                      child: const Text(
                        'Color Change Animation', textAlign: TextAlign.center,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtility.magenta
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.slideAndBounce)),
                        );
                      },
                      child: const Text(
                        'Slide And Bounce Animation', textAlign: TextAlign.center,),
                    ),
                  ),
                ]
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Create a curved animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation
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
                title: Center(child: Text(widget.title)),
                titleTextStyle: TextStyle(color: ColorUtility.magenta,fontSize: 22,fontWeight: FontWeight.bold),
                alignment: Alignment.center,
                // content: const Text('This is an animated dialog box.'),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: <Widget>[
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
                            PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType: CollectionAnimationType.fadeOut)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(collectionAnimationType: CollectionAnimationType.fadeOut)),
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
                            PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.stepAnimation)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(collectionAnimationType:CollectionAnimationType.stepAnimation)),
                          );
                        }
                      },
                      child: const Text('Step Animation', textAlign: TextAlign.center,),
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
                            PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.leftScaleAnimation)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(collectionAnimationType:CollectionAnimationType.leftScaleAnimation)),
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
                            PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.scaleLoad)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(collectionAnimationType:CollectionAnimationType.scaleLoad)),
                          );
                        }
                      },
                      child: const Text(
                        'Lazy Scale Animation', textAlign: TextAlign.center,),
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
                            PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.rightScaleAnimation)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(collectionAnimationType:CollectionAnimationType.rightScaleAnimation)),
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
                            PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.colorChange)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(collectionAnimationType:CollectionAnimationType.colorChange)),
                          );
                        }
                      },
                      child: const Text(
                        'Color Change Animation', textAlign: TextAlign.center,),
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
                            PopAndScaleTransition(page: const AnimatedListView(collectionAnimationType:CollectionAnimationType.slideAndBounce)),
                          );
                        }else {
                          Navigator.push(
                            context,
                            PopAndScaleTransition(page: const AnimatedGridView(collectionAnimationType:CollectionAnimationType.slideAndBounce)),
                          );
                        }
                      },
                      child: const Text(
                        'Slide And Bounce Animation', textAlign: TextAlign.center,),
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
