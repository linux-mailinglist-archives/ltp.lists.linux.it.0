Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B67A1B6CC0
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 06:43:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF37F3C28F8
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 06:43:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4D6D13C28EF
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 06:43:17 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 5104D1A00805
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 06:43:14 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,310,1583164800"; d="scan'208";a="90079786"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Apr 2020 12:43:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E55584BCC883;
 Fri, 24 Apr 2020 12:32:28 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Apr 2020 12:43:06 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1586429086-22975-9-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200422135856.GB5529@yuki.lan>
 <124d3b91-2025-d36e-f3b1-6c0b5528ae51@cn.fujitsu.com>
 <9084aae3-e98a-918d-9a0d-bdbe7da76f87@cn.fujitsu.com>
Message-ID: <46c50e18-faec-a428-6fcc-ffc3515b29dd@cn.fujitsu.com>
Date: Fri, 24 Apr 2020 12:43:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <9084aae3-e98a-918d-9a0d-bdbe7da76f87@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E55584BCC883.AE7A6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 09/10] syscalls/ioctl_loop07: Add dio with
 logic block size error test
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

SGkgQ3lyaWwKCgo+IEhpIEN5cmlsCj4gCj4+IEhpIEN5cmlsCj4+Cj4+Cj4+PiBIaSEKPj4+IFRo
aXMgdGVzdCBmYWlscyBmb3IgbWUsIGkuZS4gdGhlIGF0dGVtcHQgdG8gZW5hYmUgZGlyZWN0IElP
IHN1Y2NlZWRzLiBJCj4+PiB3aWxsIGhhdmUgdG8gaGF2ZSBhIGNsb3NlciBsb29rIGxhdGVyIG9u
Lgo+PiBOb3csIEkgdXNlIDUuNy4wLXJjMiBrZXJuZWwgdG8gdGVzdCwgdGhpcyBjYXNlIGZhaWxz
LCBJIGd1ZXNzIGxvb3AgCj4+IGRyaXZlciBoYXMgY2hhbmdlZCBpdHMgbG9naWMuIEkgYW0gdHJ5
aW5nLgo+IAo+IEkgd3JpdGUgdGhpcyB0ZXN0IG9uIGZlZG9yYTMxKHRtcCBkaXJlY3RvcnkgdXNl
IHRtcGZzKSwgc28gSSBnb3QgYSAKPiBwc2V1ZG8gcGFzcyB3aGVuIHNldHRpbmcgZGlvLgo+IAo+
IEkgbWlzdW5kZXJzdG9vZCB0aGUgbWVhbmluZyBvZiB0aGUgY29tbWVudCBpbiB0aGUga2VybmVs
Lgo+IGtlcm5lbCBjb21tZXQgYXMgYmVsb3c6Cj4gIldlIHN1cHBvcnQgZGlyZWN0IEkvTyBvbmx5
IGlmIGxvX29mZnNldCBpcyBhbGlnbmVkIHdpdGggdGhlCj4gbG9naWNhbCBJL08gc2l6ZSBvZiBi
YWNraW5nIGRldmljZSwgYW5kIHRoZSBsb2dpY2FsIGJsb2NrCj4gc2l6ZSBvZiBsb29wIGlzIGJp
Z2dlciB0aGFuIHRoZSBiYWNraW5nIGRldmljZSdzIGFuZCB0aGUgbG9vcAo+IG5lZWRuJ3QgdHJh
bnNmb3JtIHRyYW5zZmVyLiIKPiAKPiBzYl9ic2l6ZSA9IGJkZXZfbG9naWNhbF9ibG9ja19zaXpl
KGlub2RlLT5pX3NiLT5zX2JkZXYpO8KgIC8vZ2V0IGJsb2NrIAo+IHNpemUgZnJvbSBiYWNraW5n
IGRldmljZQo+IGRpb19hbGlnbiA9IHNiX2JzaXplIC0gMTsKPiAKPiBJIHVzZSBsb2dpYyBibG9j
ayBzaXplIG9mIGxvb3AoMTAyNCA+IDUxMikgLCBzbyB0aGlzIHRlc3QgcGFzcy4KPiAKPiBOb3cs
IEkgdGhpbmsgdGhpcyB0ZXN0IGlzIG1lYW5pbmdsZXNzIGFuZCB3ZSBjYW4gcmVtb3ZlIHRoaXMu
Cj4gCj4gQmVzdCBSZWdhcmRzCj4gWWFuZyBYdQo+Pgo+PiBwczogd2hlbiBydW4gaW9jdGxfbG9v
cDAxLmMsIEkgYWxzbyBtZXQgYW5vdGhlciBwcm9ibGVtIHRoYXQgCj4+IC9kZXYvbG9vcDBwMSBh
bmTCoCB0aGUgY29ycmVzcG9uZGluZyBzeXMgZmlsZSBkb2Vzbid0IGV4aXN0ZWQuIGRtZXNnIAo+
PiByZXBvcnQgZXJyb3IgImxvb3BfcmVyZWFkX3BhcnRpdGlvbnM6IHBhcnRpdGlvbiBzY2FuIG9m
IGxvb3AwICgpIAo+PiBmYWlsZWQgKHJjPS0xNikiLiBBbHNvIHRyeWluZyAuCktlcm5lbCBjb21t
aXQgZDNlZjU1MzYyKCJibG9jazogZml4IGJ1c3kgZGV2aWNlIGNoZWNraW5nIGluIApibGtfZHJv
cF9wYXJ0aXRpb25zIikgIGFuZCBjb21taXQgY2I2Yjc3MWIwNSgiYmxvY2s6IGZpeCBidXN5IGRl
dmljZSAKY2hlY2tpbmcgaW4gYmxrX2Ryb3BfcGFydGl0aW9ucyBhZ2FpbiIpIGludHJvZHVjZWQg
dGhpcyAKZmFpbHVyZShpb2N0bF9sb29wMDEsIEVCVVNZIGVycm9yKS4gbW9yZSBpbmZvIHNlZVsx
XQoKWzFdaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNC8yMy8zODAKPj4+CgoKCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
