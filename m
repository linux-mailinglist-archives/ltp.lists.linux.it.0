Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 533343FC085
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 03:36:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1E3E3C9B4F
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 03:36:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D01D13C2B34
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 03:36:35 +0200 (CEST)
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7054B600706
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 03:36:32 +0200 (CEST)
X-QQ-mid: bizesmtp52t1630373787th1hdc0r
Received: from [10.4.23.46] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 31 Aug 2021 09:36:26 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00A0000000
X-QQ-FEAT: CBgi6aaeY4cvIX39/iJWabm1OhmBIvZSVanj+wuVIHONH4j8WFVxDK3TD9EEX
 LP6ahDll31txJeQoqq+Rn8F0v3mxuKaSok6FqqwY2/3SCrvIEzBZYJs8TTgfqw4TBq4e5v7
 pXXmQkjBAL+ERKD89qHmk6x55MGbgxxmU3AEJlfPFpDNkHuSAZOnBDR6b9buVVpDOVnYmfP
 nX1hWyhoKgTjfEmL6GpT0j5u24HkbA7PmEFSHMgBBubu/4oQc0ThM6S848JcE+ORKMeV9rR
 I48RGlLVLJjV/IP9xUUnmXSVIPdT1flzczE++vVc0tEPU83zm1TE70khwXCF9Xi1iAEaSdk
 taLI3Yljwisa1Waakyh2uq4BNHvig==
X-QQ-GoodBg: 2
To: Li Wang <liwang@redhat.com>
References: <20210830073544.19620-1-zhanglianjie@uniontech.com>
 <CAEemH2c=nZJCJk7_NbqQZNs83OpXaZPRyoJsOuWb=OmHjW9fhQ@mail.gmail.com>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <58d78453-3da7-2967-1be5-38c2bf18fad1@uniontech.com>+507A182ECF4F4635
Date: Tue, 31 Aug 2021 09:36:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2c=nZJCJk7_NbqQZNs83OpXaZPRyoJsOuWb=OmHjW9fhQ@mail.gmail.com>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_test_macros: Add test_macros06 tests
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

