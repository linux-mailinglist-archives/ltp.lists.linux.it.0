Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CED4CDEB13
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 13:37:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FA2B3C25AE
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 13:37:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 954EF3C25B9
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 13:37:16 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D17521A00E3C
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 13:37:11 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,323,1566835200"; d="scan'208";a="77276171"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Oct 2019 19:37:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 9CB4940925DD
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 19:29:10 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 21 Oct 2019 19:36:56 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 21 Oct 2019 19:36:58 +0800
Message-ID: <1571657822-31421-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 9CB4940925DD.AC4FE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] optimize quotactl code
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8KCkkgY2xlYW51cCB0aGUgcXVvdGFjdGwgY29kZS4gClJlbW92ZSB1c2VsZXNzIGx0cC14
ZnNfcXVvdGEubTQgYW5kIHJld3JpdGluZyBsdHBfcXVvdGEubTQuIEFsc28gYWRkIFFfR0VUTkVY
VFFVT1RBIGFuZCBRX1hHRVRRU1RBVFYgZmxhZwp0ZXN0LiAKClRoZSBidWlsZCB0cmF2aXMtY2kg
bG9nIGFzIGJlbG93OgpodHRwczovL3RyYXZpcy1jaS5vcmcveHV5YW5nMDQxMC9sdHAvam9icy82
MDA2NTg2NTUKCkl0IGJ1aWxkIGZhaWxlZCBvbiBzb21lIGxpbnV4IGRpc3RyaWJ1dGlvbnMgYmVj
YXVzZSBxdW90YWN0bCBmdW5jdGlvbiByZXR1cm4gdmFsdWUgaXMgZGlmZmVyZW50LiBJbiBzeXMv
cXVvdGEuaCBpdCBpcyBpbnQsCmluIGxpbnV4L3F1b3RhLmggaXMgbG9uZy4gSSB1c2UgbGludXgv
cXVvdGEuaCBiZWNhdXNlIEkgd2FudCB0byB1c2UgaWZfbmV4dGRxYmxrIHN0cnVjdCB0byB0ZXN0
IFFfR0VUTkVYUVVPVEEKZmxhZy4gSSBkb3VidCB3aGV0aGVyIEkgbmVlZCB0byBmaXggdGhlIGJ1
aWxkIGVycm9yIGJ5IGN1c3RvbSBkZWZpbmUgdGhlIGlmX25leHRkcWJsayBzdHJ1Y3Qgb3IgaXQg
aXMgYSBvbGQga2VybmVsCnVuY29tcGF0aWJsZSBidWcgSSBkb24ndCBuZWVkIHRvIGZpeC4KCnBz
OgpJIGFtIHdyaXRpbmcgcXVvdGFjdGwgdGVzdGNhc2VzIGFib3V0IHByb2plY3QgcXVvdGEgZm9y
ICM1MjkuIApJIHdpbGwgc2VuZCBpdCB0b21vcnJvdy4KCllhbmcgWHUgKDQpOgogIHN5c2NhbGxz
L3F1b3RhY3RsOiBEb24ndCB1c2UgbHRwLXF1b3RhLm00CiAgbTQvbHRwLXhmc19xdW90YS5tNDog
UmVtb3ZlIHVzZWxlc3MgbHRw4oCUeGZzX3F1b3RhLm00CiAgc3lzY2FsbHMvcXVvdGFjdGwwMS5j
OiBBZGQgUV9HRVRORVhRVU9UQSB0ZXN0CiAgc3lzY2FsbHMvcXVvdGFjdGwwMi5jOiBBZGQgUV9Y
R0VUUVNUQVRWIHRlc3QKCiBjb25maWd1cmUuYWMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0KIGluY2x1ZGUvbGFwaS9xdW90YWN0bC5oICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyNyArKy0tCiBtNC9sdHAtcXVvdGEubTQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMzYgKy0tLS0KIG00L2x0cC14ZnNfcXVvdGEubTQgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyMyAtLS0KIC4uLi9rZXJuZWwvc3lzY2FsbHMvcXVvdGFjdGwvcXVvdGFjdGww
MS5jICAgICB8IDEzMyArKysrKysrKysrLS0tLS0tLS0KIC4uLi9rZXJuZWwvc3lzY2FsbHMvcXVv
dGFjdGwvcXVvdGFjdGwwMi5jICAgICB8ICA4OSArKysrKysrKysrLS0KIC4uLi9rZXJuZWwvc3lz
Y2FsbHMvcXVvdGFjdGwvcXVvdGFjdGwwMy5jICAgICB8ICAyMiArKy0KIDcgZmlsZXMgY2hhbmdl
ZCwgMTc2IGluc2VydGlvbnMoKyksIDE1NiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtNC9sdHAteGZzX3F1b3RhLm00CgotLSAKMi4xOC4wCgoKCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
