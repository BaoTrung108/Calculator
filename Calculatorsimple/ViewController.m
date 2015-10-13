//
//  ViewController.m
//  Calculatorsimple
//
//  Created by trung bao on 13/10/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *screen;

@end

@implementation ViewController
{
    int pheptoan;
    double numberselect;
    double runnumber;
    BOOL thapphan;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    numberselect=0;
    runnumber=0;
    thapphan=false;
    self.screen.text=@"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) chonso: (int)thenumber {
    if (thapphan==false) {
        numberselect*=10;
        numberselect+=thenumber;
        self.screen.text=[NSString stringWithFormat:@"%.0f",numberselect];
    }else {
        self.screen.text=[self.screen.text stringByAppendingFormat:[NSString stringWithFormat:@"%d",thenumber]];
    }
    numberselect=[self.screen.text floatValue];
}

- (IBAction)amduong:(id)sender {
    numberselect=-numberselect;
    if ([self.screen.text floatValue]!=0) {
    NSRange rang= [self.screen.text rangeOfString:@"."];
    if (rang.location==NSNotFound) {
        self.screen.text=[NSString stringWithFormat:@"%.0f",numberselect];
    } else {
        self.screen.text=[NSString stringWithFormat:@"%.5f",numberselect];
    }
    } else {
        self.screen.text=[NSString stringWithFormat:@"%d",0];
    }
}
- (IBAction)phantram:(id)sender {
    numberselect=numberselect/100;
    self.screen.text=[NSString stringWithFormat:@"%.2f",numberselect];
    numberselect=0;
    runnumber=0;
    thapphan=false;
    pheptoan=0;
}
- (IBAction)AC:(id)sender {
    numberselect=0;
    runnumber=0;
    pheptoan=0;
    thapphan=false;
    self.screen.text=[NSString stringWithFormat:@"%d",0];
}
-(void) tinhtoan: (int) thenumber {
    thapphan=false;
    if (runnumber==0) {
        runnumber=numberselect;
    }else {
        switch (thenumber) {
            case 1:
                runnumber/=numberselect;
                break;
            case 2:
                runnumber*=numberselect;
                break;
            case 3:
                runnumber-=numberselect;
                break;
            case 4:
                runnumber+=numberselect;
                break;
            default:
                break;
        }
    }pheptoan=thenumber;
    numberselect=0;
}
- (IBAction)chia:(id)sender {
    if (runnumber!=0) {
        [self tinhtoan:pheptoan];
        self.screen.text=[NSString stringWithFormat:@"%.2f",runnumber];
        numberselect=[self.screen.text floatValue];
        runnumber=0;
    } [self tinhtoan:1];
}
- (IBAction)nhan:(id)sender {
    if (runnumber!=0) {
        [self tinhtoan:pheptoan];
        self.screen.text=[NSString stringWithFormat:@"%.2f",runnumber];
        numberselect=[self.screen.text floatValue];
        runnumber=0;
    } [self tinhtoan:2];
}
- (IBAction)tru:(id)sender {
    if (runnumber!=0) {
        [self tinhtoan:pheptoan];
        self.screen.text=[NSString stringWithFormat:@"%.2f",runnumber];
        numberselect=[self.screen.text floatValue];
        runnumber=0;
    } [self tinhtoan:3];
}
- (IBAction)cong:(id)sender {
    if (runnumber!=0) {
        [self tinhtoan:pheptoan];
        self.screen.text=[NSString stringWithFormat:@"%.2f",runnumber];
        numberselect=[self.screen.text floatValue];
        runnumber=0;
    } [self tinhtoan:4];
}
- (IBAction)bang:(id)sender {
    if (runnumber==0) {
        self.screen.text=[NSString stringWithFormat:@"%.2f",numberselect];
    }else {
        [self tinhtoan:pheptoan];
        self.screen.text = [NSString stringWithFormat:@"%.2f",runnumber];
        pheptoan=0;
        numberselect=0;
    }
}
- (IBAction)champhay:(id)sender {
    thapphan=true;
    NSRange rang= [self.screen.text rangeOfString:@"."];
    if (rang.location==NSNotFound) {
        self.screen.text=[self.screen.text stringByAppendingFormat:[NSString stringWithFormat:@"."]];
    }
}
- (IBAction)chin:(id)sender {
    [self chonso:9];
}
- (IBAction)tam:(id)sender {
    [self chonso:8];
}
- (IBAction)bay:(id)sender {
    [self chonso:7];
}
- (IBAction)sau:(id)sender {
    [self chonso:6];
}
- (IBAction)nam:(id)sender {
    [self chonso:5];
}
- (IBAction)bon:(id)sender {
    [self chonso:4];
}
- (IBAction)ba:(id)sender {
    [self chonso:3];
}
- (IBAction)hai:(id)sender {
    [self chonso:2];
}
- (IBAction)mot:(id)sender {
    [self chonso:1];
}
- (IBAction)khong:(id)sender {
    [self chonso:0];
}

@end
