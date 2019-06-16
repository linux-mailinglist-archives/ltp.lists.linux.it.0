Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FBD4743B
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 12:24:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB9DA3EB050
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 12:24:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8F85C3EA4B8
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 12:24:03 +0200 (CEST)
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9B9901A023FC
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 12:24:02 +0200 (CEST)
Received: by mail-lf1-x142.google.com with SMTP id d11so4496850lfb.4
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 03:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KaZmNHMRO6pguVYYuS6CcjODk8YtX1UztzOB46tTzvE=;
 b=zWOra5kGA1PAX3Kj5zfL5NaXTT6gJaanJbgXDjvE3CCS2BArz3yTBWEDXE+wWPF3Tu
 7XTD3zLPfjgO6kxNup6ks1b7RyKxXc9gn2QDlm8/6dDNux/nFlYhnKsyZ2SXVRpwCcGV
 +4yipPGwYmHUka0iCkg3VvBwUUHTMU8sd33f2w/YGNEyeCQeau5HH3hk/AZOFOaai2J2
 S9LIWNxmPmLG1IHhlfZb0pvOfLaZPhErXOxFU8h1yMZ0+A8kVMEqndwZb95Ch1Tj1I5g
 2INXj9fpX03qFXvWthn+z9jcW9ewrdVOx/8opGgvG4SnOYR21mo4TjQBDaVpriGnmjak
 RiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KaZmNHMRO6pguVYYuS6CcjODk8YtX1UztzOB46tTzvE=;
 b=bU6v8jNuMrWftbB3qjyEqb7dkuW+U7HY0nKfzrOncBbB5lEsU3wnd/5myE6la0wq1g
 b0VnnzaTLMkYpQt98AVQ7aKiDpL7Neacs1T8+6tEIwxl7dtQWbtn4FgRzBDwnb/qos2w
 +mi0Gsiyl1i5vTk16NW3d+uxwzE5U8uC5VgLJmH83MRhqJwPmsSoHEJDajLWWq6re1ZX
 xn2MEhkiKFp1ymv67YnQ3SJxluKuO1vQisBjXrG2mtZvTxJbG5EhUBCY2VOGCcEjbByD
 JUD2Kn8C9I/E9G3j7ctQriXu0koQYcGts9DC9jFZm0UjcfHVHOReB/w5RM0NfLDr63YY
 nKUQ==
X-Gm-Message-State: APjAAAUWD89olnfMCzIpkCFEPOqedRFhpuZMFXLYwD95oZcO8P5z98n+
 IddAEQIT0xd79bvUIfvzZrdTCgodlr8shYLs0cjPhg==
X-Google-Smtp-Source: APXvYqx0v6UP1SjO6u+1FlgGabyb6/la0hinFIive3HY+tz+AfdrmP68zWSOWPjXMyWStUtjMqWZF7Ibd16NPozz/Lc=
X-Received: by 2002:a19:671c:: with SMTP id b28mr184968lfc.164.1560680641837; 
 Sun, 16 Jun 2019 03:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <a15d4137b63e4202751bea4e726658aa14be7351.1560678643.git.jstancek@redhat.com>
In-Reply-To: <a15d4137b63e4202751bea4e726658aa14be7351.1560678643.git.jstancek@redhat.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 16 Jun 2019 15:53:50 +0530
Message-ID: <CA+G9fYuUw2LDwwiR++GC4d5NUtC=WkS0fvxpYvdAyNG-PZxr-w@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: fhrbata@redhat.com, liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/tgkill03: wait for defunct tid to get
	detached
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

SGkgSmFuLAoKT24gU3VuLCAxNiBKdW4gMjAxOSBhdCAxNToyMiwgSmFuIFN0YW5jZWsgPGpzdGFu
Y2VrQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gQ2FzZSB3aGVyZSBkZWZ1bmN0IHRpZCBpcyB1c2Vk
IGhhcyBiZWVuIG9ic2VydmVkIHRvIHNwb3JhZGljYWxseSBmYWlsOgo+ICAgdGdraWxsMDMuYzo5
NjogRkFJTDogRGVmdW5jdCB0aWQgc2hvdWxkIGhhdmUgZmFpbGVkIHdpdGggRVNSQ0g6IFNVQ0NF
U1MKCldlIGRvIGhhdmUgbm90aWNlZCB0Z2tpbGwwMyBnZXR0aW5nIGZhaWxlZCBpbnRlcm1pdHRl
bnRseSBkdWUgdG8gdGhpcyBlcnJvci4KCj4KPiBnbGliYyBfX3B0aHJlYWRfdGltZWRqb2luX2V4
KCkgd2FpdHMgZm9yIENMT05FX0NISUxEX0NMRUFSVElEIHRvIGNsZWFyIHRpZCwKPiBhbmQgdGhl
biByZXN1bWVzLiBLZXJuZWwgY2xlYXJzIGl0IChnbGliYyBwZC0+dGlkKSBhdDoKPiAgIGRvX2V4
aXQKPiAgICAgZXhpdF9tbQo+ICAgICAgIG1tX3JlbGVhc2UKPiAgICAgICAgIHB1dF91c2VyKDAs
IHRzay0+Y2xlYXJfY2hpbGRfdGlkKTsKPgo+IGJ1dCBrZXJuZWwgdGlkIGlzIHN0aWxsIHZhbGlk
LCBwcmVzdW1hYmx5IHVudGlsOgo+ICAgcmVsZWFzZV90YXNrCj4gICAgIF9fZXhpdF9zaWduYWwK
PiAgICAgICBfX3VuaGFzaF9wcm9jZXNzCj4gICAgICAgICBkZXRhY2hfcGlkCj4KPiBUbyBhdm9p
ZCByYWNlIHdhaXQgdW50aWwgL3Byb2MvPHBpZD4vdGFzay88dGlkPiBkaXNhcHBlYXJzLgo+Cj4g
U2lnbmVkLW9mZi1ieTogSmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJlZGhhdC5jb20+CgpSZXZpZXdl
ZC1ieTogIE5hcmVzaCBLYW1ib2p1IDxuYXJlc2gua2FtYm9qdUBsaW5hcm8ub3JnPgoKVGhhbmtz
IGZvciB0aGlzIGZpeCBwYXRjaC4KCkJlc3QgcmVnYXJkcwpOYXJlc2ggS2FtYm9qdQoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
