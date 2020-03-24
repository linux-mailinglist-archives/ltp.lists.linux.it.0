Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 358851907F8
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 09:47:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E90253C4D27
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 09:47:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4C03C3C042E
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 09:47:14 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id DF9991A01229
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 09:47:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585039632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xasYT/DIyd4uZPbEkGgK/Ke/FoYvntRE3lC/VWlfuuk=;
 b=YJIGFeB3ZEOcE4J9WcT+vsd0uM8KlYdJdKfDJI0vu4ksRD3nPMDGa6Hlb9JOWtNGV3fO3w
 xh2uRhqCpvrT1m5OABP0E2o8jzb0MwmlXzYYIES4bk2SHERFHbnoLrJInqzdFLR3PgJNGm
 Taykd/8jCsDBRWSdFNSVMBER6tTL1fI=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-e4O-jzuQOyCMXWA2M281Ug-1; Tue, 24 Mar 2020 04:47:09 -0400
X-MC-Unique: e4O-jzuQOyCMXWA2M281Ug-1
Received: by mail-oi1-f197.google.com with SMTP id c8so12585875oib.9
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 01:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yn2/Jmw+6U+HsW1nZoxsa9EDzA9zdEelt++SSmFc4QM=;
 b=kkMHUoClB4saTKCvjSAWUBjTdzhymXZSO5XCVOYB6QQVZx4QNLKx+Qd6dnT+j3KYyn
 dIgVbfX9i0fbmAkRtvLcLzR6cXQd+Y+zp0EAKru6aH4l7fdeE+FI6U5OITN80dl1OvXB
 bPR1J4wEbH3KwR7n/MgporzeKm/syoEGa4NeFh+L8M+JNCVxoF7DHsjIM8kjbvWnjo0w
 pFMXVNYkwOsdMODjhwsM6ISxnSUgCa1rOWJTUwgwv9h6xxi3nqjvPQytfCHDPkw+zVFh
 HtSwNy24RLw21tCLpcPIMuX8zdFtjoi/cCcym3c1GH9St5IKpB93bre/vUFiuzgCq8Hx
 NjEg==
X-Gm-Message-State: ANhLgQ32tYNx6E+MZxPP5WAYsVApyhHVr19JdhPNGSVoWJPWoM4OuyxU
 nfj5o5RQ5zP8efCjLbg4hnXjeKrYiJUCMHccLhat1K+ABS45GHnjNQlEV5SnPdmtuJNkDOGa6nO
 UuMmJ6WQqCfGAJOIjT5scUT6V9Rg=
X-Received: by 2002:a05:6830:11c1:: with SMTP id
 v1mr748080otq.264.1585039629225; 
 Tue, 24 Mar 2020 01:47:09 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvQB67OKgSNV/RwoPhNpdRyOplgFoltwAwGr/zjNJjNH6yrnhXPHxm7aKjHaoRB5jovikrwl84a0k7dCUtEmrw=
X-Received: by 2002:a05:6830:11c1:: with SMTP id
 v1mr748064otq.264.1585039628832; 
 Tue, 24 Mar 2020 01:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <1584688129-31873-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1584688129-31873-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 24 Mar 2020 16:46:57 +0800
Message-ID: <CAEemH2dXbaHR+foq7Lzq6pwUyJWw4FrOOGyf0oTmb2zYYLm0KA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clocks/invaliddates.c: Remove outdated clock time
 setting
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1845198004=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1845198004==
Content-Type: multipart/alternative; boundary="0000000000000822e905a195cc78"

--0000000000000822e905a195cc78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

Tested and pushed. Thanks for the fix.

--=20
Regards,
Li Wang

--0000000000000822e905a195cc78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div></div><div class=3D"gmail_default" style=3D"font-size:small=
">Tested and pushed. Thanks for the fix.</div><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr"><br></div></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000000822e905a195cc78--


--===============1845198004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1845198004==--

