Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8CF2A9467
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 11:32:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 587E83C3214
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 11:32:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 842D23C239E
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 11:32:56 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 05C4A14000B4
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 11:32:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604658774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GoRewUjaU+crOFZYj74W8UoJyEzYYkWGfjV8GJcKyU8=;
 b=PK1fSnCmdpGCmFWPWcX9YziDJuk+o1Vs2PJWatuwNL6fk/2YlL/xUZaa2dyBSVZgSxYbJJ
 BOuNeMLu4mKxLXDivcyK1LyJdEWCF/1eT6WQBxpDBUMxu1HlvreYyp8Rkfm12l0+sxDif3
 OGQ9rCeSLHHlIgD6w3QWUr7D4xjQ4RQ=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-nF84ShRqOGG4VIr7SJm_RA-1; Fri, 06 Nov 2020 05:32:50 -0500
X-MC-Unique: nF84ShRqOGG4VIr7SJm_RA-1
Received: by mail-yb1-f200.google.com with SMTP id j10so1065362ybl.19
 for <ltp@lists.linux.it>; Fri, 06 Nov 2020 02:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GoRewUjaU+crOFZYj74W8UoJyEzYYkWGfjV8GJcKyU8=;
 b=OAGrISFY3U0CKFqqcUoM/6peJFlMn/+eQQSSI7mNSJ+y4AQiz6znJz6inUe+xUtLj2
 XguAg8wk3cYsVHtcuX8rG2/QDv2S0ejq3jHDmV/JW00/21m/ZopWxeJpzbXe2IEJzzQK
 zYa8bE7u0G7SHHFte6Q1X2HA240zsO8wVz5K1dtiYDbxBLYz+hq6nEkS/kKxrCYsCU2C
 +GYT+2V944WvIT9ZCpICx9mhRnk4Dm9oOSUeElcZonLbxgP/7wc6KHBXAB1CoEo9e34y
 dchYql1/QVneOLpkmEkleCfUbAU7RGLL3bgzC5WD7+kPTgYV0X/qdpbR6hvSRdoki6zr
 I0pQ==
X-Gm-Message-State: AOAM533cLXNiTC+qcuq+zddK71tOkWfbjr5wmk3LkuR5uOvGowVeH1VG
 yAB8/C4+hSgxqYQwX3yNiTvkUUpsLCks42l2gka+AhkYRyAZd24AFL6hBoVLbhIqsotLq+6KjK6
 QLW+/xw1s937CWgauGWB/P0JL4bU=
X-Received: by 2002:a25:408f:: with SMTP id n137mr1750273yba.97.1604658769824; 
 Fri, 06 Nov 2020 02:32:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaQFY9D66pt9pXXJH0lyHNWvAJ2nT3FUnJX65CJxGCFH3tO7T6UQUlcwPQFFA0eBfkTVTpEXbuEk8zCKKJ+3M=
X-Received: by 2002:a25:408f:: with SMTP id n137mr1750257yba.97.1604658769638; 
 Fri, 06 Nov 2020 02:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20201103161052.13260-1-chrubis@suse.cz>
 <20201103161052.13260-3-chrubis@suse.cz>
 <CAEemH2dUmmFx8cEhqMP6CLpRwszeBD=kMM4i3xpBKYSV+S2d8Q@mail.gmail.com>
 <20201106103108.GB25324@yuki.lan>
In-Reply-To: <20201106103108.GB25324@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Fri, 6 Nov 2020 18:32:38 +0800
Message-ID: <CAEemH2d-qNTDMgehYo1OWzFTKp8TwxSDhj2kq0c2QYqMHomuJg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] lib/tst_kconfig: Make use of boolean
 expression eval
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
Cc: automated-testing@yoctoproject.org, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1999420810=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1999420810==
Content-Type: multipart/alternative; boundary="000000000000f34ee905b36dbb7c"

--000000000000f34ee905b36dbb7c
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 6, 2020 at 6:30 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > I tried with more complicated configurations for test parsing, most works
> > as expected but except the below one with parentheses ():
> >
> >     "CONFIG_DEFAULT_HOSTNAME=\"(none)\"",
> >
> > That's because the parentheses are the element of expression and used
> > to distinguish tokens, I???m not sure whether we can change it as a
> general
> > character to fix this problem, if no, we might need to comment on this in
> > the documentation.
>
> Well we would have to teach the tokenizer about strings, i.e. treat
> everything inside of double quotes as single token. That shouldn't be
> that hard, I can try to add this later on.
>

That would be great, thank you!

-- 
Regards,
Li Wang

--000000000000f34ee905b36dbb7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Nov 6, 2020 at 6:30 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; I tried with more complicated configurations for test parsing, most wo=
rks<br>
&gt; as expected but except the below one with parentheses ():<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;CONFIG_DEFAULT_HOSTNAME=3D\&quot;(none)\&quot=
;&quot;,<br>
&gt; <br>
&gt; That&#39;s because the parentheses are the element of expression and u=
sed<br>
&gt; to distinguish tokens, I???m not sure whether we can change it as a ge=
neral<br>
&gt; character to fix this problem, if no, we might need to comment on this=
 in<br>
&gt; the documentation.<br>
<br>
Well we would have to teach the tokenizer about strings, i.e. treat<br>
everything inside of double quotes as single token. That shouldn&#39;t be<b=
r>
that hard, I can try to add this later on.<br></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">That would be gr=
eat, thank you!</div></div></div><div><br></div>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang=
<br></div></div></div></div>

--000000000000f34ee905b36dbb7c--


--===============1999420810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1999420810==--

