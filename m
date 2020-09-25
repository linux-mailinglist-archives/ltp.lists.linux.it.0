Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A300277DEB
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 04:30:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 011833C54E9
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 04:30:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 22D443C13DC
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 04:30:01 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2C24C10005FD
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 04:30:00 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601000999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JiauIqG8TkE+2yVn9KDN4zv9+TcpZz/mCSfH6O54I2w=;
 b=TdLKZe6an7zC0cOoQUIcLRjZeGjgvJGoE/UxFR9uke66F4OZaXaIAU4vaed9tdvudC71T0
 uu5j5YEArowJi+w0/Zfu2v3JSTyBU7F0Gd6oUjhby5pMzJ6mkTjf00maELHapfOAfm2nUg
 hjU7XAIAg8EWEeDshTEvhCgFfrwcJWw=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-FGF4xF1zMr2S4-FGWy6T9w-1; Thu, 24 Sep 2020 22:29:57 -0400
X-MC-Unique: FGF4xF1zMr2S4-FGWy6T9w-1
Received: by mail-yb1-f197.google.com with SMTP id z40so1296213ybi.3
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 19:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JiauIqG8TkE+2yVn9KDN4zv9+TcpZz/mCSfH6O54I2w=;
 b=hStSPFbWa/a12jPTgtDsD8Xtp2KHk3JpWMvmPZN9UY8fG5MywYWSE0DssIRbvRtJXr
 von2GDJ+VnIJvB/E8aR9mkgVdRcuVu3iCLe4CIGP+q2jLRY9WjpcHsolKPf0iw8CgRJg
 wSVF2wRHyZCHgYz5/Uct4bgc+D3iZC0ZNNBMYs3Sn4FY+rnOfP8cJ4T/GRO26dmpKo9D
 e9fKkCpIRl9RvU59i29We+PsIqSIZdKMXOVjKc+qaYrqvTVtsmuNzu2741qBGO1l8sGX
 3yOgI8hrivn1Sov7WmVzz/vy76jWFJgENpoDt5z6EevFqvRpvJcAFUpcbL+ZBh8ymW8h
 1urA==
X-Gm-Message-State: AOAM530OWCBtiUCJN6Aql7jwCpvZkLcSYAcQsA2S+ZJaZT5F2rLqYeHc
 kRhLbJp5Cl5SQU0F4rSVDhaFPioO65EXIBduqdOerNbCDMrLoMjsTkZnD1dCvKFn3xxWp8Ep+45
 DeKBnIF8DNvUSVrMT6ETxSlIU3MQ=
X-Received: by 2002:a25:1405:: with SMTP id 5mr2369434ybu.97.1601000996616;
 Thu, 24 Sep 2020 19:29:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ8qT3WCQw/f/oNVck5Ugw7xt8i2WZQH7opeh3MVITDl848OshmM6K91nTVbMnENmu7u7VW+hCI5AOwPElUjQ=
X-Received: by 2002:a25:1405:: with SMTP id 5mr2369415ybu.97.1601000996382;
 Thu, 24 Sep 2020 19:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200924111124.5666-1-rpalethorpe@suse.com>
 <CAEemH2eDPzfdUR78d_mSuaDgi=v1RuboDotNwAGrLHCCg1Q41A@mail.gmail.com>
 <877dsjxoak.fsf@suse.de>
In-Reply-To: <877dsjxoak.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Fri, 25 Sep 2020 10:29:44 +0800
Message-ID: <CAEemH2f_PdJABqTYF6JUH-BVAPO+1kH1AOK0b+x9gpvbELzVKA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
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
Subject: Re: [LTP] [PATCH] tst_cgroup: Don't try to use V2 if V1 controllers
 are mounted
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
Cc: Pter Vorel <pvorel@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0935917330=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0935917330==
Content-Type: multipart/alternative; boundary="000000000000acbd2005b01a17bf"

--000000000000acbd2005b01a17bf
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2020 at 10:06 PM Richard Palethorpe <rpalethorpe@suse.de>
wrote:

