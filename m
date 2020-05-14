Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BDC1D2BAE
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 11:44:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7AA903C5454
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 11:44:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D0EAC3C5453
 for <ltp@lists.linux.it>; Thu, 14 May 2020 11:44:01 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 33168601652
 for <ltp@lists.linux.it>; Thu, 14 May 2020 11:43:59 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; d="scan'208";a="92051326"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 14 May 2020 17:43:56 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 61E0C4CE280C;
 Thu, 14 May 2020 17:43:55 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 May 2020 17:43:54 +0800
Message-ID: <5EBD12D9.70708@cn.fujitsu.com>
Date: Thu, 14 May 2020 17:43:53 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <5EBB5B3D.4020302@cn.fujitsu.com> <20200513092028.GA4598@dell5510>
 <5EBBCA12.5020901@cn.fujitsu.com> <20200513103032.GA18763@dell5510>
 <20200514073701.GA9562@dell5510>
In-Reply-To: <20200514073701.GA9562@dell5510>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 61E0C4CE280C.AB07C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjAyMC81LzE0IDE1OjM3LCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhpIFlhbmcsCj4KPiBvbmUg
bW9yZSBub3RlOgo+Cj4+PiBBcyBteSBwZXJ2aW91cyBtYWlsIHNhaWQsIEl0IGlzIGp1c3QgYSBw
b3NzaWJsZSBzaXR1YXRpb27vvIwgZm9yIGV4YW1wbGU6Cj4+PiBVcHN0cmVhbSBrZXJuZWwgaW50
cm9kdWNlcyBidHJmcyBmaWxlc3lzdGVtIGxvbmcgbG9uZyBhZ28gYnV0IHRoZQo+Pj4ga2VybmVs
IG9mIFJIRUw4IGRyb3BzIGJ0cmZzIGZpbGVzeXN0ZW0gYmVjYXVzZSBvZiBzb21lIHJlYXNvbnMu
Cj4+IEkgZ3Vlc3MgZmlsZXN5c3RlbSBjaGFuZ2VzIGFyZSB0aGUgbW9zdCBmcmVxdWVudC4gQnV0
IGFzIEkgc2FpZCwgSSB3b3VsZG4ndCBtaW5kCj4+IHRoaXMgaW1wbGVtZW50YXRpb246Cj4+IHZv
aWQgZnNvcGVuX3N1cHBvcnRlZF9ieV9rZXJuZWwodm9pZCkKPj4gewo+PiAJVEVTVCh0c3Rfc3lz
Y2FsbChfX05SX2Zzb3BlbiwgTlVMTCwgMCkpOwo+PiAJaWYgKFRTVF9SRVQgIT0gLTEpCj4+IAkJ
U0FGRV9DTE9TRShUU1RfUkVUKTsKPj4gfQo+IEJUVyB0aGUgc2FtZSBhcHByb2FjaCBpcyB1c2Vk
IGluIGluY2x1ZGUvbGFwaS9vcGVuYXQyLmgKPgo+IHZvaWQgb3BlbmF0Ml9zdXBwb3J0ZWRfYnlf
a2VybmVsKHZvaWQpCj4gewo+IAlpZiAoKHRzdF9rdmVyY21wKDUsIDYsIDApKTwgIDApIHsKPiAJ
CS8qIENoZWNrIGlmIHRoZSBzeXNjYWxsIGlzIGJhY2twb3J0ZWQgb24gYW4gb2xkZXIga2VybmVs
ICovCj4gCQlURVNUKHN5c2NhbGwoX19OUl9vcGVuYXQyLCAtMSwgTlVMTCwgTlVMTCwgMCkpOwo+
IAkJaWYgKFRTVF9SRVQgPT0gLTEmJiAgVFNUX0VSUiA9PSBFTk9TWVMpCj4gCQkJdHN0X2JyayhU
Q09ORiwgIlRlc3Qgbm90IHN1cHBvcnRlZCBvbiBrZXJuZWwgdmVyc2lvbjwgIHY1LjYiKTsKPiAJ
fQo+IH0KPgo+IGFuZCBjbG9uZTNfc3VwcG9ydGVkX2J5X2tlcm5lbCgpLiBCb3RoIG1lcmdlZCBi
eSBDeXJpbC4KPgo+IFRvIGJlIGhvbmVzdCBJIGxpa2UgdGhpcyBhcHByb2FjaCwgYmVjYXVzZSAx
KSBpdCBkZWZpbmVzIHdoZW4gbmV3IHN5c2NhbGwgd2FzCj4gYmFja3BvcnRlZApIaSBQZXRy77yM
CgpIbW0sIHRoZSByZWFzb24gc2VlbXMgYSBsaXR0bGUgd2VhaywgaXQgY2FuIGJlIGRvbmUgYnkg
YWRkaW5nIGEgCmNvbW1lbnQoZS5nLiAidGhlIHN5c2NhbGwgaXMgaW50cm9kdWNlZCBzaW5jZSB2
NS42LjAiKS4KCjIpIGlmIHRoZXJlIGlzIHJlYWxseSBwcm9ibGVtIHRoYXQgc29tZSBmdW5jdGlv
bmFsaXR5IHdhcyByZW1vdmVkLCB3ZQo+IGNhbiBhbHdheXMgaGFuZGxlIGl0LiBCdXQgSU1ITyB0
aGF0J3MgZ29pbmcgdG8gYmUgcmFyZSAoYnRyZnMgcmVtb3ZlZCBpbiBSSEVMIDgKPiBpcyBJTUhP
IGJlY2F1c2UgUkhFTCBkb2VzIG5vdCB3YW50IHRvIHN1cHBvcnQgaXQsIGJ1dCB0aGF0IHdvdWxk
IG5vdCBoYXBwZW4gZm9yCj4gc3lzY2FsbHMpLgoKV2l0aG91dCB0aGUgcmFyZSBzaXR1YXRpb24s
IEkgYWxzbyB0aGluayB0c3Rfc3lzY2FsbCgpIGlzIGVub3VnaCB0byAKY2hlY2sgdGhlIHN1cHBv
cnQgb2Ygc3lzY2FsbC4KCj4KPiBJJ2QgYWxzbyBsaWtlIHRvIGJlIGNvbnNpc3RlbnQgaG93IHdl
IGhhbmRsZSB0aGVzZSBuZXcgc3lzY2FsbHMuCkFncmVlZC4KCkkgYWxzbyB0aGluayBpZiB3ZSBj
YW4gaW1wbGVtZW50IGNvbW1vbiBmdW5jKGUuZy4gCnN5c2NhbGxfc3VwcG9ydGVkX2J5X2tlcm5l
bCgpKS4KCkJlc3QgUmVnYXJkcywKWGlhbyBZYW5nCj4KPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+
Cj4KPiAuCj4KCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
