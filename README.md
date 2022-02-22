# CustomAlert

`CustomAlert` can help you to display a custom view in `UIAlertControllerStyleAlert` and `UIAlertControllerStyleActionSheet` style.

---

### How to use

This module is the Category of the `UIViewController`, so that's easy to use in your project.

1. Import `VCTransitionManager.h`

2. Create the `ViewController` instance and make its `view.backgroundColor` is `UIColor.clearColor`

3. Create a `UIView` as the background that contain the things you wanna display in this `UIViewController`

4. In the `UIViewController.m`, implement the method `-(UIView *)contentView`, return the view that create in step 3

5. Present it~~`[self customPresentViewControllerWithType:CustomModalTypeAlert withViewController:vc withBackgroundAlpha:0.8 completion:nil];`



you can see more detail in the project.