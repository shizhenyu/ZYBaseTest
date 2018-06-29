//
//  QRCodeScanViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/28.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "QRCodeScanViewController.h"
#import <SGQRCode/SGQRCode.h>

@interface QRCodeScanViewController ()<SGQRCodeScanManagerDelegate, SGQRCodeAlbumManagerDelegate>

@property (nonatomic, strong) SGQRCodeScanManager *manager;

@property (nonatomic, strong) SGQRCodeScanningView *scanView;

@property (nonatomic, strong) UILabel *promptLabel;

@end

@implementation QRCodeScanViewController

#pragma mark - Life Cycle
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.scanView addTimer];
    [self.manager startRunning];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [self.scanView removeTimer];
}

- (void)dealloc {
    
    ZYLogLifeFunc(self);
    
    [self removeScanView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.title = @"二维码扫描";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"相册" style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItenAction)];
}

- (void)setupUI {
    
    [self scanView];
    
    [self.manager cancelSampleBufferDelegate];
    
    [self promptLabel];
}

#pragma mark - Nav Event
- (void)rightBarButtonItenAction {
    
    SGQRCodeAlbumManager *manager = [SGQRCodeAlbumManager sharedManager];
    
    [manager readQRCodeFromAlbumWithCurrentController:self];
    
    manager.delegate = self;
    
    if (manager.isPHAuthorization == YES) {
        
        [self.scanView removeTimer];
    }
}

#pragma mark - SGQRCodeAlbumManagerDelegate
- (void)QRCodeAlbumManagerDidCancelWithImagePickerController:(SGQRCodeAlbumManager *)albumManager {
    
    [self.view addSubview:self.scanView];
}

- (void)QRCodeAlbumManager:(SGQRCodeAlbumManager *)albumManager didFinishPickingMediaWithResult:(NSString *)result {
    
    UIAlertController *tipController = [UIAlertController alertControllerWithTitle:nil message:result preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *resumeAction = [UIAlertAction actionWithTitle:@"重扫" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [tipController addAction:cancelAction];
    [tipController addAction:resumeAction];
    
    [self presentViewController:tipController animated:YES completion:nil];
}

- (void)QRCodeAlbumManagerDidReadQRCodeFailure:(SGQRCodeAlbumManager *)albumManager {
    
    [[MBProgressTool sharedMBTool] showMessageInWindowMiddle:@"未扫描出二维码"];
}

#pragma mark - SGQRCodeScanManagerDelegate
- (void)QRCodeScanManager:(SGQRCodeScanManager *)scanManager didOutputMetadataObjects:(NSArray *)metadataObjects {
    
    NSLog(@"metadataObjects - - %@", metadataObjects);
    
    if (metadataObjects != nil && metadataObjects.count > 0) {
        
        [scanManager playSoundName:@"sound.caf"];
        
        [scanManager stopRunning];
        
        [self.scanView removeTimer];

        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        
        UIAlertController *tipController = [UIAlertController alertControllerWithTitle:nil message:[obj stringValue] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        UIAlertAction *resumeAction = [UIAlertAction actionWithTitle:@"重扫" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            [scanManager startRunning];
            
            [self.scanView addTimer];
            
        }];
        
        [tipController addAction:cancelAction];
        [tipController addAction:resumeAction];
        
        [self presentViewController:tipController animated:YES completion:nil];

        
    } else {
        NSLog(@"暂未识别出扫描的二维码");
    }
}

#pragma mark - 当界面销毁时，移除扫描
- (void)removeScanView {
    
    [self.scanView removeTimer];
    
    [self.scanView removeFromSuperview];
    
    self.scanView = nil;
}

#pragma mark - 懒加载
- (SGQRCodeScanManager *)manager {
    
    if (!_manager) {
        
        _manager = [SGQRCodeScanManager sharedManager];
        
        NSArray *scanTypes = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
        
        // AVCaptureSessionPreset1920x1080 推荐使用，对于小型的二维码读取率较高
        [_manager setupSessionPreset:AVCaptureSessionPreset1920x1080 metadataObjectTypes:scanTypes currentController:self];
        
        _manager.delegate = self;
        
    }
    
    return _manager;
}

- (SGQRCodeScanningView *)scanView {
    
    if (!_scanView) {
        
        _scanView = [[SGQRCodeScanningView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        
        _scanView.scanningImageName = @"QRCodeScanningLine";
        
        _scanView.scanningAnimationStyle = ScanningAnimationStyleDefault;
        
        [self.view addSubview:_scanView];
    }
    
    return _scanView;
}

- (UILabel *)promptLabel {
    
    if (!_promptLabel) {
        
        _promptLabel = [[UILabel alloc] init];
        
        _promptLabel.backgroundColor = [UIColor clearColor];
        
        CGFloat scanViewWidth = 0.7 * kScreenWidth;
        
        CGFloat scanViewY = 0.2 * (kScreenHeight - scanViewWidth);
        
        CGFloat promptLabelX = 0;
        CGFloat promptLabelY = scanViewWidth + scanViewY + 20;
        CGFloat promptLabelW = kScreenWidth;
        CGFloat promptLabelH = 25;
        
        _promptLabel.frame = CGRectMake(promptLabelX, promptLabelY, promptLabelW, promptLabelH);
        
        _promptLabel.textAlignment = NSTextAlignmentCenter;
        
        _promptLabel.font = [UIFont boldSystemFontOfSize:13.0];
        
        _promptLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        
        _promptLabel.text = @"将二维码/条码放入框内, 即可自动扫描";
        
        [self.view addSubview:_promptLabel];
    }
    
    return _promptLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
