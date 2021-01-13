Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A172F4823
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 11:02:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F2E83C5DBF
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 11:02:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 435C33C2645
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 11:02:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B3BCC2003B9
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 11:02:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0437AE6E;
 Wed, 13 Jan 2021 10:02:06 +0000 (UTC)
Date: Wed, 13 Jan 2021 11:02:05 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <X/7FHSMKBL7L0zBs@pevik>
References: <20210113075110.31628-1-pvorel@suse.cz>
 <20210113075110.31628-4-pvorel@suse.cz>
 <5FFEBA89.5040001@cn.fujitsu.com> <5FFEBB79.4010807@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5FFEBB79.4010807@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] syscalls: Remove unused include <fcntl.h>
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWHUsCgo+IOS6jiAyMDIxLzEvMTMgMTc6MTYsIFhpYW8gWWFuZyDlhpnpgZM6Cj4gPiBPbiAy
MDIxLzEvMTMgMTU6NTEsIFBldHIgVm9yZWwgd3JvdGU6Cj4gPiA+IFRlc3RzIHNob3VsZCBhbHdh
eXMgdXNlIGxhcGkvZmNudGwuaCBpbnN0ZWFkIG9mPGZjbnRsLmg+ICB0byBmaXgKPiA+ID4gcG9z
c2libGUgbWlzc2luZyBkZWZpbml0aW9ucy4KCj4gPiA+IEJ1dCBpbiB0aGlzIGNhc2UgcmVtb3Zp
bmcgaW5jbHVkZSwgYmVjYXVzZSBmYW5vdGlmeSB0ZXN0cyBpbmNsdWRlCj4gPiA+IDxmY250bC5o
PiAgaW4gbGFwaS9mY250bC5oICh2aWEgZmFub3RpZnkuaCkgYW5kCj4gPiA+IHtuYW1lX3RvLG9w
ZW5fYnl9X2hhbmRsZV9hdCB0ZXN0cyBpbmNsdWRlIGxhcGkvZmNudGwuaCBpbgo+ID4gPiBsYXBp
L25hbWVfdG9faGFuZGxlX2F0LmguCj4gPiBIaSBQZXRyLAoKPiA+IFRoaXMgcGF0Y2hzZXQgbG9v
a3MgZ29vZCB0byBtZS4KPiA+IFJldmlld2VkLWJ5OiBYaWFvIFlhbmc8eWFuZ3guanlAY24uZnVq
aXRzdS5jb20+Cgo+ID4gT25seSBvbmUgbW9uaXIgcXVlc3Rpb246Cj4gPiBXaHkgZG8gd2UgcmVt
b3ZlPGZjbnRsLmg+ICBoZWFkZXIgZm9yIGFsbCBmYW5vdGlmeSB0ZXN0cz8KCj4gU29ycnksIGNv
cnJlY3Qgb25lIHdvcmQoZG8gPT5kb24ndCkKUmlnaHQgOikuIFRoYXQgYWN0dWFsbHkgbWFrZXMg
c2Vuc2UsIHRoYW5rcyEKSSdsbCBtZXJnZSBpdCB3aXRoIHRoaXMgY2hhbmdlLgoKS2luZCByZWdh
cmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
