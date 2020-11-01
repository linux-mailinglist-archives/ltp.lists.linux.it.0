Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A94422A1C7F
	for <lists+linux-ltp@lfdr.de>; Sun,  1 Nov 2020 08:04:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21AF83C3078
	for <lists+linux-ltp@lfdr.de>; Sun,  1 Nov 2020 08:04:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 808653C23B8
 for <ltp@lists.linux.it>; Sun,  1 Nov 2020 08:04:55 +0100 (CET)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E71466404B0
 for <ltp@lists.linux.it>; Sun,  1 Nov 2020 08:04:54 +0100 (CET)
Received: by mail-ed1-x542.google.com with SMTP id o18so10928761edq.4
 for <ltp@lists.linux.it>; Sun, 01 Nov 2020 00:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FhEY5xf3E+aW2yCGV8SL4Wn8WcDv8DyQUUrSCoTvQic=;
 b=tBk5o58fI/RgVowcC/WnLBizxhTkfQK71COkcedg81q5jTYfWCkM/9NOtJtgRjMx4u
 rJMpCRXTaMc6CzD5SsvObnOqLrWbZmOyILoS3zAWHHmdBF5n5Wh8u6zueBsg5Uzkg0UL
 9LfqUg5UNyDw9EoD1uxVvpOhCbXeTI0/S3wUW0G2IV+jGL51AJAlN5hbCW+PRQYHaHuw
 QyuC4KQEjBIwHMnec+j9Qxx6EWlLHcftY4gV3TvQvXn64zCxPL3oagFQZ4RZIyaxoMe8
 KZomw3kdcuRKJzuSmldAA7F/7Ja+Zu877HuW68+5u1VTonaaCr/j2XnDy/ibSpmQ2wS1
 gn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FhEY5xf3E+aW2yCGV8SL4Wn8WcDv8DyQUUrSCoTvQic=;
 b=kNS0Mo1SSKqpi4HLEdmYiuf6CgzJB9O/SKOeXhrdkRBYb11Mys+tieUM5HjtlwvCPB
 9FEv/Ef/mmkHo/NV1Y5OjJ8uL245xQ3U/E8nKIPOc/3L39XTLbZmgtNV/FrfsjDRLxv1
 4Cnr1/mPzmaYuxhDTRmACfXqndHuv44oUIdx3xUaiQOFLeD43MpLV0KnFpW6syk8Llw0
 xgwtASkw/2jz9aEbpIDfA2jwQiAEEBd5C5vVlFXj3Yf45pYmBpwigotKZoC2hemfQH1R
 MaER1MePVuGHIZP9jgq+OwuBN5B3s82duZV/DHOisaTQ/RiLmqqxyUCSOiJXMRzA5ubN
 k9dg==
X-Gm-Message-State: AOAM530kr+njUi82P9dMPq95Uu35GOH+qIgcxGNdWqeVxivXFYyrHN/x
 H57iG5r1Vx553oNaG59qeIa0c5jY+5Pdl7S1BbRj0w==
X-Google-Smtp-Source: ABdhPJynmej9nQmQpBCToQImgdYv/KcAPb5cD+mw+03564+9kS+eWrzYzkMmvOcg1KajXMH9+WTjTfDWM+L/LvccZZU=
X-Received: by 2002:aa7:c2d7:: with SMTP id m23mr10910678edp.230.1604214294256; 
 Sun, 01 Nov 2020 00:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201031113500.031279088@linuxfoundation.org>
In-Reply-To: <20201031113500.031279088@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 1 Nov 2020 12:34:42 +0530
Message-ID: <CA+G9fYshNJgQFZ_oxb4VgSbe2xWym9am6ajpr-SVH_bw4psa1Q@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.9 00/74] 5.9.3-rc1 review
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
Cc: pavel@denx.de, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, patches@kernelci.org,
 Linus Torvalds <torvalds@linux-foundation.org>, lkft-triage@lists.linaro.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gU2F0LCAzMSBPY3QgMjAyMCBhdCAxNzoxNywgR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGlzIHRoZSBzdGFydCBvZiB0aGUg
