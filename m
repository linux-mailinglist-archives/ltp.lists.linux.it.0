Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 864FF1F4AE2
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 03:28:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BC763C0262
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 03:28:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9A4313C01FA
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 03:28:56 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 61E7A1400192
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 03:28:54 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,494,1583164800"; d="scan'208";a="94209247"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jun 2020 09:28:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6589F4CE14E1;
 Wed, 10 Jun 2020 09:28:49 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Jun 2020 09:28:48 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <57a1c19e-d8e5-4389-8565-20e49f144657@G08CNEXMBPEKD05.g08.fujitsu.local>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <78176e41-03c4-e75b-594b-20731b2d4dfd@cn.fujitsu.com>
Date: Wed, 10 Jun 2020 09:28:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <57a1c19e-d8e5-4389-8565-20e49f144657@G08CNEXMBPEKD05.g08.fujitsu.local>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6589F4CE14E1.AD7F4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] LIB: Use INTERNAL_LIB for ltp lib
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0cgoKTm90aGluZyBibG9ja3MgdGhpcyBzaW1wbGUgcGF0Y2gsIEkgZ3Vlc3Mgd2UgY2Fu
IGRpcmVjdGx5IHB1c2ggdGhpcyAKcGF0Y2goZG9uJ3QgZm9yZ2V0IGphbidzIGFja2VkLWJ5KS4K
CkJlc3QgUmVnYXJkcwpZYW5nIFh1Cj4gSGkgcGV0cgo+IGp1c3QgcmVwbHkgZm9yIHlvdXIg4oCc
R2l2ZW4gSmFuIGFja2VkIHYxLCBJJ2QgYmUgYWxzbyBmb3IgbWVyZ2XigJ3vvIwgdjIgaXMgT0su
Cj4gCj4gQmVzdCBSZWdhcmRzCj4gWWFuZyBYdQo+IAo+IAo+IC0tLU9yaWdpbmFsLS0tCj4gKkZy
b206KiAiUGV0ciBWb3JlbCI8cHZvcmVsQHN1c2UuY3o+Cj4gKkRhdGU6KiBNb24sIEp1biA4LCAy
MDIwIDE5OjQxIFBNCj4gKlRvOiogIllhbmcgWHUiPHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5j
b20+Owo+ICpDYzoqICJsdHAiPGx0cEBsaXN0cy5saW51eC5pdD47Cj4gKlN1YmplY3Q6KiBSZTog
W0xUUF0gW1BBVENIIHYyXSBMSUI6IFVzZSBJTlRFUk5BTF9MSUIgZm9yIGx0cCBsaWIKPiAKPiBI
acKgWHUsCj4gCj4gID7CoD7CoEN5cmlswqBjb25jZXJuZWTCoDNyZMKgcGFydHnCoHVzZcKgb2bC
oGxpYi9saWJsdHAuYSzCoGJ1dMKgbm9ib2R5wqBjb21wbGFpbmVkLgo+ICA+wqA+wqBHaXZlbsKg
SmFuwqBhY2tlZMKgdjEswqBJJ2TCoGJlwqBhbHNvwqBmb3LCoG1lcmdlLgo+IAo+ICA+wqDCoFdl
wqBhbHNvwqBzaG91bGTCoGluY2x1ZGXCoGFuZHJvaWRfbGlicHRocmVhZMKgYW5kwqBhbmRyb2lk
X2xpYnJ0wqBNYWtlZmlsZS4KPiBOb3TCoHN1cmXCoHdoYXTCoHlvdcKgbWVhbi7CoFlvdcKgZGlk
wqB0aGXCoGNoYW5nZcKgaW7CoGFuZHJvaWRfbGlicHRocmVhZMKgYW5kCj4gYW5kcm9pZF9saWJy
dMKgTWFrZWZpbGXCoCh0aGlzwqBpc8KgdjLCoHRocmVhZCkswqB0aHVzwqBJwqBjb25zaWRlcsKg
dGhpc8KgcGF0Y2jCoHJlYWR5Lgo+IE9ywqBhbcKgScKgbWlzc2luZ8Kgc29tZXRoaW5nPwo+IAo+
IEtpbmTCoHJlZ2FyZHMsCj4gUGV0cgo+IAo+IC0tIAo+IE1haWxpbmfCoGxpc3TCoGluZm86wqBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAoKCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
