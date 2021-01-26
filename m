Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1FC303498
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 06:25:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 150A23C7188
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 06:25:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4B2913C6A22
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 06:25:20 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A248C600965
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 06:25:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611638717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AzMnlRNbjF50vP1zMvTOkxxqxdTjtdgSvceq9SH9IRo=;
 b=LZlUj5WgkyW36LpJitMnfctHsRs5k86M64SOcRsWGssi1wj7p5D1VjED4I3LehHroNNuQT
 mJem5rTTM/KBPBiXNC/e/KDKwBernASqnO/lnFjW8t5mj7sv8Lu8NyuGXS70vtGDYtqLni
 jCPDRwf/apw+nkGaa/JYFaToqclYw6w=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-okB_i83MMca72zXRxhNOsA-1; Tue, 26 Jan 2021 00:25:13 -0500
X-MC-Unique: okB_i83MMca72zXRxhNOsA-1
Received: by mail-yb1-f197.google.com with SMTP id v187so16813879ybv.21
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 21:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AzMnlRNbjF50vP1zMvTOkxxqxdTjtdgSvceq9SH9IRo=;
 b=RKJsUPKxQbtWHyC4T8BeDce9VJowlDHWGFsdc7xsK3CNOuBe5cTID3S+amcxpPypJN
 1UuGJTPRROYumG9afBeyyFnu+7CKdCubKPBqL4e82jrIXfNv/BxPuV6wIZBStpSDq45d
 ka7c4WyxWMLnxd2X1ARcXdiPpgVUcOIrg8VacWAAI5mlfAFK23x0OBBYPtNC24me2eIq
 0xLnL85oZbhmlp60Y3Z0vZFVTjEBj/E0Zq4LivNqX4Ds/S/TgOW78rPZ+C3tUp1BpovE
 /ERR0hvZQOIPoPOS9MFBRblrTA4SNRaI+qbYuQx6KeBXifgh9A+mWwa517M4FSGjjwUO
 tI3A==
X-Gm-Message-State: AOAM530FimFLr8QaR3g6X5PHP02mzwpP9iBvp/MDclpowZHPkneMXclr
 a9cQtbIVl2JrOaSQdkG3JN1ck54nEJJRlGpu+MNU1iGhnZM7dk5gOI+gy8THuezlsb843lQZUJh
 vaxjsdmcn+R5p+dBHAmAOn0/UjME=
X-Received: by 2002:a25:8203:: with SMTP id q3mr6026388ybk.86.1611638712790;
 Mon, 25 Jan 2021 21:25:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSEQvvlBa3dRJ6hZ66l0CGpemn5NGELF/kVTwtQEeGgGQBAtYnUFnV8m3XT7+W91qDAI0Pvltzn2DZSsm7pvA=
X-Received: by 2002:a25:8203:: with SMTP id q3mr6026368ybk.86.1611638712554;
 Mon, 25 Jan 2021 21:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20210125064747.26759-1-liwang@redhat.com>
 <20210125064747.26759-2-liwang@redhat.com>
 <YA7i/eQagkj0Jxsy@yuki.lan>
In-Reply-To: <YA7i/eQagkj0Jxsy@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 26 Jan 2021 13:25:00 +0800
Message-ID: <CAEemH2cSwtVXi2fXam2aKG0XOEd3-hfZGgQ+o4K2_vyThMrTEg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC 2/2] swapping01: check memory swap usage per
 process
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
Content-Type: multipart/mixed; boundary="===============0900542112=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0900542112==
Content-Type: multipart/alternative; boundary="000000000000f7ed0905b9c6e0db"

--000000000000f7ed0905b9c6e0db
Content-Type: text/plain; charset="UTF-8"

Hi Cyril,

On Mon, Jan 25, 2021 at 11:24 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > Since previously swapping01 read the system FreeSwap for counting
> > usage of swap-size, that's not precise on system especially with
> > eating-memory daemon??in the background. Now, we try to check the
> > 'VmmSwap' in proc/PID/status??per process, to get rid of??the potential
> > influence from??other processes??which easily leads to false positive.
>
> I've been looking for a while at the kernel commit:
>
> commit 50a15981a1fac7e019ff7c3cba87531fb580f065
> Author: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Date:   Sun Jul 24 10:47:59 2011 +0200
>
>     [S390] reference bit testing for unmapped pages
>
> For which this test seems to be a reproducer and as far as I can tell
> this fix is not correct.
>
> If I understand correctly what we are trying to test here is that the
> kernel will not attempt to swap out unreferenced pages, so we have to,
> by definition, look at the system counters not the process ones.
>

