Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA91B85D
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 16:34:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50F523EA523
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 16:34:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id F227F3EA4FF
 for <ltp@lists.linux.it>; Mon, 13 May 2019 16:34:17 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D50C3200AF6
 for <ltp@lists.linux.it>; Mon, 13 May 2019 16:34:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A58CABE9;
 Mon, 13 May 2019 14:34:15 +0000 (UTC)
Date: Mon, 13 May 2019 16:34:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190513143413.GA4568@dell5510>
References: <20190510043845.4977-1-xzhou@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510043845.4977-1-xzhou@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: linux-cifs@vger.kernel.org, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] safe_setuid: skip if testing on CIFS
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTXVycGh5LAoKPiBBcyBDSUZTIGlzIG5vdCBzdXBwb3J0aW5nIHNldHVpZCBvcGVyYXRpb25z
LgpBbnkgcmVmZXJlbmNlIHRvIHRoaXM/CmZzL2NpZnMvY2lmc2ZzLmMgYW5kIG90aGVyIHBhcnRz
IG9mIGtlcm5lbCBjaWZzIHdvcmtzIHdpdGggQ0lGU19NT1VOVF9TRVRfVUlELgpBbHNvIHNhbWJh
X3NldHJldWlkKCkgZnJvbSBsaWIvdXRpbC9zZXRpZC5jIGZyb20gc2FtYmEgZ2l0IChJIGd1ZXNz
IHVzZWQgaW4Kc2FtYmEgbGlicmFyaWVzIHdvcmtzIHdpdGggU1lTX3NldHJldWlkIHN5c2NhbGwg
b3Igc2V0cmV1aWQoKSBsaWJjIHdyYXBwZXIuCldoYXQgYW0gSSBtaXNzaW5nPwoKPiBkaWZmIC0t
Z2l0IGEvbGliL3RzdF9zYWZlX21hY3Jvcy5jIGIvbGliL3RzdF9zYWZlX21hY3Jvcy5jCj4gaW5k
ZXggMGU1OWEzZjk4Li4zNjk0MWVjMGIgMTAwNjQ0Cj4gLS0tIGEvbGliL3RzdF9zYWZlX21hY3Jv
cy5jCj4gKysrIGIvbGliL3RzdF9zYWZlX21hY3Jvcy5jCj4gQEAgLTExMSw2ICsxMTEsNyBAQCBp
bnQgc2FmZV9zZXRyZXVpZChjb25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQgbGluZW5vLAo+ICAJ
CSAgdWlkX3QgcnVpZCwgdWlkX3QgZXVpZCkKPiAgewo+ICAJaW50IHJ2YWw7Cj4gKwlsb25nIGZz
X3R5cGU7Cgo+ICAJcnZhbCA9IHNldHJldWlkKHJ1aWQsIGV1aWQpOwo+ICAJaWYgKHJ2YWwgPT0g
LTEpIHsKPiBAQCAtMTE5LDYgKzEyMCwxMyBAQCBpbnQgc2FmZV9zZXRyZXVpZChjb25zdCBjaGFy
ICpmaWxlLCBjb25zdCBpbnQgbGluZW5vLAo+ICAJCQkgKGxvbmcpcnVpZCwgKGxvbmcpZXVpZCk7
Cj4gIAl9Cgo+ICsJZnNfdHlwZSA9IHRzdF9mc190eXBlKCIuIik7Cj4gKwlpZiAoZnNfdHlwZSA9
PSBUU1RfQ0lGU19NQUdJQykgewo+ICsJCXRzdF9icmtfKGZpbGUsIGxpbmVubywgVENPTkYsCj4g
KwkJCSAic2V0cmV1aWQgaXMgbm90IHN1cHBvcnRlZCBvbiAlcyBmaWxlc3lzdGVtIiwKPiArCQkJ
IHRzdF9mc190eXBlX25hbWUoZnNfdHlwZSkpOwo+ICsJfQpJIGd1ZXNzIHRoaXMgY2hlY2sgc2hv
dWxkIGJlIGJlZm9yZSBzZXRyZXVpZCgpIEFzIGl0J3MgaW4gc2FmZV9zZXRldWlkKCkgYW5kCnNh
ZmVfc2V0dWlkKCkKPiArCj4gIAlyZXR1cm4gcnZhbDsKPiAgfQoKS2luZCByZWdhcmRzLApQZXRy
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
