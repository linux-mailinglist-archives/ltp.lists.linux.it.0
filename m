Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F6C2619D
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 12:20:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88C143EA42C
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 12:20:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DCFB73EA2BD
 for <ltp@lists.linux.it>; Wed, 22 May 2019 12:20:49 +0200 (CEST)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F4084601F15
 for <ltp@lists.linux.it>; Wed, 22 May 2019 12:20:48 +0200 (CEST)
Received: by mail-lj1-x243.google.com with SMTP id e13so1531952ljl.11
 for <ltp@lists.linux.it>; Wed, 22 May 2019 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=I6Y5uva2ZOylkepfkW7JjoryC+I9mnJT08CLLH1/zB4=;
 b=zavVrEDe37Qme7JszDwtBit8a9goL7Xf7lo7dzYs9F/s32qJMMV7ciqBvmraiaXv0z
 1z3SGu/sXwQJ1PJmUaUHUlv2qKFBXe95+hZWV3jIDL13S66YAp9x3vdJ+Fn6BuT9VU8u
 NOBZwoAp6T7manfujvUuR9RbpVzziZD+GjSMxlsGQWytCUClTW4rehuBUJjupvskHUr5
 kkJC7rbA7qka6A7HM8y0PHco+9oNkv0LZrTNeFi/W/MkRmVZ39mK5bOW4nSVp1i03h5/
 0214MndB/t3uNnBA7L4B/uS6WoXe29jOMrI0wiGoFHJkTYyz2kReyg2TfKgbDZfWpW6q
 QOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=I6Y5uva2ZOylkepfkW7JjoryC+I9mnJT08CLLH1/zB4=;
 b=oIHudB/BiQRuRSoDKbeWp91zPWwJhXpfruzdvp8dSPDf+gGeILuXgS+ZMgBvDAwX1O
 +2DsvDfLlv8EfOBVyARZ7ce+Cj6TX3FZ5nfKkT49gYyb86KsHixptiX9ZrLS0Afyp5Jj
 jMjBC5UjuSv4fO/zRjNQEY3HlLQNaL6iGfOB3IR/gq5UOqqf2/Yk7mnp7H+/CBEAazbo
 5BT0joCLePRf7QRAa3e8XOR3IkDQWukVnB3iWuJCh7aOLg53S9SINaQMVLCTebWv0OYg
 1LqSQ/yYV0D9tb0RzrzZaFxnjJoik36oBbmnW9tPVhybJgemn/l3EXj5kxJeOU5qhwS8
 hsGQ==
X-Gm-Message-State: APjAAAWv0Geo9DlPEFt0d9O9HB2m2RJxGDu1RJk+m5hPR5zBdeXL0Rm/
 X6zDvGH943X2AKFZiJw5RxKfWucGypX7aUAkDMajqw==
X-Google-Smtp-Source: APXvYqw2FkuDKjiOL0U5uxbmW7MBLTaBuIHCxmZceyZcoQRr1MyCfA1j64zoamAnH8hiGk5sO35Kb1+BFqH+Lu24ZA0=
X-Received: by 2002:a2e:7411:: with SMTP id p17mr2152330ljc.24.1558520448161; 
 Wed, 22 May 2019 03:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190520115247.060821231@linuxfoundation.org>
 <20190520222342.wtsjx227c6qbkuua@xps.therub.org>
 <20190521085956.GC31445@kroah.com>
 <CA+G9fYvHmUimtwszwo=9fDQLn+MNh8Vq3UGPaPUdhH=dEKzqxg@mail.gmail.com>
 <20190521093849.GA9806@kroah.com>
 <CA+G9fYveeg_FMsL31aunJ2A9XLYk908Y1nSFw4kwkFk3h3uEiA@mail.gmail.com>
 <20190521162142.GA2591@mit.edu>
 <CA+G9fYunxonkqmkhz+zmZYuMTfyRMVBxn6PkTFfjd8tTT+bzHQ@mail.gmail.com>
 <20190522050511.GB4943@mit.edu>
