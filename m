Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F535E72
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 15:56:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E94A3EA6DE
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 15:56:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 62EFE3EA675
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 15:56:50 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6E9F5600F14
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 15:56:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A6CCAFEF
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 13:56:46 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  5 Jun 2019 15:56:41 +0200
Message-Id: <20190605135641.1848-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] README: Add note about testing with Travis CI
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

U2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Ci0tLQogUkVBRE1FLm1k
IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9S
RUFETUUubWQgYi9SRUFETUUubWQKaW5kZXggMWViNDc0N2MzLi5jMDE3YjUwMzIgMTAwNjQ0Ci0t
LSBhL1JFQURNRS5tZAorKysgYi9SRUFETUUubWQKQEAgLTE4NSwzICsxODUsNiBAQCBsaXN0LiBB
bHNvIG5vdGUgdGhhdCB0aGVzZSBkb2N1bWVudHMgYXJlIGF2YWlsYWJsZSBvbmxpbmUgYXQ6CiAq
IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL3dpa2kvQy1UZXN0LUNh
c2UtVHV0b3JpYWwKIAogQWx0aG91Z2ggd2UgYWNjZXB0IEdpdEh1YiBwdWxsIHJlcXVlc3RzLCB0
aGUgcHJlZmVycmVkIHdheSBpcyBzZW5kaW5nIHBhdGNoZXMgdG8gb3VyIG1haWxpbmcgbGlzdC4K
KworSXQncyByZWNvbW1lbmRlZCB0byB0ZXN0IHBhdGNoZXMgb24gVHJhdmlzIENJIGJlZm9yZSBw
b3N0aW5nIHRvIG1haWxpbmcgbGlzdAorKHNpZ24gdXAgdG8gVHJhdmlzIENJIGFuZCBlbmFibGUg
cnVubmluZyBidWlsZHMgb24geW91ciBMVFAgZm9yayBvbiBodHRwczovL3RyYXZpcy1jaS5vcmcv
YWNjb3VudC9yZXBvc2l0b3JpZXMpLgotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
