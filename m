Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 900BF310633
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 09:06:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B5C63C70D3
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 09:06:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EF1E13C2EBE
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 09:06:25 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 23161600F28
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 09:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612512382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PPG2jR9BQhQZZLMju+/7A4VF7x+XX5uBoJlBbxSNpqs=;
 b=AZepn5bVgyZHa5OhOupbm2l04WhJGJfOZhWJnRmQ4LNdm3JvTnRf6t20yCBdmYIoiawXVq
 6aZTeW4A/zGq/3EqFExiHKKe0wIPJoIHKAMNshShvTKmreLqe9e3QFePFKqNGmahtvtgnv
 GkgWcnarFc4JsWTn9QKwj8kOdAsGOqg=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-oE5d_TVUPm6d8LmjnptYRA-1; Fri, 05 Feb 2021 03:06:20 -0500
X-MC-Unique: oE5d_TVUPm6d8LmjnptYRA-1
Received: by mail-yb1-f200.google.com with SMTP id v17so6180762ybq.9
 for <ltp@lists.linux.it>; Fri, 05 Feb 2021 00:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PPG2jR9BQhQZZLMju+/7A4VF7x+XX5uBoJlBbxSNpqs=;
 b=ZUDW0oqZkDnDuRMv6RUIY6EKtQgmYMjB3YeGuTexRf9u0Hli8DAwZylQeKbdKvBo5T
 9eyZj4uXkEagkiQIPUZ2oMZhk3F6609y4iQjzLdA0qzVtI0B2quRWTW7cdhYn3RWxE8Y
 7/t7JGRSLXyHErjzOfLcZqLp5a3/FrZ0mSrXK+DZFc6XROydFcaG02rAsegvNIM5D/m8
 4t6/YuNTRa+dtKBEwIJCRM1koBwbjW0juJIdWdv5CFixGmSueTPXQ+dx3tFs0vlC/ZSu
 W04NdylML/YXTTP1OJcj6iTJbiPShoebGOt4U+Vy0asxzqJzVRT2n6+c+Cr9DsnrLns1
 O4lQ==
X-Gm-Message-State: AOAM53373rfJI+BtYBP3iug5YZAJwHqwDoV+/7YT4ORCR3ZGClbGQRpo
 irWySx+W26zOiWe6CNNHAhxSnMA2wNka/N4t9SwhRva8iQAYf6/3TI0GT4ZSbgTx2B2/2HCdQdJ
 jYeNXQXljQFOiU+wRaUk56FtQAq8=
X-Received: by 2002:a25:a4ea:: with SMTP id g97mr5054710ybi.286.1612512380219; 
 Fri, 05 Feb 2021 00:06:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzR8Khf09DORwLsri16kabezYKGjGt21df2KIo8EYXn20CZ+lNU0DE6puqJ5zqCs5czFJMpjKS0iBR3i8f6UjQ=
X-Received: by 2002:a25:a4ea:: with SMTP id g97mr5054692ybi.286.1612512380011; 
 Fri, 05 Feb 2021 00:06:20 -0800 (PST)
MIME-Version: 1.0
References: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
 <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2f_mvjt4couA++RcOf9bAMO8fnqapkgG59Qvs9Ud-2SHw@mail.gmail.com>
 <601CF76D.8020705@cn.fujitsu.com>
In-Reply-To: <601CF76D.8020705@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 5 Feb 2021 16:00:35 +0800
Message-ID: <CAEemH2dwK-mabPKHKboFePgrABHDNe35XD-8ed4cjgp3yr7cLg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/5] tst_mallinfo.c: Add a common print helper
 for mallinfo
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
Content-Type: multipart/mixed; boundary="===============1291185072=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1291185072==
Content-Type: multipart/alternative; boundary="0000000000009b5b6605ba924bed"

--0000000000009b5b6605ba924bed
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 5, 2021 at 3:44 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> Hi Li
> > Hi Xu,
> >
> > Thanks for your work.
> >
> >     --- /dev/null
> >     +++ b/include/tst_mallinfo.h
> >
> >
> > Do we really need to export this function into the LTP library?
> > (I assumed no other tests will using this lib function anymore)
> Maybe we can add tst_print_mallinfo2 in the future and mallinfo2() case
> can use this header.
>

Or put it into the tst_memutils.h, I guess this header file is a
general-purpose for providing kinds of memory helpers.



>
> >
> > So I prefer to create a common header file as:
> > ../syscalls/mallinfo/mallinfo_common.h,
> > and just use it locally.
> >
> > If you're hoping mallopt01.c also benefits from it, only need to
> > build something like mallinfo_commo.o via Makefile and include
> > it in mallopt01.c by "../mallinfo/mallinfo_common.h".
> Just want to avoid random makefile. I am not sure which way is better.
> Let's listen advise from other maintainers.
>

Sure, my pleasure to hear more voice~

-- 
Regards,
Li Wang

--0000000000009b5b6605ba924bed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Feb 5, 2021 at 3:44 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn=
.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi Li<br>
&gt; Hi Xu,<br>
&gt;<br>
&gt; Thanks for your work.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/include/tst_mallinfo.h<br>
&gt;<br>
&gt;<br>
&gt; Do we really need to export this function into the LTP library?<br>
&gt; (I assumed no other tests will using this lib function anymore)<br>
Maybe we can add tst_print_mallinfo2 in the future and mallinfo2() case<br>
can use this header.<br></blockquote><div><br></div><div><div class=3D"gmai=
l_default" style=3D"font-size:small">Or put it into the tst_memutils.h, I g=
uess this header file is a general-purpose for providing kinds of memory he=
lpers.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
&gt;<br>
&gt; So I prefer to create a common header file as:<br>
&gt; ../syscalls/mallinfo/mallinfo_common.h,<br>
&gt; and just use it locally.<br>
&gt;<br>
&gt; If you&#39;re hoping mallopt01.c also benefits from it, only need to<b=
r>
&gt; build something like mallinfo_commo.o via Makefile and include<br>
&gt; it in mallopt01.c by &quot;../mallinfo/mallinfo_common.h&quot;.<br>
Just want to avoid random makefile. I am not sure which way is better. <br>
Let&#39;s listen advise from other maintainers.<br></blockquote><div>=C2=A0=
</div><div class=3D"gmail_default" style=3D"font-size:small">Sure, my pleas=
ure to hear more voice~</div></div><div><br></div>-- <br><div dir=3D"ltr"><=
div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></=
div>

--0000000000009b5b6605ba924bed--


--===============1291185072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1291185072==--

