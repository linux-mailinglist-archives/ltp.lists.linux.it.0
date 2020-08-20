Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 522FF24C22E
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 17:28:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF4AF3C2FA2
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 17:28:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0E2A03C005B
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 17:28:11 +0200 (CEST)
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 95DC66000E0
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 17:28:10 +0200 (CEST)
Received: by mail-vs1-xe44.google.com with SMTP id e14so551791vsa.9
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uYPF26fOsnSxq0X3BeFPOk0SUrFLHUyRFGGzgVJXfq8=;
 b=yL9tqtIiWrwVP/vk+PNTbPQudFqQ/Nku03VDHttP1IrTMx970xW8h0wDtHQ7KNfK+I
 SWrGQnvnwuRocjuXw6z77wNdi8Nvhd5I+47g+pDfhaHGkxBrHs04+0q9VRPmUi9bTZlD
 CyuWwq4cV7pUsyLb2cOjDle8eG+aggRgOAFAwDs0D6Ae1uZ927VlLwHo6AXcdIyZePh4
 js71qeG+n+b7/7Iy3nieGkp+iWW2pfeTaKbyCK8OA2Kn/JfDUMbsjTIKuFqRsGkM8i0J
 MEXNsxeYZg2U1hetwLztffdgRucy6cAy8re+dFL3IgCy2CgB5p/DZOVQRHd3lgEY8iS1
 WySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uYPF26fOsnSxq0X3BeFPOk0SUrFLHUyRFGGzgVJXfq8=;
 b=C6OgME0ztBB4OS1ll62PxHb/uEPTFELI/G+XcVx5DR/xsztrkNoCmBaXAf0z5SVjpe
 Pumw46KxGu4P2JGizGGUle6+ozwyrDJ7vTPx4d0E3wws6Ym4uXbS19iCsmWl8GD4nAaW
 oAuYMmhaIlYSaR8XLQCOniRR5ntPbadhzLbV5xNZA4snQbevIVSyGhrTv/HwebvXVHz3
 Wai3dULCpi/IqbeTQ+fuPbFLmHOwPH7XQmELdrmbZ0pfyhLS7z9mqV6Wqv3cr2e7u3Ls
 kEHZVk0nuIoitME059jaHWUMgK98elvsmAyYM7bxtuOHCKixnPokgHanM4JOAvkFIGlo
 o9qA==
X-Gm-Message-State: AOAM5316OxyF+WkB20vMRff3oyM6hLrAdubgALjy1ZWMUEBuj9G6m7qH
 MIhz07pxSCeprjPZ1C0ImZkeTSnm/LTYFnDFfmP3tQ==
X-Google-Smtp-Source: ABdhPJw3x/JjWeGkqsHzLhjFeoMAMLmCjvIghKiFM19pnVR2pzadjfWz1sl+deP5Pc9dZd8e9wEdeR0iwIOlz36At6A=
X-Received: by 2002:a67:e45:: with SMTP id 66mr2349582vso.191.1597937289189;
 Thu, 20 Aug 2020 08:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200820091612.692383444@linuxfoundation.org>
In-Reply-To: <20200820091612.692383444@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 20 Aug 2020 20:57:57 +0530
Message-ID: <CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.8 000/232] 5.8.3-rc1 review
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
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, patches@kernelci.org,
 Eric Biggers <ebiggers@kernel.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, lkft-triage@lists.linaro.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCAyMCBBdWcgMjAyMCBhdCAxNDo1NSwgR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGlzIHRoZSBzdGFydCBvZiB0aGUg
