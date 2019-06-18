Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD24A4A60A
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 18:01:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D3453EA2FF
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 18:01:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D5F963EA2DC
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 18:00:59 +0200 (CEST)
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ADFFC200CE8
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 18:00:58 +0200 (CEST)
Received: by mail-yw1-xc42.google.com with SMTP id a11so6945314ywc.1
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 09:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b4F35+AqDaCgCaCNEEQssEMGvBCS97alZ7+rsN9zGL8=;
 b=Y7AY7xJVUWPnGQ3thb9aznHGNtny/ETwzgHj8yVgFA/r3JJw6wtGB1OCA7bAGeUJDe
 cdCMa+HG9RKMm1Q2piCpD0hu5SlAetpxLd2pbObgyqr+tp3pCInihDJoU8nqBbJSnvyQ
 yCUquELE9GnSAsxXdmzEzkh6WCpZBkxhV/EOWANPQoEWJLclnAYtV9ua/A78x1X66XJK
 f4hX+i1vvkh9NWO81mSY9aJ9R/GXk37CGcrZjIXNeMxzh9Du3zWIXRu4pKmpZyyPiDf/
 1h9ync7w4r4EScyGQyMY0WSO3NzbERA+gKSj3NqHxkMTdblV42UCEUZgdM4IEiB7VgJk
 6OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b4F35+AqDaCgCaCNEEQssEMGvBCS97alZ7+rsN9zGL8=;
 b=F89y0MCxz9Z4Y1sDBSIZIsXm0YidTddTskEcr5c4ZcxFmqZMtE2mxhi+uHYJsrWXkq
 8ytcL/Xo5YhvM7yVZwiE9ndg8L6fgMioYOQMYUU0vRw7iVJRmliZmcwV3JUG5JXKLBgX
 vlCyeeQ4XPS8BW125oH6xNCH6vNA9/n+gaElkIo/PdqxjuLrPoiG3ng3+8gIGU0AQQUe
 A7Odp/u3QGDphJPnq5ZFKxdhffNOPZKDVOJOd0ej6HDCD/gvmG4STJZMzyClhxGlWY/8
 xQhkdU5muuDO80fVQJmRhP5yBR0JI9iuCz9Owq+VwFbYURl4zSpaDjmUgBtsvJjGTj67
 +iAA==
X-Gm-Message-State: APjAAAVogozo4AtJubv/jLfdwyw9++HB/uvKD0trZuP7BZuB9oUo8OUA
 hB1ZQ1ce59nveyG2V9clcLBE1jUMmc0Foi0rjbA=
X-Google-Smtp-Source: APXvYqx8fn6uP/K7OBDXlxaDw6wIYcerfgx/uk4rbEC6I4Hli2XInvL2wk5daFeMViPb32Kbj0nmFM7fTGu8CQYa4y8=
X-Received: by 2002:a81:7096:: with SMTP id
 l144mr68187437ywc.294.1560873657607; 
 Tue, 18 Jun 2019 09:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <CAEemH2frt_zGSdSRL3d_J+km74p8ruQTNF6bVhEpaiTdMLCC6A@mail.gmail.com>
 <1320546599.27920597.1560420988025.JavaMail.zimbra@redhat.com>
 <20190613141714.GC29926@rei.lan>
 <1211798607.28016198.1560437855198.JavaMail.zimbra@redhat.com>
 <20190613151419.GE29926@rei.lan>
 <151498464.28356667.1560670442630.JavaMail.zimbra@redhat.com>
 <20190617085039.GA1629@rei.lan>
 <894722811.28675645.1560782288619.JavaMail.zimbra@redhat.com>
In-Reply-To: <894722811.28675645.1560782288619.JavaMail.zimbra@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 18 Jun 2019 19:00:46 +0300
Message-ID: <CAOQ4uxgPPoxWp5fJ-7GdgEg89683_1mL3mCHqevGX=-FrRYwmA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>, Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: Federico Bonfiglio <fedebonfi95@gmail.com>, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/ioctl_ns0[156]: align stack and
 wait for child
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNTozOCBQTSBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPgo+IC0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiA+IEhp
IQo+ID4gPiA+ID4gSSByZWNhbGwgSSBzdGFydGVkIHdpdGggdGhhdCBwb3NpdGlvbiAoZnJlZSBh
bGwpLCBhbmQgSSB0aG91Z2h0IHlvdQo+ID4gPiA+ID4gdHVybmVkIG1lIGFyb3VuZCBhZnRlciB0
aGlzIG1hbnkgeWVhcnMgOi0pLgo+ID4gPiA+Cj4gPiA+ID4gV2VsbCBJIGRpZG4ndCBjYXJlIHRo
YXQgbXVjaCwgYnV0IEkgZ3Vlc3MgdGhhdCBJIGxlYW4gc2xpZ2h0bHkgdG8gZnJlZQo+ID4gPiA+
IHRoZSBtZW1vcnkgOi0pLgo+ID4gPgo+ID4gPiBPSywgc28gc2hvdWxkIEkgcmVwb3N0IG9yIGlz
IHRoaXMgZ29vZCB0byBnbyB3aXRoIGZyZWUgYWRkZWQgdG8gY2xlYW51cD8KPiA+Cj4gPiBMZXQn
cyBkbyB0aGF0Lgo+Cj4gUHVzaGVkLgo+IChMaSwgSSBhZGRlZCB5b3VyIEFja2VkLWJ5IHRvIGl0
LCBzaW5jZSB5b3VyIGNvbW1lbnQgaGFzIGJlZW4gYWRkcmVzc2VkKS4KPgoKRllJLCBub3QgcmVs
YXRlZCB0byB0aGVzZSBmaXhlcywgYnV0IHRlc3RzIGlvY3RsX25zMFs0Nl0gaGF2ZSBmYWlsdXJl
cyBvbiBrZXJuZWwKd2l0aG91dCBDT05GSUdfVVNFUl9OUzoKdHN0X3Rlc3QuYzoxMTEyOiBJTkZP
OiBUaW1lb3V0IHBlciBydW4gaXMgMGggMDVtIDAwcwppb2N0bF9uczA0LmM6MjQ6IENPTkY6IG5h
bWVzcGFjZSBub3QgYXZhaWxhYmxlCnNhZmVfbWFjcm9zLmM6MjI1OiBCUk9LOiBpb2N0bF9uczA0
LmM6MzE6Cm9wZW4oL3Byb2Mvc2VsZi9ucy91c2VyLDAsMDE2MDYzMjcwNTApIGZhaWxlZDogRU5P
RU5UCgpBbmQgc28gZG9lcyB0ZXN0IGdldHhhdHRyMDU6CmdldHhhdHRyMDUuYzo4NTogUEFTUzog
R290IHNhbWUgZGF0YSB3aGVuIGFjcXVpcmluZyB0aGUgdmFsdWUgb2YKc3lzdGVtLnBvc2l4X2Fj
bF9hY2Nlc3MgdHdpY2UKZ2V0eGF0dHIwNS5jOjk1OiBGQUlMOiB1bnNoYXJlKENMT05FX05FV1VT
RVIpIGZhaWxlZDogRUlOVkFMCnRzdF90ZXN0LmM6MzYyOiBCUk9LOiBJbnZhbGlkIGNoaWxkICgy
OTAxNCkgZXhpdCB2YWx1ZSAxCgpUaGFua3MsCkFtaXIuCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
