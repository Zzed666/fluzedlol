import 'package:flutter/material.dart';

/// item widget with scale

class CustomItemWithScaleItemWidget extends StatefulWidget {
  final Widget itemWidget;

  CustomItemWithScaleItemWidget({Key key, this.itemWidget}) : super(key: key);

  @override
  _CustomItemWithScaleItemWidgetState createState() =>
      _CustomItemWithScaleItemWidgetState();
}

class _CustomItemWithScaleItemWidgetState
    extends State<CustomItemWithScaleItemWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey _itemGlobalKey = GlobalKey();
  double _originalHeight;
  double _height;
  AnimationController controller;
  Animation _animation;
  double value = 1.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_getHeight);
    controller =
        AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
    _animation = Tween(begin: 1.0, end: 1.2).animate(controller);
    _animation.addListener(() {
      value = _animation.value;
      setState(() {
        _height = _originalHeight * value;
      });
      print("_animation.value:$value");
    });
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
        print("status is dismissed");
      } else if (status == AnimationStatus.forward) {
        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
        print("status is reverse");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: _itemGlobalKey,
        height: _height,
        color: Colors.white,
        child: GestureDetector(
              onTap: () {
                if(controller.isCompleted){
                  //反向开始
                  controller.reverse();
                }else{
                  //正向动画开始
                  controller.forward();
                }
              },
            child: widget.itemWidget));
  }

  _getHeight(_) {
    final BuildContext context = _itemGlobalKey.currentContext;
    final RenderObject renderObject = context?.findRenderObject();
    if (mounted) {
      setState(() {
        _originalHeight = renderObject?.paintBounds?.size?.height;
        print("_originalHeight:$_originalHeight");
      });
    }
  }
}
