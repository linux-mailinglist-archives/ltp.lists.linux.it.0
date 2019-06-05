Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B73EA35678
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:55:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C9ED3EA6CD
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:55:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E12733EA2DC
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:55:39 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 0ADBF1A00CBF
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:55:37 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,550,1549900800"; d="scan'208";a="66047636"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Jun 2019 13:55:35 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 2ED194CDCCC4;
 Wed,  5 Jun 2019 13:55:36 +0800 (CST)
Received: from [10.167.215.39] (10.167.215.39) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 5 Jun 2019 13:55:33 +0800
Message-ID: <5CF75955.1090704@cn.fujitsu.com>
Date: Wed, 5 Jun 2019 13:55:33 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Murphy Zhou <jencce.kernel@gmail.com>
References: <5CF750DF.9040006@cn.fujitsu.com>
 <20190605053312.17369-1-jencce.kernel@gmail.com>
In-Reply-To: <20190605053312.17369-1-jencce.kernel@gmail.com>
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: 2ED194CDCCC4.ABE8C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/preadv2/preadv203: set mount_device
	flag
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

SGkgTXVycGh5LAoKUHVzaGVkLiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guIDotKQoKQmVzdCBSZWdh
cmRzLApYaWFvIFlhbmcKT24gMjAxOS8wNi8wNSAxMzozMywgTXVycGh5IFpob3Ugd3JvdGU6Cj4g
Tm93IHRoZSB0ZXN0cyBhcmUgcnVubmluZyBpbiBNT1VOVFBPSU5UIHdpdGhvdXQgaXQgbW91bnRl
ZC4gRmFpbHMgb24KPiBORlMsIGNpZnMsIHRtcGZzOgo+Cj4gICAgIHByZWFkdjIwMy5jIGRvZXMg
bm90IHNldCBtb3VudF9kZXZpY2UsIHdoaWNoIG1ha2VzIEJST0s6Cj4gICAgICAgcHJlYWR2MjAz
LmM6MTIyOiBCUk9LOiBwcmVhZHYyKCkgZmFpbGVkOiBFT1BOT1RTVVBQCj4KPiBTaWduZWQtb2Zm
LWJ5OiBNdXJwaHkgWmhvdSA8amVuY2NlLmtlcm5lbEBnbWFpbC5jb20+Cj4gLS0tCj4gdjM6Cj4g
ICBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlCj4gdjI6Cj4gICBzZXQgbW91bnRfZGV2aWNlIGluIHBy
ZWFkdjIwMy5jLCByYXRoZXIgdGhhbiBpbiB0aGUgbGlicmFyeQo+Cj4gIHRlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvcHJlYWR2Mi9wcmVhZHYyMDMuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L3ByZWFkdjIvcHJlYWR2MjAzLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByZWFkdjIv
cHJlYWR2MjAzLmMKPiBpbmRleCA4MTBkMWU4ZGIuLmU0ZjY4YTUxYiAxMDA2NDQKPiAtLS0gYS90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByZWFkdjIvcHJlYWR2MjAzLmMKPiArKysgYi90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByZWFkdjIvcHJlYWR2MjAzLmMKPiBAQCAtMjYxLDYgKzI2
MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPiAgCS5jbGVhbnVwID0gY2xl
YW51cCwKPiAgCS50ZXN0X2FsbCA9IHZlcmlmeV9wcmVhZHYyLAo+ICAJLm1udHBvaW50ID0gTU5U
UE9JTlQsCj4gKwkubW91bnRfZGV2aWNlID0gMSwKPiAgCS5hbGxfZmlsZXN5c3RlbXMgPSAxLAo+
ICAJLm5lZWRzX3RtcGRpciA9IDEsCj4gIAkubmVlZHNfcm9vdCA9IDEsCgoKCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