In-Reply-To: <20190522050511.GB4943@mit.edu>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 22 May 2019 15:50:37 +0530
Message-ID: <CA+G9fYsA6BWh+W+U-9BSQWq63WZMKGXGbsh92LS94ZCempgm5A@mail.gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Shuah Khan <shuah@kernel.org>,
 patches@kernelci.org, 
 Ben Hutchings <ben.hutchings@codethink.co.uk>, lkft-triage@lists.linaro.org, 
 linux- stable <stable@vger.kernel.org>, linux-ext4@vger.kernel.org, 
 Arthur Marsh <arthur.marsh@internode.on.net>, 
 Richard Weinberger <richard.weinberger@gmail.com>, ltp@lists.linux.it, 
 Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] ext4 regression (was Re: [PATCH 4.19 000/105]
	4.19.45-stable review)
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

T24gV2VkLCAyMiBNYXkgMjAxOSBhdCAxMDozNiwgVGhlb2RvcmUgVHMnbyA8dHl0c29AbWl0LmVk
dT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAxMToyNzoyMVBNICswNTMwLCBO
YXJlc2ggS2FtYm9qdSB3cm90ZToKPiA+IFN0ZXBzIHRvIHJlcHJvZHVjZSBpcywKPiA+IHJ1bm5p
bmcgTFRQIHRocmVlIHRlc3QgY2FzZXMgaW4gc2VxdWVuY2Ugb24geDg2IGRldmljZS4KPiA+ICMg
Y2QgbHRwL3J1bnRlc3QKPiA+ICMgY2F0IHN5c2NhbGxzICggb25seSB0aHJlZSB0ZXN0IGNhc2Up
Cj4gPiBvcGVuMTIgb3BlbjEyCj4gPiBtYWR2aXNlMDYgbWFkdmlzZTA2Cj4gPiBwb2xsMDIgcG9s
bDAyCj4gPiAjCj4gPgo+ID4gYXMgRGFuIHJlZmVycmluZyB0bywKPiA+Cj4gPiBMVFAgaXMgcnVu
IHVzaW5nICcvb3B0L2x0cC9ydW5sdHAgLWQgL3NjcmF0Y2ggLWYgc3lzY2FsbHMnLCB3aGVyZSB0
aGUKPiA+IHN5c2NhbGxzIGZpbGUgaGFzIGJlZW4gcmVwbGFjZWQgd2l0aCB0aHJlZSB0ZXN0IGNh
c2UgbmFtZXMsIGFuZAo+ID4gL3NjcmF0Y2ggaXMgYW4gZXh0NCBTQVRBIGRyaXZlLiAvc2NyYXRj
aCBpcyBjcmVhdGVkIHVzaW5nICdta2ZzIC10IGV4dDQKPiA+IC9kZXYvZGlzay9ieS1pZC9hdGEt
VE9TSElCQV9NRzAzQUNBMTAwXzM3TzlLR0tXRicgYW5kIG1vdW50ZWQgdG8KPiA+IC9zY3JhdGNo
Lgo+Cj4gSSdtIHN0aWxsIGhhdmluZyB0cm91YmxlIHJlcHJvZHVjaW5nIHRoZSBwcm9ibGVtLiAg
SSd2ZSBmb2xsb3dlZCB0aGUKPiBhYm92ZSBleGFjdGx5LCBhbmQgaXQgZG9lc24ndCB0cmlnZ2Vy
IG9uIG15IHN5c3RlbS4gIEkgdGhpbmsgSSBrbm93Cj4gd2hhdCBpcyBoYXBwZW5pbmcsIGJ1dCBl
dmVuIGdpdmVuIG15IHRoZW9yeSwgSSdtIHN0aWxsIG5vdCBhYmxlIHRvCj4gdHJpZ2dlciBpdC4g
IFNvLCBJJ20gbm90IDEwMCUgc3VyZSB0aGlzIGlzIHRoZSBhcHByb3ByaWF0ZSBmaXguICBJZgo+
IHlvdSBjYW4gcmVwcm9kdWNlIGl0LCBjYW4geW91IHNlZSBpZiB0aGlzIHBhdGNoLCBhcHBsaWVk
IG9uIHRvcCBvZiB0aGUKPiBMaW51cydzIHRpcCwgZml4ZXMgdGhlIHByb2JsZW0gZm9yIHlvdT8K
CkFwcGxpZWQgeW91ciBwYXRjaCBvbiBtYWlubGluZSBtYXN0ZXIgYnJhbmNoIGFuZCB0ZXN0ZWQg
b24geDg2XzY0IGFuZApjb25maXJtcyB0aGF0IHRoZSByZXBvcnRlZCBwcm9ibGVtIGZpeGVkLgoK
VGhhbmtzIGZvciB5b3VyIGZpeCBwYXRjaC4KCkxUUCBzeXNjYWxscyBmdWxsIHRlc3Qgb3V0cHV0
IGxvZywKaHR0cHM6Ly9sa2Z0LnZhbGlkYXRpb24ubGluYXJvLm9yZy9zY2hlZHVsZXIvam9iLzcz
OTA3NQoKLS0tCkZpeGVzOiAzNDVjMGRiZjNhMzAgKCJleHQ0OiBwcm90ZWN0IGpvdXJuYWwgaW5v
ZGUncyBibG9ja3MgdXNpbmcKYmxvY2tfdmFsaWRpdHkiKQogICAgUmVwb3J0ZWQtYnk6IERhbiBS
dWUgPGRhbi5ydWVAbGluYXJvLm9yZz4KICAgIFNpZ25lZC1vZmYtYnk6IFRoZW9kb3JlIFRzJ28g
PHR5dHNvQG1pdC5lZHU+CgpkaWZmIC0tZ2l0IGEvZnMvZXh0NC9leHRlbnRzLmMgYi9mcy9leHQ0
L2V4dGVudHMuYwppbmRleCBmMmM2MmUyYTBjOTguLmQ0MGVkOTQwMDAxZSAxMDA2NDQKLS0tIGEv
ZnMvZXh0NC9leHRlbnRzLmMKKysrIGIvZnMvZXh0NC9leHRlbnRzLmMKQEAgLTUxOCwxMCArNTE4
LDE0IEBAIF9fcmVhZF9leHRlbnRfdHJlZV9ibG9jayhjb25zdCBjaGFyICpmdW5jdGlvbiwKdW5z
aWduZWQgaW50IGxpbmUsCiAgICAgICAgfQogICAgICAgIGlmIChidWZmZXJfdmVyaWZpZWQoYmgp
ICYmICEoZmxhZ3MgJiBFWFQ0X0VYX0ZPUkNFX0NBQ0hFKSkKICAgICAgICAgICAgICAgIHJldHVy
biBiaDsKLSAgICAgICBlcnIgPSBfX2V4dDRfZXh0X2NoZWNrKGZ1bmN0aW9uLCBsaW5lLCBpbm9k
ZSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4dF9ibG9ja19oZHIoYmgpLCBkZXB0
aCwgcGJsayk7Ci0gICAgICAgaWYgKGVycikKLSAgICAgICAgICAgICAgIGdvdG8gZXJyb3V0Owor
ICAgICAgIGlmICghZXh0NF9oYXNfZmVhdHVyZV9qb3VybmFsKGlub2RlLT5pX3NiKSB8fAorICAg
ICAgICAgICAoaW5vZGUtPmlfaW5vICE9CisgICAgICAgICAgICBsZTMyX3RvX2NwdShFWFQ0X1NC
KGlub2RlLT5pX3NiKS0+c19lcy0+c19qb3VybmFsX2ludW0pKSkgeworICAgICAgICAgICAgICAg
ZXJyID0gX19leHQ0X2V4dF9jaGVjayhmdW5jdGlvbiwgbGluZSwgaW5vZGUsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4dF9ibG9ja19oZHIoYmgpLCBkZXB0aCwgcGJs
ayk7CisgICAgICAgICAgICAgICBpZiAoZXJyKQorICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IGVycm91dDsKKyAgICAgICB9CiAgICAgICAgc2V0X2J1ZmZlcl92ZXJpZmllZChiaCk7CiAgICAg
ICAgLyoKICAgICAgICAgKiBJZiB0aGlzIGlzIGEgbGVhZiBibG9jaywgY2FjaGUgYWxsIG9mIGl0
cyBlbnRyaWVzCgoKLSBOYXJlc2gKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
