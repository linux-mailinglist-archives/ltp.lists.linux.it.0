Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 362AD32993C
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:15:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE88C3C5730
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:15:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 33A8F3C56B4
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:15:25 +0100 (CET)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AD6A314010D2
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:15:24 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id dx17so6602381ejb.2
 for <ltp@lists.linux.it>; Tue, 02 Mar 2021 02:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MpgdEY+xkJdsoRX59VzkePVcPoFPaD3OZG7TYDRW4KU=;
 b=q66k2buIJldsnHIt6TmO9TJrxPJTcGOMHfKWA3WCAouMGR3WMo6B1zOIXj+5dyCPgU
 Erzg6/W683GesDNNNQmv7RT/bTEnndnfV8LQi4GA/MZgq2wyq83WLjGgoabkHXJLTd0+
 nSefuvXOD4AXnHIBm25McxuQeA8JTVFa1Nv5WVaSL8umn9cPbmNzfnYe7hXSXvONWO5B
 fLsmN9hJPAELZB0gTNNnkJK+J4w4Abt3pWXQ7L0IKyc20evQzDQuByWKmTvH3AKR2b6P
 YYrLStCfOny5+3bbHRw31rZ5iFf+KdrgiivY1heV973Eu1a/02hD1p0egRG8snj6X8Bk
 fidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MpgdEY+xkJdsoRX59VzkePVcPoFPaD3OZG7TYDRW4KU=;
 b=QFLstAyAkoPY8A+k0A8PxBDVCCbNsoMTe6UTQIoQ+iFDEi6WwzvoDY/F65ccPtStJa
 zukibUGM9uqInsQTHui/Z/gHUiSC+VZbFSkY9B+JLNqcPxgQ8vOb0uUmgj7IprCjN5gU
 6n7t7gstmISxikxG5TJSh3UDygYXWV3pU+/kl7EQ3rfNqr8er4j58hEGXE1j2mYqagPG
 u7XNJTj4/YGSbJAgAsh7ZDIPDnEcwTMVc8P34Aei+zCCl0LRXA4zg5kanpRQeRJ96rmv
 Blds2yQ6IsvdJoR+YgqXgSQGPWogQdiVZ+WomiD7qOeUKdjRt8X/4ylOmmKfKoXQARlu
 XqkA==
X-Gm-Message-State: AOAM531vu9mniwS7PLzsbexDiV03iG25US43xbQAcHIl40ZA3dbFIgDv
 UTx85bsTgbB9QdTcPB+u6HFiGDj9M5/zVUAIhzc7Wg==
X-Google-Smtp-Source: ABdhPJwlLd0mNZbGEtX9E/pIytMCFYrh0qNifxpn5diBNusJ17Ap1GHoboVpaKamYOneEv6/1WANMx+miaF3e88roFk=
X-Received: by 2002:a17:906:a896:: with SMTP id
 ha22mr20045311ejb.503.1614680124240; 
 Tue, 02 Mar 2021 02:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20210301193642.707301430@linuxfoundation.org>
 <CA+G9fYuK0k0FsnSk4egKOO=B0pV80bjp+f5E-0xPOfbPugQPxg@mail.gmail.com>
 <CA+G9fYsivUPRRQgMXpnA_XdXH8i2wx_DPH70t+6OzHkjOaswrg@mail.gmail.com>
 <YD4L57LQb8Nh/A85@kroah.com>
In-Reply-To: <YD4L57LQb8Nh/A85@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 2 Mar 2021 15:45:13 +0530
Message-ID: <CA+G9fYsuLBo86PVUGVx=w6w8t9UCmNw+Co53_g_suE_my9Mmug@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.10 000/661] 5.10.20-rc2 review
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, linux-stable <stable@vger.kernel.org>, pavel@denx.de,
 Jiri Slaby <jirislaby@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Jon Hunter <jonathanh@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCAyIE1hciAyMDIxIGF0IDE1OjI2LCBHcmVnIEtyb2FoLUhhcnRtYW4KPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWFyIDAyLCAyMDIxIGF0IDAz
