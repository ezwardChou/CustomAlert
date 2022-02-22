//
//  AlertViewController.m
//  Alert
//
//  Created by mac on 2022/1/11.
//

#import "AlertViewController.h"

@interface AlertViewController ()
@property (weak, nonatomic) IBOutlet UIView *centerView;

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _centerView.layer.cornerRadius = 10;
    // Do any additional setup after loading the view from its nib.
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
    [self dismissViewControllerAnimated:1 completion:nil];
}


-(UIView *)contentView {
    return  _centerView;
}


@end
