//
//  BRRootViewController.m
//  BoundingRectKernExperiment
//
//  Created by Daniel Hammond on 10/4/13.
//  Copyright (c) 2013 Daniel Hammond. All rights reserved.
//

#import "BRRootViewController.h"

@interface BRRootViewController ()

@property (nonatomic, weak) UITextView *textView;
@property (nonatomic, weak) UITextView *textViewWithFontKerning;

@end

@implementation BRRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *testString = @"Te"; // "Te" has some automated kerning with the system font but not with Menlo
    
    UITextView *textView = [UITextView new];
    textView.frame = (CGRect){0, 100, 320, 100};
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    textView.text = testString;
    textView.font = [UIFont fontWithName:@"Menlo-Regular" size:48.0];
    [self.view addSubview:textView];
    
    UITextView *textViewWithFontKerning = [UITextView new];
    textViewWithFontKerning.frame = (CGRect){0, 200, 320, 100};
    textViewWithFontKerning.translatesAutoresizingMaskIntoConstraints = NO;
    textViewWithFontKerning.text = testString;
    textViewWithFontKerning.font = [UIFont systemFontOfSize:48];
    [self.view addSubview:textViewWithFontKerning];

    self.textView = textView;
    self.textViewWithFontKerning = textViewWithFontKerning;
}

- (void)viewDidAppear:(BOOL)animated
{
    NSRange characterRange = NSMakeRange(0, 1);
    [self displayOverlayOverCharacterRange:characterRange textView:self.textView];
    [self displayOverlayOverCharacterRange:characterRange textView:self.textViewWithFontKerning];
}

- (void)displayOverlayOverCharacterRange:(NSRange)range textView:(UITextView *)textView
{
    NSRange glyphRange = [textView.layoutManager glyphRangeForCharacterRange:range actualCharacterRange:NULL];
    CGRect boundingRect = [textView.layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:textView.textContainer];
    
    UIView *overlay = [UIView new];
    overlay.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    overlay.frame = CGRectOffset(boundingRect, textView.frame.origin.x, textView.frame.origin.y);
    [self.view addSubview:overlay];
}

@end
