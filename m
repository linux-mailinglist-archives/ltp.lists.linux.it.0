Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE992CC74
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2024 10:05:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 889AE3D3831
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2024 10:05:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F05873D0F08
 for <ltp@lists.linux.it>; Wed, 10 Jul 2024 10:04:57 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B3ABF140121B
 for <ltp@lists.linux.it>; Wed, 10 Jul 2024 10:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720598694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIyA4NJxjkb7vT7u1wOY07SVdFqY6NqTEfeGGdsU9Y8=;
 b=RtQImTl146FAGprwHH+1UHIxKSYnVaKzxjeo6zozBoysw17Qlxzkum8upLMO1oHWMPWP/4
 meCCOdJnSNGhpJERVR0ij+RVgtWZs2DgXWiRMprsErMxA8YNYLTfNCVFimKhrFNtWffXJF
 QhUA+EowdkzSDPObG/3dFwAZ+8pqBVk=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-ET_LzXW7MeG8MqLlHAs55g-1; Wed, 10 Jul 2024 04:04:51 -0400
X-MC-Unique: ET_LzXW7MeG8MqLlHAs55g-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3d936a102acso2194787b6e.2
 for <ltp@lists.linux.it>; Wed, 10 Jul 2024 01:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720598690; x=1721203490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JIyA4NJxjkb7vT7u1wOY07SVdFqY6NqTEfeGGdsU9Y8=;
 b=qP4+brhkYhqV0r278LwkKm/k/+nSwIkDcx7o6nJcBCkQzbscklSRQ8v4pnuyoLsSRH
 9d6RUrqyHA8J79V0T5bOOY7HJdAbLQeuQ4o5h/rpECh4/TjNVUrn+XhGF+1WlB0bBeqP
 4Z793ACPdZFTBgiB2DJGuangMDb7B/Vi+k3nMqb4Atny0d+6SZvECP8F0T3AV7YBUp7z
 3Cpz1+03+Kw4kJ5p5i96X37tleNfUXp6LHN4x8f3ecqAYWHbOjPpSGO+xkeMWEwnWXy4
 Ite8M3OumY96Ti2xXPDGOPCDKdCdNjlFVPju6ddgdQN3BP6meIqgjEtcYjFEFmgLA43X
 oY1g==
X-Gm-Message-State: AOJu0Yw2N1cssst84FVkPaKKB8CrFg2Fq25S2XVyh7sfL0B8n3nGMWGJ
 uhCZGvXEHDp3otF1R2PLqar4JMvUcsGoBsHcfvo4I41dfqv3AjJSgzUwy2pdstJLjwLD2fjLy95
 iOFqBlWEZB8NnnxT54yVJE+szVQVg7VdYuiJ7ftUlkMOt08o0cPIM/gZbyaZO7i30m4iMomPoiH
 UTLR6UivsX7cc6YrtSaJ/dCTo=
X-Received: by 2002:a05:6808:211a:b0:3d2:1c37:25ca with SMTP id
 5614622812f47-3d93c0b8a8amr5110027b6e.53.1720598690418; 
 Wed, 10 Jul 2024 01:04:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhqcho6caZqvLdNu6vdEi6CCqcRyqat1SHFlKFEj7rEZMOfTCfvZuHLOziEq84EamX4r4acQmLDEftFUVf1Ac=
X-Received: by 2002:a05:6808:211a:b0:3d2:1c37:25ca with SMTP id
 5614622812f47-3d93c0b8a8amr5109991b6e.53.1720598689096; Wed, 10 Jul 2024
 01:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <09c8813ad86c4a8034e3e35a183355c4f887f1b4.1720527432.git.jstancek@redhat.com>
 <CAEemH2dhdUZki19_KhUO74CoQiomvn9Yo9SOdTbAttAVxLaShA@mail.gmail.com>
