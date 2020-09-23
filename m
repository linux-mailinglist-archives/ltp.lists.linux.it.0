Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 516952754C8
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:50:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1154A3C4D4A
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:50:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 23D0A3C101E
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:50:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CBEC9600A73
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:50:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CFF6ACB8;
 Wed, 23 Sep 2020 09:50:48 +0000 (UTC)
Date: Wed, 23 Sep 2020 11:50:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200923095009.GA31351@dell5510>
References: <20200923094625.30601-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923094625.30601-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] recvmmsg01: Fix compilation
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Filip.Bozuta@syrmia.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgp0aGlzIGlzIHdyb25nLCBYYW8ncyBzb2x1dGlvbiBpcyBiZXR0ZXI6Cmh0dHA6Ly9saXN0
cy5saW51eC5pdC9waXBlcm1haWwvbHRwLzIwMjAtU2VwdGVtYmVyLzAxOTA2MC5odG1sCgpLaW5k
IHJlZ2FyZHMsClBldHIKCj4gdm9pZCogY2Fubm90IGJlIGRpcmVjdGx5IHVzZWQsIGl0IG11c3Qg
YmUgcG9pbnRpbmcgdG8gdGhlIHN0cnVjdC4KCj4gcmVjdm1tc2cwMS5jOjg2Ojk6IGVycm9yOiBy
ZXF1ZXN0IGZvciBtZW1iZXIg4oCYdHlwZeKAmSBpbiBzb21ldGhpbmcgbm90IGEKPiBzdHJ1Y3R1
cmUgb3IgdW5pb24KPiAgIHRpbWVvdXQudHlwZSA9IHR2LT50c190eXBlOwoKPiBGaXhlczogMTM1
YWY4ZWRlICgic3lzY2FsbHMve3NlbmR8cmVjdn1tbXNnOiBhZGQgYSB0ZXN0IGNhc2UgZm9yIHRp
bWVvdXQKPiBhbmQgZXJybm8gdGVzdCIpCgo+IFJlcG9ydGVkLWJ5OiBMaSBXYW5nIDxsaXdhbmdA
cmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4K
PiAtLS0KPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9yZWN2bW1zZy9yZWN2bW1zZzAxLmMg
fCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3JlY3ZtbXNnL3Jl
Y3ZtbXNnMDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcmVjdm1tc2cvcmVjdm1tc2cw
MS5jCj4gaW5kZXggZmU2Mzc0MzBiLi5hMTZhNzhmOWIgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9yZWN2bW1zZy9yZWN2bW1zZzAxLmMKPiArKysgYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3JlY3ZtbXNnL3JlY3ZtbXNnMDEuYwo+IEBAIC02NSw3ICs2NSw4IEBA
IHN0YXRpYyB2b2lkIGRvX3Rlc3QodW5zaWduZWQgaW50IGkpCj4gIHsKPiAgCXN0cnVjdCB0aW1l
NjRfdmFyaWFudHMgKnR2ID0gJnZhcmlhbnRzW3RzdF92YXJpYW50XTsKPiAgCXN0cnVjdCB0ZXN0
X2Nhc2UgKnRjID0gJnRjYXNlW2ldOwo+IC0Jdm9pZCAqcmN2X21zZ3ZlYywgKnRpbWVvdXQ7Cj4g
KwlzdHJ1Y3QgdHN0X3RzIHQ7Cj4gKwl2b2lkICpyY3ZfbXNndmVjLCAqdGltZW91dCA9ICZ0OwoK
PiAgCXRzdF9yZXMoVElORk8sICJjYXNlICVzIiwgdGMtPmRlc2MpOwoKPiBAQCAtODMsNyArODQs
NyBAQCBzdGF0aWMgdm9pZCBkb190ZXN0KHVuc2lnbmVkIGludCBpKQo+ICAJbWVtc2V0KHJjdjEt
Pmlvdl9iYXNlLCAwLCByY3YxLT5pb3ZfbGVuKTsKPiAgCW1lbXNldChyY3YyLT5pb3ZfYmFzZSwg
MCwgcmN2Mi0+aW92X2xlbik7Cgo+IC0JdGltZW91dC50eXBlID0gdHYtPnRzX3R5cGU7Cj4gKwko
KHN0cnVjdCB0c3RfdHMqKXRpbWVvdXQpLT50eXBlID0gdHYtPnRzX3R5cGU7Cj4gIAl0c3RfdHNf
c2V0X3NlYygmdHMsIHRjLT50dl9zZWMpOwo+ICAJdHN0X3RzX3NldF9uc2VjKCZ0cywgdGMtPnR2
X25zZWMpOwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
