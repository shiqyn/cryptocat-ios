//
//  TBChatToolbarView.m
//  ChatView
//
//  Created by Thomas Balthazar on 06/11/13.
//  Copyright (c) 2013 Thomas Balthazar. All rights reserved.
//

#import "TBChatToolbarView.h"

#define kBackgroundColor  [UIColor colorWithRed:0.969 green:0.969 blue:0.980 alpha:1.000]

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TBChatToolbarView () <UITextViewDelegate, TBGrowingTextViewDelegate>

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TBChatToolbarView

////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithCoder:(NSCoder *)aDecoder {
  NSLog(@"-- initWithCoder");
  if (self=[super initWithCoder:aDecoder]) {
    self.backgroundColor = kBackgroundColor;
    //self.translatesAutoresizingMaskIntoConstraints = NO;
    
    // -- textView
    _textView = [[TBGrowingTextView alloc] initWithFrame:CGRectZero];
    _textView.contentInset = UIEdgeInsetsMake(-4, 0, 0, 0); // needed to align the font
    _textView.maxNbLines = 3;
    _textView.font = [UIFont fontWithName:@"Monda-Regular" size:14.0];
    _textView.delegate = self;
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.translatesAutoresizingMaskIntoConstraints = NO;
    _textView.growingDelegate = self;
    [self addSubview:_textView];
    
    // -- button
    _sendButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_sendButton setTitle:NSLocalizedString(@"Send", @"Send Button Title")
                 forState:UIControlStateNormal];
    _sendButton.enabled = NO;
    [_sendButton sizeToFit];
    _sendButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_sendButton];
  }
  
  return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)awakeFromNib {
  [super awakeFromNib];
  NSLog(@"-- awakeFromNib");
  
  NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_textView, _sendButton);
  
  [self addConstraints:
   [NSLayoutConstraint constraintsWithVisualFormat:@"|-5-[_textView]-[_sendButton]-5-|"
                                           options:0
                                           metrics:0
                                             views:viewsDictionary]];

  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                                                                      @"V:|-7-[_textView(>=30)]-7-|"
                                                               options:0
                                                               metrics:0
                                                                 views:viewsDictionary]];

  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                                                                      @"V:|-(>=7)-[_sendButton]-7-|"
                                                               options:0
                                                               metrics:0
                                                                 views:viewsDictionary]];

}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TBGrowingTextViewDelegate

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)growingTextView:(TBGrowingTextView *)textView
   willChangeFromHeight:(CGFloat)fromHeight
               toHeight:(CGFloat)toHeight {
  if ([self.delegate
       respondsToSelector:@selector(chatToolbarViewView:willChangeFromHeight:toHeight:)]) {
    [self.delegate chatToolbarViewView:self willChangeFromHeight:fromHeight toHeight:toHeight];
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)growingTextView:(TBGrowingTextView *)textView
    didChangeFromHeight:(CGFloat)fromHeight
               toHeight:(CGFloat)toHeight {
  if ([self.delegate
       respondsToSelector:@selector(chatToolbarViewView:didChangeFromHeight:toHeight:)]) {
    [self.delegate chatToolbarViewView:self didChangeFromHeight:fromHeight toHeight:toHeight];
  }
}

@end