c3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDUuOC4zIHJlbGVhc2UuCj4gVGhlcmUgYXJlIDIz
MiBwYXRjaGVzIGluIHRoaXMgc2VyaWVzLCBhbGwgd2lsbCBiZSBwb3N0ZWQgYXMgYSByZXNwb25z
ZQo+IHRvIHRoaXMgb25lLiAgSWYgYW55b25lIGhhcyBhbnkgaXNzdWVzIHdpdGggdGhlc2UgYmVp
bmcgYXBwbGllZCwgcGxlYXNlCj4gbGV0IG1lIGtub3cuCj4KPiBSZXNwb25zZXMgc2hvdWxkIGJl
IG1hZGUgYnkgU2F0LCAyMiBBdWcgMjAyMCAwOToxNTowOSArMDAwMC4KPiBBbnl0aGluZyByZWNl
aXZlZCBhZnRlciB0aGF0IHRpbWUgbWlnaHQgYmUgdG9vIGxhdGUuCj4KPiBUaGUgd2hvbGUgcGF0
Y2ggc2VyaWVzIGNhbiBiZSBmb3VuZCBpbiBvbmUgcGF0Y2ggYXQ6Cj4gICAgICAgICBodHRwczov
L3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjUueC9zdGFibGUtcmV2aWV3L3BhdGNo
LTUuOC4zLXJjMS5nego+IG9yIGluIHRoZSBnaXQgdHJlZSBhbmQgYnJhbmNoIGF0Ogo+ICAgICAg
ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9s
aW51eC1zdGFibGUtcmMuZ2l0IGxpbnV4LTUuOC55Cj4gYW5kIHRoZSBkaWZmc3RhdCBjYW4gYmUg
Zm91bmQgYmVsb3cuCj4KPiB0aGFua3MsCj4KPiBncmVnIGstaAoKPiBIZXJiZXJ0IFh1IDxoZXJi
ZXJ0QGdvbmRvci5hcGFuYS5vcmcuYXU+Cj4gICAgIGNyeXB0bzogYWZfYWxnIC0gRml4IHJlZ3Jl
c3Npb24gb24gZW1wdHkgcmVxdWVzdHMKClJlc3VsdHMgZnJvbSBMaW5hcm/igJlzIHRlc3QgZmFy
bS4KUmVncmVzc2lvbnMgZGV0ZWN0ZWQuCgogIGx0cC1jcnlwdG8tdGVzdHM6CiAgICAqIGFmX2Fs
ZzAyCiAgbHRwLWN2ZS10ZXN0czoKICAgICogY3ZlLTIwMTctMTc4MDUKCmFmX2FsZzAyLmM6NTI6
IEJST0s6IFRpbWVkIG91dCB3aGlsZSByZWFkaW5nIGZyb20gcmVxdWVzdCBzb2NrZXQuCldlIGFy
ZSBydW5uaW5nIHRoZSBMVFAgMjAyMDA1MTUgdGFnIHJlbGVhc2VkIHRlc3Qgc3VpdGUuCiBodHRw
czovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9ibG9iL21hc3Rlci90ZXN0Y2Fz
ZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jCgpTdW1tYXJ5Ci0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKa2Vy
bmVsOiA1LjguMy1yYzEKZ2l0IHJlcG86IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0CmdpdCBicmFuY2g6IGxp
bnV4LTUuOC55CmdpdCBjb21taXQ6IDIwMWZmZjgwNzMxMGNlMTA0ODViY2ZmMjk0ZDQ3YmU5NWYz
NzY5ZWIKZ2l0IGRlc2NyaWJlOiB2NS44LjItMjMzLWcyMDFmZmY4MDczMTAKVGVzdCBkZXRhaWxz
OiBodHRwczovL3FhLXJlcG9ydHMubGluYXJvLm9yZy9sa2Z0L2xpbnV4LXN0YWJsZS1yYy01Ljgt
b2UvYnVpbGQvdjUuOC4yLTIzMy1nMjAxZmZmODA3MzEwCgpSZWdyZXNzaW9ucyAoY29tcGFyZWQg
dG8gYnVpbGQgdjUuOC4yKQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCngxNToKICBsdHAtY3J5cHRvLXRlc3Rz
OgogICAgKiBhZl9hbGcwMgoKICBsdHAtY3ZlLXRlc3RzOgogICAgKiBjdmUtMjAxNy0xNzgwNQoK
Ci0tIApMaW5hcm8gTEtGVApodHRwczovL2xrZnQubGluYXJvLm9yZwoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
