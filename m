Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E941920CC
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 06:57:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB7853C4BAF
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 06:57:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0E7B13C0358
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 06:56:59 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 00A661000C7E
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 06:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585115817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x7hGhCCWlNBxdC4sdp0ASEtvEBAcY6kdEYsdgU3JGnw=;
 b=RROMVt/OvucWkJV5hNEt3srJyyYQc+3Zxs0mBEu8RDMm7Frx5XafEv3dCvexUqY7DYzy6Q
 qOdA8AaKIGfKad3jgDWk7fWQRHFbfMaiqd1mLFZM8HWHfeBOWNZy42G9uCKQNLC2U0DECR
 TtvaaG20U5+pgofevi7+0q9qOXomwp8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-Du_zTHXzMTeRlM7_7EoLqA-1; Wed, 25 Mar 2020 01:56:54 -0400
X-MC-Unique: Du_zTHXzMTeRlM7_7EoLqA-1
Received: by mail-oi1-f198.google.com with SMTP id e203so1019722oif.5
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 22:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGiEXmgBBY47H+q5OzIivRzen0qhf+yNKREdvLTYhyg=;
 b=ZjhnN/eHIyCDCXMKAdC80usS0oyndnfbXbccvWOXPo103DRQkRcFYzg9rFiLrPHQ3z
 Lpp+dUq6R3cwDL19K0BSmw5vmnq37cbDpY4wlazkbxpJF8WAdQ2WKueiVfTWol3pzY9H
 uNFqrthuB7OAXzr09qvMbH7JayX2C3nbpGJGVcAJ/WTxTP09bsjvhc7BUCRV44xRifIZ
 l4zmU/mnCd60e+E5M6ynuKVfv7FF1xSJ3pfbDh2rY4ti/3AA6nSSw+Tzs8qbUyygi5ua
 30aqEHkVGbrPdr765Qj21ldYmvhVTy7/LEMtncha+LV+kMA7Y7iJWhCHrp+iFiWNY26h
 x7zg==
X-Gm-Message-State: ANhLgQ2Hf9WWMLGnzZG4St6wd1v4anN3H618NhHj8uzdKTdb17HYoOA8
 MML7tcDTTKWeIaHIBPpNJlyJ3w+QfRKfNkR91vhnexOWhvqNDQO08YSGlHsyIr4a4ln++P+rKg+
 AUrFDNxE/u3R0ExwMqJM4T8dFWec=
X-Received: by 2002:a9d:2c64:: with SMTP id f91mr1358415otb.17.1585115813740; 
 Tue, 24 Mar 2020 22:56:53 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvwR0qFnEMn+sdAp5wkR97Kz2Z9A1pMIn7Xu56NTD3zkycpCkK3gotmzbRHkoDUiqAerT6R+Os/JohXb1FjaCo=
X-Received: by 2002:a9d:2c64:: with SMTP id f91mr1358407otb.17.1585115813535; 
 Tue, 24 Mar 2020 22:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200320134937.16616-2-pvorel@suse.cz>
 <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
 <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
 <20200323113738.GA4807@dell5510>
 <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
 <20200323160415.GC15673@dell5510> <20200324235150.GC4521@yuki.lan>
 <20200324172102.GA1307@dell5510> <20200325015324.GA15127@yuki.lan>
 <20200324185542.GB17441@dell5510>
In-Reply-To: <20200324185542.GB17441@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Wed, 25 Mar 2020 13:56:42 +0800
Message-ID: <CAEemH2cGgB_H3pq1xwBC46OhA_y-Zhyrr_H-jQS13-_4xu7-0A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Content-Type: multipart/mixed; boundary="===============1460979775=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1460979775==
Content-Type: multipart/alternative; boundary="000000000000fe7a6405a1a788b7"

