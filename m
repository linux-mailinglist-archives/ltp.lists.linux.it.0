Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF030B96E
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 09:18:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A4583C7450
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 09:18:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5F0BB3C0EC2
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 09:18:27 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C0F2A600916
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 09:18:26 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id A84399F761;
 Tue,  2 Feb 2021 08:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1612253904; bh=YPnaH4RoOM/9QfDm3jbfkY8TU6ENbYMMdwtd1ZU22Fo=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=s6CAJ3ERJMot56VBOm2hhl8jrFAqm+vY3t0Gn3ZciA9etfpo2Xn0uXLLpEnYIRFbM
 jINbnr6zhehiPCphZvpEaDQblAzYQDFgLBv2HiFq9Mlz6B2ScdMoPiaCuNj2lHYvqv
 6ubSbDL1tqTybFbeMuejk0hM9kB4xit71rC4/re8=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210202074753.31516-1-pvorel@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <47060cdf-58a3-2568-3508-31436b9c6e12@jv-coder.de>
Date: Tue, 2 Feb 2021 09:19:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202074753.31516-1-pvorel@suse.cz>
Content-Language: en-US
X-Spam-Status: No, score=-0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC PATCH 1/1] tst_test.sh: Run cleanup also on timeout
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpPbiAyLzIvMjAyMSA4OjQ3IEFNLCBQZXRyIFZvcmVsIHdyb3RlOgo+IEFsc28gdGltZW91
dCByZXF1aXJlcyB0byBydW4gYSB0ZXN0IGNsZWFudXAgKGUuZy4genJhbTAxLnNoKS4KPiBUaHVz
IHNlbmQgZmlyc3QgU0lHSU5ULCBidXQga2VlcCBhbHNvIFNJR0tJTEwgZm9yIHNhZmV0eSByZWFz
b25zCj4gKGFmdGVyIDUgc2VjIHRvIGdpdmUgY2xlYW51cCBmdW5jdGlvbiBzb21lIHRpbWUuCisx
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9saWIvdHN0X3Rlc3Quc2ggYi90ZXN0Y2FzZXMvbGli
L3RzdF90ZXN0LnNoCj4gaW5kZXggNjlmMDA3ZDg5Li4zNWFkNmQyZDcgMTAwNjQ0Cj4gLS0tIGEv
dGVzdGNhc2VzL2xpYi90c3RfdGVzdC5zaAo+ICsrKyBiL3Rlc3RjYXNlcy9saWIvdHN0X3Rlc3Qu
c2gKPiBAQCAtMjEsNyArMjEsNyBAQCBleHBvcnQgVFNUX0xJQl9MT0FERUQ9MQo+ICAgLiB0c3Rf
c2VjdXJpdHkuc2gKPiAgIAo+ICAgIyBkZWZhdWx0IHRyYXAgZnVuY3Rpb24KPiAtdHJhcCAidHN0
X2JyayBUQlJPSyAndGVzdCBpbnRlcnJ1cHRlZCciIElOVAo+ICt0cmFwICJ0c3RfYnJrIFRCUk9L
ICd0ZXN0IGludGVycnVwdGVkIG9yIHRpbWVvdXQnIiBJTlQKc2hvdWxkIGJlICJ0aW1lZCBvdXQi
IGZvciBjb25zaXN0ZW5jeQo+ICAgCj4gICBfdHN0X2RvX2V4aXQoKQo+ICAgewo+IEBAIC00NTks
NyArNDU5LDcgQEAgX3RzdF9zZXR1cF90aW1lcigpCj4gICAKPiAgIAl0c3RfcmVzIFRJTkZPICJ0
aW1lb3V0IHBlciBydW4gaXMgJHtofWggJHttfW0gJHtzfXMiCj4gICAKPiAtCXNsZWVwICRzZWMg
JiYgdHN0X3JlcyBUQlJPSyAidGVzdCBraWxsZWQsIHRpbWVvdXQhIElmIHlvdSBhcmUgcnVubmlu
ZyBvbiBzbG93IG1hY2hpbmUsIHRyeSBleHBvcnRpbmcgTFRQX1RJTUVPVVRfTVVMID4gMSIgJiYg
a2lsbCAtOSAtJHBpZCAmCj4gKwlzbGVlcCAkc2VjICYmIHRzdF9yZXMgVEJST0sgInRlc3Qga2ls
bGVkLCB0aW1lb3V0ISBJZiB5b3UgYXJlIHJ1bm5pbmcgb24gc2xvdyBtYWNoaW5lLCB0cnkgZXhw
b3J0aW5nIExUUF9USU1FT1VUX01VTCA+IDEiICYmIHsga2lsbCAtMiAtJHBpZDsgc2xlZXAgNTsg
a2lsbCAtOSAtJHBpZDsgfSAmCkNhbiB3ZSBtb3ZlIHRoZSB0aW1lb3V0IGhhbmRsaW5nIHRvIGEg
c2VwYXJhdGUgZnVuY3Rpb24/IFRoaXMgaXMgZ2V0dGluZyAKYSB0aW55IGJpdCB1bnJlYWRhYmxl
Li4uCkNhbiB0aGlzIHdvcms/OgpfdHN0X2hhbmRsZV90aW1lb3V0KCkKewogwqDCoMKgIHRzdF9y
ZXMgVEJST0sgLi4uCiDCoMKgwqAga2lsbCAuLi4uCn0KLi4uCnNsZWVwICRzZWMgJiYgX3RzdF9o
YW5kbGVfdGltZW91dCAmCgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
