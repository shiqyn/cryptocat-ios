//
//  XMPPInBandRegistration.h
//  Cryptocat
//
//  Created by Thomas Balthazar on 24/09/13.
//  Copyright (c) 2013 Thomas Balthazar. All rights reserved.
//
//  This file is part of Cryptocat for iOS.
//
//  Cryptocat for iOS is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Cryptocat for iOS is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with Cryptocat for iOS.  If not, see <http://www.gnu.org/licenses/>.
//

#import "XMPP.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface XMPPInBandRegistration : XMPPModule

- (void)requestRegistrationFields;
- (void)registerUsername:(NSString *)username password:(NSString *)password;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@protocol XMPPInBandRegistrationDelegate <NSObject>

- (void)xmppInBandRegistration:(XMPPInBandRegistration *)sender
didReceiveRegistrationFieldsAnswer:(XMPPIQ *)iq;
- (void)xmppInBandRegistration:(XMPPInBandRegistration *)sender
           didRegisterUsername:(NSString *)username
                      password:(NSString *)password;
- (void)xmppInBandRegistration:(XMPPInBandRegistration *)sender
     didFailToRegisterUsername:(NSString *)username
                 withErrorCode:(NSInteger)errorCode;

@end