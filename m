Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBCD1D4452
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 06:17:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 514563C5436
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 06:17:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 86E373C1778
 for <ltp@lists.linux.it>; Fri, 15 May 2020 06:17:05 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id E59C61001732
 for <ltp@lists.linux.it>; Fri, 15 May 2020 06:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589516223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ctRIntyCieLyGn3H2DpB9FE3MLSJfwq/cDa28O9m60=;
 b=VItbbAK7qS1ty24hENMjEr/man2Rmjmk2VAMONWLcyuvjUHfPPvOa8h1YYB8ZYgWHxnDda
 w7cS3ko3jTccT6tmxpTTPw2Le6e2jzgHXOQJTwsVRLNUuh0qIYAPq4619ERe7I0f1MoIY3
 uFI3CeiAVJUyEEA8zZW5+xYQIfJkGT4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-_7dQoOm_OmKX2g1BePcaDg-1; Fri, 15 May 2020 00:17:00 -0400
X-MC-Unique: _7dQoOm_OmKX2g1BePcaDg-1
Received: by mail-lj1-f198.google.com with SMTP id a26so75174ljn.20
 for <ltp@lists.linux.it>; Thu, 14 May 2020 21:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ctRIntyCieLyGn3H2DpB9FE3MLSJfwq/cDa28O9m60=;
 b=tth8RdYjaOOQqpemGDsmR9bEE9gGTug/FNMo2qjsmED9C3RQpZxFmMpD7sKLir3aaz
 nX+sMp4rKFqQ9s/VmQlZJj4+hfBggPjYZgDOW/xuc802QcScssMZ3XVYcbvDueg6NCtV
 Q3oazHdlMsJnHlFwi9yON0UE7zD0o/p/5n9pzr6JVAfgy5xlviHoWynnn58jNVC9SPjl
 rM9ZDP3Iub6gca4mdkwjof33U6zGUJWYzEClmU8vvQaJup/ZvOFpGa9gNj7CnfmrDow2
 Fm0XhfX4hUFD525WmTkw2JmKZ1VY7aFcBcAYFN+I0ijPwbj/l3yJWUMGGWriHumYgOJc
 taFA==
X-Gm-Message-State: AOAM533o6msSBIOAvIEfLOY9oJeqX0k+ji3yiTOtQuzgEz1mp1Q5SH/c
 rngaRWMNECgZH+oMrqtFYqDtoYBGrV73p4h+spUiA9DAknDFG6pmxHmBpMyiA0mgvwv6rlCXxqm
 JzKK/pf2WI8Pd28jOjrQE3EjCq5E=
X-Received: by 2002:a19:675e:: with SMTP id e30mr983339lfj.42.1589516219393;
 Thu, 14 May 2020 21:16:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhOK8fB7pslYDEu+zv/WjUIPguWLGdM3Ju7Pnvfbn+jIUBySUjShoMtdTR+uLXCeRu5hbh+mJ1ddcconB4wK0=
X-Received: by 2002:a19:675e:: with SMTP id e30mr983328lfj.42.1589516219177;
 Thu, 14 May 2020 21:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <5ebe1570.1c69fb81.46edc.a08cSMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <5ebe1570.1c69fb81.46edc.a08cSMTPIN_ADDED_BROKEN@mx.google.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 15 May 2020 12:16:47 +0800
Message-ID: <CAEemH2do_dTERpsB_k0X97JVqdThXH2EO457bhu=qNHhomCwhw@mail.gmail.com>
To: "xuyang_jy_0410@163.com" <xuyang_jy_0410@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Content-Type: multipart/mixed; boundary="===============0542945069=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0542945069==
Content-Type: multipart/alternative; boundary="0000000000009bf8fb05a5a81564"

--0000000000009bf8fb05a5a81564
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 12:07 PM xuyang_jy_0410@163.com <
xuyang_jy_0410@163.com> wrote:

> Hi Li
> Can we put these attach and disattach steps into verify function like
> ioctl_loop 04.c does=EF=BC=9F
>

How does the attach/detach device cause the failure?  I actually run into
this failure without parameter "-i".

--=20
Regards,
Li Wang

--0000000000009bf8fb05a5a81564
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 15, 2020 at 12:07 PM <a href=3D"mailto:=
xuyang_jy_0410@163.com">xuyang_jy_0410@163.com</a> &lt;<a href=3D"mailto:xu=
yang_jy_0410@163.com">xuyang_jy_0410@163.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div>Hi Li=C2=A0</div><div>Can =
we put these attach and disattach steps into verify function like ioctl_loo=
p 04.c does=EF=BC=9F=C2=A0</div></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">How does the attach/detach dev=
ice cause the failure?=C2=A0 I actually run into this failure without param=
eter &quot;-i&quot;.</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>=
Li Wang<br></div></div></div></div>

--0000000000009bf8fb05a5a81564--


--===============0542945069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0542945069==--