In-Reply-To: <CAEemH2dhdUZki19_KhUO74CoQiomvn9Yo9SOdTbAttAVxLaShA@mail.gmail.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 10 Jul 2024 10:04:32 +0200
Message-ID: <CAASaF6yzF9D3su3Hmog4infvwz3CZmF+TXsJc4+Gm5B8J8zQig@mail.gmail.com>
To: Li Wang <liwan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] kallsyms: skip user-space mapped addresses
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

T24gV2VkLCBKdWwgMTAsIDIwMjQgYXQgOToyNuKAr0FNIExpIFdhbmcgPGxpd2FuQHJlZGhhdC5j
b20+IHdyb3RlOgo+Cj4KPgo+IE9uIFR1ZSwgSnVsIDksIDIwMjQgYXQgODoxOOKAr1BNIEphbiBT
dGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPiB3cm90ZToKPj4KPj4gUkhFTDkgczM5MHggd2l0
aCBLUFRJIGVuYWJsZWQgaGFzIGJlZW4gb2JzZXJ2ZWQgdG8gc3BvcmFkaWNhbGx5Cj4+IHVzZSBz
YW1lIGFkZHJlc3MgcmFuZ2VzIGZvciB1c2VyLXNwYWNlIGxpYnJhcmllcyBhcyB0aGUgb25lcwo+
PiBvY2N1cGllZCBieSBrYWxsc3ltcyB3aGlsZSBpbiBrZXJuZWwtc3BhY2UuCj4+Cj4+IFRoZSB0
ZXN0IGN1cnJlbnRseSAod3JvbmdseSkgYXNzdW1lcywgdGhhdCBhIHdyaXRlIHRvIGthbGxzeW0K
Pj4gYWRkcmVzcyBzaG91bGQgZmFpbCBhbmQgZG9lc24ndCB0YWtlIGludG8gYWNjb3VudCB0aGF0
IHNhbWUKPj4gbWVtb3J5IHJhbmdlcyBjb3VsZCBiZSBtYXBwZWQgZGlmZmVyZW50bHkgaW4gdXNl
ciB2cy4ga2VybmVsLXNwYWNlLgo+Pgo+PiBBZGQgYSBjaGVjayB0byBzZWUgaWYgYSBrYWxsc3lt
IGFkZHJlc3MgaXMgYWxyZWFkeSBtYXBwZWQgYnkgdXNlci1zcGFjZSwKPj4gYW5kIGlmIGl0IGlz
LCBza2lwIGl0IHRvIGF2b2lkIGZhbHNlIHBvc2l0aXZlcy4KPj4KPj4gQmVmb3JlOgo+PiAgICAg
MTMgIGthbGxzeW1zLmM6MTE1OiBURkFJTDogU3VjY2Vzc2Z1bGx5IGFjY2Vzc2VkIGtlcm5lbCBh
ZGRyIDB4M2ZmODA2MDc4N2QgKHIpIChfX2tzdHJ0YWJuc19uZnMzX3NldF9kc19jbGllbnQpCj4+
ICAgICAxNCAga2FsbHN5bXMuYzoxMTU6IFRGQUlMOiBTdWNjZXNzZnVsbHkgYWNjZXNzZWQga2Vy
bmVsIGFkZHIgMHgzZmY4MDYwMDdhMCAodCkgKG5mc19pbml0X3NlcnZlcl9hY2xjbGllbnQpCj4+
ICAgICAxNSAga2FsbHN5bXMuYzoxMTU6IFRGQUlMOiBTdWNjZXNzZnVsbHkgYWNjZXNzZWQga2Vy
bmVsIGFkZHIgMHgzZmY4MDYwYTA1OCAoZCkgKG5mc2FjbF92ZXJzaW9uKQo+PiAgICAgMTYgIGth
bGxzeW1zLmM6MTE1OiBURkFJTDogU3VjY2Vzc2Z1bGx5IGFjY2Vzc2VkIGtlcm5lbCBhZGRyIDB4
M2ZmODA2MGEwNzggKGQpIChuZnNhY2xfcnBjc3RhdCkKPj4gICAgIC4uLgo+PiAgICAga2FsbHN5
bXMuYzoxMzA6IFRGQUlMOiBDYXVnaHQgMTAzMTAyIFNJR1NFR1YgYnV0IGV4cGVjdGVkIDE1Mzcz
OAo+Pgo+PiBBZnRlcjoKPj4gICAgIGthbGxzeW1zLmM6MTc1OiBUREVCVUc6IFNraXBwaW5nIHVz
ZXJzcGFjZSBtYXBwZWQgYWRkcmVzcyAweDNmZjgwMjIwMDI0Cj4+ICAgICBrYWxsc3ltcy5jOjE3
NTogVERFQlVHOiBTa2lwcGluZyB1c2Vyc3BhY2UgbWFwcGVkIGFkZHJlc3MgMHgzZmY4MDIyMDAz
Ywo+PiAgICAga2FsbHN5bXMuYzoxNzU6IFRERUJVRzogU2tpcHBpbmcgdXNlcnNwYWNlIG1hcHBl
ZCBhZGRyZXNzIDB4M2ZmODAyMTNiMjAKPj4gICAgIC4uLgo+PiAgICAga2FsbHN5bXMuYzoxODQ6
IFRQQVNTOiBDYXVnaHQgMTAzNDczIFNJR1NFR1YgaW4gYWNjZXNzIGtzeW1ib2xzIGFkZHIsIHNr
aXBwZWQgMjcyMzQKPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJl
ZGhhdC5jb20+Cj4+IC0tLQo+PiAgdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9rYWxsc3ltcy9r
YWxsc3ltcy5jIHwgNjggKysrKysrKysrKysrKysrKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDYz
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS90ZXN0Y2Fz
ZXMva2VybmVsL3NlY3VyaXR5L2thbGxzeW1zL2thbGxzeW1zLmMgYi90ZXN0Y2FzZXMva2VybmVs
L3NlY3VyaXR5L2thbGxzeW1zL2thbGxzeW1zLmMKPj4gaW5kZXggMmE1Y2JhYTMyNWVhLi5iMDdj
YjljZGEyNjggMTAwNjQ0Cj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkva2FsbHN5
bXMva2FsbHN5bXMuYwo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2thbGxzeW1z
L2thbGxzeW1zLmMKPj4gQEAgLTU0LDYgKzU0LDggQEAgc3RhdGljIHN0cnVjdCBrYWxsc3ltICpz
eW1fdGFibGU7Cj4+ICBzdGF0aWMgdW5zaWduZWQgaW50IG5yX3N5bWJvbHM7Cj4+ICBzdGF0aWMg
c2lnam1wX2J1ZiBqbXBidWY7Cj4+ICB2b2xhdGlsZSBzaWdfYXRvbWljX3Qgc2Vndl9jYXVnaHQ7
Cj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyAqcmFuZ2VzOwo+PiArc3RhdGljIGludCByYW5nZXNf
c2l6ZSwgcmFuZ2VzX2xlbjsKPj4KPj4gIHN0YXRpYyB2b2lkIHNlZ3ZfaGFuZGxlcihpbnQgc2ln
KQo+PiAgewo+PiBAQCAtODksNiArOTEsNDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCByZWFkX2th
bGxzeW1zKHN0cnVjdCBrYWxsc3ltICp0YWJsZSwgdW5zaWduZWQgaW50IHRhYmxlX3NpemUKPj4g
ICAgICAgICByZXR1cm4gbnJfc3ltczsKPj4gIH0KPj4KPj4gK3N0YXRpYyB2b2lkIHJlYWRfcHJv
Y19zZWxmX21hcHModm9pZCkKPj4gK3sKPj4gKyAgICAgICBGSUxFICpmcDsKPj4gKwo+PiArICAg
ICAgIHJhbmdlc19sZW4gPSAwOwo+PiArICAgICAgIGZwID0gZm9wZW4oIi9wcm9jL3NlbGYvbWFw
cyIsICJyIik7Cj4+ICsgICAgICAgaWYgKGZwID09IE5VTEwpCj4+ICsgICAgICAgICAgICAgICB0
c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAiRmFpbGVkIHRvIG9wZW4gL3Byb2Mvc2VsZi9tYXBzLiIp
Owo+PiArCj4+ICsgICAgICAgd2hpbGUgKCFmZW9mKGZwKSkgewo+PiArICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBzdGFydCwgZW5kOwo+PiArICAgICAgICAgICAgICAgaW50IHJldDsKPj4g
Kwo+PiArICAgICAgICAgICAgICAgcmV0ID0gZnNjYW5mKGZwLCAiJWx4LSVseCAlKlteXG5dXG4i
LCAmc3RhcnQsICZlbmQpOwo+PiArICAgICAgICAgICAgICAgaWYgKHJldCAhPSAyKSB7Cj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGZjbG9zZShmcCk7Cj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHRzdF9icmsoVEJST0sgfCBURVJSTk8sICJDb3VsZG4ndCBwYXJzZSAvcHJvYy9zZWxmL21h
cHMgbGluZS4iKTsKPj4gKyAgICAgICAgICAgICAgIH0KPj4gKwo+PiArICAgICAgICAgICAgICAg
aWYgKHJhbmdlc19zaXplIDwgcmFuZ2VzX2xlbiArIDEpIHsKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmFuZ2VzX3NpemUgKz0gMTI4Owo+PiArICAgICAgICAgICAgICAgICAgICAgICByYW5n
ZXMgPSByZWFsbG9jKHJhbmdlcywgMipyYW5nZXNfc2l6ZSpzaXplb2YodW5zaWduZWQgbG9uZykp
Owo+Cj4KPiBCVFcsIHdlIGhhdmUgU0FGRV9SRUFMTE9DIG1hY3JvIG5vdy4KCkFoLCBvaywgSSBj
YW4gdXBkYXRlIHRoYXQgaW4gdjIgLSBJJ2xsIHdhaXQgdG8gc2VlIGlmIHRoZXJlJ3MgYW55IG1v
cmUKZmVlZGJhY2sgZm9yIGRheSBvciB0d28uCgo+Cj4+Cj4+ICsgICAgICAgICAgICAgICB9Cj4+
ICsgICAgICAgICAgICAgICByYW5nZXNbcmFuZ2VzX2xlbioyXSA9IHN0YXJ0Owo+PiArICAgICAg
ICAgICAgICAgcmFuZ2VzW3Jhbmdlc19sZW4qMiArIDFdID0gZW5kOwo+PiArCj4+ICsgICAgICAg
ICAgICAgICByYW5nZXNfbGVuKys7Cj4+ICsgICAgICAgfQo+PiArCj4+ICsgICAgICAgZmNsb3Nl
KGZwKTsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBpc19hZGRyZXNzX21hcHBlZCh1bnNpZ25l
ZCBsb25nIGFkZHIpCj4+ICt7Cj4+ICsgICAgICAgaW50IGk7Cj4+ICsKPj4gKyAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgcmFuZ2VzX2xlbjsgaSsrKSB7Cj4+ICsgICAgICAgICAgICAgICBpZiAocmFu
Z2VzW2kqMl0gPD0gYWRkciAmJiBhZGRyIDwgcmFuZ2VzW2kqMiArIDFdKQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gMTsKPj4gKyAgICAgICB9Cj4+ICsgICAgICAgcmV0dXJuIDA7
Cj4+ICt9Cj4+ICsKPj4gIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4+ICB7Cj4+ICAgICAgICAg
c3RydWN0IHNpZ2FjdGlvbiBzYTsKPj4gQEAgLTExNywxNyArMTYyLDMwIEBAIHN0YXRpYyB2b2lk
IGFjY2Vzc19rc3ltYm9sc19hZGRyZXNzKHN0cnVjdCBrYWxsc3ltICp0YWJsZSkKPj4gICAgICAg
ICB9Cj4+ICB9Cj4+Cj4+ICsKPj4gIHN0YXRpYyB2b2lkIHRlc3RfYWNjZXNzX2tlcm5lbF9hZGRy
ZXNzKHZvaWQpCj4+ICB7Cj4+IC0gICAgICAgc2Vndl9jYXVnaHQgPSAwOwo+PiArICAgICAgIGlu
dCBza2lwcGVkID0gMDsKPj4KPj4gLSAgICAgICBmb3IgKHVuc2lnbmVkIGludCBpID0gMDsgaSA8
IG5yX3N5bWJvbHM7IGkrKykKPj4gKyAgICAgICBzZWd2X2NhdWdodCA9IDA7Cj4+ICsgICAgICAg
cmVhZF9wcm9jX3NlbGZfbWFwcygpOwo+PiArCj4+ICsgICAgICAgZm9yICh1bnNpZ25lZCBpbnQg
aSA9IDA7IGkgPCBucl9zeW1ib2xzOyBpKyspIHsKPj4gKyAgICAgICAgICAgICAgIGlmIChpc19h
ZGRyZXNzX21hcHBlZChzeW1fdGFibGVbaV0uYWRkcikpIHsKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgdHN0X3JlcyhUREVCVUcsICJTa2lwcGluZyB1c2Vyc3BhY2UgbWFwcGVkIGFkZHJlc3Mg
MHglbHgiLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN5bV90YWJsZVtpXS5h
ZGRyKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2tpcHBlZCsrOwo+PiArICAgICAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsKPj4gKyAgICAgICAgICAgICAgIH0KPj4gICAgICAgICAg
ICAgICAgIGFjY2Vzc19rc3ltYm9sc19hZGRyZXNzKCZzeW1fdGFibGVbaV0pOwo+PiArICAgICAg
IH0KPj4KPj4gLSAgICAgICBpZiAoc2Vndl9jYXVnaHQgPT0gKHNpZ19hdG9taWNfdClucl9zeW1i
b2xzKQo+PiAtICAgICAgICAgICAgICAgdHN0X3JlcyhUUEFTUywgIkNhdWdodCAlZCBTSUdTRUdW
IGluIGFjY2VzcyBrc3ltYm9scyBhZGRyIiwgc2Vndl9jYXVnaHQpOwo+PiArICAgICAgIGlmIChz
ZWd2X2NhdWdodCA9PSAoc2lnX2F0b21pY190KW5yX3N5bWJvbHMgLSBza2lwcGVkKQo+PiArICAg
ICAgICAgICAgICAgdHN0X3JlcyhUUEFTUywgIkNhdWdodCAlZCBTSUdTRUdWIGluIGFjY2VzcyBr
c3ltYm9scyBhZGRyLCBza2lwcGVkICVkIiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2Vn
dl9jYXVnaHQsIHNraXBwZWQpOwo+PiAgICAgICAgIGVsc2UKPj4gLSAgICAgICAgICAgICAgIHRz
dF9yZXMoVEZBSUwsICJDYXVnaHQgJWQgU0lHU0VHViBidXQgZXhwZWN0ZWQgJWQiLCBzZWd2X2Nh
dWdodCwgbnJfc3ltYm9scyk7Cj4+ICsgICAgICAgICAgICAgICB0c3RfcmVzKFRGQUlMLCAiQ2F1
Z2h0ICVkIFNJR1NFR1YgYnV0IGV4cGVjdGVkICVkLCBza2lwcGVkICVkIiwKPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgc2Vndl9jYXVnaHQsIG5yX3N5bWJvbHMtc2tpcHBlZCwgc2tpcHBlZCk7
Cj4+ICB9Cj4+Cj4+ICBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCj4+IC0tCj4+IDIuMzkuMwo+
PgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
