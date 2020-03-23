Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E88DF18F22A
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:52:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D60D3C4E68
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:52:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AC7543C0796
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:52:48 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 32E65600A4D
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:52:46 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,295,1580745600"; d="scan'208";a="86904688"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Mar 2020 17:52:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id BAF8B49DF125;
 Mon, 23 Mar 2020 17:42:30 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Mar 2020 17:52:42 +0800
To: Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
 <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
Date: Mon, 23 Mar 2020 17:52:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BAF8B49DF125.A031C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGkKCgo+IEhpIFBldHIsCj4gCj4gT24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgOTo1MCBQTSBQ
ZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jego+IDxtYWlsdG86cHZvcmVsQHN1c2UuY3o+PiB3cm90
ZToKPiAKPiAgICAgU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3ogPG1h
aWx0bzpwdm9yZWxAc3VzZS5jej4+Cj4gICAgIC0tLQo+ICAgICAgwqB0ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL2FkZF9rZXkvYWRkX2tleTA1LmPCoCDCoHwgMTUgKystLS0tLS0tLS0tLS0tCj4g
ICAgICDCoHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcXVvdGFjdGwvcXVvdGFjdGwwMS5jIHwg
MTQgKystLS0tLS0tLS0tLS0KPiAgICAgIMKgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9xdW90
YWN0bC9xdW90YWN0bDA2LmMgfCAxMiArLS0tLS0tLS0tLS0KPiAKPiAKPiBBcGFydCBmcm9tIHRo
ZSB0aHJlZSwgZG8geW91IGNvbnNpZGVyIGNvbnZlcnRpbmcgdG8gU0FGRV9SVU5DTUQgZm9yIHRo
ZSAKPiByZXN0IHRlc3RjYXNlcz8KPiAoaXQgc2VlbXMgbm90IHRvbyBtdWNoIHdvcmsgcmVtYWlu
aW5nIHNpbmNlIG9ubHkgYSBmZXcgdGVzdCBjYXNlIHVzZXMgCj4gdHN0X3J1bl9jbWQpCkF0IHRo
ZSBiZWdpbm5pbmcsIEkgaGF2ZSB0aGUgc2FtZSBpZGVhLiBCdXQgYWZ0ZXIgc2VlaW5nIGNvZGUs
IEkgdGhpbmsgCndlIHNob3VsZCBub3QgYmVjYXVzZSB0aGVzZSBjYXNlcyBoYXZlIG1hbnkgc3Vi
IHRlc3RzKG9ubHkgZmV3IHRlc3QgCmRlcG9uZHMgb24gdGhlIHJlc3VsdCBvZiB0aGUgY21kIGV4
ZWN1dGlvbi4KPiAKPiBrZXJuZWwvc3lzY2FsbHMvc2V0cHJpb3JpdHkvc2V0cHJpb3JpdHkwMS5j
Ck9uZSB5ZWFyIGFnbyBoYXMgYSBjb21taXQgZGI4MmI1OTYoc2V0cHJpb3JpdHkwMTogU2tpcCBv
bmx5IFBSSU9fVVNFUiAKd2hlbiB1bmFibGUgdG8gYWRkIHRlc3QgdXNlcikuIEl0IG9ubHkgYWZm
ZWN0cyBQUklPX1VTRVIgc3ViIHRlc3QuCj4ga2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5n
ZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jCm9ubHkgYWZmZWN0IHRlc3Q2IGFuZCB0ZXN0NwogIDYpIFRy
eSB0byBjb3B5IGNvbnRlbnRzIHRvIGEgZmlsZSBjaGF0dHJlZCB3aXRoICtpCiAgKiAgICBmbGFn
IC0+IEVQRVJNCiAgKiA3KSBUcnkgdG8gY29weSBjb250ZW50cyB0byBhIHN3YXBmaWxlIC0+RVRY
VEJTWQoKCkJlc3QgUmVnYXJkcwpZYW5nIFh1Cgo+IC4uLgo+IAo+IAo+IC0tIAo+IFJlZ2FyZHMs
Cj4gTGkgV2FuZwo+IAo+IAoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
