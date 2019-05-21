Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B1B24F35
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 14:50:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 733D13EA6F6
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 14:50:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 13EB53EA59E
 for <ltp@lists.linux.it>; Tue, 21 May 2019 14:50:39 +0200 (CEST)
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 12DAF601CC0
 for <ltp@lists.linux.it>; Tue, 21 May 2019 14:50:38 +0200 (CEST)
Received: by mail-yw1-xc43.google.com with SMTP id e68so7248592ywf.3
 for <ltp@lists.linux.it>; Tue, 21 May 2019 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a28JWvf8gYik8ShajszzAhGQkjbfg0uzpS114mULkmY=;
 b=WZOIVkxgQSKicaoV7Xezd3Ec7hqYU6hpF4HNGqGtn8UlQ4OLkA/+q0b28V9p+LcP7o
 xKlJ1/CLDe/fR/Lntz1OdQnxNGM0Psbuw+VPtIXGiBH2GsKN7HhTfxPQU1CJEVoJ7P+F
 IS+juxgeGGIKpCkGUh5/go5M3CBOHtm5/dg2whS3+fJ0Nd8d0Zlp2S8F8/KPyGvH/9nL
 hWVHUlb1Qli0dsO5wOHRchOv+JyuLNEu3Rz0xuansARMXzgIpIAUzPq9TafFiOUUr6ZV
 vOt6U9vnG1fqjnY5ujhLFdhYChrHvrKO7s3oYeMgt+2Iqpt41LX2xrQUjCQmWiN9XwZA
 F+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a28JWvf8gYik8ShajszzAhGQkjbfg0uzpS114mULkmY=;
 b=llBqnkpxn4tWElNK2O93MVglhHD/0t142eZP55btbePHBNf5mcdVa57CLKkZZ9VpBD
 Lr4GUar69nko90a3HHRisUSpVJZSBwmq1Vfn+Px35+yyWvbGLLh4OUuve8UMNHDDqK5X
 OqxFVJVTl2dd0kNHz/Y5HktGccD1HmxEOPpo8u7Z2O4vCLKIdRHQwQhvqU3+UFsjz9dj
 BYG1gL/Bhdv6Dxl+46ENgemilWolRL0Zxm2SrgB9VKj1nomtxA3/DPsMsC6w87robG6b
 NALumUuTAPJsZmke2SXOBxQsjqtXY54cjlu6UF7dGFAJDjidRiw9afrGjnVJqywrowrv
 89xQ==
X-Gm-Message-State: APjAAAXPLSjDMWunuazOW/DlCbW6PjgLu6y5SLIpjDkajwuRjbaoDWY2
 wVND40cM6JoUoBUI7MrNBS1F/A28CQTnFZqSPVM=
X-Google-Smtp-Source: APXvYqxnz1yNGwolpwDgHJmKP8YNEmQM54ZySt3AIgfXiloiYtj2C+aHvsuA1FLNy7n5HCK5ifAEOB+za3WF+hOcUA8=
X-Received: by 2002:a81:4f06:: with SMTP id d6mr24477799ywb.379.1558443036679; 
 Tue, 21 May 2019 05:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190506105457.22350-1-camann@suse.com>
 <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
 <20190506201948.GA9828@dell5510> <20190520143135.GA27341@dell5510>
 <20190520144645.GD28976@rei.lan> <20190520152400.GA11845@dell5510>
 <CAOQ4uxivgpoMeUUxm-fboFfiXLXn+QXNzKJWSHAZhidwUsuvng@mail.gmail.com>
 <20190521114040.GB13910@rei>
In-Reply-To: <20190521114040.GB13910@rei>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 May 2019 15:50:25 +0300
Message-ID: <CAOQ4uxi8v+WqwY8sNh+j4b6vYfeyLvHR4+jodt1=s9hUF1FSWQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/copy_file_range: add/restructured
	tests
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

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMjo0MCBQTSBDeXJpbCBIcnViaXMgPGNocnViaXNAc3Vz
ZS5jej4gd3JvdGU6Cj4KPiBIaSEKPiA+ID4gPiA+IDIpIEdsaWJjIGFkZHMgaW50ZXJuYWwgaW1w
bGVtZW50YXRpb24gb2YgY29weV9maWxlX3JhbmdlKCksIHVzZWQgYXMgZmFsbGJhY2sKPiA+ID4g
PiA+IHdoZW4ga2VybmVsIDwgNC41ICh3aGljaCBicm91Z2h0IGNvcHlfZmlsZV9yYW5nZSgpKSBb
MV0uIEkgZ3Vlc3MgdGhlcmUgaXMgbm8gd2F5Cj4gPiA+ID4gPiB0byB1c2UgaXQgZXhwbGljaXRs
eSA6KC4KPiA+ID4KPiA+ID4gPiBXZWxsIHdlIGNhbiBhbHdheXMgdXNlIGZpbGVzeXN0ZW0gdGhh
dCBkb2VzIG5vdCBzdXBwb3J0IHRoZSBvcGVyYXRpb24sCj4gPiA+ID4gc28gcnVubmluZyB0aGUg
dGVzdCBmb3IgYWxsIGZpbGVzeXN0ZW1zIHNob3VsZCBnZXQgdGhlIGVtdWxhdGlvbiBjb3ZlcmVk
Cj4gPiA+ID4gZm9yIHN1cmUuLi4KPiA+ID4gT2gsIHRoYXQncyB0aGUgd2F5IDopLgo+ID4KPiA+
IEFjdHVhbGx5LCB0aGVyZSBpcyBubyBzdWNoIHRoaW5nIGFzIGZpbGVzeXN0ZW0gdGhhdCBkb2Vz
IG5vdCBzdXBwb3J0Cj4gPiBjb3B5X2ZpbGVfcmFuZ2UoKSBiZWNhdXNlIHRoZSBrZXJuZWwgcHJv
dmlkZXMgYSBmYWxsYmFjayBkZWZhdWx0IGltcGxlbWVudGF0aW9uCj4gPiAoaW4ta2VybmVsIGNv
cHkpLgo+Cj4gU28gdGhlIGdsaWJjIGZhbGxiYWNrIGNvZGUgaXMgcHJvYmFibHkgc29tZXRoaW5n
IHRoYXQgd2lsbCBlbmQgdXAgYmVpbmcKPiB1c2VkIGlmIHNvbWVvbmUgd2FudHMgdG8gcnVuIGFw
cGxpY2F0aW9uIHRoYXQgdXNlcyB0aGlzIHN5c2NhbGwgb24gQlNECgpPciBMaW51eCBrZXJuZWwg
PCA0LjUuCgo+IG9yIG90aGVyIGNvcm5lciBjYXNlcy4gSSBndWVzcyB0aGF0IHdlIGRvIG5vdCBj
YXJlIHRoYXQgbXVjaCBhYm91dAo+IHRlc3RpbmcgdGhlIGdsaWJjIGZhbGxiYWNrIGNvZGUgdGhl
bi4KPgo+IC0tCj4gQ3lyaWwgSHJ1YmlzCj4gY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
