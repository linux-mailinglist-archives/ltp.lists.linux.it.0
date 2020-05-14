Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 768DD1D28DD
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 09:37:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 065143C5435
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 09:37:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2F49C3C2555
 for <ltp@lists.linux.it>; Thu, 14 May 2020 09:37:04 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BE7751000B7B
 for <ltp@lists.linux.it>; Thu, 14 May 2020 09:37:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD9D7AC64;
 Thu, 14 May 2020 07:37:05 +0000 (UTC)
Date: Thu, 14 May 2020 09:37:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200514073701.GA9562@dell5510>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <5EBB5B3D.4020302@cn.fujitsu.com> <20200513092028.GA4598@dell5510>
 <5EBBCA12.5020901@cn.fujitsu.com> <20200513103032.GA18763@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513103032.GA18763@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWWFuZywKCm9uZSBtb3JlIG5vdGU6Cgo+ID4gQXMgbXkgcGVydmlvdXMgbWFpbCBzYWlkLCBJ
dCBpcyBqdXN0IGEgcG9zc2libGUgc2l0dWF0aW9u77yMIGZvciBleGFtcGxlOgo+ID4gVXBzdHJl
YW0ga2VybmVsIGludHJvZHVjZXMgYnRyZnMgZmlsZXN5c3RlbSBsb25nIGxvbmcgYWdvIGJ1dCB0
aGUKPiA+IGtlcm5lbCBvZiBSSEVMOCBkcm9wcyBidHJmcyBmaWxlc3lzdGVtIGJlY2F1c2Ugb2Yg
c29tZSByZWFzb25zLgo+IEkgZ3Vlc3MgZmlsZXN5c3RlbSBjaGFuZ2VzIGFyZSB0aGUgbW9zdCBm
cmVxdWVudC4gQnV0IGFzIEkgc2FpZCwgSSB3b3VsZG4ndCBtaW5kCj4gdGhpcyBpbXBsZW1lbnRh
dGlvbjoKPiB2b2lkIGZzb3Blbl9zdXBwb3J0ZWRfYnlfa2VybmVsKHZvaWQpCj4gewo+IAlURVNU
KHRzdF9zeXNjYWxsKF9fTlJfZnNvcGVuLCBOVUxMLCAwKSk7Cj4gCWlmIChUU1RfUkVUICE9IC0x
KQo+IAkJU0FGRV9DTE9TRShUU1RfUkVUKTsKPiB9CkJUVyB0aGUgc2FtZSBhcHByb2FjaCBpcyB1
c2VkIGluIGluY2x1ZGUvbGFwaS9vcGVuYXQyLmgKCnZvaWQgb3BlbmF0Ml9zdXBwb3J0ZWRfYnlf
a2VybmVsKHZvaWQpCnsKCWlmICgodHN0X2t2ZXJjbXAoNSwgNiwgMCkpIDwgMCkgewoJCS8qIENo
ZWNrIGlmIHRoZSBzeXNjYWxsIGlzIGJhY2twb3J0ZWQgb24gYW4gb2xkZXIga2VybmVsICovCgkJ
VEVTVChzeXNjYWxsKF9fTlJfb3BlbmF0MiwgLTEsIE5VTEwsIE5VTEwsIDApKTsKCQlpZiAoVFNU
X1JFVCA9PSAtMSAmJiBUU1RfRVJSID09IEVOT1NZUykKCQkJdHN0X2JyayhUQ09ORiwgIlRlc3Qg
bm90IHN1cHBvcnRlZCBvbiBrZXJuZWwgdmVyc2lvbiA8IHY1LjYiKTsKCX0KfQoKYW5kIGNsb25l
M19zdXBwb3J0ZWRfYnlfa2VybmVsKCkuIEJvdGggbWVyZ2VkIGJ5IEN5cmlsLgoKVG8gYmUgaG9u
ZXN0IEkgbGlrZSB0aGlzIGFwcHJvYWNoLCBiZWNhdXNlIDEpIGl0IGRlZmluZXMgd2hlbiBuZXcg
c3lzY2FsbCB3YXMKYmFja3BvcnRlZCAyKSBpZiB0aGVyZSBpcyByZWFsbHkgcHJvYmxlbSB0aGF0
IHNvbWUgZnVuY3Rpb25hbGl0eSB3YXMgcmVtb3ZlZCwgd2UKY2FuIGFsd2F5cyBoYW5kbGUgaXQu
IEJ1dCBJTUhPIHRoYXQncyBnb2luZyB0byBiZSByYXJlIChidHJmcyByZW1vdmVkIGluIFJIRUwg
OAppcyBJTUhPIGJlY2F1c2UgUkhFTCBkb2VzIG5vdCB3YW50IHRvIHN1cHBvcnQgaXQsIGJ1dCB0
aGF0IHdvdWxkIG5vdCBoYXBwZW4gZm9yCnN5c2NhbGxzKS4KCkknZCBhbHNvIGxpa2UgdG8gYmUg
Y29uc2lzdGVudCBob3cgd2UgaGFuZGxlIHRoZXNlIG5ldyBzeXNjYWxscy4KCktpbmQgcmVnYXJk
cywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