--000000000000fe7a6405a1a788b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Wed, Mar 25, 2020 at 2:55 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Cyril,
>
> > > > Also if we are going to add this functionality it should be added a=
s
> an
> > > > .needs_cmds array in the tst_test structure.
> > > .needs_cmds sounds as a good idea. But let's do it as a separate
> effort.
> > > I'll leave already sent v2 for review. Once .needs_cmds is
> implemented, we can
> > > use it as well for copy_file_range02.c.
>
> > Actually I would like to avoid exposing the function to the tests and
> > force people to use the .needs_cmds instead in order to have a proper
> > metadata.
> Oh yes, metadata effort, that's important, I'll implement it. But I still
> think
> it's useful to have SAFE_RUNCMD(), although I can remove TCONF (use flag
> TST_RUN_CMD_CHECK_CMD, see below).
>

I'm OK with SAFE_RUNCMD.


> > > BTW what do you think on changing 255 (and 254) for something less
> common?
> > > It's just a corner case swapon on certain setup in copy_file_range02.=
c
> returns
> > > 255 on error:
>
> > I do not think that this will solve the problem. We may hit the same
> > problem with any random number we will choose.
>
> > I guess checking for the command existence before we vfork() would be
> > safer bet here.
> +1. But this IMHO requires to add another parameter to tst_run_cmd_fds_()=
,
> because we don't want always TCONF. Best will be to turn int pass_exit_va=
l
> into
> int flags with 2 possible values (e.g. TST_RUN_CMD_PASS_EXIT_VAL and
> TST_RUN_CMD_CHECK_CMD).
>

Agree, if we set '.needs_cmds' already we don't need to double-check the
command existence in tst_run_cmd() again.

--=20
Regards,
Li Wang

--000000000000fe7a6405a1a788b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25, 2020 at 2:55 AM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Cyril,<br>
<br>
&gt; &gt; &gt; Also if we are going to add this functionality it should be =
added as an<br>
&gt; &gt; &gt; .needs_cmds array in the tst_test structure.<br>
&gt; &gt; .needs_cmds sounds as a good idea. But let&#39;s do it as a separ=
ate effort.<br>
&gt; &gt; I&#39;ll leave already sent v2 for review. Once .needs_cmds is im=
plemented, we can<br>
&gt; &gt; use it as well for copy_file_range02.c.<br>
<br>
&gt; Actually I would like to avoid exposing the function to the tests and<=
br>
&gt; force people to use the .needs_cmds instead in order to have a proper<=
br>
&gt; metadata.<br>
Oh yes, metadata effort, that&#39;s important, I&#39;ll implement it. But I=
 still think<br>
it&#39;s useful to have <span class=3D"gmail_default" style=3D"font-size:sm=
all"></span>SAFE_RUNCMD(), although I can remove TCONF (use flag<br>
TST_RUN_CMD_CHECK_CMD, see below).<br></blockquote><div>=C2=A0</div><div><s=
pan class=3D"gmail_default" style=3D"font-size:small"></span>I&#39;m OK wit=
h <span class=3D"gmail_default" style=3D"font-size:small"></span><span clas=
s=3D"gmail_default"></span>SAFE_RUNCMD<span class=3D"gmail_default" style=
=3D"font-size:small"></span><span class=3D"gmail_default" style=3D"font-siz=
e:small">.</span></div><div></div><div><span class=3D"gmail_default"></span=
>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; BTW what do you think on changing 255 (and 254) for something les=
s common?<br>
&gt; &gt; It&#39;s just a corner case swapon on certain setup in copy_file_=
range02.c returns<br>
&gt; &gt; 255 on error:<br>
<br>
&gt; I do not think that this will solve the problem. We may hit the same<b=
r>
&gt; problem with any random number we will choose.<br>
<br>
&gt; I guess checking for the command existence before we vfork() would be<=
br>
&gt; safer bet here.<br>
+1. But this IMHO requires to add another parameter to tst_run_cmd_fds_(),<=
br>
because we don&#39;t want always TCONF. Best will be to turn int pass_exit_=
val into<br>
int flags with 2 possible values (e.g. TST_RUN_CMD_PASS_EXIT_VAL and<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>TST_RUN_CMD_=
CHECK_CMD).<br></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">Agree, if we set &#39;.needs_cmds&#39; already =
we don&#39;t need to double-check=C2=A0the command existence in tst_run_cmd=
() again.</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--000000000000fe7a6405a1a788b7--


--===============1460979775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1460979775==--