SGksCkkgd2lsbCBmaXggaXQsIHRoYW5rcyBmb3IgeW91ciByZXZpZXcuCgpPbiAyMDIxLTA4LTMw
IDIwOjE1LCBMaSBXYW5nIHdyb3RlOgo+IAo+IAo+IE9uIE1vbiwgQXVnIDMwLCAyMDIxIGF0IDM6
MzYgUE0gemhhbmdsaWFuamllIDx6aGFuZ2xpYW5qaWVAdW5pb250ZWNoLmNvbSAKPiA8bWFpbHRv
OnpoYW5nbGlhbmppZUB1bmlvbnRlY2guY29tPj4gd3JvdGU6Cj4gCj4gICAgIFRlc3QgdGhlIFRT
VF9FWFBfVkFMIGFuZCBUU1RfRVhQX1ZBTF9TSUxFTlQgbWFjcm9zLgo+IAo+ICAgICBTaWduZWQt
b2ZmLWJ5OiB6aGFuZ2xpYW5qaWUgPHpoYW5nbGlhbmppZUB1bmlvbnRlY2guY29tCj4gICAgIDxt
YWlsdG86emhhbmdsaWFuamllQHVuaW9udGVjaC5jb20+Pgo+IAo+ICAgICBkaWZmIC0tZ2l0IGEv
bGliL25ld2xpYl90ZXN0cy8uZ2l0aWdub3JlIGIvbGliL25ld2xpYl90ZXN0cy8uZ2l0aWdub3Jl
Cj4gICAgIGluZGV4IGEwYmFkNzhjMS4uY2Y0NjdiNWEwIDEwMDY0NAo+ICAgICAtLS0gYS9saWIv
bmV3bGliX3Rlc3RzLy5naXRpZ25vcmUKPiAgICAgKysrIGIvbGliL25ld2xpYl90ZXN0cy8uZ2l0
aWdub3JlCj4gICAgIEBAIC00Miw2ICs0Miw3IEBAIHRlc3RfbWFjcm9zMDIKPiAgICAgIMKgdGVz
dF9tYWNyb3MwMwo+ICAgICAgwqB0ZXN0X21hY3JvczA0Cj4gICAgICDCoHRlc3RfbWFjcm9zMDUK
PiAgICAgK3Rlc3RfbWFjcm9zMDYKPiAgICAgIMKgdHN0X2Z1enp5X3N5bmMwMQo+ICAgICAgwqB0
c3RfZnV6enlfc3luYzAyCj4gICAgICDCoHRzdF9mdXp6eV9zeW5jMDMKPiAgICAgZGlmZiAtLWdp
dCBhL2xpYi9uZXdsaWJfdGVzdHMvdGVzdF9tYWNyb3MwNi5jCj4gICAgIGIvbGliL25ld2xpYl90
ZXN0cy90ZXN0X21hY3JvczA2LmMKPiAgICAgbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAgICAgaW5k
ZXggMDAwMDAwMDAwLi42MjZmMjMzZDIKPiAgICAgLS0tIC9kZXYvbnVsbAo+ICAgICArKysgYi9s
aWIvbmV3bGliX3Rlc3RzL3Rlc3RfbWFjcm9zMDYuYwo+ICAgICBAQCAtMCwwICsxLDQwIEBACj4g
ICAgICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+ICAgICAr
LyoKPiAgICAgKyAqIENvcHlyaWdodCAoYykgMjAyMSB6aGFuZ2xpYW5qaWUgPHpoYW5nbGlhbmpp
ZUB1bmlvbnRlY2guY29tCj4gICAgIDxtYWlsdG86emhhbmdsaWFuamllQHVuaW9udGVjaC5jb20+
Pgo+ICAgICArICovCj4gICAgICsKPiAgICAgKy8qCj4gICAgICsgKiBUZXN0IFRTVF9FWFBfVkFM
IGFuZCBUU1RfRVhQX1ZBTF9TSUxFTlQgbWFjcm8uCj4gICAgICsgKi8KPiAgICAgKwo+ICAgICAr
I2luY2x1ZGUgInRzdF90ZXN0LmgiCj4gICAgICsKPiAgICAgK3N0YXRpYyBpbnQgZmFpbF92YWwo
dm9pZCkKPiAgICAgK3sKPiAgICAgK8KgIMKgIMKgIMKgZXJybm8gPSBFSU5WQUw7Cj4gICAgICvC
oCDCoCDCoCDCoHJldHVybiA0MjsKPiAgICAgK30KPiAgICAgKwo+ICAgICArc3RhdGljIGludCBw
YXNzX3ZhbCh2b2lkKQo+ICAgICArewo+ICAgICArwqAgwqAgwqAgwqByZXR1cm4gNDI7Cj4gICAg
ICt9Cj4gICAgICsKPiAgICAgK3N0YXRpYyB2b2lkIGRvX3Rlc3Qodm9pZCkKPiAgICAgK3sKPiAg
ICAgK8KgIMKgIMKgIMKgdHN0X3JlcyhUSU5GTywgIlRlc3RpbmcgVFNUX0VYUF9WQUwgbWFjcm8i
KTsKPiAgICAgK8KgIMKgIMKgIMKgVFNUX0VYUF9WQUwoZmFpbF92YWwoKSwgNDAsICJmYWlsX3Zh
bCgpIik7Cj4gICAgICvCoCDCoCDCoCDCoHRzdF9yZXMoVElORk8sICJUU1RfUEFTUyA9ICVpIiwg
VFNUX1BBU1MpOwo+ICAgICArwqAgwqAgwqAgwqBUU1RfRVhQX1ZBTChwYXNzX3ZhbCgpLCA0Miwg
ImZhaWxfdmFsKCkiKTsKPiAKPiAKPiBFcnIsIHRoZSBsYXN0IGZ1bmN0aW9uIG5hbWUgc2hvdWxk
IGJlIGNvcnJlY3RlZCB0byAicGFzc192YWwoKSIgb3IKPiBkZWxldGUgaXQgbGlrZSB0ZXN0X21h
Y3JvczA1Lgo+IAo+IFNvbWVvbmUgd2hvIG1lcmdlcyB0aGlzIGNhbiBoZWxwIGZpeCBpdC4KPiAK
PiAgICAgK8KgIMKgIMKgIMKgdHN0X3JlcyhUSU5GTywgIlRTVF9QQVNTID0gJWkiLCBUU1RfUEFT
Uyk7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgdHN0X3JlcyhUSU5GTywgIlRlc3RpbmcgVFNU
X0VYUF9QSURfU0lMRU5UIG1hY3JvIik7Cj4gICAgICvCoCDCoCDCoCDCoFRTVF9FWFBfVkFMX1NJ
TEVOVChmYWlsX3ZhbCgpLCA0MCwgImZhaWxfdmFsKCkiKTsKPiAgICAgK8KgIMKgIMKgIMKgdHN0
X3JlcyhUSU5GTywgIlRTVF9QQVNTID0gJWkiLCBUU1RfUEFTUyk7Cj4gICAgICvCoCDCoCDCoCDC
oFRTVF9FWFBfVkFMX1NJTEVOVChwYXNzX3ZhbCgpLCA0MiwgIiVzIiwgInBhc3NfdmFsKCkiKTsK
PiAgICAgK8KgIMKgIMKgIMKgdHN0X3JlcyhUSU5GTywgIlRTVF9QQVNTID0gJWkiLCBUU1RfUEFT
Uyk7Cj4gICAgICt9Cj4gICAgICsKPiAgICAgK3N0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9
IHsKPiAgICAgK8KgIMKgIMKgIMKgLnRlc3RfYWxsID0gZG9fdGVzdCwKPiAgICAgK307Cj4gICAg
IC0tCj4gICAgIDIuMjAuMQo+IAo+IAo+IAo+IAo+ICAgICAtLSAKPiAgICAgTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCj4gCj4gCj4gCj4gLS0g
Cj4gUmVnYXJkcywKPiBMaSBXYW5nCgotLSAKUmVnYXJkcywKWmhhbmcgTGlhbmppZQoKCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
