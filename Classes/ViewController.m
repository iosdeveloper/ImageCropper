//
//  ViewController.m
//  Created by http://github.com/iosdeveloper
//

#import "ViewController.h"

@implementation ViewController

@synthesize imageView;

- (void)loadView {
	[super loadView];
	
	imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SteveJobsMacbookAir.JPG"]];
	[imageView setFrame:CGRectMake(80.0, 20.0, 160.0, 230.0)];
	[imageView setContentMode:UIViewContentModeScaleAspectFit];
	
	[[self view] addSubview:imageView];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button addTarget:self action:@selector(cropImage) forControlEvents:UIControlEventTouchUpInside];
	[button setFrame:CGRectMake(124.0, 258.0, 72.0, 37.0)];
	[button setTitle:@"Crop!" forState:UIControlStateNormal];
	
	[[self view] addSubview:button];
}

- (void)cropImage {
	ImageCropper *cropper = [[ImageCropper alloc] initWithImage:[imageView image]];
	[cropper setDelegate:self];
	
	[self presentModalViewController:cropper animated:YES];
	
	[cropper release];
}

- (void)imageCropper:(ImageCropper *)cropper didFinishCroppingWithImage:(UIImage *)image {
	[imageView setImage:image];
	
	[self dismissModalViewControllerAnimated:YES];
	
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

- (void)imageCropperDidCancel:(ImageCropper *)cropper {
	[self dismissModalViewControllerAnimated:YES];
	
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

- (void)dealloc {
	[imageView release];
	
    [super dealloc];
}

@end