Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5932B5F3
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 09:32:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4C293C56A7
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 09:32:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id CA5A33C2FCD
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 09:32:33 +0100 (CET)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EA17910008EC
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 09:32:32 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id mj10so20432712ejb.5
 for <ltp@lists.linux.it>; Wed, 03 Mar 2021 00:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BqekrOVrolDpMG5/JmcfAVvwbTu8RV0j7Se99VtBEcc=;
 b=P/uquj684daW3A9Yv0Xkt8CYVBwRo6rBr82FZNHKB2DuIJdQC8PDPM/3w45UUn9gYj
 SQkWWvqCBUmN6HhFSCsVTygg7Rs5JqBTo6nfEjpDFz10wooVgcphM0qYiCzvpHt7i5tX
 IqxkmEOymk5/q8KAtpF0bG8WdlVSlahvvPZAjSQSr9VwJOgE9KLeoklPAv08UPQTuoqr
 ZnHyWSXxDul0pcgPraS8bYVyMqdidsx5PhINDgqOpD72W5SYxJxU6uIfdydQ8eZOyNMn
 lrmIdtT6l7RUpsiE5bD9L9cFBNwSXwjFmSBWFlJt9BRF2SqLAcIKtXZ8aars7BmtIhYj
 uPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BqekrOVrolDpMG5/JmcfAVvwbTu8RV0j7Se99VtBEcc=;
 b=Jz2Kjy2Ctn4lpVfppjGKqJRjP5bVgoGcVK+SN89DP8YmIIBquYmr2xO9dAhW/0qANU
 IWHx5tAXpjJRgcVDzUwZqvLE1e+ImpXrfHEsAn9fkfoOV5JOqZlVbS1Dd8XEXxI21tex
 VbJQT68uibOvfPsZkDyXx4leyUtfjLB4Z7/ZfZ5FIFMCXmiW11X3QHp5swRz35wXcL6n
 LH+LiN884xbOZdfYKhhW/hEGCBSDbem5Zsz3q/0VA9J66zlWqaVt5MzYf2/snriQ1lnr
 3B5VD677fOv8AkxaPE6hp+GXAVs4gm14IjH0W5t7hiaP02iLhPM/yVXOeIoE/hkfv8b9
 QF8A==
X-Gm-Message-State: AOAM5315kO9uBo9psFu5gIaE90xzAq+aE1kU0DLBUAD6g9eBJaB+Rmrr
 hE6e+XnfNq+mvnZiq1C8LksOiImDMY18LP6NWzMEJA==
X-Google-Smtp-Source: ABdhPJxLGkewqef2ptqvWfzIQC0wsO06AMlom/LK9nRXq1YbtxPiX/brbeeo/8lskFM/06A0G+ZRg92pBd4v5pf4mqM=
X-Received: by 2002:a17:906:b2c3:: with SMTP id
 cf3mr23862604ejb.133.1614760352304; 
 Wed, 03 Mar 2021 00:32:32 -0800 (PST)
MIME-Version: 1.0
References: <20210302192719.741064351@linuxfoundation.org>
In-Reply-To: <20210302192719.741064351@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 3 Mar 2021 14:02:20 +0530
Message-ID: <CA+G9fYvkW+84U9e0Cjft_pq9bGnBBqCXST7Hg+gx4pKNyuGPFQ@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, pavel@denx.de,
 LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Jon Hunter <jonathanh@nvidia.com>,
 linux-stable <stable@vger.kernel.org>, patches@kernelci.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gV2VkLCAzIE1hciAyMDIxIGF0IDAwOjU5LCBHcmVnIEtyb2FoLUhhcnRtYW4KPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IFRoaXMgaXMgdGhlIHN0YXJ0IG9mIHRoZSBz
