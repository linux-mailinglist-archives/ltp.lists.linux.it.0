Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEBE32D91E
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 18:58:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69E7D3C6E3C
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 18:58:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9F1383C5669
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 18:58:19 +0100 (CET)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1A210600F45
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 18:58:19 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id p8so24812557ejb.10
 for <ltp@lists.linux.it>; Thu, 04 Mar 2021 09:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8otJ+QXVNuhO+CoL5UIOP2Zpn78jb+0u14xT9NO0oaI=;
 b=I7RLdKPz+0nbiE/tPyyi3RBbc1Ko7eWuyqgqwNPZWg3uWi+MybCjsLbqkfhES0iLjh
 lYipu0bJm0/360fjG8Q+Y/f50vMIeoOUfNTcWb5uSN+cAuTO5MW11/eF2tgC6Yctw43k
 vdlE+oPrTr4SV8E7Ubi4EyRYKl7JLiba82EXBs7Ex07SGVCbDZ81mPCBxmWOP0BkyvpM
 DENEwmLdV9CcdspmvRE8yDH30lss9YVNopUq9xhIKEdj3o9YbjnYASOxdIkKKKnpscSj
 /aC5WQcLzXYQSEiyf1pyWASemsmwoyyKeERTrF7hdsJ2YMG8ZbaRF6GaO8RjNP7K+vdh
 L1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8otJ+QXVNuhO+CoL5UIOP2Zpn78jb+0u14xT9NO0oaI=;
 b=KvBY4D5ls5A3QPVsqzhgYxuK4uPFSiPp07yUdmwe+KI1fezuGgA4bqGfXtxsNqx7pN
 /CCZi9VTmZ8L0zXkXZeF1ZRdixe33wvzhZVxOwv3oiu+sA6gkI7+N+gL3Dr4sLcVm5+a
 xbLnr+GCMwMM6SioEXTlzAMCbjRDkNKGBq4aFv2OhYGMQul2IGh+iHPhOQBBapC5a8zQ
 BJEXkFBHbgdvs3ZdkJy6Fb8fh3iah/RQ/MxzEHs+xjPmUaYb4cG4/z/pIy24O2AMZ1Ab
 mrL7XHkuXz4BpQ4G0UU7OnG4dsgMpbc0TZifsaV2TI1QiFbagq+2UBO+XjnS/BGbw93q
 Y4+Q==
X-Gm-Message-State: AOAM5312pMNNc3Msi3Cvw4ckUUITCjsGgyghLdwRJG/VO1ads8DKU/Kk
 ByOGduuI2kC0x+XFfn/zT3Hc2jqCyzFXRlN9G+7w6A==
X-Google-Smtp-Source: ABdhPJwP32cWgTZhbgugyJHSgv+e/cuMqlUseyqjVdSzyz0wZa2hqLQIEzpOesuCH/cL407aI0R8O8N+dZ0/euh/NRU=
X-Received: by 2002:a17:906:d8ca:: with SMTP id
 re10mr5665674ejb.18.1614880698539; 
 Thu, 04 Mar 2021 09:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20210302192719.741064351@linuxfoundation.org>
 <CA+G9fYvkW+84U9e0Cjft_pq9bGnBBqCXST7Hg+gx4pKNyuGPFQ@mail.gmail.com>
 <YEDDIzz32JqSvi1S@kroah.com> <20210304165247.GA131220@roeck-us.net>
 <YEESn1JboVRjfJGN@kroah.com>
In-Reply-To: <YEESn1JboVRjfJGN@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 4 Mar 2021 23:28:07 +0530
Message-ID: <CA+G9fYuDQ9Ph8-Y3dRzNi7odmcLX4shE5rbCvHekn+wTnzj4Dg@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.11 000/773] 5.11.3-rc3 review
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, linux-stable <stable@vger.kernel.org>, pavel@denx.de,
 Andrew Morton <akpm@linux-foundation.org>, Jon Hunter <jonathanh@nvidia.com>,
 Shuah Khan <shuah@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCA0IE1hciAyMDIxIGF0IDIyOjMyLCBHcmVnIEtyb2FoLUhhcnRtYW4KPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWFyIDA0LCAyMDIxIGF0IDA4
