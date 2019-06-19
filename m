Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D34144BA98
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 15:57:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 980D23EA9C2
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 15:57:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D461B3EA376
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 15:57:24 +0200 (CEST)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2B1441A0048F
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 15:57:24 +0200 (CEST)
Received: by mail-lj1-x243.google.com with SMTP id m23so3326715lje.12
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rNSyYuITCcI3jikGC1gDns3xHgkTNs+uPqbRZZcc3nY=;
 b=VCT2X5r8UNDrC549EZliZM+jfvXcqrA8gVioNLV1x4GX37oWTULaBKafQv/LSUe1ZS
 5UgcvGskg5kWCJ86Jt/8/Id9LFYsAOxwu6Fv1OYJbU4Ea5I036By0h4XV4JL/jVK0FfA
 hijR+FikRo54Vp8/jDi0O54Wr4pLQFpFjwiiI6Gino7Hp+RI+YGU67jBkUrFjITl3Gsk
 JYEtjmFPJTkPnOnGdwfUX2McW62zJji4tUsa+AsC1RNvmarGFOllZWKfyXMhBJRRP7O0
 3F2f+PHKM2MQsZR/wtTYaREPbpDCpTQXdchbiYxjpdrDDD8LNGXJqc7Wx3A7TfAViJgz
 hsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rNSyYuITCcI3jikGC1gDns3xHgkTNs+uPqbRZZcc3nY=;
 b=NE+bKx6e9vCZ0FPqqfkkvmsfby25DPZ6eUqLiBJnQp1OnuYXn0Xaf3/nUo7bOIafsX
 hlGZ4pO+EFJlDFkfLxb30JTSG+S52wysh+bYs5NReIMyR6GZq/No9/8j6FGQn7W1hLAh
 fSKjsc4WFWIFtHW4wbXECtlQECD7vj1fvvV4khkXHi0OnAHFp/xcvQJTEyXDoj1Wn8GO
 hqhLIVOMWqarZmR7GVkFRHYAJPCnPZ0TwGV29N8ZdLnq7BA7F0Dqfso5rifiGmL9ILHG
 IT9bZcpRFPCjWaykT/jbpE2woDm9bFXuD00Hr5MD/Gkrqi/IGvkWbg5E7Mc4iq2guDqa
 3WZA==
X-Gm-Message-State: APjAAAVVQN/DaIEDzfHH2DBqHw948ox46xqHzu3cM3nZVwN5PJWNIwIG
 yNZ0HgBZgjABBxbuEWdWSYnR1/TFeyvot9xH79NGK+YKnsI=
X-Google-Smtp-Source: APXvYqzGoaY9tHLGYROhSPxwmFZmqQEVlQ2nk2kyOPyOUw7kKaFnQQUjhGBVXGNpwg4xC1k9g2s1da9VqUCiWFY83EE=
X-Received: by 2002:a2e:864d:: with SMTP id i13mr4366867ljj.92.1560952643540; 
 Wed, 19 Jun 2019 06:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190619123148.29733-1-chrubis@suse.cz>
In-Reply-To: <20190619123148.29733-1-chrubis@suse.cz>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 19 Jun 2019 19:27:12 +0530
Message-ID: <CAFA6WYMyfAe+QHZfDFTR9YZedjyrhKSEU4-nx+MOtX5H=dHC+Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH 0/2] sync_file_range02 skip tests on FUSE
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

T24gV2VkLCAxOSBKdW4gMjAxOSBhdCAxODowMSwgQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2Uu
Y3o+IHdyb3RlOgo+Cj4gQXMgZGlzY3Vzc2VkIG9uIExUUCBNTCBpdCBkb2VzIG5vdCBtYWtlIHNl
bnNlIHRvIHJ1biB0aGUKPiBzeW5jX2ZpbGVfcmFuZ2UuCj4KPiBDeXJpbCBIcnViaXMgKDIpOgo+
ICAgbGliOiBBZGQgZmxhZ3MgdG8gdHN0X2dldF9zdXBwb3J0ZWRfZnNfdHlwZXMoKQo+ICAgc3lz
Y2FsbHMvc3luY19maWxlX3JhbmdlMDI6IFNraXAgdGVzdCBvbiBmdXNlLgo+CgpBY2tlZC1ieTog
U3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPgoKPiAgaW5jbHVkZS90c3RfZnMuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKystLQo+ICBpbmNsdWRlL3Rz
dF90ZXN0LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKPiAgbGliL3Rz
dF9zdXBwb3J0ZWRfZnNfdHlwZXMuYyAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysr
KystLS0tLQo+ICBsaWIvdHN0X3Rlc3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KPiAgLi4uL3N5c2NhbGxzL3N5bmNfZmlsZV9yYW5nZS9zeW5jX2ZpbGVfcmFu
Z2UwMi5jICB8ICAxICsKPiAgdGVzdGNhc2VzL2xpYi90c3Rfc3VwcG9ydGVkX2ZzLmMgICAgICAg
ICAgICAgICAgICB8ICA0ICsrLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi4xOS4yCj4KPgo+IC0tCj4gTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