> Hello Li,
>
> Li Wang <liwang@redhat.com> writes:
>
> > Hi Richard,
> >
> > On Thu, Sep 24, 2020 at 7:11 PM Richard Palethorpe <rpalethorpe@suse.com
> >
> > wrote:
> >
> >> It is not possible to use a controller in V2 cgroups if it has been
> >> mounted as a V1 controller. So if V1 is mounted we use it regardless
> >> of if V2 is available.
> >>
> >> We have to include a space in tst_is_mounted so that we do not match
> >> cgroup2.
> >>
> >> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> >> ---
> >>  lib/tst_cgroup.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> >> index ba413d874..73ddd4b82 100644
> >> --- a/lib/tst_cgroup.c
> >> +++ b/lib/tst_cgroup.c
> >> @@ -44,7 +44,7 @@ enum tst_cgroup_ver tst_cgroup_version(void)
> >>          enum tst_cgroup_ver cg_ver;
> >>
> >>          if (tst_cgroup_check("cgroup2")) {
> >> -                if (!tst_is_mounted("cgroup2") &&
> >> tst_is_mounted("cgroup"))
> >> +                if (tst_is_mounted("cgroup "))
> >>
> >
> > Add a space in the suffix still not work as expected.
> >
> > The reason is that tst_is_mounted("cgroup ") also get non-zero return if
> > system only mount cgroup_v2, which lead to choose cgroup_v1 in LTP test.
> >
> > # cat /proc/mounts |grep cgroup
> > cgroup2 /sys/fs/cgroup cgroup2 rw,seclabel,nosuid,nodev,noexec,relatime
> 0 0
>
> I wonder if it would be better to simply try mounting/using V2 and if
> that fails try V1?
>

That will be work but not good, because if cgroup mount fails, how do we
know it is a bug or not support?

-- 
Regards,
Li Wang

--000000000000acbd2005b01a17bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 24, 2020 at 10:06 PM Richard Palethorpe=
 &lt;<a href=3D"mailto:rpalethorpe@suse.de">rpalethorpe@suse.de</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Li,<br=
>
<br>
Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt; Hi Richard,<br>
&gt;<br>
&gt; On Thu, Sep 24, 2020 at 7:11 PM Richard Palethorpe &lt;<a href=3D"mail=
to:rpalethorpe@suse.com" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; It is not possible to use a controller in V2 cgroups if it has bee=
n<br>
&gt;&gt; mounted as a V1 controller. So if V1 is mounted we use it regardle=
ss<br>
&gt;&gt; of if V2 is available.<br>
&gt;&gt;<br>
&gt;&gt; We have to include a space in tst_is_mounted so that we do not mat=
ch<br>
&gt;&gt; cgroup2.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorp=
e@suse.com" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 lib/tst_cgroup.c | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c<br>
&gt;&gt; index ba413d874..73ddd4b82 100644<br>
&gt;&gt; --- a/lib/tst_cgroup.c<br>
&gt;&gt; +++ b/lib/tst_cgroup.c<br>
&gt;&gt; @@ -44,7 +44,7 @@ enum tst_cgroup_ver tst_cgroup_version(void)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum tst_cgroup_ver cg_ver;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_cgroup_check(&quot;cgrou=
p2&quot;)) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tst_=
is_mounted(&quot;cgroup2&quot;) &amp;&amp;<br>
&gt;&gt; tst_is_mounted(&quot;cgroup&quot;))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_i=
s_mounted(&quot;cgroup &quot;))<br>
&gt;&gt;<br>
&gt;<br>
&gt; Add a space in the suffix still not work as expected.<br>
&gt;<br>
&gt; The reason is that tst_is_mounted(&quot;cgroup &quot;) also get non-ze=
ro return if<br>
&gt; system only mount cgroup_v2, which lead to choose cgroup_v1 in LTP tes=
t.<br>
&gt;<br>
&gt; # cat /proc/mounts |grep cgroup<br>
&gt; cgroup2 /sys/fs/cgroup cgroup2 rw,seclabel,nosuid,nodev,noexec,relatim=
e 0 0<br>
<br>
I wonder if it would be better to simply try mounting/using V2 and if<br>
that fails try V1?<br></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">That will be work but not good, because=
=C2=A0if cgroup mount fails, how do we know it is a bug or not support?</di=
v></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div><=
/div></div>

--000000000000acbd2005b01a17bf--


--===============0935917330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0935917330==--

