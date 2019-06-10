Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E303AF54
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 09:11:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29DF43EB01C
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 09:11:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8B7053EB011
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 09:11:32 +0200 (CEST)
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E63791000ACF
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 09:11:27 +0200 (CEST)
Received: by mail-ua1-x942.google.com with SMTP id o2so2144713uae.10
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 00:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lTtC8p64nfSEehaqmLSJKdkMUq0KbY7h5ZLV/W6eJKA=;
 b=d0QwJzIO18hZLn5E+W4EF8i25802M6jW3Z0BqqFLv02LpeWsbTXSTKrmRT7OqhfRTl
 kznlwARmnuLgMXXb6uXtEgRsED6Y4RI+ZeauMja3ZvPvbPyHt6D9tbe0dYTKFEAtq2hr
 b17MDRH+36430GzEHyR6Jdqze2eVdsRNrmDrko667K0CU/UNFkeCSyDv0jpLviFZlIg3
 FBUeAyV4q/aL4fIUdOuygj5Umbb+DIHC9DCLK3NZSMnrTfHCEsAAOkUmt6wSvPpYcb7Y
 sTClwrBDbHYl//gzOwYDK4G5QT7zDteAebuFphImuNSrEXxVxZDqjURiWFnJ6Ian5xPH
 XcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lTtC8p64nfSEehaqmLSJKdkMUq0KbY7h5ZLV/W6eJKA=;
 b=FXWGsjvnZMjaFQ5P/UTVoR3CF8d4pDnbp6e+6yut1hpRxlDBQdqTZSMONyukjK6428
 v/oEBO7rVZUNFuHMFc/oppRX8FthZm1sUcXomGEsFC31Lwdhb8kOD+xqow9MBO1Q+0Rd
 GAnar0wDXRMwm+OHIUWiL7+FYcVOZF2zjfQzJ3aNBcVXDd5hx0YyYYko5pwhP3r+GDnN
 sHB93aOqbNEfBKiQLCP6vAN42EfZsUUUkN7S2gavwt8+eMO2Azr06LwPngLoz0MxMLfT
 fs2cMlBJIbPAQ9d/JUL5wBjRWRvZ+sxAouhywig8dygbd29TWlrS8t8jMhZKE4+ZaYd8
 Mpiw==
X-Gm-Message-State: APjAAAVcc6Ol1en8iuFTONhFnQwVCj7E8MJYvoJb7yodRcWxTfvOyXpO
 0nW61oGIBPmqU5br8rveTYVt7cE4LzSFvW1YpkbaKg==
X-Google-Smtp-Source: APXvYqxD5XmuH0q+RXNCGUfZGACOBoXpeeKNpdjoJ22+rv8Xf0zgIqk5cXNRf3HyI23x+X5+IBRufXEjJDHRU1TqSJE=
X-Received: by 2002:ab0:4127:: with SMTP id j36mr31569218uad.125.1560150690516; 
 Mon, 10 Jun 2019 00:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <1551962651-22261-1-git-send-email-sumit.garg@linaro.org>
 <20190327144826.GA30619@rei>
 <CAFA6WYPxhVSub1SQyAk_51=NB0=yhjBfWPKdXoAjJB_TP0Za1Q@mail.gmail.com>
 <CAEemH2fHYLuCpBAiyNz8cmzyT0rTJcAF56Lj1W8g0nN9Tv-Afw@mail.gmail.com>
In-Reply-To: <CAEemH2fHYLuCpBAiyNz8cmzyT0rTJcAF56Lj1W8g0nN9Tv-Afw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 10 Jun 2019 12:41:19 +0530
Message-ID: <CAFA6WYNPgyyag1+rBK4P_JYQtMDY7TxkAyf+ZFW7WCWgo1DfKQ@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3] syscalls/sync_file_range: add partial file
	sync test-cases
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

