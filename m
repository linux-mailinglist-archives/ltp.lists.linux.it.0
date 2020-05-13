Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6D41D0FC0
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 12:30:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 794943C54F9
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 12:30:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A8DE23C08C9
 for <ltp@lists.linux.it>; Wed, 13 May 2020 12:30:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9530060106E
 for <ltp@lists.linux.it>; Wed, 13 May 2020 12:30:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F39EAB0B6;
 Wed, 13 May 2020 10:30:36 +0000 (UTC)
Date: Wed, 13 May 2020 12:30:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200513103032.GA18763@dell5510>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <5EBB5B3D.4020302@cn.fujitsu.com> <20200513092028.GA4598@dell5510>
 <5EBBCA12.5020901@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5EBBCA12.5020901@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

SGkgWWFuZywKCj4gVGhhbmtzIGEgbG90IGZvciB5b3VyIHF1aWNrIHJlcGx5LgpUaGFua3MgZm9y
IGEgcGF0aWVuY2UgKHdlJ3JlIG5vdCB3b3JraW5nIGp1c3Qgb24gTFRQIHVuZm9ydHVuYXRlbHkp
LgoKPiBSZXNldHRpbmcgZXJybm8gbWF5IG5vdCBuZWNlc3NhcnkgYmVjYXVzZSBlcnJubyB3aWxs
IGJlIHNldCBhZ2FpbiB3aGVuCj4gZmQgPT0gLTEuCkFncmVlLCBJJ20ganVzdCBjYXJlZnVsLCB0
aHVzIGFza2luZyA6KS4KCj4gPiA+IDIpIHRzdF9zeXNjYWxsKCkgaXMgZW5vdWdoIHRvIGNoZWNr
IHRoZSBzdXBwb3J0IG9mIHBpZGZkX29wZW4oKSBhbmQgSQo+ID4gPiAgICAgZG9uJ3Qgd2FudCB0
byBkZWZpbmUgY2hlY2sgZnVuY3Rpb24gYXMgZnNvcGVuX3N1cHBvcnRlZF9ieV9rZXJuZWwoKQo+
ID4gPiAgICAgZG9lcy4KPiA+ID4gICAgIERvIHlvdSB0aGluayBzbz8KCj4gPiA+IEJUVzoKPiA+
ID4gSSBkb24ndCBsaWtlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBmc29wZW5fc3VwcG9ydGVkX2J5
X2tlcm5lbCgpOgo+ID4gPiBhKSBzeXNjYWxsKCkvdHN0X3N5c2NhbGwoKSBpcyBlbm91Z2ggdG8g
Y2hlY2sgdGhlIHN1cHBvcnQgb2YKPiA+ID4gcGlkZmRfb3BlbigyKSBhbmQgJ3RzdF9rdmVyY21w
KDUsIDIsIDApKTwgIDAnIHdpbGwgc2tpcCB0aGUgY2hlY2sgaWYKPiA+ICsxIGZvciB0c3Rfc3lz
Y2FsbCgpCgo+ID4gPiBhIGtlcm5lbCBvbiBkaXN0cmlidXRpb24gaXMgbmV3ZXIgdGhhbiB2NS4y
IGJ1dCBkcm9wIHRoZSBzdXBwb3J0IG9mCj4gPiA+IHBpZGZkX29wZW4oMikgb24gcHVycG9zZS4K
PiA+ICJkcm9wIHN1cHBvcnQgb2YgcGlkZmRfb3BlbigyKSBvbiBwdXJwb3NlIjogd291bGQgYW55
Ym9keSBoYXMgYSByZWFzb24gdG8gZG8KPiA+IHRoYXQ/Cgo+IEFzIG15IHBlcnZpb3VzIG1haWwg
c2FpZCwgSXQgaXMganVzdCBhIHBvc3NpYmxlIHNpdHVhdGlvbu+8jCBmb3IgZXhhbXBsZToKPiBV
cHN0cmVhbSBrZXJuZWwgaW50cm9kdWNlcyBidHJmcyBmaWxlc3lzdGVtIGxvbmcgbG9uZyBhZ28g
YnV0IHRoZQo+IGtlcm5lbCBvZiBSSEVMOCBkcm9wcyBidHJmcyBmaWxlc3lzdGVtIGJlY2F1c2Ug
b2Ygc29tZSByZWFzb25zLgpJIGd1ZXNzIGZpbGVzeXN0ZW0gY2hhbmdlcyBhcmUgdGhlIG1vc3Qg
ZnJlcXVlbnQuIEJ1dCBhcyBJIHNhaWQsIEkgd291bGRuJ3QgbWluZCAKdGhpcyBpbXBsZW1lbnRh
dGlvbjoKdm9pZCBmc29wZW5fc3VwcG9ydGVkX2J5X2tlcm5lbCh2b2lkKQp7CglURVNUKHRzdF9z
eXNjYWxsKF9fTlJfZnNvcGVuLCBOVUxMLCAwKSk7CglpZiAoVFNUX1JFVCAhPSAtMSkKCQlTQUZF
X0NMT1NFKFRTVF9SRVQpOwp9Cgo+IEl0IGlzIGp1c3QgYSByZWFzb24gdXNlZCB0byBleHBsYWlu
IHdoeSBJIHdhbnQgdG8gZHJvcCB0aGUga2VybmVsIHZlcnNpb24KPiBjaGVjay4KCi4uLgoKPiA+
IEhvdyBhYm91dCB0byBjYWxsIHRoZSBmdW5jdGlvbiBwaWRmZF9vcGVuX3N1cHBvcnRlZF9ieV9r
ZXJuZWwoKT8KCj4gT0sKCj4gPiBUaGFuIHlvdSBjYW4gcmVtb3ZlIHRoZSBjb21tZW50ICh3aGlj
aCBCVFcgc2hvdWxkIHVzZSBDIHN0eWxlIC8qICovKS4KCj4gT0sKCj4gPiBBbmQgSU1ITyB5b3Ug
ZG9uJ3QgaGF2ZSB0byBhc3NpZ24gcGlkZmQgdG8gLTEuCgo+IEluIHBpZGZkX29wZW5fc3VwcG9y
dGVkX2J5X2tlcm5lbCgpLCBkbyB5b3Ugd2FudCB0byBkcm9wICdwaWRmZCA9IC0xJwo+IGRpcmVj
dGx5IG9yIGRyb3AgJ3BpZGZkID0gLTEnIGJ5IHVzaW5nIFRFU1QoKT8KSSBtZWFudCAoYXMgaXQn
cyBhbHdheXMgYXNzaWduZWQgYnkgdGhlIGNhbGwsIGl0J3MganVzdCBhIG5pdC4pOgotaW50IHBp
ZGZkID0gLTE7CitpbnQgcGlkZmQ7CgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
