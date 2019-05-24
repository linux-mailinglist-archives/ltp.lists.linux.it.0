Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD4329717
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 13:24:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14D9C3EA6BA
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 13:24:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B1B363EA193
 for <ltp@lists.linux.it>; Fri, 24 May 2019 13:24:30 +0200 (CEST)
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8A938602714
 for <ltp@lists.linux.it>; Fri, 24 May 2019 13:24:29 +0200 (CEST)
Received: by mail-yb1-xb42.google.com with SMTP id z22so3459321ybi.13
 for <ltp@lists.linux.it>; Fri, 24 May 2019 04:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1yvTGGiHdkWRO9l4BHWAE/pEWoT3Pj0f4XlVeCxk0fE=;
 b=IJIP9K+4HmOexDSzluY3Bb5ScwawFguo/CL2Jgs14s+Pz8nxYwrDdDLXMo8Pn9jXuW
 WvefL4+JjFkgBzW6+BElYkcJYrqImgNqbBY33mm6Yto1xTa/JGNfrFnGHzifBc337qba
 lsT8H+RaLasJJtS2oa3Zt7JP/eeOVJwWd0SKl3uvncMFpHI4cqpLad/KMO9ZgkmS+7u2
 yHUPmzKEVZx0wxzjjhOwFpOpn2h6YW0NPc3D2xBGG/kuLfLWgTdO8shSdMwDcGJqSKjA
 AVNNMas3HWHdoClV0bIV6c9NUtLEkFje4VtNwbYpDaBZAyFkzqn53udNva6lva8TyCf2
 nsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1yvTGGiHdkWRO9l4BHWAE/pEWoT3Pj0f4XlVeCxk0fE=;
 b=r5NJeTa7Z2ctfFDIYABVCJjluENkUez+//9eeOH2B6QdgW6NxfY37G2VZX0e78lV3Y
 etV8GknMiimoO5aPxc1w6FpzQPbbwJnQrOJmhc5COafMxc++96Ut/GMm1DHyUcMV1jvF
 VKb0kr5N6GSiSB4Da5FEt5//fPpnx6NUgvk3ZVrRzONRzd7QyRPYVqvxygPm5baqJqWY
 WlHAP1a5hxlCfYL0IJ0uRj2vU36/7xdhJ3js+33FyfvpCubST6DPdPTLKWVWCNJWWV3s
 74qPMEqvM0g4wN48ebf/hTD0Bz5Sn//PLLMRv9l+B5CHnntwlWxw6KJrIZPs9txUeKV7
 +kJg==
X-Gm-Message-State: APjAAAU+xt22vZMiOWqEJRB8jHPg9Zl8bteRLTcJuxzGaVxsRJtKM9uF
 caSPncBmM/VhLzyKJHzD9+idC7VjK98yO1pQjJI=
X-Google-Smtp-Source: APXvYqywCpptyI/Vhi0R4RwolsNqG4OAYbgCn1SzSHk/0EOmXXzWoJvx5obl+uJrwG0EIegq8hLD6F8KtfqFF7ek1PY=
X-Received: by 2002:a25:a081:: with SMTP id y1mr21102265ybh.428.1558697068387; 
 Fri, 24 May 2019 04:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510>
 <20190524043201.sxmkm6b7dixn2kuw@XZHOUW.usersys.redhat.com>
 <20190524085452.GB29592@dell5510>
