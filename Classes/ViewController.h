//
//  ViewController.h
//  Created by http://github.com/iosdeveloper
//

#import <UIKit/UIKit.h>
#import "ImageCropper.h"

@interface ViewController : UIViewController <ImageCropperDelegate> {
	UIImageView *imageView;
}

@property (nonatomic, retain) UIImageView *imageView;

@end