Thanks for point out this! Seems we were all working towards
making the test robust but neglect it's a reproducer:).


As we have discussed many unsure things will take side effect to
the system swap-counting, that's what we do NOT want to expect.
Maybe, can we encapsulate all of the means in a process to avoid
involving the whole system swap-counting. e.g.

Child:
         to touch unreferenced pages (via
alloc&write&free 1.3*MemAvailable) [1]
         alloc&wirte 1.3*MemAvailable
         raise(SIGSTOP)
         ...
Parent:
         waiting for child suspension
         check child's VmSwap to see if heavy-swap occurs in a process
         ...

Does this make some sense to the test or, any else suggestion?

[1] As to perform alloc&write&free, the system pages will go through a
completed life cycle from buddy-system to active-list to inactive-list
then back to buddy-system, which reflect to a page status is theoretically
like:
"inactive,unreferenced -> active,referenced -> ... ->inactive,unreferenced"
so that might helpful to produce what the kernel target commit fixed
situation.

-- 
Regards,
Li Wang

--000000000000f7ed0905b9c6e0db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Cyril,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jan 25, 2021 at 11:24 PM Cyril Hrubis=
 &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi=
!<br>
&gt; Since previously swapping01 read the system FreeSwap for counting<br>
&gt; usage of swap-size, that&#39;s not precise on system especially with<b=
r>
&gt; eating-memory daemon??in the background. Now, we try to check the<br>
&gt; &#39;VmmSwap&#39; in proc/PID/status??per process, to get rid of??the =
potential<br>
&gt; influence from??other processes??which easily leads to false positive.=
<br>
<br>
I&#39;ve been looking for a while at the kernel commit:<br>
<br>
commit 50a15981a1fac7e019ff7c3cba87531fb580f065<br>
Author: Martin Schwidefsky &lt;<a href=3D"mailto:schwidefsky@de.ibm.com" ta=
rget=3D"_blank">schwidefsky@de.ibm.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Sun Jul 24 10:47:59 2011 +0200<br>
<br>
=C2=A0 =C2=A0 [S390] reference bit testing for unmapped pages<br>
<br>
For which this test seems to be a reproducer and as far as I can tell<br>
this fix is not correct.<br>
<br>
If I understand correctly what we are trying to test here is that the<br>
kernel will not attempt to swap out unreferenced pages, so we have to,<br>
by definition, look at the system counters not the process ones.<br></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Thanks for point out this! Seems we were all working towards</div><di=
v class=3D"gmail_default" style=3D"font-size:small">making the test robust =
but neglect it&#39;s a reproducer:).</div></div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">As we have discussed many unsure things will=C2=A0take side effect =
to</div><div class=3D"gmail_default" style=3D"font-size:small">the system s=
wap-counting, that&#39;s what we do NOT want to expect.</div><div class=3D"=
gmail_default" style=3D"font-size:small">Maybe, can we encapsulate=C2=A0all=
 of the means in a process to avoid</div><div class=3D"gmail_default" style=
=3D"font-size:small">involving the whole system swap-counting. e.g.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br>Child:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0to touch unreferenced pages (via alloc&amp;write=
&amp;free=C2=A01.3*MemAvailable) [1]</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alloc&amp;wirte=C2=
=A01.3*MemAvailable</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise(SIGSTOP)</div><div class=3D"gm=
ail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0..=
.</div><div class=3D"gmail_default" style=3D"font-size:small">Parent:</div>=
<div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0waiting for child=C2=A0suspension<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0check child&#39;s VmSwap to see if heavy-swap occurs in a process=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0...</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Does this make some sense to the test or, any else=C2=A0suggestion?</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">[1] As to perform alloc&amp;w=
rite&amp;free, the system pages will go through a</div><div class=3D"gmail_=
default" style=3D"font-size:small">completed life cycle from buddy-system t=
o active-list to inactive-list</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">then back to buddy-system, which reflect to a page status i=
s theoretically like:</div><div class=3D"gmail_default" style=3D"font-size:=
small">&quot;inactive,unreferenced -&gt; active,referenced -&gt; ... -&gt;i=
nactive,unreferenced&quot;</div><div class=3D"gmail_default" style=3D"font-=
size:small">so that might helpful to produce what the kernel target commit =
fixed situation.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br=
></div><div>Li Wang<br></div></div></div></div>

--000000000000f7ed0905b9c6e0db--


--===============0900542112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0900542112==--

