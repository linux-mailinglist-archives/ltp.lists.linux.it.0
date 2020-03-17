Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B65BF187B13
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 09:21:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 590283C55F3
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 09:21:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 42DF53C0E5E
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 09:21:39 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1972A1A0144C
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 09:21:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584433296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qBnjZMK9Sd/un7z8H2Nj8I/IXMzkswrnErfPNpUPaD8=;
 b=D5QDAis5YnsLvIV+tRK1TbH6aagKusBuHFh+DihHBcfrzAg6UJKn7q3+QmZM3hzBFQcYLQ
 x8Ev1CVD/LeRRrfvnsQw4TRBlRsmBt27v6V1McZhnFsF8w8agYG66lvXPdfqvXVISGgJ3A
 JGfArhHuvMt/rjvnzTtu1DiaJUPl/V8=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-rH2iRQhiNIOxJMOi9of61g-1; Tue, 17 Mar 2020 04:21:33 -0400
X-MC-Unique: rH2iRQhiNIOxJMOi9of61g-1
Received: by mail-oi1-f199.google.com with SMTP id x24so12700830oie.3
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 01:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0n43JKA81B8KNy7WErb38rpgKE9sSHHmpPBMY00JL6w=;
 b=Xbrx1U4hbXeNJeihiddiPAMTCgsNjZZnOOQbF2nYdQBqnCBWlWTugdcolfVASoRZ8e
 Rn5MmQzHPGsMKWMp6L26GPou2OlPP/7E7UWes7UD3jf72WkIFmk8r8bZmz8Y4JQ5RuOU
 5mkv6jaCnjj0sa3uBNO3eE2CXuQcIKgqKeiSyPRNe6hEJjj3vUIqAsQA0DMlMMIYJhh2
 BDahEqYaEqgzW+KXuqQZ01kFJbEkyffdF+fzhMRDjlLv5D6GVGNnavHIXbdh3w2fGGxI
 mtWSH8uOYEDzfYhL14W6VNaAtLLm6q1U8YesOM9P2LKjaIBD1s8LymAvVNaQwGGD8FFH
 3W3A==
X-Gm-Message-State: ANhLgQ1R/xFz7IsFl+1SJiv2jkK8ywpAMK5Gd9PuQLSWp427o275jCXw
 EQmmPvARWPaEMmsXGU2uNRAhyv8RAv/fQafP2SHgs0zVUuj90UofLSGIyZ62GVsTVXwJJWcCyyy
 UO3rUV32T47eUil0Zo3HTZ8EjAyw=
X-Received: by 2002:a9d:4b98:: with SMTP id k24mr2638419otf.26.1584433293256; 
 Tue, 17 Mar 2020 01:21:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtJ3bJj8G1/IndfiSv5yNHvhsrNG+EWk6D0+bMB2/ahcew8ouRLMUXvKvyw0jJ/Ns9aJqW57PpSv60tNkcK6PI=
X-Received: by 2002:a9d:4b98:: with SMTP id k24mr2638406otf.26.1584433292941; 
 Tue, 17 Mar 2020 01:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <1584430031-47227-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1584430031-47227-1-git-send-email-zou_wei@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 17 Mar 2020 16:21:21 +0800
Message-ID: <CAEemH2fjmP=FxH0zfnBrXX=uE4VQDTbmnso5fpNs+qBWOuKRqw@mail.gmail.com>
To: Zou Wei <zou_wei@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix_testsuite: Fix compilation issues
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
Content-Type: multipart/mixed; boundary="===============1541320414=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1541320414==
Content-Type: multipart/alternative; boundary="00000000000098ac3d05a1089f81"

--00000000000098ac3d05a1089f81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2020 at 3:21 PM Zou Wei <zou_wei@huawei.com> wrote:

> Fix compilation issues:
> 1. Add the '-lpthread -lrt -lm' config into LDFLAGS
> 2. Update makefile and locate-test script
>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
>
Reviewed-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--00000000000098ac3d05a1089f81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Mar 17, 2020 at 3:21 PM Zou Wei &lt;<a href=
=3D"mailto:zou_wei@huawei.com" target=3D"_blank">zou_wei@huawei.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fix comp=
ilation issues:<br>
1. Add the &#39;-lpthread -lrt -lm&#39; config into LDFLAGS<br>
2. Update makefile and locate-test script<br>
<br>
Signed-off-by: Zou Wei &lt;<a href=3D"mailto:zou_wei@huawei.com" target=3D"=
_blank">zou_wei@huawei.com</a>&gt;<br></blockquote><div><span class=3D"gmai=
l_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"ma=
ilto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt;</span><=
/div><div><span class=3D"gmail_default" style=3D"font-size:small"></span>=
=C2=A0</div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br=
></div><div>Li Wang<br></div></div></div></div>

--00000000000098ac3d05a1089f81--


--===============1541320414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1541320414==--

