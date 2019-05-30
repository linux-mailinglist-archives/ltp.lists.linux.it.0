Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED1430046
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 18:40:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 069EC3EA641
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 18:40:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 93D543EA0C4
 for <ltp@lists.linux.it>; Thu, 30 May 2019 18:40:17 +0200 (CEST)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 694E214017C4
 for <ltp@lists.linux.it>; Thu, 30 May 2019 18:40:10 +0200 (CEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R301e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=caspar@linux.alibaba.com; NM=1;
 PH=DS; RN=3; SR=0; TI=SMTPD_---0TT1NYN9_1559234406; 
Received: from linux.alibaba.com(mailfrom:caspar@linux.alibaba.com
 fp:SMTPD_---0TT1NYN9_1559234406) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 31 May 2019 00:40:06 +0800
Date: Fri, 31 May 2019 00:40:05 +0800
From: Caspar Zhang <caspar@linux.alibaba.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190530164005.GB57736@linux.alibaba.com>
References: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
 <20190530151843.GA25602@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530151843.GA25602@rei>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.5 required=7.0 tests=ENV_AND_HDR_SPF_MATCH,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Caspar Zhang <caspar@linux.alibaba.com>, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH 1/3] tst_test: fix again when test has both TPASS
 and TCONF
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

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDU6MTg6NDNQTSArMDIwMCwgQ3lyaWwgSHJ1YmlzIHdy
b3RlOgo+IEhpIQo+ID4gQ29uc2lkZXIgdGhpcyBzaXR1YXRpb246IHdlIGdldCBvbmx5IFRQQVNT
IGFuZCBUQ09ORiBpbiB0ZXN0Cj4gPiByZXN1bHRzLCBhbmQgdGhlIGxhc3Qgc3RhdHVzIGhhcHBl
bnMgdG8gYmUgVFBBU1MsIHRoZSBjaGVjawo+ID4gY29uZGl0aW9uIGluIGNvbW1pdCBmZWNkZDg4
NWViNGIgKCJ0c3RfdGVzdDogRml4IGV4aXQgdmFsdWUgb24KPiA+IHRzdF9icmsoVENPTkYsIC4u
LikiIHdvbid0IHdvcmsuIEZpeCBpdCBieSByZW1vdmluZyB1bm5lY2Vzc2FyeQo+ID4gVENPTkYg
Y2hlY2suCj4KPiBXaGF0IGlzIHRoZSBleGFjdCBzZXF1ZW5jZSBvZiB0aGUgdHN0X3JlcygpL3Rz
dF9icmsoKSBjYWxscyBsZWFkaW5nIHRvCj4gdGhpcz8KPgo+IEJlY2F1c2UgaWYgdGhlIHRlc3Qg
ZnVuY3Rpb24gaGFzIGV4aXR0ZWQgd2l0aCAwIHRoZSBkb19leGl0KCkgZnVuY3Rpb24KPiB3b3Vs
ZCBiZSBwYXNzZWQgMCBhbmQgdGhhdCBjYXNlIGlzIGhhbmRsZWQgYWxyZWFkeToKPgo+IAlpZiAo
cmVzdWx0cy0+c2tpcHBlZCAmJiAhcmVzdWx0cy0+cGFzc2VkKQo+IAkJcmV0IHw9IFRDT05GOwoK
SG1tLi4uIHlvdSBhcmUgcmlnaHQsIHRoZSBvcmlnaW5hbCBmaXggd2FzIGFic29sdXRlbHkgY29y
cmVjdC4gUGxlYXNlCmZlZWwgZnJlZSB0byBpZ25vcmUgdGhpcyBwYXRjaC4gU29ycnkgZm9yIHRo
ZSBub2lzZSA7LSkKClRoYW5rcywKQ2FzcGFyCgoKPgo+ID4gRml4ZXM6IDUzOTBkNmVhMzY1NyAo
ImxpYi90c3RfdGVzdDogUmVwb3J0IDAgaWYgdGVzdCBoYXMgYm90aCBUUEFTUyBhbmQgVENPTkYi
KQo+ID4gU2lnbmVkLW9mZi1ieTogQ2FzcGFyIFpoYW5nIDxjYXNwYXJAbGludXguYWxpYmFiYS5j
b20+Cj4gPiAtLS0KPiA+ICBsaWIvdHN0X3Rlc3QuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbGli
L3RzdF90ZXN0LmMgYi9saWIvdHN0X3Rlc3QuYwo+ID4gaW5kZXggMmQ4OGFkYmQ3Li44YmExMjJm
YmUgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvdHN0X3Rlc3QuYwo+ID4gKysrIGIvbGliL3RzdF90ZXN0
LmMKPiA+IEBAIC01OTQsNyArNTk0LDcgQEAgc3RhdGljIHZvaWQgZG9fZXhpdChpbnQgcmV0KQo+
ID4gIAkJcHJpbnRmKCJza2lwcGVkICAlZFxuIiwgcmVzdWx0cy0+c2tpcHBlZCk7Cj4gPiAgCQlw
cmludGYoIndhcm5pbmdzICVkXG4iLCByZXN1bHRzLT53YXJuaW5ncyk7Cj4gPgo+ID4gLQkJaWYg
KHJlc3VsdHMtPnBhc3NlZCAmJiByZXQgPT0gVENPTkYpCj4gPiArCQlpZiAocmVzdWx0cy0+cGFz
c2VkKQo+ID4gIAkJCXJldCA9IDA7Cj4KPiAtLQo+IEN5cmlsIEhydWJpcwo+IGNocnViaXNAc3Vz
ZS5jegoKLS0KICAgICAgICBUaGFua3MsCiAgICAgICAgQ2FzcGFyCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
