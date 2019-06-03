Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5330A3348D
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 18:07:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 297D0294AFC
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 18:07:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7D7D8294AC4
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 18:07:31 +0200 (CEST)
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A8E8660015C
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 18:07:30 +0200 (CEST)
Received: by mail-yw1-xc44.google.com with SMTP id e68so7760235ywf.3
 for <ltp@lists.linux.it>; Mon, 03 Jun 2019 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ho/HqLLhsplgQvr6TWki36Y64MR8O7cVUN/+zSLp1po=;
 b=r5tvWbIlmMERczjNFAPnb8LYEklKo6iTxt1UfTkWyFsAeSp0RurqJwx4J8AKsWGUPp
 ljSIXR/W/yYzLCjzESiL3PVhHGsl2P7G2hHqfmhaNG7bHthWBh3n2K0U5op2j42fgTVw
 7Oo5fRvZFQHczOO4gNKFqlYnkxSHsEwggkhcm65/ig8WAPuYOZei3cOgXD1kDFfzLFd3
 ls/kP0iYLNwZ3nns0dz1M3C0/7ro6z9jpESUkA45xAYkqfeX0iQ7lg/I2IPWQUIZBXF2
 5WhEcWUSjuGL4vOIYKqJb0yX277+U99h6IajbWWmrATXXX0Dt5jzKojh6Xkt/QK8baQe
 X6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ho/HqLLhsplgQvr6TWki36Y64MR8O7cVUN/+zSLp1po=;
 b=ArqUUa/3H88e/2201OFY1PDzeh1g81wm0l7Z/em+DEAu4LfY+OQ79+MMyFLUKdpUHf
 3fWZQuu6t6WwDImZ6lCLjBNbJC0ksdnZPysGXddLATZpj/MqS5YszXCcsBURGxDQsXY1
 Pn29C9NDWdSf7XCJmW7hvazyBQs/Uw0RFgOOESk+v+tYS7xdMqwkh0cUepL5VyRPnoBj
 pGzlb0kWFEowqp+w1sJPqDxukovWXaaC/aq1E6oX4AjIsqWj+bpWVB3xsE5qP9Afpqn8
 qEl9BVIwbY1N3obwc0t7NnUTibsDN/w6jbbmI7Vt2dMG1AXYWzRf8NjN7jCnyBZ25RLJ
 cdvg==
X-Gm-Message-State: APjAAAXZtTO7sV8pDwsqjdMVsYwloXE66QXvMlK9C5caQiuqZxkjcGsg
 89R+Om9DpvB7MA1XgFiCJmlXabHfAKxohtN6tXA=
X-Google-Smtp-Source: APXvYqwQIJ8oOFus+u2LQtIiesPVaKk6Q0zqTGqk5u2RshYm6iFlPHNFUihd/ifgjmjzh1z41oulj98xIJMYwpKKuD8=
X-Received: by 2002:a81:910a:: with SMTP id i10mr602094ywg.31.1559578049390;
 Mon, 03 Jun 2019 09:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190424085317.409-1-amir73il@gmail.com>
 <CAOQ4uxgSrpfo=uz29PQOO0LjZFdX+dY4PNQdb7rCWbP3T8MgAA@mail.gmail.com>
 <20190603141853.GA17414@dell5510>
In-Reply-To: <20190603141853.GA17414@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 3 Jun 2019 19:07:17 +0300
Message-ID: <CAOQ4uxghhv0tSwb1_taHG5M+BgpA9xGoUOMO=yh3s2nLfy-QLg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] fanotify06: add a test case for overlayfs
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

T24gTW9uLCBKdW4gMywgMjAxOSBhdCA1OjE4IFBNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6
PiB3cm90ZToKPgo+IEhpIEFtaXIsCj4KPiAuLi4KPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkwNi5jIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTA2LmMKPiA+ID4gaW5kZXggNmEyZTI0OTRmLi42
MmRlZmIyM2MgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFu
b3RpZnkvZmFub3RpZnkwNi5jCj4gPiA+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
ZmFub3RpZnkvZmFub3RpZnkwNi5jCj4gPiA+IEBAIC01NCw4ICs1NCwyMyBAQCBzdGF0aWMgaW50
IGZkX25vdGlmeVtGQU5PVElGWV9QUklPUklUSUVTXVtHUk9VUFNfUEVSX1BSSU9dOwo+Cj4gPiA+
ICBzdGF0aWMgY2hhciBldmVudF9idWZbRVZFTlRfQlVGX0xFTl07Cj4KPiA+ID4gLSNkZWZpbmUg
TU9VTlRfTkFNRSAibW50cG9pbnQiCj4gPiA+ICsjZGVmaW5lIE1OVFBPSU5UICJtbnRwb2ludCIK
PiA+ID4gKyNkZWZpbmUgT1ZMX0xPV0VSICJvdmwtbG93ZXIiCj4gPiA+ICsjZGVmaW5lIE9WTF9V
UFBFUiAib3ZsLXVwcGVyIgo+ID4gPiArI2RlZmluZSBPVkxfV09SSyAib3ZsLXdvcmsiCj4gPiA+
ICsjZGVmaW5lIE9WTF9NTlQgIm92bC1tbnQiCj4gSSBndWVzcyB5b3UncmUgZ29pbmcgdG8gc2Vu
ZCB2MiB3aXRoIHtTQUZFLFRTVH1fTU9VTlRfT1ZFUkxBWSgpIG9yIC5uZWVkc19vdmVybGF5IHVz
YWdlIGZyb20gbGlicmFyeS4KClN1cmUuIEknbGwgZmluZCBhIHRpbWUgdG8gZG8gdGhhdC4KClRo
YW5rcywKQW1pci4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
