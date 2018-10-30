//
//  Tools+UpdateVersion.m
//  KMPharmacy
//
//  Created by mac on 2018/5/7.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "Tools+UpdateVersion.h"

@implementation Tools (UpdateVersion)

#pragma mark - 获取本本号
//获取本地版本号
+ (NSString *)getLocalVersion {
    
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * currentVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString * showString = [NSString stringWithFormat:@"%@",currentVersion];
    return showString;
}

//根据appstore中版本号与本地版本号对比判断是否需要更新
+ (void)updateVersion:(NSString *)appstoreID {
    
    //网络获取当前最新版本及版本更新信息
    //T_WARNING APP在appstore上的APPID
    NSString *url = [NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@",appstoreID];
    
    [XMCenter sendRequest:^(XMRequest *request) {
        request.url = url;
        request.httpMethod = kXMHTTPMethodGET;
        request.requestSerializerType = kXMRequestSerializerRAW;
    } onSuccess:^(id responseObject) {
        
        //获取信息
        NSDictionary * response = responseObject;
        NSArray * arr = [response valueForKey:@"results"];
        NSDictionary * result = arr[0];
        NSString * appStoreVersion = [result valueForKey:@"version"];
        NSString * releaseNotes = [result valueForKey:@"releaseNotes"];
        
        //获取本地版本号
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *localVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        
        BOOL isUpdate = NO;
        
        NSMutableArray *localArray = [NSMutableArray arrayWithArray:[localVersion componentsSeparatedByString:@"."]];
        NSMutableArray *versionArray = [NSMutableArray arrayWithArray:[appStoreVersion componentsSeparatedByString:@"."]];
        
        while (localArray.count < 3) {
            [localArray addObject:@"0"];
        }
        
        while (versionArray.count < 3) {
            [versionArray addObject:@"0"];
        }
        
        
        if ((versionArray.count == 3) && (localArray.count == versionArray.count)) {
            
            if ([localArray[0] intValue] <  [versionArray[0] intValue]) {
                
                isUpdate = YES;
            }
            else if ([localArray[0] intValue]  ==  [versionArray[0] intValue]) {
                
                if ([localArray[1] intValue] <  [versionArray[1] intValue]) {
                    
                    isUpdate = YES;
                }
                else if ([localArray[1] intValue] ==  [versionArray[1] intValue]) {
                    
                    if ([localArray[2] intValue] <  [versionArray[2] intValue]) {
                        
                        isUpdate = YES;
                    }
                }
            }
        }
        
        
        //判断
        if (isUpdate) {
            
            NSString *title = @"药葫芦有新版本";
            
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:title
                                                                            message:releaseNotes
                                                                     preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                                    style:UIAlertActionStyleCancel
                                                                  handler:nil];
            UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"去更新"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action)
                                        {
                                            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@?mt=8",appstoreID]]];
                                            
                                        }];
            [alert addAction:cancelAction];
            [alert addAction:okAction];
            
            /*
            UIView *subView1;
            UIView *subView2;
            UIView *subView3;
            UIView *subView4;
            UIView *subView5;
            
            if (alert.view.subviews.count > 0) {
                subView1 = alert.view.subviews[0];
            }
            if (subView1.subviews.count > 0) {
                subView2 = subView1.subviews[0];
            }
            if (subView2.subviews.count > 0) {
                subView3 = subView2.subviews[0];
            }
            if (subView3.subviews.count > 0) {
                subView4 = subView3.subviews[0];
            }
            if (subView4.subviews.count > 0) {
                subView5 = subView4.subviews[0];
            }

            NSLog(@"%@",subView5.subviews);
            
            //取title和message：
            for (UILabel *label in subView5.subviews) {
                
                if ([label isKindOfClass:[UILabel class]] && ![label.text isEqualToString:title]) {
                    label.textAlignment = NSTextAlignmentLeft;
                }
            }
            */
            UIWindow * window = LF_MAIN_WINDOW;
            [window.rootViewController presentViewController:alert animated:YES completion:nil];
        }
        
        
    } onFailure:^(NSError *error) {
        
        
        
    } onFinished:^(id responseObject, NSError *error) {
        
        
    }];
}

@end