dGFibGUgcmV2aWV3IGN5Y2xlIGZvciB0aGUgNS4xMS4zIHJlbGVhc2UuCj4gVGhlcmUgYXJlIDc3
MyBwYXRjaGVzIGluIHRoaXMgc2VyaWVzLCBhbGwgd2lsbCBiZSBwb3N0ZWQgYXMgYSByZXNwb25z
ZQo+IHRvIHRoaXMgb25lLiAgSWYgYW55b25lIGhhcyBhbnkgaXNzdWVzIHdpdGggdGhlc2UgYmVp
bmcgYXBwbGllZCwgcGxlYXNlCj4gbGV0IG1lIGtub3cuCj4KPiBSZXNwb25zZXMgc2hvdWxkIGJl
IG1hZGUgYnkgVGh1LCAwNCBNYXIgMjAyMSAxOToyNTowNyArMDAwMC4KPiBBbnl0aGluZyByZWNl
aXZlZCBhZnRlciB0aGF0IHRpbWUgbWlnaHQgYmUgdG9vIGxhdGUuCj4KPiBUaGUgd2hvbGUgcGF0
Y2ggc2VyaWVzIGNhbiBiZSBmb3VuZCBpbiBvbmUgcGF0Y2ggYXQ6Cj4gICAgICAgICBodHRwczov
L3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjUueC9zdGFibGUtcmV2aWV3L3BhdGNo
LTUuMTEuMy1yYzMuZ3oKPiBvciBpbiB0aGUgZ2l0IHRyZWUgYW5kIGJyYW5jaCBhdDoKPiAgICAg
ICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUv
bGludXgtc3RhYmxlLXJjLmdpdCBsaW51eC01LjExLnkKPiBhbmQgdGhlIGRpZmZzdGF0IGNhbiBi
ZSBmb3VuZCBiZWxvdy4KPgo+IHRoYW5rcywKPgo+IGdyZWcgay1oCgoKUmVzdWx0cyBmcm9tIExp
bmFyb+KAmXMgdGVzdCBmYXJtLgpBbGwgb3VyIGJ1aWxkcyBhcmUgZ2V0dGluZyBQQVNTIG5vdy4K
QnV0LApSZWdyZXNzaW9ucyBkZXRlY3RlZCBvbiBhbGwgZGV2aWNlcyAoYXJtNjQsIGFybSwgeDg2
XzY0IGFuZCBpMzg2KS4KTFRQIHB0eSB0ZXN0IGNhc2UgaGFuZ3VwMDEgZmFpbGVkIG9uIGFsbCBk
ZXZpY2VzCgpoYW5ndXAwMSAgICAxICBURkFJTCAgOiAgaGFuZ3VwMDEuYzoxMzM6IHVuZXhwZWN0
ZWQgbWVzc2FnZSAzCgpSZXBvcnRlZC1ieTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGlu
ZyA8bGtmdEBsaW5hcm8ub3JnPgoKVGhpcyBmYWlsdXJlIGlzIHNwZWNpZmljIHRvIHN0YWJsZS1y
YyB2NS4xMC4yMC1yYzQgYW5kIHY1LjExLjMtcmMzClRlc3QgUEFTUyBvbiB0aGUgdjUuMTItcmMx
IG1haW5saW5lIGFuZCBMaW51eCBuZXh0IGtlcm5lbC4KCkZvbGxvd2luZyB0d28gY29tbWl0cyBj
YXVzZWQgdGhpcyB0ZXN0IGZhaWx1cmUsCgogICBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGlu
dXgtZm91bmRhdGlvbi5vcmc+CiAgICAgICB0dHk6IGltcGxlbWVudCByZWFkX2l0ZXIKCiAgIExp
bnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KICAgICAgIHR0eTog
Y29udmVydCB0dHlfbGRpc2Nfb3BzICdyZWFkKCknIGZ1bmN0aW9uIHRvIHRha2UgYSBrZXJuZWwg
cG9pbnRlcgoKVGVzdCBjYXNlIGZhaWxlZCBsaW5rLApodHRwczovL3FhLXJlcG9ydHMubGluYXJv
Lm9yZy9sa2Z0L2xpbnV4LXN0YWJsZS1yYy1saW51eC01LjExLnkvYnVpbGQvdjUuMTEuMi03NzQt
ZzZjYTUyZGJjNThkZi90ZXN0cnVuLzQwNzAxNDMvc3VpdGUvbHRwLXB0eS10ZXN0cy90ZXN0L2hh
bmd1cDAxL2xvZwoKCi0tIApMaW5hcm8gTEtGVApodHRwczovL2xrZnQubGluYXJvLm9yZwoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
