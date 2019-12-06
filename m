Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1F114C4C
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 07:13:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22B813C2436
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 07:13:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 793703C2422
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 07:13:32 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CFE2A1402FBD
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 07:13:31 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 335039F7F0;
 Fri,  6 Dec 2019 06:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1575612810; bh=mCGqUStDAETTN1hhVIkY9yJtytRNAwoNuENyR2bVjl0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=knini1mStgf1FpA7hTdBBZ2CkRDDCaXlTSk6KFtv67UZrSx4PMlwbx2N5q8vSi+q4
 LNyyowruJN3qA7uvZnI53QKx/jpnbBXQlHaFvRG423NL1nJ0ddJQnA2kSQt4MJ7NTx
 LAYpQhkTwHxxPrYvn3CbuN4Tnr2MGs6hK6DaIIJw=
To: Petr Vorel <pvorel@suse.cz>, linux-rt-users@vger.kernel.org,
 rt@linutronix.de
References: <20191205135020.GA7951@dell5510>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <6a7fbfdf-4fda-70bb-01d8-19fb6218170d@jv-coder.de>
Date: Fri, 6 Dec 2019 07:13:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191205135020.GA7951@dell5510>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP realtime tests
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

SGkgUGV0ciwKCndlIGFyZSBydW5uaW5nIHRoZXNlIHRlc3RzIGFuZCBmcm9tIHdoYXQgSSd2ZSBz
ZWVuIHRoZSBxdWFsaXR5IGlzIHZlcnkgcG9vci4KV2UgaGFkIHRvIG1ha2UgY2hhbmdlcyB0byBh
IGxvdCBvZiB0aGVtIHRvIG1ha2UgdGhlbSBwYXNzIHJlbGlhYmx5Ogptb3N0IG9mIHRoZSB0ZXN0
czogTWlzc2luZyBjaGVja3Mgb2YgcmV0dXJuIHZhbHVlIGZvciBwdGhyZWFkIGZ1bmN0aW9uIAph
bmQgcmVzdWx0aW5nIGRlYWRsb2NrCnByaW8td2FrZSBhbmQgcHJpby1wcmVlbXB0OiBCb3VuZCB0
byBhIHNpbmdsZSBjcHUgY29yZQpzY2hlZF9mb290YmFsbDogTmVlZHMgYSBzbGVlcCB0byBydW4g
cmVsaWFibGUgKEkgc2VuZCBhIG1haWwgc29tZSB0aW1lIAphZ28gdG8gdGhpcyBtYWlsaW5nIGxp
c3QKcmVnYXJkaW5nIHRoZSB2YWxpZGl0eSBvZiB0aGUgdGVzdCwgd2hpY2ggZ290IGZvcndhcmRl
ZCB0byBsa21sIGJ5IApjeXJpbCwgYnV0IG5vIHJlcGx5KQoKU29tZSB0ZXN0cyBkbyBub3QgcmV0
dXJuIHRoZSBjb3JyZWN0IHJlc3VsdCBlLmcuOgp0ZXN0cGktNSwgdGVzdHBpLTYsIHNjaGVkX2pp
dHRlciwgZ3RvZF9sYXRlbmN5CgpJIGhhdmVuJ3QgcmVhbGx5IGxvb2tlZCBpbnRvIG1vc3Qgb2Yg
dGhlc2UgdGVzdHMuCgpKw7ZyZwoKQW0gMDUuMTIuMjAxOSB1bSAxNDo1MCBzY2hyaWViIFBldHIg
Vm9yZWw6Cj4gSGkgUlQgZm9sa3MsCj4KPiBsb29raW5nIGludG8gTFRQIHJlYWx0aW1lIHRlc3Rz
ICh0ZXN0Y2FzZXMvcmVhbHRpbWUvIFsxXSksCj4gdGhlIGNvZGUgY2VydGFpbmx5IGRlc2VydmVz
IGNsZWFudXAuCj4KPiBMb29raW5nIGF0IFsyXSwgaXQgZG9lcyBub3QgbWVudGlvbiB0aGVzZSB0
ZXN0cyBhdCBhbGwuCj4gQ2FuIGFueW9uZSBjb21tZW50IG9uIHJlbGV2YW5jZSBvZiB0aGVzZSB0
ZXN0cyB0byBjdXJyZW50IFJUPwo+IERvZXMgYW55b25lIHVzZSB0aGVzZSB0ZXN0cz8KPgo+IFRo
YW5rcyBmb3IgZmVlZGJhY2suCj4KPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+Cj4gWzFdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL3RyZWUvbWFzdGVyL3Rlc3RjYXNl
cy9yZWFsdGltZQo+IFsyXSBodHRwczovL2VsaW51eC5vcmcvUmVhbHRpbWVfVGVzdGluZ19CZXN0
X1ByYWN0aWNlcyNUZXN0X3Byb2dyYW1zCj4KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
