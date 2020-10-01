Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD59280B49
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Oct 2020 01:21:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A32123C6E0B
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Oct 2020 01:21:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4B20F3C2A24
 for <ltp@lists.linux.it>; Fri,  2 Oct 2020 01:21:47 +0200 (CEST)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CDAEC14004EF
 for <ltp@lists.linux.it>; Fri,  2 Oct 2020 01:21:46 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id k15so499523wrn.10
 for <ltp@lists.linux.it>; Thu, 01 Oct 2020 16:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eX2Hry364wEtWsiVxRCfo7pQcaZnWzwwpUvuS5k5CvI=;
 b=rVneh100iFtrjIOwdJkApUFTPEFqWURGqQecXFsDDRfB1ZWq4FQmu8BR1tLeVPT72f
 pPjDNcZ5g/wknBoFDZU5JQXkiNLm9sBspAOPcfgv3YPr9qxFP0WL5klASY2MAmKizucy
 r+dD9ivtcD++lGOlOKOJJhRpHhoOHs0xCc2FlyareIFDuqdyJGtjHusbALCgfK4+Qzqa
 ZUus/I64E0KMcoW+TyvdAgRYa60jwGivESGBQSS1sh5XVrpnKuY4KKbD8+7C4sgo7dY0
 tPy8wF0FFRmVM7DZ5blE3LovGQq0kNVe0fmioa8oCUvUjwYgpEI1GcYbUk86//z1oZqM
 cOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=eX2Hry364wEtWsiVxRCfo7pQcaZnWzwwpUvuS5k5CvI=;
 b=WYKQtgD0xVMXn6FfpMvthPwne5+LSI3StECXJMNnbHhn4Wh3jdP+80TZH7DZWcjAAt
 aQUVutuKbHidOJ392aeaMty+G6G0vsE99VmU0THlQR96hBlAVM1x76tlSX7B5qqzOEUH
 pXVTIYUWAHZOm2VLinitZq7dax0INvGlWbGzFE+BRRc8EgDOATceQeiOArVkWtQqblgW
 YhN+qV0TVe0KM0HKJ4qmR7pJv1oCrBf0Lesi1RFXcuHDA399uzdxcTdy4merpHYzTftF
 yJm4CftNmjTNRVjMTGbQpxYWjqyDBtCAjRKZzFnlhKxYsGmtkbiiji6DROVHlxVTmpm5
 iZZQ==
X-Gm-Message-State: AOAM531o+VUigdS1U+8pFgyKLiqbakhyEZ8ZVCgeeDqHx6It8ubltLjI
 PldLzjgOdDm8R9is994p0bVdy/nA/ACgPQ==
X-Google-Smtp-Source: ABdhPJybWjJ18MrCPvGlJOun6C0h18Yb5qKd0lQc7u+pvjgxqQiuDWmJgDGpF9uIm+2zigZGihL4Ng==
X-Received: by 2002:adf:81e6:: with SMTP id 93mr11473710wra.412.1601594506134; 
 Thu, 01 Oct 2020 16:21:46 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id t16sm2292160wmi.18.2020.10.01.16.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 16:21:45 -0700 (PDT)
Date: Fri, 2 Oct 2020 01:21:43 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Message-ID: <20201001232143.GA32085@dell5510>
References: <20201001231256.6930-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001231256.6930-1-petr.vorel@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] lapi: Add sysinfo.h to fix build with
 MUSL libc
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+IFRoZSByZWFzb24gaXMgdG8gYXZvaWQgaW5kaXJlY3QgPGxpbnV4L3N5c2luZm8uaD4g
aW5jbHVkZSB3aGVuIHVzaW5nCj4gc29tZSBVQVBJIGhlYWRlcnM6IDxsaW51eC9uZXRsaW5rLmg+
IG9yIG90aGVycyAtPiA8bGludXgva2VybmVsLmg+Cj4gLT4gPGxpbnV4L3N5c2luZm8uaD4KCj4g
VGhpcyBpbmRpcmVjdCBpbmNsdWRlIGNhdXNlcyBvbiBNVVNMIHJlZGVmaW5pdGlvbiBvZiBzdHJ1
Y3Qgc3lzaW5mbyB3aGVuCj4gaW5jbHVkZWQgYm90aCA8c3lzL3N5c2luZm8uaD4gYW5kIHNvbWUg
b2YgVUFQSSBoZWFkZXJzOgoKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20geDg2XzY0LWJ1aWxkcm9v
dC1saW51eC1tdXNsL3N5c3Jvb3QvdXNyL2luY2x1ZGUvbGludXgva2VybmVsLmg6NSwKPiAgICAg
ICAgICAgICAgICAgIGZyb20geDg2XzY0LWJ1aWxkcm9vdC1saW51eC1tdXNsL3N5c3Jvb3QvdXNy
L2luY2x1ZGUvbGludXgvbmV0bGluay5oOjUsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4uL2lu
Y2x1ZGUvdHN0X25ldGxpbmsuaDoxNCwKPiAgICAgICAgICAgICAgICAgIGZyb20gdHN0X2NyeXB0
by5jOjEzOgo+IHg4Nl82NC1idWlsZHJvb3QtbGludXgtbXVzbC9zeXNyb290L3Vzci9pbmNsdWRl
L2xpbnV4L3N5c2luZm8uaDo4Ojg6IGVycm9yOiByZWRlZmluaXRpb24gb2Yg4oCYc3RydWN0IHN5
c2luZm/igJkKPiAgc3RydWN0IHN5c2luZm8gewo+ICAgICAgICAgXn5+fn5+fgo+IEluIGZpbGUg
aW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRlL3RzdF9zYWZlX21hY3Jvcy5oOjE1LAo+ICAgICAgICAg
ICAgICAgICAgZnJvbSAuLi9pbmNsdWRlL3RzdF90ZXN0Lmg6OTMsCj4gICAgICAgICAgICAgICAg
ICBmcm9tIHRzdF9jcnlwdG8uYzoxMToKPiB4ODZfNjQtYnVpbGRyb290LWxpbnV4LW11c2wvc3lz
cm9vdC91c3IvaW5jbHVkZS9zeXMvc3lzaW5mby5oOjEwOjg6IG5vdGU6IG9yaWdpbmFsbHkgZGVm
aW5lZCBoZXJlCgpGWUkgY29tbWl0IHdoaWNoIGludHJvZHVjZWQgdGhlIHByb2JsZW0gaXMgMzlh
YWJmYmQwICgiQWRkIFNBRkVfU1lTSU5GTygpIG1hY3JvIikuCgpBbHBpbmUgbGludXggaGFzIHBh
dGNoZWQga2VybmVsIGhlYWRlciwgdGhhdCdzIHdoeSBvdXIgdHJhdmlzIHRlc3QgZGlkbid0IGNh
dGNoIHRoYXQuCmh0dHBzOi8vZ2l0LmFscGluZWxpbnV4Lm9yZy9hcG9ydHMvdHJlZS9tYWluL2xp
bnV4LWhlYWRlcnMvMDAwMy1yZW1vdmUtaW5jbHVzaW9uLW9mLXN5c2luZm8uaC1pbi1rZXJuZWwu
aC5wYXRjaAoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
