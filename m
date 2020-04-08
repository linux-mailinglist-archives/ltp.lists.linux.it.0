Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9121A1ACB
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 06:16:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 767413C2DB9
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 06:16:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6BD7B3C220D
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 06:16:08 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EBFA1200C7A
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 06:16:07 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id cp9so1780966pjb.0
 for <ltp@lists.linux.it>; Tue, 07 Apr 2020 21:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QxyW0KKiqgX/9uXPWcOtQCIsJVIBHM3ARqzL2iR2cWU=;
 b=eTAfWkRD7/eKywXKollixI4c+FWzxlwdmqibQGVIiq+nMkVUEqA2XrF06BxX2DXRkZ
 T48sKjhJLDvoaDtSyJASpCHOyRg236mevUN2iMyeDbhVyx1t1vlw2BFptKzivd3h2ojp
 rsqLRPuQnAFchy2Fe/phHRd1Gtd57q5QMo5uqIZrukGLd63ZDonQfz9Vk/5P1H73JulK
 p8NMbQaETPnO5CoHYm6+7ZMMBWng9kMTRbBqC1sVWOoaHZSxihinILQn9b3T37tSv3R9
 1DZYTh0LFySDmdmTh7HgQnoe6K2xLTYAzv2ZAtfhIk/SGjo2qOlmx2Qz0Jj6BU9FHEZo
 212Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QxyW0KKiqgX/9uXPWcOtQCIsJVIBHM3ARqzL2iR2cWU=;
 b=h3m9jYdN8ZOIkmfaQfcUrzj9ZhnIknh7uVxpEx2ON5mDBDZqRw60hz1L6KYtvrXxtA
 FNdtdFivVQ5O+C09Le75YCOePMIoMGPSRO0/iKuxxrDrujSSjehWMFNgM3K1qcghr8wa
 /EYys2Sr9Q2B9z13GHRy7ygi/2T1gEXbn7UzcPoRRA7VC4rtkNcrzz9b7kKg6Gp3iivj
 JyufUPEZeJNsDRR+lZW+/vAoZtke1X6LkpNFW/rPoYW2KboGf568Xuvmy/1yjg5WNwrW
 tHGkVdcFtNjHZDTA/TVSr/Sb7hib0vc9mbNt1X/p43xgL5s5NUsyswwFLNIDbU8QmuAD
 jT/w==
X-Gm-Message-State: AGi0PuYl06RyzeI83KtLo3pr0Sy2jCrZ2q7fwO5XCwlzI2Z5KcEsvkXA
 vQl87W8gG6C+bsvlKiFwZgoV48eEFwgyKFbuXAA=
X-Google-Smtp-Source: APiQypJVQekuaSrs3tEBM2bi1Z/GzAtoMQhtpwHDoomaMgNjoLaeaJMyrranx6xNy7zBpKTR0hFjpyJuQa0ZvOE35j0=
X-Received: by 2002:a17:902:6b86:: with SMTP id
 p6mr5482125plk.150.1586319366181; 
 Tue, 07 Apr 2020 21:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200327134707.4532-1-chrubis@suse.cz>
 <20200327134707.4532-3-chrubis@suse.cz>
 <CAF12kFteeJ6nerju6kwX+Ebzrzd_JPCiJ9jKW4tX9F4Y4s7FEg@mail.gmail.com>
 <20200330152122.GA2699@yuki.lan> <20200331180816.GE2900@yuki.lan>
 <CAF12kFs6H1FgU_77MAMhrn1pK15fp1cx+9wox4k9LN5GxCN=nA@mail.gmail.com>
 <20200401131220.GA3627@yuki.lan>
 <CAF12kFsFsG6Jk0citiGmicq+dyB90i_cG_bcDAMhHiyVPafRdA@mail.gmail.com>
 <20200402093127.GA28452@yuki.lan>
 <CAF12kFvDv8ksxMLDyniwQ=hty6J4Oy5-wvErX=DLrfWmhiwT0w@mail.gmail.com>
 <20200402112309.GA5732@yuki.lan>
 <CAF12kFsCfb12Yi=rhAqKSLPUBLkaWPs_-JCQOcucvyu=whYFsw@mail.gmail.com>
In-Reply-To: <CAF12kFsCfb12Yi=rhAqKSLPUBLkaWPs_-JCQOcucvyu=whYFsw@mail.gmail.com>
From: Cixi Geng <gengcixi@gmail.com>
Date: Wed, 8 Apr 2020 12:15:30 +0800
Message-ID: <CAF12kFvV=a5HJgDOAOGgdr2CMJhtVsYJ199T=SM1kyQSp-Js=w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, Orson Zhai <orsonzhai@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] device_drivers/uart01: Add uart01 test
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

