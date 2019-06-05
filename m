Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A67DA35628
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:19:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73E403EA690
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:19:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1B5293EA5DD
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:19:50 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C8AE51400DB5
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:19:46 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,550,1549900800"; d="scan'208";a="66043250"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Jun 2019 13:19:44 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 9CEDB4CDD456;
 Wed,  5 Jun 2019 13:19:43 +0800 (CST)
Received: from [10.167.215.39] (10.167.215.39) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 5 Jun 2019 13:19:38 +0800
Message-ID: <5CF750DF.9040006@cn.fujitsu.com>
Date: Wed, 5 Jun 2019 13:19:27 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Murphy Zhou <jencce.kernel@gmail.com>
References: <20190604082331.uunxtzshdgcnv4xg@XZHOUW.usersys.redhat.com>
 <20190605044215.19448-1-jencce.kernel@gmail.com>
In-Reply-To: <20190605044215.19448-1-jencce.kernel@gmail.com>
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: 9CEDB4CDD456.AD67E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/preadv2/preadv203: set mount_device
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

T24gMjAxOS8wNi8wNSAxMjo0MiwgTXVycGh5IFpob3Ugd3JvdGU6Cj4gTm93IHRoZSB0ZXN0cyBh
cmUgcnVubmluZyBpbiBNT1VOVFBPSU5UIHdpdGhvdXQgaXQgbW91bnRlZC4KPiBGYWlscyBvbiBl
eHQyOgpIaSBNdXJwaHksCgpEaWQgeW91IGdldCBFT1BOT1RTVVBQIHdoZW4gcnVubmluZyBwcmVh
ZHYyMDMgb24gZXh0Mj8KCkl0IHNlZW1zIE9LIHRvIHJ1bm5pbmcgcHJlYWR2MjAzIG9uIGV4dDIs
IGFzIGJlbG93OgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQp0c3RfdGVzdC5jOjExNzI6IElORk86IFRlc3Rpbmcgb24gZXh0Mgp0c3RfbWtm
cy5jOjkwOiBJTkZPOiBGb3JtYXR0aW5nIC9kZXYvbG9vcDAgd2l0aCBleHQyIG9wdHM9JycgZXh0
cmEgb3B0cz0nJwpta2UyZnMgMS40NC4zICgxMC1KdWx5LTIwMTgpCnRzdF90ZXN0LmM6MTExMTog
SU5GTzogVGltZW91dCBwZXIgcnVuIGlzIDBoIDA1bSAwMHMKcHJlYWR2MjAzLmM6MTQ1OiBJTkZP
OiBOdW1iZXIgb2YgZnVsbF9yZWFkcyA3NTEwNDQsIHNob3J0IHJlYWRzIDEwLCB6ZXJvCmxlbiBy
ZWFkcyAwLCBFQUdBSU4ocykgNjcwMjEKcHJlYWR2MjAzLmM6MTgwOiBJTkZPOiBOdW1iZXIgb2Yg
d3JpdGVzIDEwODc1NjAKcHJlYWR2MjAzLmM6MTk0OiBJTkZPOiBDYWNoZSBkcm9wcGVkIDE0OSB0
aW1lcwpwcmVhZHYyMDMuYzoyMjM6IFBBU1M6IEdvdCBzb21lIEVBR0FJTgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpCVFc6IEkgZ290IEVP
UE5PVFNVUFAgd2hlbiBydW5uaW5nIHByZWFkdjIwMyBvbiB0bXBmcy4gOi0pCgpCZXN0IFJlZ2Fy
ZHMsClhpYW8gWWFuZwo+ICAgICBwcmVhZHYyMDMuYyBkb2VzIG5vdCBzZXQgbW91bnRfZGV2aWNl
LCB3aGljaCBtYWtlcyBCUk9LOgo+ICAgICAgIHByZWFkdjIwMy5jOjEyMjogQlJPSzogcHJlYWR2
MigpIGZhaWxlZDogRU9QTk9UU1VQUAo+Cj4gU2lnbmVkLW9mZi1ieTogTXVycGh5IFpob3UgPGpl
bmNjZS5rZXJuZWxAZ21haWwuY29tPgo+IC0tLQo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L3ByZWFkdjIvcHJlYWR2MjAzLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4KPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmVhZHYyL3By
ZWFkdjIwMy5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmVhZHYyL3ByZWFkdjIwMy5j
Cj4gaW5kZXggODEwZDFlOGRiLi5lNGY2OGE1MWIgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9wcmVhZHYyL3ByZWFkdjIwMy5jCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9wcmVhZHYyL3ByZWFkdjIwMy5jCj4gQEAgLTI2MSw2ICsyNjEsNyBAQCBzdGF0
aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Cj4gIAkuY2xlYW51cCA9IGNsZWFudXAsCj4gIAku
dGVzdF9hbGwgPSB2ZXJpZnlfcHJlYWR2MiwKPiAgCS5tbnRwb2ludCA9IE1OVFBPSU5ULAo+ICsJ
Lm1vdW50X2RldmljZSA9IDEsCj4gIAkuYWxsX2ZpbGVzeXN0ZW1zID0gMSwKPiAgCS5uZWVkc190
bXBkaXIgPSAxLAo+ICAJLm5lZWRzX3Jvb3QgPSAxLAoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
