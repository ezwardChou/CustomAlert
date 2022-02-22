//
//  ViewController.m
//  Alert
//
//  Created by mac on 2022/1/11.
//
#import "CustomModal/VCTransitionManager.h"
#import "ViewController.h"
#import "AlertViewController.h"
#import "ActionSheetViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)showAlert:(id)sender {
    AlertViewController *al = AlertViewController.new;
    
    [self customPresentViewControllerWithType:CustomModalTypeAlert withViewController:al withBackgroundAlpha:0.8 completion:nil];
}


- (IBAction)showSheet:(id)sender {
    ActionSheetViewController *vc = ActionSheetViewController.new;
    
    [self customPresentViewControllerWithType:CustomModalTypeBottomPresent withViewController:vc withBackgroundAlpha:0.8 completion:nil];
}

@end