OjUyOjQ3QU0gLTA4MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4gPiBPbiBUaHUsIE1hciAwNCwg
MjAyMSBhdCAxMjoyMzoxNVBNICswMTAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gPiA+
IE9uIFdlZCwgTWFyIDAzLCAyMDIxIGF0IDAyOjAyOjIwUE0gKzA1MzAsIE5hcmVzaCBLYW1ib2p1
IHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgMyBNYXIgMjAyMSBhdCAwMDo1OSwgR3JlZyBLcm9haC1I
YXJ0bWFuCj4gPiA+ID4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBUaGlzIGlzIHRoZSBzdGFydCBvZiB0aGUgc3RhYmxlIHJldmlldyBjeWNs
ZSBmb3IgdGhlIDUuMTEuMyByZWxlYXNlLgo+ID4gPiA+ID4gVGhlcmUgYXJlIDc3MyBwYXRjaGVz
IGluIHRoaXMgc2VyaWVzLCBhbGwgd2lsbCBiZSBwb3N0ZWQgYXMgYSByZXNwb25zZQo+ID4gPiA+
ID4gdG8gdGhpcyBvbmUuICBJZiBhbnlvbmUgaGFzIGFueSBpc3N1ZXMgd2l0aCB0aGVzZSBiZWlu
ZyBhcHBsaWVkLCBwbGVhc2UKPiA+ID4gPiA+IGxldCBtZSBrbm93Lgo+ID4gPiA+ID4KPiA+ID4g
PiA+IFJlc3BvbnNlcyBzaG91bGQgYmUgbWFkZSBieSBUaHUsIDA0IE1hciAyMDIxIDE5OjI1OjA3
ICswMDAwLgo+ID4gPiA+ID4gQW55dGhpbmcgcmVjZWl2ZWQgYWZ0ZXIgdGhhdCB0aW1lIG1pZ2h0
IGJlIHRvbyBsYXRlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSB3aG9sZSBwYXRjaCBzZXJpZXMg
Y2FuIGJlIGZvdW5kIGluIG9uZSBwYXRjaCBhdDoKPiA+ID4gPiA+ICAgICAgICAgaHR0cHM6Ly93
d3cua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y1Lngvc3RhYmxlLXJldmlldy9wYXRjaC01
LjExLjMtcmMzLmd6Cj4gPiA+ID4gPiBvciBpbiB0aGUgZ2l0IHRyZWUgYW5kIGJyYW5jaCBhdDoK
PiA+ID4gPiA+ICAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0IGxpbnV4LTUuMTEueQo+ID4gPiA+ID4g
YW5kIHRoZSBkaWZmc3RhdCBjYW4gYmUgZm91bmQgYmVsb3cuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
dGhhbmtzLAo+ID4gPiA+ID4KPiA+ID4gPiA+IGdyZWcgay1oCj4gPiA+ID4KPiA+ID4gPgo+ID4g
PiA+IFJlc3VsdHMgZnJvbSBMaW5hcm/igJlzIHRlc3QgZmFybS4KPiA+ID4gPiBBbGwgb3VyIGJ1
aWxkcyBhcmUgZ2V0dGluZyBQQVNTIG5vdy4KPiA+ID4gPiBCdXQsCj4gPiA+ID4gUmVncmVzc2lv
bnMgZGV0ZWN0ZWQgb24gYWxsIGRldmljZXMgKGFybTY0LCBhcm0sIHg4Nl82NCBhbmQgaTM4Niku
Cj4gPiA+ID4gTFRQIHB0eSB0ZXN0IGNhc2UgaGFuZ3VwMDEgZmFpbGVkIG9uIGFsbCBkZXZpY2Vz
Cj4gPiA+ID4KPiA+ID4gPiBoYW5ndXAwMSAgICAxICBURkFJTCAgOiAgaGFuZ3VwMDEuYzoxMzM6
IHVuZXhwZWN0ZWQgbWVzc2FnZSAzCj4gPiA+ID4KPiA+ID4gPiBSZXBvcnRlZC1ieTogTGludXgg
S2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5hcm8ub3JnPgo+ID4gPiA+Cj4gPiA+
ID4gVGhpcyBmYWlsdXJlIGlzIHNwZWNpZmljIHRvIHN0YWJsZS1yYyB2NS4xMC4yMC1yYzQgYW5k
IHY1LjExLjMtcmMzCj4gPiA+ID4gVGVzdCBQQVNTIG9uIHRoZSB2NS4xMi1yYzEgbWFpbmxpbmUg
YW5kIExpbnV4IG5leHQga2VybmVsLgo+ID4gPiA+Cj4gPiA+ID4gRm9sbG93aW5nIHR3byBjb21t
aXRzIGNhdXNlZCB0aGlzIHRlc3QgZmFpbHVyZSwKPiA+ID4gPgo+ID4gPiA+ICAgIExpbnVzIFRv
cnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiA+ID4gPiAgICAgICAgdHR5
OiBpbXBsZW1lbnQgcmVhZF9pdGVyCj4gPiA+ID4KPiA+ID4gPiAgICBMaW51cyBUb3J2YWxkcyA8
dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gPiA+ID4gICAgICAgIHR0eTogY29udmVy
dCB0dHlfbGRpc2Nfb3BzICdyZWFkKCknIGZ1bmN0aW9uIHRvIHRha2UgYSBrZXJuZWwgcG9pbnRl
cgo+ID4gPiA+Cj4gPiA+ID4gVGVzdCBjYXNlIGZhaWxlZCBsaW5rLAo+ID4gPiA+IGh0dHBzOi8v
cWEtcmVwb3J0cy5saW5hcm8ub3JnL2xrZnQvbGludXgtc3RhYmxlLXJjLWxpbnV4LTUuMTEueS9i
dWlsZC92NS4xMS4yLTc3NC1nNmNhNTJkYmM1OGRmL3Rlc3RydW4vNDA3MDE0My9zdWl0ZS9sdHAt
cHR5LXRlc3RzL3Rlc3QvaGFuZ3VwMDEvbG9nCj4gPiA+ID4KPiA+ID4KPiA+ID4gVGhhbmtzIGZv
ciB0ZXN0aW5nIHRoZW0gYWxsLCBJJ2xsIHRyeSB0byBkZWJ1ZyB0aGlzIGxhdGVyIHRvZGF5Li4u
Cj4gPiA+Cj4gPgo+ID4gRGlkIHlvdSBzZWUgbXkgcmVzcG9uc2UgdG8gdjUuMTAueSA/IEl0IGxv
b2tzIGxpa2UgdHdvIHJlbGF0ZWQgcGF0Y2hlcwo+ID4gbWF5IGJlIG1pc3NpbmcgZnJvbSB2NS4x
MC55IGFuZCB2NS4xMS55Lgo+Cj4gSSBkaWQsIHRoYW5rIHlvdSwgSSBuZWVkIHRvIGdldCB0aHJv
dWdoIHNvbWUgb3RoZXIgdGFza3MgZmlyc3QgYmVmb3JlCj4gdHJ5aW5nIHRoZSByZXByb2R1Y2Vy
IGFuZCBzZWUgaWYgdGhlIHBhdGNoZXMgeW91IGxpc3QgZml4IGl0IG9yIG5vdC4uLgoKSSBoYXZl
IGFwcGxpZWQgdGhvc2UgdHdvIHBhdGNoZXMgYW5kIHRoZSByZXBvcnRlZCBwcm9ibGVtIGRpZCBu
b3Qgc29sdmUKb24gdjUuMTAuMjAuCgotIE5hcmVzaAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
