Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F8F2C1F33
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 08:58:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F17793C4E4E
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 08:58:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E33DE3C2D0C
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 08:58:06 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A2B2E1000367
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 08:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606204684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sgzwp3BTbivjMLVUokR+jq5zEenN3dkQv2JRiAgEt/4=;
 b=LPzgUhGoWnyGbwhhLWlrpN4KNCesIAzg/ci5U/SoB/609AFcint/lbZcWVJdzPJDdXWF4p
 Drid/sbIDGpg5jzN3BEusdAhH+j/RpHTfgOeQze1uubqQFUwyY45SEtym8VPLnlhouyp5E
 zBzbJRxOfTkiUlxTEmBPw2j4DDRULI8=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-RAgyQi8TPyyjrNMWz4gEWg-1; Tue, 24 Nov 2020 02:57:59 -0500
X-MC-Unique: RAgyQi8TPyyjrNMWz4gEWg-1
Received: by mail-yb1-f197.google.com with SMTP id c9so26503472ybs.8
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 23:57:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sgzwp3BTbivjMLVUokR+jq5zEenN3dkQv2JRiAgEt/4=;
 b=IrG0G7gyr2NZu8khZAsfLE7o4mfpEHTlNRojfmwtOmbj0xfgT/hzbof4lBLPv6ws8w
 Gk72Q3rInR0vZcgzavKQS3IWshGKv3lkdVt7Lvb/BXF6wEN9TU0Wv+UWNPr3Lp2GXCpc
 KO1RX3EoKLuo6ua6G1PVyOdD1KUnbgbyX3AIEBPo5klQFle5UKdXCmmb4k2/oqlkwdtP
 crNBmJJjY8mA1QQe8991PUT1WohpoTM3uYCy6dR61ZcomKIiVzGSqM7fhweS/+S7zg5n
 UdxJ+t2hquYd9zTzZ9X+F5dNQ9o6sCUu8bVkWKdHaCFqhnMbHeRxmMiEv/daeCBxfrN2
 lppw==
X-Gm-Message-State: AOAM5312ptTc7H9wU8hXTBXmen/4EIGS6g1GSe6XPT44p7fLem1w3tFa
 ZCkzA0GTA1WsIEdxB8j8RgOFC2LUV6ZAIOFJKXNVPiMTGGdRh6vhXbQHCH0IcVzL+fn2UFqcZKK
 JcJbRURcxqWPdgPaXb2mwOrZh7Y0=
X-Received: by 2002:a25:4444:: with SMTP id r65mr5778487yba.86.1606204679063; 
 Mon, 23 Nov 2020 23:57:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgxK8K3rxAMkLndw2YEAiugbANgxxd9o/IT6ClQl4iR/swcerYgBen8bgSc3qpq4zzEVM0VUpBFxYuYMR4vhw=
X-Received: by 2002:a25:4444:: with SMTP id r65mr5778464yba.86.1606204678754; 
 Mon, 23 Nov 2020 23:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20201123083137.11575-1-liwang@redhat.com>
 <20201123083137.11575-2-liwang@redhat.com>
 <5FBC765A.3020102@cn.fujitsu.com>
In-Reply-To: <5FBC765A.3020102@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 24 Nov 2020 15:57:47 +0800
Message-ID: <CAEemH2eiTQMBA6g1BOeDNx+H81Yk6FvZt_0AonRY7zdpc0K14w@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls: shift to time() if __NR_time not
 support
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
Content-Type: multipart/mixed; boundary="===============0459692053=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0459692053==
Content-Type: multipart/alternative; boundary="000000000000506bdc05b4d5ab12"

--000000000000506bdc05b4d5ab12
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:


> I have seen this patchset, Can we use a function to check whether kernel
>

Yes, we can, I was even thinking to define a global MACRO can check
any syscall not only __NR_time.
(maybe we can achieve it for other tests)
But for this kind of case, I'd not suggest using that MACRO/function
to check __NR_time, because the test will perform twice at the moment
for the __NR_time syscall if it supporting(first time for support checking,
second time for real invoking).

Considering this is a time comparing test, that makes our seconds
more inaccurate to compare.

supports time syscall (like time_supported_by_kernel()) in setup
> and then we use time() - !return value in verify funtion?
>

Though we check the syscall in setup(), shouldn't we also export a variable
to record the result we checked? That does not make things be simple too.

-- 
Regards,
Li Wang

--000000000000506bdc05b4d5ab12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">Yang =
Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fuj=
itsu.com</a>&gt; wrote:<br></div><div>=C2=A0<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
I have seen this patchset, Can we use a function to check whether kernel <b=
r></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-si=
ze:small">Yes, we can, I was even thinking to define a global MACRO can che=
ck</div><div class=3D"gmail_default" style=3D"font-size:small">any syscall =
not only __NR_time.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">(maybe we can achieve it for other tests)</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><div><div class=3D"gmail_default"></div></d=
iv><div class=3D"gmail_default">But for this kind of case, I&#39;d not sugg=
est using that MACRO/function</div><div class=3D"gmail_default">to check __=
NR_time, because the test will perform twice at the moment</div><div class=
=3D"gmail_default">for the __NR_time syscall if it supporting(first time fo=
r support checking,</div><div class=3D"gmail_default">second time for real =
invoking).=C2=A0</div><div class=3D"gmail_default"><br></div><div class=3D"=
gmail_default">Considering this is a time comparing test, that makes our se=
conds</div><div class=3D"gmail_default">more inaccurate to compare.</div></=
div><div class=3D"gmail_default"></div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
supports time syscall (like time_supported_by_kernel()) in setup<br>
and then we use time() - !return value in verify funtion?<br></blockquote><=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Though we check the syscal=
l in setup(), shouldn&#39;t we also export a variable</div><div class=3D"gm=
ail_default" style=3D"font-size:small">to record the result we checked? Tha=
t does not make things be simple too.</div></div><div><br></div></div>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,=
<br></div><div>Li Wang<br></div></div></div></div>

--000000000000506bdc05b4d5ab12--


--===============0459692053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0459692053==--

