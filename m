Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5B33F12F0
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 07:50:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 455BD3C5434
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 07:50:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8AE363C4BEE
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 07:50:25 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 51B061A01177
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 07:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629352222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fdwb37I6SOGy2bvsc6XVjC8CnF5zLSgCa3IHdJZDWfY=;
 b=LNso/+lkOAoxxCZh80XWtv8QxN1xY4FU6HH1ZYgBx6sjM4sTizPnsYkRiIS7rOg53kU1rU
 uRS2c6d5N9cuxiIoIdbn0OJ9/4pYAtIfQA3VINS7HCwVr9vXokwCiT5rOxj+Az7BJr62lO
 HXE3Wifcat2qsf5n8DPk5mXRpUQjLfs=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-zwSX5EoeOpGNLzb-1skK0g-1; Thu, 19 Aug 2021 01:50:11 -0400
X-MC-Unique: zwSX5EoeOpGNLzb-1skK0g-1
Received: by mail-yb1-f198.google.com with SMTP id
 n20-20020a2540140000b0290593b8e64cd5so5492899yba.3
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 22:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fdwb37I6SOGy2bvsc6XVjC8CnF5zLSgCa3IHdJZDWfY=;
 b=l9MsKEcC3wn13GOAyk7VWyt7iPs3xYV1WaQnY7jsb2sOzj1PWqYkTHKxQD7LSyn20b
 MUwz4q+HaYGflPViG/wqYDTwKbS1a5cywhyUhARveSZdT5xXsIEV26MIgA58ysxCI6ns
 VkI8IxAd2l9Fg5ostjZM2BTkg66nj2o8UAbgvoiMo5XwIp6dJ3c0+/AV/siAX9CTuJf5
 PjqIfpMYPRNG+sh+oEFa0+e5HlAWNOgMIj2QtgEamQHV8pi6+rxD9dY3Ewxt/Fm0kPxs
 KDjQbyf4XI3axDLg7IatVujvOvYRrzqnsPyhqbi4zBVUFkTMuCycdc0evDjNeHeAIZaz
 Gp4A==
X-Gm-Message-State: AOAM531NwgHukISd/faZu+RX4eGl6dehaEmy8/OdxlrFyJy14naAWzNY
 0xRFzxmrhJEotsbS/xW05mcCCooygDh1RoQFDJ+V8pSOb4zmB8NQ0fasABcxk2d+Uqkf6jawE0/
 yFhexpy4+L5quOTPzaobj7B8ZxWg=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr16522601ybc.86.1629352210961; 
 Wed, 18 Aug 2021 22:50:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaWFIhxLaFQzmF9TOWQWO/Rhpj97hO3imK+DVkiXWOfTufhSrcjztll80w5jB+qrrXepikCNzZIhfjoUE6nGA=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr16522589ybc.86.1629352210813; 
 Wed, 18 Aug 2021 22:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210818091224.27578-1-pvorel@suse.cz>
 <20210818091224.27578-4-pvorel@suse.cz>
 <8589e81b-4c45-e62e-297a-ef6a3cd548dc@jv-coder.de> <YRzaf3jq02zM306Y@pevik>
In-Reply-To: <YRzaf3jq02zM306Y@pevik>
From: Li Wang <liwang@redhat.com>
Date: Thu, 19 Aug 2021 13:49:59 +0800
Message-ID: <CAEemH2eyyT4STv1NyUnc1hp39z-x3vsetc8z3hVKqs=uaMqGMA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] commands: Drop which01.sh
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
Cc: LTP List <ltp@lists.linux.it>, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: multipart/mixed; boundary="===============1203536379=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1203536379==
Content-Type: multipart/alternative; boundary="000000000000bd69cf05c9e31f7d"

--000000000000bd69cf05c9e31f7d
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 6:01 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Joerg,
>
> > Hi Petr,
>
> > On 8/18/2021 11:12 AM, Petr Vorel wrote:
> > > "which" has been discontinued after 2.21 release in 2015 due this (git
> > > repository is empty [1]).
> > I am a bit against dropping this. which is widely used and I think as
> long
> > as it is available, it should behave as expected.
> First, thanks for your review of all patchset.
>
> I should have marked this commit as RFC. I have no problem to postpone
> deleting this test fairly long time (even for 1-2 years).
>

I just have a look at which01.sh that is written by the new API and so far
so good.
Maybe we can reserve it for a bit long time.



>
> But, if we really want to test basic shell commands (IMHO they should be
> part of
> particular shell implementation code and most of these projects have it:
> e.g.
> bash, busybox, coreutils, util-linux, ...), in this particular test it'd
> be more
> useful to test "type" or "command" than "which", which code hasn't been
> changed
> since 2015. Looking into openSUSE code [1], there is no patch on "which"
> command.
>
> Also, I might be a bit too aggressive when removing tests for legacy code,
> but
> in this case Debian has deprecated "which" from it's basic tools [2],
> proving
> there is a push to use "type" / "command -v" at least in some distros.
>
> Kind regards,
> Petr
>
> [1] https://build.opensuse.org/package/show/Base:System/which
> [2]
> https://salsa.debian.org/debian/debianutils/-/commit/3a8dd10b4502f7bae8fc6973c13ce23fc9da7efb
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000bd69cf05c9e31f7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Aug 18, 2021 at 6:01 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Joerg,<br>
<br>
&gt; Hi Petr,<br>
<br>
&gt; On 8/18/2021 11:12 AM, Petr Vorel wrote:<br>
&gt; &gt; &quot;which&quot; has been discontinued after 2.21 release in 201=
5 due this (git<br>
&gt; &gt; repository is empty [1]).<br>
&gt; I am a bit against dropping this. which is widely used and I think as =
long<br>
&gt; as it is available, it should behave as expected.<br>
First, thanks for your review of all patchset.<br>
<br>
I should have marked this commit as RFC. I have no problem to postpone<br>
deleting this test fairly long time (even for 1-2 years).<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I=
 just have a look at which01.sh that is written by the new API and so far s=
o good.</div><div class=3D"gmail_default" style=3D"font-size:small">Maybe w=
e can reserve it for a bit long time.<br></div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
But, if we really want to test basic shell commands (IMHO they should be pa=
rt of<br>
particular shell implementation code and most of these projects have it: e.=
g.<br>
bash, busybox, coreutils, util-linux, ...), in this particular test it&#39;=
d be more<br>
useful to test &quot;type&quot; or &quot;command&quot; than &quot;which&quo=
t;, which code hasn&#39;t been changed<br>
since 2015. Looking into openSUSE code [1], there is no patch on &quot;whic=
h&quot;<br>
command.<br>
<br>
Also, I might be a bit too aggressive when removing tests for legacy code, =
but<br>
in this case Debian has deprecated &quot;which&quot; from it&#39;s basic to=
ols [2], proving<br>
there is a push to use &quot;type&quot; / &quot;command -v&quot; at least i=
n some distros.<br>
<br>
Kind regards,<br>
Petr<br>
<br>
[1] <a href=3D"https://build.opensuse.org/package/show/Base:System/which" r=
el=3D"noreferrer" target=3D"_blank">https://build.opensuse.org/package/show=
/Base:System/which</a><br>
[2] <a href=3D"https://salsa.debian.org/debian/debianutils/-/commit/3a8dd10=
b4502f7bae8fc6973c13ce23fc9da7efb" rel=3D"noreferrer" target=3D"_blank">htt=
ps://salsa.debian.org/debian/debianutils/-/commit/3a8dd10b4502f7bae8fc6973c=
13ce23fc9da7efb</a><br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000bd69cf05c9e31f7d--


--===============1203536379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1203536379==--

