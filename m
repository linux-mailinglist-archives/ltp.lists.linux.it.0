Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F098A720D16
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Jun 2023 04:01:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8020E3CE9D8
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Jun 2023 04:01:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 25FDE3CD2AC
 for <ltp@lists.linux.it>; Sat,  3 Jun 2023 04:01:20 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 374571A003C4
 for <ltp@lists.linux.it>; Sat,  3 Jun 2023 04:01:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685757677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zRf8avA7KV4EAM50dcQIcArd6vR2u6c9O/9qiQDECCk=;
 b=LdghSryVpdW9mci4LeeJMFBpOujcIcoWfbdJHVgxyDCHfoHCPlXVy9blUXUpla45OaOiko
 FfvI8TPH9ON8xop/TFCTQY22KqVd9bHSCEwGqjARHOsLjfefBEwv1Olw1wc7EWM99eGcE0
 HLPFVpnYRYPSKvXaD7xuHoNu6bUXrxQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-78OL4pPSPh-bRyll4lKMCQ-1; Fri, 02 Jun 2023 22:01:15 -0400
X-MC-Unique: 78OL4pPSPh-bRyll4lKMCQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b1bbe83720so429041fa.0
 for <ltp@lists.linux.it>; Fri, 02 Jun 2023 19:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685757674; x=1688349674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zRf8avA7KV4EAM50dcQIcArd6vR2u6c9O/9qiQDECCk=;
 b=TvCaBh6NpbN36BpsSuAnJ22j2S7887UdDjhH0QsK5apGba9BMdpfIPCl1oA0brMeOc
 GIKLddDOATPpLlOrQHu1iGASpA1f1S+xn/XZZXZKZht6aanA3fR0KguHfd1fYf/3B13P
 LXKJ1r7Sbbnn7gh0/aaHdyPvN3whJzSKqdQhYbsNnIsJpI60zf6M/Yk9Bnstsc6uG1Lu
 pBlX4wm35yrQS/5e0Ec+M06MCA2UYdLpnRInQPMw1wC/c0on56qGwrp7AVMCzoh4WUyP
 26Jd+shzms6ObdxOMLxOM2mTtYfz83IkZjEldJRA6u36f5V7NOya2xDmJOJkorBP6nIa
 sp8w==
X-Gm-Message-State: AC+VfDzmm2YuBtc+iNfeeZYXUMLsSB1hBKewRbzqJZ9240iTraSuCrQ4
 MhUxfss71tfD6U1vcT+Mqtq4RC02CCLhxsZPvXzjMC8IHCR8UdR0MTIbpAp0XrdYVjgEbXuKSro
 yb56UZLLCHv/P7sdCTeuPLcmQpW0=
X-Received: by 2002:a2e:9bc3:0:b0:2a8:ea26:607f with SMTP id
 w3-20020a2e9bc3000000b002a8ea26607fmr904168ljj.31.1685757673868; 
 Fri, 02 Jun 2023 19:01:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4I2xlB1O3ptQ0tADkZgfQqUJH4nMgi4wrk3reHxeBU6YvwnO5n6bYieleXB1142JbwJSLPi4cp3jO3NM4eniI=
X-Received: by 2002:a2e:9bc3:0:b0:2a8:ea26:607f with SMTP id
 w3-20020a2e9bc3000000b002a8ea26607fmr904165ljj.31.1685757673483; Fri, 02 Jun
 2023 19:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230601112214.18193-1-akumar@suse.de>
 <2266765.c7OTsSVgG4@localhost>
 <CAEemH2f0AvTGz9UuOnjjuQW4hF6jko4-AhURfd_Rx6m_=gjB_w@mail.gmail.com>
 <3069508.FjzGgX1xCW@localhost>