PiBDeXJpbCBIcnViaXMgPGNocnViaXNAc3VzZS5jej4g5LqOMjAyMOW5tDTmnIgy5pel5ZGo5Zub
IOS4i+WNiDc6MjLlhpnpgZPvvJoKPj4KPj4gSGkhCj4+ID4gSSBhbSBzb3JyeSB0aGF0IHdoZW4g
SSBydW4gdGhlIHNlcmlhbGNoZWNrIG9uIG15IGxhcHRvcCwKPj4gPiB0aGVyZSBhbHdheXMgaGFz
IHNvbWUgZXJyb3IgYXMgZm9sbG93LHdoaWNoIG1lYW4gSSBjYW5ub3QKPj4gPiB2ZXJpZnkgdGhl
IHNlcmlhbGNoZWNrIG9uIG15IGNvbXB1dGVyIGZvciBub3cuCj4+ID4gRmFpbGVkIHRvIGlvY3Rs
KCxUSU9DR0lDT1VOVCwpICAtLSB0ZXN0IHR0eVVTQjAKPj4KPj4gVGhpcyBvbmUgY2FuIGJlIGln
bm9yZWQsIHRoYXQganVzdCBtZWFucyB0aGF0IHRoZSBjb3VudGVycyBhcmUgbm90Cj4+IGltcGxl
bWVudGVkIGFuZCB0aGUgc3RhdGlzdGljcyBhcmUgbm90IHByaW50ZWQgYXQgdGhlIHRlc3QgZW5k
Lgo+Pgo+PiA+IHRjZ2V0YXR0cigpIGZhaWxlZDogSW5wdXQvb3V0cHV0IGVycm9yIC0tIHRlc3Qg
dHR5UzAKPj4gPiBJIGFtIHRyeWluZyB0byBmaW5kIGF2YWlsYWJsZSBtYWNoaW5lIGFuZCB0aGVu
IHJ1biB0ZXN0Lgo+Pgo+PiBUaGF0IGxvb2tzIGxpa2UgdGhlcmUgaXMgbm8gVUFSVCB0byBiZWdp
biB3aXRoLgo+Pgo+PiAtLQo+PiBDeXJpbCBIcnViaXMKPj4gY2hydWJpc0BzdXNlLmN6CgpIaSBD
eXJpbDoKSSB3b3VsZCBsaWtlIHRvIGtub3cgaG93IGlzIGl0IGdvaW5nPyBsYXN0d2VlayBJIHNl
bmQgdGhlIHRlc3QgZGF0YSAuCmhvcGUgaXQgd2lsbCBoZWxwZnVsLgpJbiBteSB0ZXN0IHJlc3Vs
dCAgd2UgY2FuIGZvdW5kIGlmIFJ4IFR4IGluIGRpZmZlcmVudCByYXRlLCAgdGhlIHRlc3Qgd2ls
bCBmYWlsLgoKMS4gdGVzdCB0dHlVU0IwIGluIGxvb3BiYWNrIHVzZSB0aGUgc2FtZSBiYXVkcmF0
ZSBvZiBSeCBhbmQgVHggLCB0ZXN0CnBhc3Mgd2l0aCA1bG9vcApyb290QFk1MDovaG9tZS9nY3gv
cHJvamVjdC9zZXJpYWxjaGVjayMgc2VyaWFsY2hlY2sgIC1iIDExNTIwMCAtZAovZGV2L3R0eVVT
QjAgLWYgYmluYXJ5IC1sIDUgLW0gciAtawpOZWVkZWQgNjQgcmVhZHMgMCB3cml0ZXMgbG9vcHMg
NSAvIDUKRmFpbGVkIHRvIGlvY3RsKCxUSU9DR0lDT1VOVCwpCmdjeEBZNTA6fi9wcm9qZWN0L3Nl
cmlhbGNoZWNrJCBzZXJpYWxjaGVjayAtYiAxMTUyMDAgLWQgL2Rldi90dHlVU0IwCi1mIGJpbmFy
eSAtbSB0IC1sIDUgLWsKTmVlZGVkIDAgcmVhZHMgMSB3cml0ZXMgbG9vcHMgNSAvIDUKRmFpbGVk
IHRvIGlvY3RsKCxUSU9DR0lDT1VOVCwpCjIuIHRlc3QgdHR5VVNCMCBpbiBsb29wYmFjayB1c2Ug
ZGlmZmVyZW50IGJhdWRyYXRlICxFcnJvciBhdCB0aGUgZmlzdCBsb29wCnJvb3RAWTUwOi9ob21l
L2djeC9wcm9qZWN0L3NlcmlhbGNoZWNrIyBzZXJpYWxjaGVjayAgLWIgOTYwMCAtZAovZGV2L3R0
eVVTQjAgLWYgYmluYXJ5IC1sIDUgLW0gciAtayAmClsxXSAyMDc2NApnY3hAWTUwOn4vcHJvamVj
dC9zZXJpYWxjaGVjayQgc2VyaWFsY2hlY2sgLWIgMTE1MjAwIC1kIC9kZXYvdHR5VVNCMAotZiBi
aW5hcnkgLW0gdCAtbCA1IC1rCk5lZWRlZCAwIHJlYWRzIDEgd3JpdGVzIGxvb3BzIDUgLyA1CkZh
aWxlZCB0byBpb2N0bCgsVElPQ0dJQ09VTlQsKQpOZWVkZWQgNjQgcmVhZHMgMCB3cml0ZXMgT2gg
b2gsIGluY29uc2lzdGVuY3kgYXQgcG9zIDUwMiAoMHgxZjYpLgoKT3JpZ2luYWwgc2FtcGxlOgow
MDAwMDFjMDogOTEgOTUgZWIgYjYgODIgZTkgMmEgZTYgIDE2IDVhIGRhIGEzIGMyIDUxIGM0IGM5
ICAgLi4uLi4uKi4uWi4uLlEuLgowMDAwMDFkMDogYzUgNTEgZTEgYjcgYzkgNzYgNjcgZDUgIDA5
IDU3IDgwIDc3IGViIGJmIDZkIGQ3ICAgLlEuLi52Zy4uVy53Li5tLgowMDAwMDFlMDogMDggYTYg
N2IgZmQgNTIgMWIgMTIgOGUgIGYyIDUwIGMxIGI3IGE3IDUyIDM1IDM5ICAgLi57LlIuLi4uUC4u
LlI1OQowMDAwMDFmMDogNTQgZDQgNTAgOTYgNDkgNTUgMzUgMzAgIDMzIDUyIDgwIDg5IDhlIGE5
IDFlIGEyICAgVC5QLklVNTAzUi4uLi4uLgowMDAwMDIwMDogMmMgYTUgMGQgMWEgMjYgZjYgZWEg
NzcgIGE0IDRhIGI5IDY5IDM0IDE3IGNjIGJjICAgLC4uLiYuLncuSi5pNC4uLgowMDAwMDIxMDog
ZTIgNmUgMGMgZjkgZTEgMTEgMzkgOWYgIGZkIGNlIDk0IDllIDE5IDMwIGY0IDFjICAgLm4uLi4u
OS4uLi4uLjAuLgoKUmVjZWl2ZWQgc2FtcGxlOgowMDAwMDFjMDogOTEgOTUgZWIgYjYgODIgZTkg
MmEgZTYgIDE2IDVhIGRhIGEzIGMyIDUxIGM0IGM5ICAgLi4uLi4uKi4uWi4uLlEuLgowMDAwMDFk
MDogYzUgNTEgZTEgYjcgYzkgNzYgNjcgZDUgIDA5IDU3IDgwIDc3IGViIGJmIDZkIGQ3ICAgLlEu
Li52Zy4uVy53Li5tLgowMDAwMDFlMDogMDggYTYgN2IgZmQgNTIgMWIgMTIgOGUgIGYyIDUwIGMx
IGI3IGE3IDUyIDM1IDM5ICAgLi57LlIuLi4uUC4uLlI1OQowMDAwMDFmMDogNTQgZDQgNTAgOTYg
NDkgNTUgMDYgOWEgIDkyIDAxIDg5IDhlIGE5IDFlIGEyIDJjICAgVC5QLklVLi4uLi4uLi4uLAow
MDAwMDIwMDogYTUgMGQgMWEgMjYgZjYgZWEgNzcgYTQgIDRhIGI5IDY5IDM0IDE3IGNjIGJjIGUy
ICAgLi4uJi4udy5KLmk0Li4uLgowMDAwMDIxMDogNmUgMGMgZjkgZTEgMTEgMzkgOWYgZmQgIGNl
IDk0IDllIDE5IDMwIGY0IDFjIDc0ICAgbi4uLi45Li4uLi4uMC4udApsb29wcyAxIC8gNQoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