c3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDUuOS4zIHJlbGVhc2UuCj4gVGhlcmUgYXJlIDc0
IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIGFsbCB3aWxsIGJlIHBvc3RlZCBhcyBhIHJlc3BvbnNl
Cj4gdG8gdGhpcyBvbmUuICBJZiBhbnlvbmUgaGFzIGFueSBpc3N1ZXMgd2l0aCB0aGVzZSBiZWlu
ZyBhcHBsaWVkLCBwbGVhc2UKPiBsZXQgbWUga25vdy4KPgo+IFJlc3BvbnNlcyBzaG91bGQgYmUg
bWFkZSBieSBNb24sIDAyIE5vdiAyMDIwIDExOjM0OjQyICswMDAwLgo+IEFueXRoaW5nIHJlY2Vp
dmVkIGFmdGVyIHRoYXQgdGltZSBtaWdodCBiZSB0b28gbGF0ZS4KPgo+IFRoZSB3aG9sZSBwYXRj
aCBzZXJpZXMgY2FuIGJlIGZvdW5kIGluIG9uZSBwYXRjaCBhdDoKPiAgICAgICAgIGh0dHBzOi8v
d3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5lbC92NS54L3N0YWJsZS1yZXZpZXcvcGF0Y2gt
NS45LjMtcmMxLmd6Cj4gb3IgaW4gdGhlIGdpdCB0cmVlIGFuZCBicmFuY2ggYXQ6Cj4gICAgICAg
ICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xp
bnV4LXN0YWJsZS1yYy5naXQgbGludXgtNS45LnkKPiBhbmQgdGhlIGRpZmZzdGF0IGNhbiBiZSBm
b3VuZCBiZWxvdy4KPgo+IHRoYW5rcywKPgo+IGdyZWcgay1oCj4KClJlc3VsdHMgZnJvbSBMaW5h
cm/igJlzIHRlc3QgZmFybS4KTm8gcmVncmVzc2lvbnMgb24gYXJtNjQsIGFybSwgeDg2XzY0LCBh
bmQgaTM4Ni4KClRlc3RlZC1ieTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtm
dEBsaW5hcm8ub3JnPgoKTk9URToKTFRQIHZlcnNpb24gdXBncmFkZSB0byAyMDIwMDkzMC4gRHVl
IHRvIHRoaXMgY2hhbmdlIHdlIGhhdmUgbm90aWNlZCBmZXcgdGVzdApmYWlsdXJlcyBhbmQgZml4
ZXMgd2hpY2ggYXJlIG5vdCByZWxhdGVkIHRvIGtlcm5lbCBjaGFuZ2VzLgoKU3VtbWFyeQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KCmtlcm5lbDogNS45LjMtcmMxCmdpdCByZXBvOiBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdp
dApnaXQgYnJhbmNoOiBsaW51eC01LjkueQpnaXQgY29tbWl0OiBkYWUyYzkwMmQwNDgwZjllNTE4
OTE3Njg4NjJmMDM0ZWU5N2Y0ZGIxCmdpdCBkZXNjcmliZTogdjUuOS4yLTc1LWdkYWUyYzkwMmQw
NDgKVGVzdCBkZXRhaWxzOiBodHRwczovL3FhLXJlcG9ydHMubGluYXJvLm9yZy9sa2Z0L2xpbnV4
LXN0YWJsZS1yYy1saW51eC01LjkueS9idWlsZC92NS45LjItNzUtZ2RhZTJjOTAyZDA0OAoKTm8g
cmVncmVzc2lvbnMgKGNvbXBhcmVkIHRvIGJ1aWxkIHY1LjkuMikKCk5vIGZpeGVzIChjb21wYXJl
ZCB0byBidWlsZCB2NS45LjIpCgpGaXhlcyAoY29tcGFyZWQgdG8gTFRQIDIwMjAwNTE1KQpUaGVz
ZSBmaXhlcyBhcmUgY29taW5nIGZyb20gTFRQIHVwZ3JhZGUgMjAyMDA5MzAuCiAgbHRwLWNvbW1h
bmRzLXRlc3RzOgogICAgKiBsb2dyb3RhdGVfc2gKCiAgbHRwLWNvbnRhaW5lcnMtdGVzdHM6CiAg
ICAqIG5ldG5zX25ldGxpbmsKCiAgbHRwLWNvbnRyb2xsZXJzLXRlc3RzOgogICAgKiBjcHVzZXRf
aG90cGx1ZwoKICBsdHAtY3J5cHRvLXRlc3RzOgogICAgKiBhZl9hbGcwMgoKICBsdHAtY3ZlLXRl
c3RzOgogICAgKiBjdmUtMjAxNy0xNzgwNQogICAgKiBjdmUtMjAxOC0xMDAwMTk5CgogIGx0cC1z
eXNjYWxscy10ZXN0czoKICAgICogY2xvY2tfZ2V0dGltZTAzCiAgICAqIGNsb25lMzAyCiAgICAq
IGNvcHlfZmlsZV9yYW5nZTAyCiAgICAqIG1rbm9kMDcKICAgICogcHRyYWNlMDgKICAgICogc3lz
bG9nMDEKICAgICogc3lzbG9nMDIKICAgICogc3lzbG9nMDMKICAgICogc3lzbG9nMDQKICAgICog
c3lzbG9nMDUKICAgICogc3lzbG9nMDcKICAgICogc3lzbG9nMDgKICAgICogc3lzbG9nMDkKICAg
ICogc3lzbG9nMTAKCiAgbHRwLW9wZW4tcG9zaXgtdGVzdHM6CiAgICAqIGNsb2Nrc19pbnZhbGlk
ZGF0ZXMKCi0tIApMaW5hcm8gTEtGVApodHRwczovL2xrZnQubGluYXJvLm9yZwoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