OjIwOjMyUE0gKzA1MzAsIE5hcmVzaCBLYW1ib2p1IHdyb3RlOgo+ID4gSGkgR3JlZyBhbmQgTGlu
dXMsCj4gPgo+ID4gT24gVHVlLCAyIE1hciAyMDIxIGF0IDEyOjQ1LCBOYXJlc2ggS2FtYm9qdSA8
bmFyZXNoLmthbWJvanVAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFR1ZSwgMiBN
YXIgMjAyMSBhdCAwMToyMSwgR3JlZyBLcm9haC1IYXJ0bWFuCj4gPiA+IDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIGlzIHRoZSBzdGFydCBv
ZiB0aGUgc3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDUuMTAuMjAgcmVsZWFzZS4KPiA+ID4g
PiBUaGVyZSBhcmUgNjYxIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIGFsbCB3aWxsIGJlIHBvc3Rl
ZCBhcyBhIHJlc3BvbnNlCj4gPiA+ID4gdG8gdGhpcyBvbmUuICBJZiBhbnlvbmUgaGFzIGFueSBp
c3N1ZXMgd2l0aCB0aGVzZSBiZWluZyBhcHBsaWVkLCBwbGVhc2UKPiA+ID4gPiBsZXQgbWUga25v
dy4KPiA+ID4gPgo+ID4gPiA+IFJlc3BvbnNlcyBzaG91bGQgYmUgbWFkZSBieSBXZWQsIDAzIE1h
ciAyMDIxIDE5OjM0OjUzICswMDAwLgo+ID4gPiA+IEFueXRoaW5nIHJlY2VpdmVkIGFmdGVyIHRo
YXQgdGltZSBtaWdodCBiZSB0b28gbGF0ZS4KPiA+ID4gPgo+ID4gPiA+IFRoZSB3aG9sZSBwYXRj
aCBzZXJpZXMgY2FuIGJlIGZvdW5kIGluIG9uZSBwYXRjaCBhdDoKPiA+ID4gPiAgICAgICAgIGh0
dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5lbC92NS54L3N0YWJsZS1yZXZpZXcv
cGF0Y2gtNS4xMC4yMC1yYzIuZ3oKPiA+ID4gPiBvciBpbiB0aGUgZ2l0IHRyZWUgYW5kIGJyYW5j
aCBhdDoKPiA+ID4gPiAgICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdCBsaW51eC01LjEwLnkKPiA+ID4g
PiBhbmQgdGhlIGRpZmZzdGF0IGNhbiBiZSBmb3VuZCBiZWxvdy4KPiA+ID4gPgo+ID4gPiA+IHRo
YW5rcywKPiA+ID4gPgo+ID4gPiA+IGdyZWcgay1oCj4gPiA+Cj4gPiA+Cj4gPiA+IFJlc3VsdHMg
ZnJvbSBMaW5hcm/igJlzIHRlc3QgZmFybS4KPiA+ID4gUmVncmVzc2lvbnMgZGV0ZWN0ZWQgb24g
YWxsIGRldmljZXMgKGFybTY0LCBhcm0sIHg4Nl82NCBhbmQgaTM4NikuCj4gPiA+Cj4gPiA+IGhh
bmd1cDAxICAgIDEgIFRGQUlMICA6ICBoYW5ndXAwMS5jOjEzMzogdW5leHBlY3RlZCBtZXNzYWdl
IDMKPiA+ID4KPiA+ID4gVGhpcyBmYWlsdXJlIGlzIHNwZWNpZmljIHRvIHN0YWJsZS1yYyA1LjEw
IGFuZCA1LjExLgo+ID4gPiBUZXN0IFBBU1Mgb24gbWFpbmxpbmUgYW5kIExpbnV4IG5leHQga2Vy
bmVsLgo+ID4gPgo+ID4KPiA+IEkgaGF2ZSByZXZlcnRlZCB0aGVzZSB0d28gcGF0Y2hlcyBhbmQg
dGhlIHRlc3QgY2FzZSBnb3QgUEFTUwo+ID4gb24gTGludXggdmVyc2lvbiA1LjEwLjIwLXJjMi4K
PiA+Cj4gPiBoYW5ndXAwMSAxIFRQQVNTIDogY2hpbGQgcHJvY2VzcyBleGl0ZWQgd2l0aCBzdGF0
dXMgMAo+ID4KPiA+ICAgIExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9u
Lm9yZz4KPiA+ICAgICAgICB0dHk6IGltcGxlbWVudCByZWFkX2l0ZXIKPiA+Cj4gPiAgICBMaW51
cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gPiAgICAgICAgdHR5
OiBjb252ZXJ0IHR0eV9sZGlzY19vcHMgJ3JlYWQoKScgZnVuY3Rpb24gdG8gdGFrZSBhIGtlcm5l
bCBwb2ludGVyCj4KPiBPZGQuCj4KPiBJcyA1LjEyLXJjMSBhbHNvIGZhaWxpbmcgd2l0aCB0aGlz
IHRlc3QgYXMgd2VsbD8KCk5vLgpUZXN0IFBBU1Mgb24gdjUuMTItcmMxLgoKLSBOYXJlc2gKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
