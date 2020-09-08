Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B25260C2F
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 09:37:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 021163C53CC
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 09:37:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 417793C093E
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 09:37:19 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 1F6956008E3
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 09:37:17 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; d="scan'208";a="98997955"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 15:37:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id DDC3E48990E5;
 Tue,  8 Sep 2020 15:37:14 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 15:37:13 +0800
To: Cyril Hrubis <chrubis@suse.cz>, <ltp@lists.linux.it>
References: <20200908073138.GB2475@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <6bbac309-b13d-2703-7b48-b8beffe04256@cn.fujitsu.com>
Date: Tue, 8 Sep 2020 15:37:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908073138.GB2475@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DDC3E48990E5.AEE06
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ3lyaWwKCgo+IEhpIQo+IEFzIHVzdWFsIHdlIHNob3VsZCBzdGFydCBwcmVwYXJpbmcgZm9y
IGEgbmV4dCByZWxlYXNlLgo+IAo+IEFzIHVzdWFsbCB3ZSB3aWxsIGhhdmUgYSB3ZWVrIG9yIHR3
byB3aGVyZSB3ZSBzaG91bGQgbWVyZ2UgZXZlcnRoaW5nCj4gdGhhdCBzaG91bGQgZ28gaW4gYmVm
b3JlIHRoZSByZWxlYXNlLCB0aGVuIGdpdCBmcmVlemUgZm9yIGFub3RoZXIgd2Vlawo+IGFuZCBm
aW5hbGx5IGEgcmVsZWFzZS4KPiAKPiBTbyBsZXQncyBzdGFydCB3aXRoIGEgbGlzdCBvZiB0aGlu
Z3MgdGhhdCBzaG91bGQgZ28gaW4uCj4gCj4gRm9yIG1lIGl0IHdvdWxkIGJlOgo+IAo+ICogcHRy
YWNlMDggZml4Cj4gCj4gKiBpZiBwb3NzaWJsZSB0aGUgc2htY3RsKCkgcmV3cml0ZQo+IAo+IAo+
IFdoYXQgZWxzZSBzaG91bGQgZ28gaW4/CkZvciBtZSwgdGhyZWUgcGF0Y2hlczoKMS5zeXNjYWxs
cy9pb2N0bF9sb29wMDcuY6O6VXNpbmcgTE9PUF9DT05GSUdVUkUgdG8gdGVzdCBsb19zaXplbGlt
aXQgZmllbGQKMi5zeXNjYWxscy9tc2dyY3YwNzogQWRkIGZ1bmN0aW9uYWwgdGVzdCBmb3IgTVNH
X0NPUFkgZmxhZwozLnN5c2NhbGxzL21zZ3JjdjAzOiBBZGQgZXJyb3IgdGVzdCBmb3IgTVNHX0NP
UFkgZmxhZwoKQmVzdCBSZWdhcmRzCllhbmcgWHUKPiAKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
