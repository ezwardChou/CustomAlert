//
//  ActionSheetViewController.m
//  Alert
//
//  Created by mac on 2022/2/22.
//

#import "ActionSheetViewController.h"

@interface ActionSheetViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ActionSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIView *view = [_contentView viewWithTag:100];
    view.layer.cornerRadius = 8;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(UIView *)contentView{
    return _contentView;
}
@end
