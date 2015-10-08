//
//  __  __          ____           _          _
//  \ \/ / /\_/\   /___ \  _   _  (_)   ___  | | __
//   \  /  \_ _/  //  / / | | | | | |  / __| | |/ /
//   /  \   / \  / \_/ /  | |_| | | | | (__  |   <
//  /_/\_\  \_/  \___,_\   \__,_| |_|  \___| |_|\_\
//
//  Copyright (C) Heaven.
//
//	https://github.com/uxyheaven/XYQuick
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "UIActionSheet+XY.h"
#import "NSObject+XY.h"

DUMMY_CLASS(UIActionSheet_XY);

@implementation UIActionSheet (XY)

uxy_staticConstString(UIActionSheet_key_clicked)
uxy_staticConstString(UIActionSheet_key_cancel)
uxy_staticConstString(UIActionSheet_key_willPresent)
uxy_staticConstString(UIActionSheet_key_didPresent)
uxy_staticConstString(UIActionSheet_key_willDismiss)
uxy_staticConstString(UIActionSheet_key_didDismiss)

- (void)uxy_handlerClickedButton:(UIActionSheet_block_self_index)aBlock
{
    self.delegate = self;
    [self uxy_setCopyAssociatedObject:aBlock forKey:UIActionSheet_key_clicked];
}
- (void)uxy_handlerCancel:(UIActionSheet_block_self)aBlock
{
    self.delegate = self;
    [self uxy_setCopyAssociatedObject:aBlock forKey:UIActionSheet_key_cancel];
}
- (void)uxy_handlerWillPresent:(UIActionSheet_block_self)aBlock
{
    self.delegate = self;
    [self uxy_setCopyAssociatedObject:aBlock forKey:UIActionSheet_key_willPresent];
}
- (void)uxy_handlerDidPresent:(UIActionSheet_block_self)aBlock
{
    self.delegate = self;
    [self uxy_setCopyAssociatedObject:aBlock forKey:UIActionSheet_key_didPresent];
}
- (void)uxy_handlerWillDismiss:(UIActionSheet_block_self)aBlock
{
    self.delegate = self;
    [self uxy_setCopyAssociatedObject:aBlock forKey:UIActionSheet_key_willDismiss];
}
- (void)uxy_handlerDidDismiss:(UIActionSheet_block_self_index)aBlock
{
    self.delegate = self;
    [self uxy_setCopyAssociatedObject:aBlock forKey:UIActionSheet_key_didDismiss];
}
#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIActionSheet_block_self_index block = [self uxy_getAssociatedObjectForKey:UIActionSheet_key_clicked];
    
    if (block)
        block(actionSheet, buttonIndex);
}

-(void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    UIActionSheet_block_self block = [self uxy_getAssociatedObjectForKey:UIActionSheet_key_cancel];
    
    if (block)
        block(actionSheet);
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    UIActionSheet_block_self block = [self uxy_getAssociatedObjectForKey:UIActionSheet_key_willPresent];
    
    if (block)
        block(actionSheet);
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
    UIActionSheet_block_self block = [self uxy_getAssociatedObjectForKey:UIActionSheet_key_didPresent];
    
    if (block)
        block(actionSheet);
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIActionSheet_block_self_index block = [self uxy_getAssociatedObjectForKey:UIActionSheet_key_willDismiss];
    
    if (block)
        block(actionSheet, buttonIndex);
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIActionSheet_block_self_index block = [self uxy_getAssociatedObjectForKey:UIActionSheet_key_didDismiss];
    
    if (block)
        block(actionSheet, buttonIndex);
}

@end
