Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 066E5329938
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:12:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 906443C5742
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:12:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 913B33C56B4
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:12:37 +0100 (CET)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0E5086007B2
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:12:37 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id hs11so34164150ejc.1
 for <ltp@lists.linux.it>; Tue, 02 Mar 2021 02:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9emZJGXSfS3CBcoV3moek0dr0o68xi0UvE5qBXpPUXA=;
 b=fr17Px/Z62oKFGYJ/W88x9bOoKKpT/UW7LHPP7GzTTUryspn3cBwYenB6BbxirCW3r
 XOCtCtIgvkezeRYYTG0m9S7vRfZb0U+NKoF9KTGtjklJjsgD06NXphU1asP1hXb6Kp+D
 ekVH4pz2whvgusZscWvubpgcqi5Qw0KtAuMgKCmoDoLitRb/PNvLqpI6ca+hE3rr6HUS
 fJRzAqiD31DYBZ4MSH19AliggrS3qJgAn/NMD4/rAXQksEax49z1TQWGk/SiZQhuNuVN
 gXXJ97iZwOrOaD1D6BLA1BXmzAR2zDnTP3W9yBOerDdyJC9OI3l6n29fxZo0vOU6UXKA
 KiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9emZJGXSfS3CBcoV3moek0dr0o68xi0UvE5qBXpPUXA=;
 b=RQ/R1k10cr4dB226U53q9aUO41VC/lBBSkRrjqocST2I1Wx4SWmTodTNSDvGe9kcpU
 VWZKg86Eg+zLexBowO0nK/rDm+A5Olq2eRXNji7ytFDZToQUDqkjHBnV2ZQVywaklJ56
 nKYOs2843IQRxZ7A8tom0ErgXvZzccKaUNs+iSPeTJEXrmPF3c218AN6264HKi312l4E
 KRFikLkKsjCuJ3UTyi06s0dKiFzaMlE11KiJ4rcsvjmKZO7gjdiU7Gr3cAEhRl9BanmP
 BjHzGKQbMzQzo8lt4ycaw2YsD0TWd6zOZclk99QyL8SR8g7Ss+nl3dwlfhgNxmLIRX8E
 bgqg==
X-Gm-Message-State: AOAM533vpL5jQ768yofd4yhIfwJvVydSD48UWa82t8hzlqXbKUMLnl4q
 H6KS2fByRJ8H/Y03GVJEUh1OROYhBp+We/DPvJaP9g==
X-Google-Smtp-Source: ABdhPJygHRWR6muKo1EKip/CdEc4MkfpNRQJIYTz00eMsp1q2b55BBcAgn3jRL2LvNtMSRKUwCewGi/MkwTQZskjB/0=
X-Received: by 2002:a17:906:7b8d:: with SMTP id
 s13mr20268094ejo.247.1614679956551; 
 Tue, 02 Mar 2021 02:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20210301193642.707301430@linuxfoundation.org>
 <CA+G9fYuK0k0FsnSk4egKOO=B0pV80bjp+f5E-0xPOfbPugQPxg@mail.gmail.com>
 <CA+G9fYsivUPRRQgMXpnA_XdXH8i2wx_DPH70t+6OzHkjOaswrg@mail.gmail.com>
 <YD4L57LQb8Nh/A85@kroah.com>
In-Reply-To: <YD4L57LQb8Nh/A85@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 2 Mar 2021 15:42:25 +0530
Message-ID: <CA+G9fYtbYENvUk8z78k3OHj5cULbd5Tc3Dfew0EE6sKfndOJxA@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
IHRlc3QgYXMgd2VsbD8KCjUuMTAgRmFpbGVkCjUuMTEgRmFpbGVkCjUuMTIgUEFTUwoKVGhpcyBM
VFAgcHR5IGhhbmd1cDAxIFBBU1MgTGludXggbWFpbmxpbmUgYW5kIGxpbnV4IG5leHQuCgotIE5h
cmVzaAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