In-Reply-To: <3069508.FjzGgX1xCW@localhost>
From: Li Wang <liwang@redhat.com>
Date: Sat, 3 Jun 2023 10:01:01 +0800
Message-ID: <CAEemH2fGD8TaG8j1ETydgjCfSjaHM-VeRkfAd2wMg09sTqFd_A@mail.gmail.com>
To: Avinesh Kumar <akumar@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] fcntl30.c: Convert the test to new LTP API
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCBKdW4gMiwgMjAyMyBhdCA3OjIx4oCvUE0gQXZpbmVzaCBLdW1hciA8YWt1bWFyQHN1
c2UuZGU+IHdyb3RlOgoKPiBPbiBGcmlkYXksIEp1bmUgMiwgMjAyMyAxOjAyOjQ5IFBNIElTVCBM
aSBXYW5nIHdyb3RlOgo+ID4gT24gRnJpLCBKdW4gMiwgMjAyMyBhdCAzOjE04oCvUE0gQXZpbmVz
aCBLdW1hciA8YWt1bWFyQHN1c2UuZGU+IHdyb3RlOgo+ID4gPiBIaSBMaSwKPiA+ID4KPiA+ID4g
T24gRnJpZGF5LCBKdW5lIDIsIDIwMjMgODoxMDoxMSBBTSBJU1QgTGkgV2FuZyB3cm90ZToKPiA+
ID4gPiBPbiBUaHUsIEp1biAxLCAyMDIzIGF0IDc6MjLigK9QTSBBdmluZXNoIEt1bWFyIDxha3Vt
YXJAc3VzZS5kZT4gd3JvdGU6Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBdmluZXNoIEt1bWFy
IDxha3VtYXJAc3VzZS5kZT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4KPiA+ID4gPiA+ICB0ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzAuYyB8IDExMgo+ID4gPiA+ID4gICsr
KysrKystLS0tLS0tLS0tLS0tLS0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0
aW9ucygrKSwgNzYgZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBh
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzMC5jCj4gPiA+ID4gPiBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzMC5jCj4gPiA+ID4gPiBpbmRleCBj
NGMzZjgxZjEuLjYyY2MzOWU3MyAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzMC5jCj4gPiA+ID4gPiArKysgYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzAuYwo+ID4gPiA+ID4gQEAgLTEsMTAzICsxLDYzIEBA
Cj4gPiA+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ID4gPiA+
Cj4gPiA+ID4gPiAgLyoKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICogQ29weXJpZ2h0IChjKSAyMDE0
IEZ1aml0c3UgTHRkLgo+ID4gPiA+ID4gICAqIEF1dGhvcjogWGlhb2d1YW5nIFdhbmcgPHdhbmd4
Zy5mbnN0QGNuLmZ1aml0c3UuY29tPgo+ID4gPiA+ID4KPiA+ID4gPiA+IC0gKgo+ID4gPiA+ID4g
LSAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IKPiA+ID4KPiA+ID4gbW9kaWZ5Cj4gPiA+Cj4gPiA+ID4gPiBpdAo+ID4gPiA+ID4g
LSAqIHVuZGVyIHRoZSB0ZXJtcyBvZiB2ZXJzaW9uIDIgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlCj4gYXMKPiA+ID4gPiA+IC0gKiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbi4KPiA+ID4gPiA+IC0gKgo+ID4gPiA+ID4gLSAqIFRoaXMgcHJvZ3JhbSBp
cyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdvdWxkIGJlCj4gdXNlZnVsLAo+ID4g
Pgo+ID4gPiBidXQKPiA+ID4KPiA+ID4gPiA+IC0gKiBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0
aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCj4gPiA+ID4gPiAtICogTUVSQ0hBTlRB
QklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLgo+ID4gPiA+ID4gLSAq
Cj4gPiA+ID4gPiAtICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljCj4gTGljZW5zZQo+ID4gPiA+ID4gYWxvbmcKPiA+ID4gPiA+IC0gKiB3
aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uLAo+ID4gPgo+ID4gPiBJbmMuLAo+ID4gPgo+ID4gPiA+ID4gLSAqIDUxIEZyYW5rbGluIFN0
cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EuCj4gPiA+ID4gPiAr
ICogQ29weXJpZ2h0IChjKSAyMDIzIFNVU0UgTExDIEF2aW5lc2ggS3VtYXIgPAo+IGF2aW5lc2gu
a3VtYXJAc3VzZS5jb20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAqLwo+ID4gPiA+ID4KPiA+ID4g
PiA+IC0vKgo+ID4gPiA+ID4gLSAqIERlc2NyaXB0aW9uOgo+ID4gPiA+ID4gLSAqIFZlcmlmeSB0
aGF0LAo+ID4gPiA+ID4gLSAqICAgICBCYXNpYyB0ZXN0IGZvciBmY250bCgyKSB1c2luZyBGX1NF
VFBJUEVfU1osIEZfR0VUUElQRV9TWgo+ID4gPgo+ID4gPiBhcmd1bWVudC4KPiA+ID4KPiA+ID4g
PiA+ICsvKlwKPiA+ID4gPiA+ICsgKiBbRGVzY3JpcHRpb25dCj4gPiA+ID4gPiArICoKPiA+ID4g
PiA+ICsgKiBWZXJpZnkgdGhhdCwgZmV0Y2hpbmcgYW5kIGNoYW5naW5nIHRoZSBjYXBhY2l0eSBv
ZiBhIHBpcGUKPiB3b3JrcyBhcwo+ID4gPiA+ID4gKyAqIGV4cGVjdGVkIHdpdGggZmNudGwoMikg
c3lzY2FsbCB1c2luZyBGX0dFVFBJUEVfU1osIEZfU0VUUElQRV9TWgo+ID4gPiA+ID4gYXJndW1l
bnRzLgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgKi8KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtI2luY2x1
ZGUgPHN0ZGlvLmg+Cj4gPiA+ID4gPiAtI2luY2x1ZGUgPGVycm5vLmg+Cj4gPiA+ID4gPiAtI2lu
Y2x1ZGUgPHVuaXN0ZC5oPgo+ID4gPiA+ID4gLSNpbmNsdWRlIDxzdHJpbmcuaD4KPiA+ID4gPiA+
IC0jaW5jbHVkZSA8c2lnbmFsLmg+Cj4gPiA+ID4gPiAtI2luY2x1ZGUgPHN5cy90eXBlcy5oPgo+
ID4gPiA+ID4gLSNpbmNsdWRlIDxwd2QuaD4KPiA+ID4gPiA+IC0KPiA+ID4gPiA+IC0jaW5jbHVk
ZSAidGVzdC5oIgo+ID4gPiA+ID4gLSNpbmNsdWRlICJzYWZlX21hY3Jvcy5oIgo+ID4gPiA+ID4g
KyNpbmNsdWRlICJ0c3RfdGVzdC5oIgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAjaW5jbHVkZSAibGFw
aS9mY250bC5oIgo+ID4gPiA+ID4KPiA+ID4gPiA+IC1jaGFyICpUQ0lEID0gImZjbnRsMzAiOwo+
ID4gPiA+ID4gLWludCBUU1RfVE9UQUwgPSAxOwo+ID4gPiA+ID4gK3N0YXRpYyBpbnQgZmRzWzJd
Owo+ID4gPiA+ID4gK3N0YXRpYyBpbnQgbWF4X3NpemVfdW5wcml2Owo+ID4gPiA+ID4KPiA+ID4g
PiA+IC1zdGF0aWMgdm9pZCBzZXR1cCh2b2lkKTsKPiA+ID4gPiA+IC1zdGF0aWMgdm9pZCBjbGVh
bnVwKHZvaWQpOwo+ID4gPiA+ID4gLQo+ID4gPiA+ID4gLWludCBtYWluKGludCBhYywgY2hhciAq
KmF2KQo+ID4gPiA+ID4gK3N0YXRpYyB2b2lkIHJ1bih2b2lkKQo+ID4gPiA+ID4KPiA+ID4gPiA+
ICB7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLSAgICAgICBpbnQgbGM7Cj4gPiA+ID4gPiAtICAgICAg
IGludCBwaXBlX2Zkc1syXSwgdGVzdF9mZDsKPiA+ID4gPiA+IC0gICAgICAgaW50IG9yaWdfcGlw
ZV9zaXplLCBuZXdfcGlwZV9zaXplOwo+ID4gPiA+ID4gLQo+ID4gPiA+ID4gLQo+ID4gPiA+ID4g
LSAgICAgICB0c3RfcGFyc2Vfb3B0cyhhYywgYXYsIE5VTEwsIE5VTEwpOwo+ID4gPiA+ID4gKyAg
ICAgICBpbnQgb3JpZ19zaXplLCBuZXdfc2l6ZTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtICAgICAg
IHNldHVwKCk7Cj4gPiA+ID4gPiArICAgICAgIFNBRkVfUElQRShmZHMpOwo+ID4gPiA+ID4KPiA+
ID4gPiA+IC0gICAgICAgZm9yIChsYyA9IDA7IFRFU1RfTE9PUElORyhsYyk7IGxjKyspIHsKPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICB0c3RfY291bnQgPSAwOwo+ID4gPiA+ID4gKyAgICAgICBU
U1RfRVhQX1BPU0lUSVZFKGZjbnRsKGZkc1sxXSwgRl9HRVRQSVBFX1NaKSk7Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gLSAgICAgICAgICAgICAgIFNBRkVfUElQRShjbGVhbnVwLCBwaXBlX2Zkcyk7Cj4g
PiA+ID4gPiAtICAgICAgICAgICAgICAgdGVzdF9mZCA9IHBpcGVfZmRzWzFdOwo+ID4gPiA+ID4g
KyAgICAgICBvcmlnX3NpemUgPSBUU1RfUkVUOwo+ID4gPiA+ID4gKyAgICAgICBuZXdfc2l6ZSA9
IG9yaWdfc2l6ZSAqIDI7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIFRFU1Qo
ZmNudGwodGVzdF9mZCwgRl9HRVRQSVBFX1NaKSk7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAg
aWYgKFRFU1RfUkVUVVJOIDwgMCkgewo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
dHN0X2Jya20oVEZBSUwgfCBUVEVSUk5PLCBjbGVhbnVwLAo+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgImZjbnRsIGdldCBwaXBlIHNpemUgZmFpbGVkIik7Cj4gPiA+
ID4gPiAtICAgICAgICAgICAgICAgfQo+ID4gPiA+ID4gKyAgICAgICBpZiAobmV3X3NpemUgPiBt
YXhfc2l6ZV91bnByaXYpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgdHN0X2JyayhUQlJPSywg
IlJlcXVlc3RlZCBwaXBlIHNpemUgYWJvdmUgdGhlCj4gYWxsb3dlZAo+ID4gPiA+ID4gbGltaXQg
JWQiLCBtYXhfc2l6ZV91bnByaXYpOwo+ID4gPiA+Cj4gPiA+ID4gSXQgaXMgcG9zc2libGUgdGhh
dCB0aGUgcGlwZS1tYXgtc2l6ZSB2YWx1ZSB3YXMgc2V0IHRvIGEgc21hbGxlciBzaXplCj4gPiA+
ID4gc28gdGhhdCB0aGUgdGVzdCBnZXRzIGZhaWx1cmUgaGVyZS4gQnV0IGl0IHdvdWxkIG5vdCBi
ZSBhIHByb2JsZW0uCj4gPiA+Cj4gPiA+IERvIHlvdSBtZWFuIHRoZSBFUEVSTSBzY2VuYXJpbyB3
aGVuIHVucHJpdmlsZWdlZCBwcm9jZXNzIHRyeWluZyB0byBzZXQKPiB0aGUKPiA+ID4gc2l6ZSBs
YXJnZXIgdGhhbiB0aGUgdmFsdWUgaW4gL3Byb2Mvc3lzL2ZzL3BpcGUtbWF4LXNpemU/IGlmIHll
cywgdGhpcwo+IGlzCj4gPiA+IGJlaW5nIGNvdmVyZWQgaW4gZmNudGwzNy4KPiA+Cj4gPiBObywg
IGFzIHRoaXMgZmlsZSBhbGxvd3MgdXMgdG8gY29uZmlndXJlIHRoZSBtYXhpbXVtIHNpemUgb2Yg
dGhlCj4gPiBidWZmZXIgdXNlZCBmb3IgZGF0YSB0cmFuc2ZlciBiZXR3ZWVuIHByb2Nlc3NlcyB0
aHJvdWdoIHBpcGVzLgo+ID4KPiA+IEltYWdpbmUgdGhhdCwgaWYgYSB0ZXN0IG1hY2hpbmUgc2V0
IGl0IHdpdGggYSBzbWFsbGVyIHNpemUsIHRoaXMgdGVzdAo+ID4gd2lsbCBnZXQgYSBmYWlsdXJl
IGxpa2U6Cj4gb2theSwgc28gaW5zdGVhZCB3ZSBjYW4ganVzdCBkbyA/Cj4KPiAtICAgICAgIG5l
d19zaXplID0gb3JpZ19zaXplICogMjsKPiArICAgICAgIG5ld19zaXplID0gbWF4X3NpemVfdW5w
cml2Owo+Cj4gdGhpcyBzaG91bGQgYWx3YXlzIHRlc3QgdGhlIEZfU0VUUElQRV9TWiBwb3NpdGl2
ZSBjYXNlLgo+CgpZZXMsIHRoaXMgc2hvdWxkIHdvcmsuCgoKCj4KPiA+Cj4gPiAjIGVjaG8gODE5
MiA+IC9wcm9jL3N5cy9mcy9waXBlLW1heC1zaXplCj4gPgo+ID4gIyBjYXQgL3Byb2Mvc3lzL2Zz
L3BpcGUtbWF4LXNpemUKPiA+IDgxOTIKPiA+Cj4gPiAjIC4vZmNudGwzMAo+ID4gdHN0X3Rlc3Qu
YzoxNTYwOiBUSU5GTzogVGltZW91dCBwZXIgcnVuIGlzIDBoIDAwbSAzMHMKPiA+IGZjbnRsMzAu
YzoyODogVFBBU1M6IGZjbnRsKGZkc1sxXSwgRl9HRVRQSVBFX1NaKSByZXR1cm5lZCA2NTUzNgo+
ID4gZmNudGwzMC5jOjM0OiBUQlJPSzogUmVxdWVzdGVkIHBpcGUgc2l6ZSBhYm92ZSB0aGUgYWxs
b3dlZCBsaW1pdCA4MTkyCj4gPgo+ID4gU3VtbWFyeToKPiA+IHBhc3NlZCAgIDEKPiA+IGZhaWxl
ZCAgIDAKPiA+IGJyb2tlbiAgIDEKPiA+IHNraXBwZWQgIDAKPiA+IHdhcm5pbmdzIDAKPiA+Cj4g
PiA+ID4gSSBndWVzcyBUQ09ORiBzaG91bGQgYmUgbW9yZSBwcm9wZXIuCj4gPiA+Cj4gPiA+IEkn
bSBub3Qgc3VyZSBpZiBUQ09ORiBpcyBtb3JlIGFwdC4KPiA+ID4KPiA+ID4gPiBPdGhlcndpc2Us
IExHVE0uCj4gPiA+ID4gUmV2aWV3ZWQtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgo+
ID4gPgo+ID4gPiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCj4gPiA+Cj4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgb3JpZ19waXBlX3NpemUgPSBURVNUX1JFVFVSTjsKPiA+ID4gPiA+IC0gICAg
ICAgICAgICAgICBuZXdfcGlwZV9zaXplID0gb3JpZ19waXBlX3NpemUgKiAyOwo+ID4gPiA+ID4g
LSAgICAgICAgICAgICAgIFRFU1QoZmNudGwodGVzdF9mZCwgRl9TRVRQSVBFX1NaLCBuZXdfcGlw
ZV9zaXplKSk7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgaWYgKFRFU1RfUkVUVVJOIDwgMCkg
ewo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgdHN0X2Jya20oVEZBSUwgfCBUVEVS
Uk5PLCBjbGVhbnVwLAo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ImZjbnRsIHRlc3QgRl9TRVRQSVBFX1NaIGZhaWxlZCIpOwo+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgIH0KPiA+ID4gPiA+ICsgICAgICAgVFNUX0VYUF9QT1NJVElWRShmY250bChmZHNbMV0sIEZf
U0VUUElQRV9TWiwgbmV3X3NpemUpKTsKPiA+ID4gPiA+ICsgICAgICAgVFNUX0VYUF9QT1NJVElW
RShmY250bChmZHNbMV0sIEZfR0VUUElQRV9TWikpOwo+ID4gPiA+ID4gKyAgICAgICBUU1RfRVhQ
X0VYUFIoVFNUX1JFVCA+PSBuZXdfc2l6ZSwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIm5ldyBwaXBlIHNpemUgKCVsZCkgPj0gcmVxdWVzdGVkCj4gc2l6ZQo+ID4g
PiA+ID4gKCVkKSIsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRT
VF9SRVQsIG5ld19zaXplKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgVEVT
VChmY250bCh0ZXN0X2ZkLCBGX0dFVFBJUEVfU1opKTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICBpZiAoVEVTVF9SRVRVUk4gPCAwKSB7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICB0c3RfYnJrbShURkFJTCB8IFRURVJSTk8sIGNsZWFudXAsCj4gPiA+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiZmNudGwgdGVzdCBGX0dFVFBJUEVfU1ogZmFpbGVkIik7
Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgfQo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIHRz
dF9yZXNtKFRJTkZPLCAib3JpZ19waXBlX3NpemU6ICVkIG5ld19waXBlX3NpemU6Cj4gPiA+ID4g
PiAlZCIsCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgb3JpZ19waXBlX3NpemUs
IG5ld19waXBlX3NpemUpOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGlmIChURVNUX1JFVFVS
TiA+PSBuZXdfcGlwZV9zaXplKSB7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICB0
c3RfcmVzbShUUEFTUywgImZjbnRsIHRlc3QgRl9HRVRQSVBFX1NaCj4gYW5kCj4gPiA+ID4gPiBG
X1NFVFBJUEVfU1ogcGFzc2VkIik7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgfSBlbHNlIHsK
PiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHRzdF9yZXNtKFRGQUlMLCAiZmNudGwg
dGVzdCBGX0dFVFBJUEVfU1oKPiBhbmQKPiA+ID4gPiA+IEZfU0VUUElQRV9TWiBmYWlsZWQiKTsK
PiA+ID4gPiA+IC0gICAgICAgICAgICAgICB9Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgU0FG
RV9DTE9TRShjbGVhbnVwLCBwaXBlX2Zkc1swXSk7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAg
U0FGRV9DTE9TRShjbGVhbnVwLCBwaXBlX2Zkc1sxXSk7Cj4gPiA+ID4gPiAtICAgICAgIH0KPiA+
ID4gPiA+IC0KPiA+ID4gPiA+IC0gICAgICAgY2xlYW51cCgpOwo+ID4gPiA+ID4gLSAgICAgICB0
c3RfZXhpdCgpOwo+ID4gPiA+ID4gKyAgICAgICBTQUZFX0NMT1NFKGZkc1swXSk7Cj4gPiA+ID4g
PiArICAgICAgIFNBRkVfQ0xPU0UoZmRzWzFdKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgfQo+ID4g
PiA+ID4KPiA+ID4gPiA+ICBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+ID4gPiA+ID4gIHsKPiA+
ID4gPiA+Cj4gPiA+ID4gPiAtICAgICAgIHRzdF9zaWcoTk9GT1JLLCBERUZfSEFORExFUiwgY2xl
YW51cCk7Cj4gPiA+ID4gPiAtCj4gPiA+ID4gPiAtICAgICAgIFRFU1RfUEFVU0U7Cj4gPiA+ID4g
PiArICAgICAgIFNBRkVfRklMRV9TQ0FORigiL3Byb2Mvc3lzL2ZzL3BpcGUtbWF4LXNpemUiLCAi
JWQiLAo+ID4gPiA+ID4KPiA+ID4gPiA+ICAmbWF4X3NpemVfdW5wcml2KTsKPiA+ID4gPiA+ICB9
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gIHN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKPiA+ID4gPiA+
ICB7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gKyAgICAgICBpZiAoZmRzWzBdID4gMCkKPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICBTQUZFX0NMT1NFKGZkc1swXSk7Cj4gPiA+ID4gPiArICAgICAgIGlm
IChmZHNbMV0gPiAwKQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIFNBRkVfQ0xPU0UoZmRzWzFd
KTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgfQo+ID4gPiA+ID4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ICtzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Cj4gPiA+ID4gPiArICAgICAgIC50ZXN0
X2FsbCA9IHJ1biwKPiA+ID4gPiA+ICsgICAgICAgLnNldHVwID0gc2V0dXAsCj4gPiA+ID4gPiAr
ICAgICAgIC5jbGVhbnVwID0gY2xlYW51cAo+ID4gPiA+ID4gK307Cj4gPiA+ID4gPiAtLQo+ID4g
PiA+ID4gMi40MC4xCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiBN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKPiA+
ID4KPiA+ID4gLS0KPiA+ID4gUmVnYXJkcywKPiA+ID4gQXZpbmVzaAo+Cj4KPgo+Cj4KCi0tIApS
ZWdhcmRzLApMaSBXYW5nCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
