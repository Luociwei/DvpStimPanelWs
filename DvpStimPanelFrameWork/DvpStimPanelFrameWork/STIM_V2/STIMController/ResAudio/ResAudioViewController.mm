//
//  ResAudioViewController
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 suncode. All rights reserved.
//

#import "ResAudioViewController.h"
#import "ExtensionConst.h"

@interface ResAudioViewController ()
@property (assign) IBOutlet NSButton *bit_244_btn1;
@property (assign) IBOutlet NSButton *bit_244_btn2;
@property (assign) IBOutlet NSButton *bit_244_btn3;
@property (assign) IBOutlet NSButton *bit_244_btn4;

@property (assign) IBOutlet NSButton *bit_242_btn1;
@property (assign) IBOutlet NSButton *bit_242_btn2;
@property (assign) IBOutlet NSButton *bit_242_btn3;
@property (assign) IBOutlet NSButton *bit_242_btn4;

@property (copy) NSArray *switchBtns;

@property (assign) IBOutlet NSButton *bit_245_btn1;
@property (assign) IBOutlet NSButton *bit_245_btn2;
@property (assign) IBOutlet NSButton *bit_245_btn3;
@property (assign) IBOutlet NSButton *bit_245_btn4;

@property (assign) IBOutlet NSButton *bit_243_btn1;
@property (assign) IBOutlet NSButton *bit_243_btn2;
@property (assign) IBOutlet NSButton *bit_243_btn3;
@property (assign) IBOutlet NSButton *bit_243_btn4;
@property (weak) IBOutlet NSImageView *backgroundView;
@end


@implementation ResAudioViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self setImages];
    self.switchBtns = @[_bit_244_btn1,_bit_244_btn2,_bit_244_btn3,_bit_244_btn4,_bit_242_btn1,_bit_242_btn2,_bit_242_btn3,_bit_242_btn4,_bit_245_btn1,_bit_245_btn2,_bit_245_btn3,_bit_245_btn4,_bit_243_btn1,_bit_243_btn2,_bit_243_btn3,_bit_243_btn4];
    
    self.allSwitchs = @[@[_bit_245_btn1,_bit_245_btn2,_bit_245_btn3,_bit_245_btn4,_bit_243_btn1,_bit_243_btn2,_bit_243_btn3,_bit_243_btn4],@[_bit_244_btn1,_bit_244_btn2,_bit_244_btn3,_bit_244_btn4,_bit_242_btn1,_bit_242_btn2,_bit_242_btn3,_bit_242_btn4]];
    
    for (int j=0;j<self.switchBtns.count;j++) {
        NSButton *btn = self.switchBtns[j];
        btn.state = 0;
        btn.alternateTitle = @"IO";
        
        if (j<4 ) {
            btn.tag = 244;
        }else if (j>=4 && j<8){
            btn.tag = 242;
        }else if (j>=8 && j<12){
            btn.tag = 245;
        }else{
            btn.tag = 243;
        }
        
    }
    
}


-(void)setImages{
    [self setImageView:self.backgroundView imageName:@"ResAudio.jpg"];
    [self setSwitch2BtnImage:self.bit_244_btn1];
    [self setSwitch2BtnImage:self.bit_244_btn2];
    [self setSwitch2BtnImage:self.bit_244_btn3];
    [self setSwitch2BtnImage:self.bit_244_btn4];
    [self setSwitch2BtnImage:self.bit_242_btn1];
    [self setSwitch2BtnImage:self.bit_242_btn2];
    [self setSwitch2BtnImage:self.bit_242_btn3];
    [self setSwitch2BtnImage:self.bit_242_btn4];
    
    [self setSwitch1BtnImage:self.bit_243_btn1];
    [self setSwitch1BtnImage:self.bit_243_btn2];
    [self setSwitch1BtnImage:self.bit_243_btn3];
    [self setSwitch1BtnImage:self.bit_243_btn4];
    [self setSwitch1BtnImage:self.bit_245_btn1];
    [self setSwitch1BtnImage:self.bit_245_btn2];
    [self setSwitch1BtnImage:self.bit_245_btn3];
    [self setSwitch1BtnImage:self.bit_245_btn4];
}

-(NSString *)getSwitchBtnName:(NSButton *)btn{
    NSString *btnName = @"";
    NSInteger tag = btn.tag;
    if (btn.title.length) {
        
    }else{
        if (tag == 244) {
            btnName = [self joinSwitchBtnAndTextName:@"S1" textName:@""];
        }else if (tag == 245){
            btnName = [self joinSwitchBtnAndTextName:@"S2" textName:@""];
        }else if (tag == 242){
            btnName = [self joinSwitchBtnAndTextName:@"S3" textName:@""];
        }else if (tag == 243){
            btnName = [self joinSwitchBtnAndTextName:@"S4" textName:@""];
        }
        
    }
    
    return btnName;
}

- (IBAction)switch2Click:(NSButton *)switchBtn {
    NSControlStateValue btnState = switchBtn.state;
    for (NSButton *btn in self.switchBtns) {
        if (btn.tag == switchBtn.tag) {
            btn.state = btnState;
            if (btn.tag == 242 || btn.tag == 244) {
                [self setSwitch2BtnImage:btn];
            }else if (btn.tag == 243 || btn.tag == 245){
                [self setSwitch1BtnImage:btn];
            }
            
        }
    }
#if 1
    // Insert code here
    NSString *name = [self getSwitchBtnName:switchBtn];
    [self respondsToStimControllerSwitchClickWithSwtichName:name switchBtn:switchBtn];
#else //suncode
    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
#endif
    
    
    
    
}


@end