T24gTW9uLCAxMCBKdW4gMjAxOSBhdCAwOTowMywgTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+
IHdyb3RlOgo+Cj4KPgo+IE9uIFRodSwgTWFyIDI4LCAyMDE5IGF0IDEyOjU3IFBNIFN1bWl0IEdh
cmcgPHN1bWl0LmdhcmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIFdlZCwgMjcgTWFyIDIw
MTkgYXQgMjA6MTgsIEN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6PiB3cm90ZToKPj4gPgo+
PiA+IEhpIQo+PiA+IFNvcnJ5IGZvciB0aGUgbG9uZyBkZWxheS4KPj4gPgo+PiA+IFRoaXMgaXMg
YWx0bW9zdCBwZXJmZWN0LCB0aGUgb25seSBwcm9ibGVtIGlzIHRoYXQgdGhlIHRoaXJkIHRlc3Qg
ZmFpbHMKPj4gPiBvbiB2ZmF0LiBBcyBmYXIgYXMgSSBjYW4gdGVsbCB0aGUgcmVhc29uIGlzIHRo
YXQgdmZhdCBkb2VzIG5vdCBzdXBwb3J0Cj4+ID4gc3BhcnNlIGZpbGVzLCBoZW5jZSBzZWVraW5n
IHRvIHRoZSBtaWRkbGUgb2YgZmlsZSBhbmQgd3JpdGluZyB0aGVyZSBhbHNvCj4+ID4gc2NoZWR1
bGxlcyBJL08gdG8gd3JpdGUgemVyb3MgZnJvbSB0aGUgc3RhcnQgb2YgdGhlIGZpbGUgdG8gdGhl
IG9mZnNldAo+PiA+IHdlIHN0YXJ0ZWQgd3JpdGluZyB0by4KPj4gPgo+Pgo+PiBIbW0sIEkgc2Vl
Lgo+Pgo+PiA+IEZvbGxvd2luZyB1Z2x5IHBhdGNoIHNvbHZlcyB0aGUgcHJvYmxlbToKPj4gPgo+
PiA+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N5bmNfZmlsZV9yYW5n
ZS9zeW5jX2ZpbGVfcmFuZ2UwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zeW5jX2Zp
bGVfcmFuZ2Uvc3luY19maWxlX3JhbmdlMDIuYwo+PiA+IGluZGV4IDMzNGVhNWU4OC4uNzc0NTI0
YzJmIDEwMDY0NAo+PiA+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3luY19maWxl
X3JhbmdlL3N5bmNfZmlsZV9yYW5nZTAyLmMKPj4gPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3N5bmNfZmlsZV9yYW5nZS9zeW5jX2ZpbGVfcmFuZ2UwMi5jCj4+ID4gQEAgLTQ1LDYg
KzQ1LDEyIEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9zeW5jX2ZpbGVfcmFuZ2Uoc3RydWN0IHRlc3Rj
YXNlICp0YykKPj4gPgo+PiA+ICAgICAgICAgZmQgPSBTQUZFX09QRU4odGMtPmZuYW1lLCBPX1JE
V1J8T19DUkVBVCwgTU9ERSk7Cj4+ID4KPj4gPiArICAgICAgIGlmICghc3RyY21wKHRzdF9kZXZp
Y2UtPmZzX3R5cGUsICJ2ZmF0IikpIHsKPj4gPiArICAgICAgICAgICAgICAgdHN0X3JlcyhUSU5G
TywgIlByZS1maWxsaW5nIGZpbGUiKTsKPj4gPiArICAgICAgICAgICAgICAgdHN0X2ZpbGxfZmQo
ZmQsIDAsIHRjLT53cml0ZV9vZmYsIDEpOwo+PiA+ICsgICAgICAgICAgICAgICBmc3luYyhmZCk7
Cj4+ID4gKyAgICAgICB9Cj4+ID4gKwo+PiA+ICAgICAgICAgbHNlZWsoZmQsIHRjLT53cml0ZV9v
ZmYsIFNFRUtfU0VUKTsKPj4gPgo+PiA+Cj4+ID4gU28gZWl0aGVyIHdlIGxpbWl0IHRoZSB0ZXN0
cyBzbyB0aGF0IHRoZSBzeW5jIHJlZ2lvbiBkb2VzIG5vdCBvdmVybGFwIHdpdGggdGhlCj4+ID4g
cG9zc2libGUgaG9sZSBhdCB0aGUgc3RhcnQgb2YgdGhlIGZpbGUgYW5kIGxvb3NlIHNvbWUgdGVz
dCBjb3ZlcmFnZS4KPj4gPgo+PiA+IE9yIHdlIGNhbiBhZGQgYSBmdW5jdGlvbiB0byB0aGUgdGVz
dCBsaWJyYXJ5IHRoYXQgd291bGQgcmV0dXJuIHRydWUvZmFsc2UgaWYKPj4gPiBzcGFyc2UgZmls
ZXMgYXJlIHN1cHBvcnRlZCBmb3IgYSBnaXZlbiBGUy4KPj4gPgo+Pgo+PiBNeSBpbml0aWFsIHRo
b3VnaHQgYmVoaW5kIHRoaXMgdGVzdC1jYXNlIHdhcyB0byBydW4gc3luYyBvdmVyIGEgcmFuZ2UK
Pj4gd2hpY2ggaXMgcGFydGlhbGx5IHdyaXR0ZW4uIFRoZSBvdGhlciBwYXJ0aWFsIHJlZ2lvbiBu
b3QgYmVpbmcgd3JpdHRlbgo+PiBjb3VsZCBlaXRoZXIgYmUgYSBob2xlIG9yIGFscmVhZHkgc3lu
Y2VkIGRhdGEuIFNvIHByZS1maWxsIGZpbGUgaW4KPj4gY2FzZSBvZiB2ZmF0IGxvb2tzIHNhbmUg
b3B0aW9uLCBidXQgaG93IGFib3V0IGlmIHdlIGFkZCBwcmUtZmlsbCBhcwo+PiBwYXJ0IG9mIHNl
dHVwPyBTb21ldGhpbmcgbGlrZToKPgo+Cj4gSSB0aGluayB0aGlzIGlzIGEgYml0IGJldHRlci4g
Q291bGQgdSBzZW5kIGEgbmV3IHBhdGNoIHZlcnNpb24/Cj4KClN1cmUuIEJUVywgYXBvbG9naWVz
IGZvciB0aGUgZGVsYXkgYXMgSSB3YXMgYnVzeSB3aXRoIHNvbWUgb3RoZXIgdGFza3MuCgotU3Vt
aXQKCj4+Cj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3luY19maWxlX3Jhbmdl
L3N5bmNfZmlsZV9yYW5nZTAyLmMKPj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9z
eW5jX2ZpbGVfcmFuZ2Uvc3luY19maWxlX3JhbmdlMDIuYwo+PiBAQCAtODYsNiArODYsMTIgQEAg
c3RhdGljIHZvaWQgc2V0dXAodm9pZCkKPj4gIHsKPj4gICAgICAgICBpZiAoIWNoZWNrX3N5bmNf
ZmlsZV9yYW5nZSgpKQo+PiAgICAgICAgICAgICAgICAgdHN0X2JyayhUQ09ORiwgInN5bmNfZmls
ZV9yYW5nZSgpIG5vdCBzdXBwb3J0ZWQiKTsKPj4gKwo+PiArICAgICAgIGlmICghc3RyY21wKHRz
dF9kZXZpY2UtPmZzX3R5cGUsICJ2ZmF0IikpIHsKPj4gKyAgICAgICAgICAgICAgIHRzdF9yZXMo
VElORk8sICJQcmUtZmlsbGluZyBmaWxlIik7Cj4+ICsgICAgICAgICAgICAgICB0c3RfZmlsbF9m
aWxlKEZOQU1FMywgMCwgVFNUX01CLCBGSUxFX1NaX01CKTsKPj4gKyAgICAgICAgICAgICAgIHN5
bmMoKTsKPj4gKyAgICAgICB9Cj4+ICB9Cj4+Cj4+IC1TdW1pdAo+Pgo+PiA+IC0tCj4+ID4gQ3ly
aWwgSHJ1YmlzCj4+ID4gY2hydWJpc0BzdXNlLmN6Cj4+Cj4+IC0tCj4+IE1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo+Cj4KPgo+IC0tCj4gUmVn
YXJkcywKPiBMaSBXYW5nCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
