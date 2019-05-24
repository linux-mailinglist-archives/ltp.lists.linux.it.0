Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F932939E
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 10:54:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CB103EA5FE
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 10:54:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E5C693EA17E
 for <ltp@lists.linux.it>; Fri, 24 May 2019 10:54:56 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C2DA6200055
 for <ltp@lists.linux.it>; Fri, 24 May 2019 10:54:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD982ADD9;
 Fri, 24 May 2019 08:54:54 +0000 (UTC)
Date: Fri, 24 May 2019 10:54:52 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190524085452.GB29592@dell5510>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510>
 <20190524043201.sxmkm6b7dixn2kuw@XZHOUW.usersys.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524043201.sxmkm6b7dixn2kuw@XZHOUW.usersys.redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] OVL_MNT: add setup_overlay helper
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTXVycGh5LAoKPiA+ID4gKwlyZXQgPSBtb3VudCgib3ZlcmxheSIsIE9WTF9NTlQsICJvdmVy
bGF5IiwgMCwgImxvd2VyZGlyPSJPVkxfTE9XRVIKPiA+ID4gKwkJICAgICIsdXBwZXJkaXI9Ik9W
TF9VUFBFUiIsd29ya2Rpcj0iT1ZMX1dPUkspOwo+ID4gPiArCWlmIChyZXQgPCAwKSB7Cj4gPiA+
ICsJCWlmIChlcnJubyA9PSBFTk9ERVYpIHsKPiA+ID4gKwkJCXRzdF9yZXMoVElORk8sCj4gPiA+
ICsJCQkJIm92ZXJsYXlmcyBpcyBub3QgY29uZmlndXJlZCBpbiB0aGlzIGtlcm5lbC4iKTsKPiA+
ID4gKwkJCXJldHVybiAxOwo+ID4gRmlyc3QgSSB0aG91Z2h0IHdlJ2QgaW1wbGVtZW50IGl0IGFz
IGEgdGVzdCBmbGFnIChtZW1iZXIgb2Ygc3RydWN0IHRzdF90ZXN0KS4KPiA+IFdoZW4gd2UgaGF2
ZSBpdCBhcyBzZXBhcmF0ZSBmdW5jdGlvbiBJIHdvbmRlciB3aGV0aGVyIHdlIGNvdWxkIFRDT05G
IG9uIEVOT0RFVgo+ID4gaW5zdGVhZCBvZiBUSU5GTyBhbmQgcmV0dXJuLiBNYXliZSB0aGVyZSBj
b3VsZCBiZSBoZXJlIGZvciBpbnQgc3RyaWN0IHBhcmFtZXRlciwKCj4gVGhlIHJldHVybiB2YWx1
ZSBpcyByZWZlcmVuY2VkIGluIHRoZSB0ZXN0Y2FzZSB0byBkZXRlcm1pbmUgd2hldGhlciB0byBy
dW4KPiB0ZXN0cyBpbiBvdmVybGF5ZnMuIEl0J3MgbmVlZGVkLgoKPiBJZiB0aGlzIHN0cmljdCBw
YXJhbWV0ZXIgaXMgb25seSBmb3IgZGlmZmVyZW50IHdvcmRpbmcgb24gTk9ERVYuIElzIGl0Cj4g
bmVjZXNzYXJ5ID8KCkknbGwgcmVjYXAgbXkgc3VnZ2VzdGlvbnM6CjEpIEkgbGlrZSBoYXZpbmcg
bWFjcm9zIHRvIGhlbHAgcmVkdWNlIHNvbWUgcGFyYW1ldGVycywgdGhpcyBkb2VzIG5vdCBibG9j
awpmdW5jdGlvbnMgYmVpbmcgZmxleGlibGUgKHdoaWNoIHJlcXVpcmVzIHBhcmFtZXRlcnMpLgoy
KSBIYXZpbmcgaGVscGVyIGZ1bmN0aW9uIGNyZWF0ZV9vdmVybGF5X2RpcnMoKSB1c2VkIHNlcGFy
YXRlbHksIHRoYW4gcGFyYW1ldGVyCmluIHNpbmdsZSBmdW5jdGlvbiAoQW1pciBbMV0gc3VnZ2Vz
dGlvbiBtYWtlcyBzZW5zZSkuCgpTb21ldGhpbmcgbGlrZSB0aGlzLCBqdXN0IGEgc3VnZ2VzdGlv
bjoKCmludCBjcmVhdGVfb3ZlcmxheV9kaXJzKCkKewoJU0FGRV9NS0RJUihPVkxfTE9XRVIsIDA3
NTUpOwoJLi4uCglyZXR1cm4gcmV0Owp9CgppbnQgbW91bnRfb3ZlcmxheShjb25zdCBjaGFyICpm
aWxlLCBjb25zdCBpbnQgbGluZW5vLCBpbnQgc2FmZSkKewoJLi4uCglpZiAoY3JlYXRlX292ZXJs
YXlfZGlycygpKQoJCXRzdF9icmsoVENPTkYsICIuLi4iKTsKCglyZXQgPSBtb3VudCgib3Zlcmxh
eSIsIE9WTF9NTlQsICJvdmVybGF5IiwgMCwgImxvd2VyZGlyPSJPVkxfTE9XRVIKCQkgICAgIix1
cHBlcmRpcj0iT1ZMX1VQUEVSIix3b3JrZGlyPSJPVkxfV09SSyk7CglpZiAocmV0IDwgMCkgewoJ
CWlmIChlcnJubyA9PSBFTk9ERVYpIHsKCQkJLyoKCQkJICogVE9ETzogbWF5YmUgc2FmZSBpcyBj
b25mdXNpbmcgYXMgd2UgdXNlIHRzdF9icmsoVEJST0sgYW55d2F5KSwKCQkJICogKyBzb21ldGlt
ZXMgdHN0X3JlcyhUQ09ORiwgLi4pIHdvdWxkIGJlIHByZWZlcnJlZCBvdmVyCgkJCSAqIHRzdF9i
cmsoVENPTkYsIC4uLikKCQkJICovCgkJCWlmIChzYWZlKQoJCQkJdHN0X2JyayhUQ09ORiwKCQkJ
CQkib3ZlcmxheWZzIGlzIG5vdCBjb25maWd1cmVkIGluIHRoaXMga2VybmVsLiIpOwoJCQl9IGVs
c2UgewoJCQkJdHN0X3JlcyhUSU5GTywKCQkJCQkib3ZlcmxheWZzIGlzIG5vdCBjb25maWd1cmVk
IGluIHRoaXMga2VybmVsLiIpOwoJCQkJcmV0dXJuIDE7CgkJCX0KCQl9CgkJdHN0X2JyayhUQlJP
SyB8IFRFUlJOTywgIm92ZXJsYXlmcyBtb3VudCBmYWlsZWQiKTsKCX0KfQoKI2RlZmluZSBTQUZF
X01PVU5UX09WRVJMQVkoKSBcCgltb3VudF9vdmVybGF5KF9fRklMRV9fLCBfX0xJTkVfXywgMSk7
CgojZGVmaW5lIFRTVF9NT1VOVF9PVkVSTEFZKCkgXAoJbW91bnRfb3ZlcmxheShfX0ZJTEVfXywg
X19MSU5FX18sIDApOwoKS2luZCByZWdhcmRzLApQZXRyCgpbMV0gaHR0cDovL2xpc3RzLmxpbnV4
Lml0L3BpcGVybWFpbC9sdHAvMjAxOS1NYXkvMDExOTgzLmh0bWwKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