In-Reply-To: <20190524085452.GB29592@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 24 May 2019 14:24:17 +0300
Message-ID: <CAOQ4uxhBcMRg1+7sihQaTC217We8Hj+fAQ2xhiDTHvBDP4NZag@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: Li Wang <liwan@redhat.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] OVL_MNT: add setup_overlay helper
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

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTE6NTQgQU0gUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2Uu
Y3o+IHdyb3RlOgo+Cj4gSGkgTXVycGh5LAo+Cj4gPiA+ID4gKyByZXQgPSBtb3VudCgib3Zlcmxh
eSIsIE9WTF9NTlQsICJvdmVybGF5IiwgMCwgImxvd2VyZGlyPSJPVkxfTE9XRVIKPiA+ID4gPiAr
ICAgICAgICAgICAgICIsdXBwZXJkaXI9Ik9WTF9VUFBFUiIsd29ya2Rpcj0iT1ZMX1dPUkspOwo+
ID4gPiA+ICsgaWYgKHJldCA8IDApIHsKPiA+ID4gPiArICAgICAgICAgaWYgKGVycm5vID09IEVO
T0RFVikgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIHRzdF9yZXMoVElORk8sCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAib3ZlcmxheWZzIGlzIG5vdCBjb25maWd1cmVkIGlu
IHRoaXMga2VybmVsLiIpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIHJldHVybiAxOwo+ID4g
PiBGaXJzdCBJIHRob3VnaHQgd2UnZCBpbXBsZW1lbnQgaXQgYXMgYSB0ZXN0IGZsYWcgKG1lbWJl
ciBvZiBzdHJ1Y3QgdHN0X3Rlc3QpLgo+ID4gPiBXaGVuIHdlIGhhdmUgaXQgYXMgc2VwYXJhdGUg
ZnVuY3Rpb24gSSB3b25kZXIgd2hldGhlciB3ZSBjb3VsZCBUQ09ORiBvbiBFTk9ERVYKPiA+ID4g
aW5zdGVhZCBvZiBUSU5GTyBhbmQgcmV0dXJuLiBNYXliZSB0aGVyZSBjb3VsZCBiZSBoZXJlIGZv
ciBpbnQgc3RyaWN0IHBhcmFtZXRlciwKPgo+ID4gVGhlIHJldHVybiB2YWx1ZSBpcyByZWZlcmVu
Y2VkIGluIHRoZSB0ZXN0Y2FzZSB0byBkZXRlcm1pbmUgd2hldGhlciB0byBydW4KPiA+IHRlc3Rz
IGluIG92ZXJsYXlmcy4gSXQncyBuZWVkZWQuCj4KPiA+IElmIHRoaXMgc3RyaWN0IHBhcmFtZXRl
ciBpcyBvbmx5IGZvciBkaWZmZXJlbnQgd29yZGluZyBvbiBOT0RFVi4gSXMgaXQKPiA+IG5lY2Vz
c2FyeSA/Cj4KPiBJJ2xsIHJlY2FwIG15IHN1Z2dlc3Rpb25zOgo+IDEpIEkgbGlrZSBoYXZpbmcg
bWFjcm9zIHRvIGhlbHAgcmVkdWNlIHNvbWUgcGFyYW1ldGVycywgdGhpcyBkb2VzIG5vdCBibG9j
awo+IGZ1bmN0aW9ucyBiZWluZyBmbGV4aWJsZSAod2hpY2ggcmVxdWlyZXMgcGFyYW1ldGVycyku
Cj4gMikgSGF2aW5nIGhlbHBlciBmdW5jdGlvbiBjcmVhdGVfb3ZlcmxheV9kaXJzKCkgdXNlZCBz
ZXBhcmF0ZWx5LCB0aGFuIHBhcmFtZXRlcgo+IGluIHNpbmdsZSBmdW5jdGlvbiAoQW1pciBbMV0g
c3VnZ2VzdGlvbiBtYWtlcyBzZW5zZSkuCj4KPiBTb21ldGhpbmcgbGlrZSB0aGlzLCBqdXN0IGEg
c3VnZ2VzdGlvbjoKPgo+IGludCBjcmVhdGVfb3ZlcmxheV9kaXJzKCkKPiB7Cj4gICAgICAgICBT
QUZFX01LRElSKE9WTF9MT1dFUiwgMDc1NSk7Cj4gICAgICAgICAuLi4KPiAgICAgICAgIHJldHVy
biByZXQ7Cj4gfQo+Cj4gaW50IG1vdW50X292ZXJsYXkoY29uc3QgY2hhciAqZmlsZSwgY29uc3Qg
aW50IGxpbmVubywgaW50IHNhZmUpCj4gewo+ICAgICAgICAgLi4uCj4gICAgICAgICBpZiAoY3Jl
YXRlX292ZXJsYXlfZGlycygpKQo+ICAgICAgICAgICAgICAgICB0c3RfYnJrKFRDT05GLCAiLi4u
Iik7Cj4KPiAgICAgICAgIHJldCA9IG1vdW50KCJvdmVybGF5IiwgT1ZMX01OVCwgIm92ZXJsYXki
LCAwLCAibG93ZXJkaXI9Ik9WTF9MT1dFUgo+ICAgICAgICAgICAgICAgICAgICAgIix1cHBlcmRp
cj0iT1ZMX1VQUEVSIix3b3JrZGlyPSJPVkxfV09SSyk7Cj4gICAgICAgICBpZiAocmV0IDwgMCkg
ewo+ICAgICAgICAgICAgICAgICBpZiAoZXJybm8gPT0gRU5PREVWKSB7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgLyoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgKiBUT0RPOiBtYXliZSBz
YWZlIGlzIGNvbmZ1c2luZyBhcyB3ZSB1c2UgdHN0X2JyayhUQlJPSyBhbnl3YXkpLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAqICsgc29tZXRpbWVzIHRzdF9yZXMoVENPTkYsIC4uKSB3b3Vs
ZCBiZSBwcmVmZXJyZWQgb3Zlcgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAqIHRzdF9icmso
VENPTkYsIC4uLikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoc2FmZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRz
dF9icmsoVENPTkYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJv
dmVybGF5ZnMgaXMgbm90IGNvbmZpZ3VyZWQgaW4gdGhpcyBrZXJuZWwuIik7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHRzdF9yZXMoVElORk8sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJvdmVybGF5ZnMgaXMgbm90IGNvbmZpZ3VyZWQgaW4gdGhpcyBrZXJuZWwuIik7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMTsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICB9Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgdHN0X2JyayhUQlJP
SyB8IFRFUlJOTywgIm92ZXJsYXlmcyBtb3VudCBmYWlsZWQiKTsKPiAgICAgICAgIH0KPiB9Cj4K
PiAjZGVmaW5lIFNBRkVfTU9VTlRfT1ZFUkxBWSgpIFwKPiAgICAgICAgIG1vdW50X292ZXJsYXko
X19GSUxFX18sIF9fTElORV9fLCAxKTsKPgo+ICNkZWZpbmUgVFNUX01PVU5UX09WRVJMQVkoKSBc
Cj4gICAgICAgICBtb3VudF9vdmVybGF5KF9fRklMRV9fLCBfX0xJTkVfXywgMCk7Cj4KCkkgbGlr
ZSB0aGlzIHZlcnNpb24gb2YgdGhlIGhlbHBlcnMvbWFjcm9zLgoKSSB3b3VsZCBjaGFuZ2UgVFNU
X01PVU5UX09WRVJMQVkgdG8KKG1vdW50X292ZXJsYXkoX19GSUxFX18sIF9fTElORV9fLCAwKSA9
PSAwKQpzbyB0aGF0IGl0IGNvdWxkIGJlIHVzZWQgbGlrZSB0aGlzOgoKb3ZsX21vdW50ZWQgPSBU
U1RfTU9VTlRfT1ZFUkxBWSguLi4pCgpVc2VzIG9mIFNBRkVfTU9VTlRfT1ZFUkxBWSgpIHNob3Vs
ZCBub3QgY2hlY2sgcmV0dXJuIHZhbHVlCmNvdWxkIGV2ZW4gcGxhY2UgKHZvaWQpIGluIGZyb250
IG9mIG1vdW50X292ZXJsYXkgdG8gZW5mb3JjZSB0aGF0LgoKVGVzdCB0aGF0IHVzZSBTQUZFX01P
VU5UX09WRVJMQVkoKSBzaG91bGQgZWl0aGVyIGhhdmUgbm8KdmFyaWFibGUgb3ZsX21vdW50ZWQg
b3Igc2V0IGl0IGFmdGVyIFNBRkVfTU9VTlRfT1ZFUkxBWSgpIHdpdGhvdXQKY2hlY2tpbmcgcmV0
dXJuIHZhbHVlLgoKVGhhbmtzLApBbWlyLgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
