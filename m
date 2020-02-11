Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C2872158E47
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 13:18:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D2523C2387
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 13:18:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5DF133C224B
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 13:18:43 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7F9942013A0
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 13:18:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581423521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TaTAawFaJTaMe8d/c8hxu3sWz5bf/AXUtm4nQs/owco=;
 b=Wzdvw/pfvNWV6c5YaPw1kZsNkSlqRWvdfHalxlXqgIhW60XzuMzUZK6gXhCsqrsJ3dl2OT
 Rc41S1YcMSAFtbGyIPVR4k2M5qeqsqrezElwIShSleLo6EAJOgLu9LAdOzJzu29WhTexOe
 HgO4vrbyjjns19zywrk/aHuRR8jeGcg=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-PWxx002SNzeBIv1qPC0b6w-1; Tue, 11 Feb 2020 07:18:37 -0500
Received: by mail-ot1-f70.google.com with SMTP id z3so6848706oto.22
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 04:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iHFCkt4vk6W870xpwRXbWZbsPapBLw2fgc570wdHK9g=;
 b=qkB2+WLDbUTWHYPv1pAluz1P2BuzwivztGDboAQ360a/1e/NKy0x84tVBFlR1Iw69K
 FI1uEvATb8rI1zpuHBzm7oJ1PU6N91DNAL5kHtlQkCfnoU0OgBp14C9F96fkHdClsDPY
 rla3R3N3KfpVWEfaQCeR8jL3CSEea+nWLI/URVpFpHHCUAMIP4+YLKLVoOsHPhFa3Xjd
 Bl9lCvmTwc+s2UWmJRXAKbwaIrlXf1+9FDZSXT4ZsaEdr+9ZywJgf3+dKeKgi3hwfeWj
 nyCOJlzPXzBfHJNggzunB40fTBJlpmCHgCFn0JN0Cu3SoJHOjhGHX3GquW2+5HTG7JUs
 WlHw==
X-Gm-Message-State: APjAAAUnXQz2njczrvcnBPOFRoM2AnDys+kLQCx2DNKGktMFjPBURrw0
 nSMI32jwLhhMJ7SbkSnpe5jhe7CtGiHYTGZVbHtk/wWEE34CJlKIRL1Faxoi47B4QZR3WEXIXaH
 RhPRRDpLcr1EWFzQ33wl7CECy1ug=
X-Received: by 2002:aca:afd8:: with SMTP id y207mr2587374oie.96.1581423517313; 
 Tue, 11 Feb 2020 04:18:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzl80E1jHxjx1Tf2d1x/LVZfhmPxA51wrtTw+0gP75sDXcviAjtmBKGTBaREbEcW84Wi2LsaIURRkpRJf9Y/j4=
X-Received: by 2002:aca:afd8:: with SMTP id y207mr2587366oie.96.1581423517040; 
 Tue, 11 Feb 2020 04:18:37 -0800 (PST)
MIME-Version: 1.0
References: <87e6761eb699c7912e2064dea222f5ac7fd04a6b.1581338640.git.jstancek@redhat.com>
 <CAEemH2f90MPBV_w2+gw331cg0Fiu-=aqgp3M1BHhBCXcFUbyyg@mail.gmail.com>
 <1734212650.7000036.1581418326024.JavaMail.zimbra@redhat.com>
 <CAEemH2cJhxWcMj3k1ayasQegL-aPgjkkdypk881dXmjeV=MQmA@mail.gmail.com>
 <333995219.7015340.1581423014012.JavaMail.zimbra@redhat.com>
In-Reply-To: <333995219.7015340.1581423014012.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 11 Feb 2020 20:18:25 +0800
Message-ID: <CAEemH2e-w=-wp6tpG2+nz1wy35XBP5eDpdXNMV_FN-hWLc8iBA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: PWxx002SNzeBIv1qPC0b6w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setrlimit06: lower RLIMIT_CPU parameters
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
Content-Type: multipart/mixed; boundary="===============1532218822=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1532218822==
Content-Type: multipart/alternative; boundary="000000000000f924ed059e4bda7e"

--000000000000f924ed059e4bda7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 8:10 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > On Tue, Feb 11, 2020 at 6:52 PM Jan Stancek <jstancek@redhat.com> wrote=
:
> >
> > >
> > >
> > > ----- Original Message -----
> > > > On Mon, Feb 10, 2020 at 8:47 PM Jan Stancek <jstancek@redhat.com>
> wrote:
> > > >
> > > > > Lower the parameters so that test completes faster where possible=
.
> > > > >
> > > > > This also increases alarm timer slightly, which in combination wi=
th
> > > > > lower RLIMIT_CPU aims to avoid false positives in environments wi=
th
> > > > > high steal time, where it can take multiple of wall clock seconds
> > > > > to spend single second on a cpu.
> > > > >
> > > >
> > > > This patch could reduce the test failure possibility, but I'm afrai=
d
> it
> > > > can't fix the problem radically, because with `stress -c 20' to
> overload
> > > an
> > > > s390x system(2cpus) in the background then setrlimit06(patched) sti=
ll
> > > > easily gets failed:
> > > >     setrlimit06.c:98: FAIL: Got only SIGXCPU after reaching both
> limit
> > > >
> > > > Another way I can think of is to raise the priority before its
> running,
> > > not
> > > > sure if that will disturb the original test but from my test, it
> always
> > > > gets a pass even with too much overload.
> > >
> > > Is this in addition to my patch? Because on its own I don't see how
> this
> > > will help when load is coming from different guests.
> > >
> >
> > Yes, this is only solving for itself loads. Besides the high steal time=
,
> > that's another reason I guess it causes the same failure, so do you thi=
nk
> > it makes sense to merge two methods together?
>
> For now I'd go with just original patch. Until there is parallel test
> execution,
> there shouldn't be any local load during this test.
>

Ok sure. Let's apply the original first, then keep watching the status in
the next testing.

--=20
Regards,
Li Wang

--000000000000f924ed059e4bda7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Feb 11, 2020 at 8:10 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; On Tue, Feb 11, 2020 at 6:52 PM Jan Stancek &lt;<a href=3D"mailto:jsta=
ncek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; ----- Original Message -----<br>
&gt; &gt; &gt; On Mon, Feb 10, 2020 at 8:47 PM Jan Stancek &lt;<a href=3D"m=
ailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wr=
ote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Lower the parameters so that test completes faster wher=
e possible.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This also increases alarm timer slightly, which in comb=
ination with<br>
&gt; &gt; &gt; &gt; lower RLIMIT_CPU aims to avoid false positives in envir=
onments with<br>
&gt; &gt; &gt; &gt; high steal time, where it can take multiple of wall clo=
ck seconds<br>
&gt; &gt; &gt; &gt; to spend single second on a cpu.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This patch could reduce the test failure possibility, but I&=
#39;m afraid it<br>
&gt; &gt; &gt; can&#39;t fix the problem radically, because with `stress -c=
 20&#39; to overload<br>
&gt; &gt; an<br>
&gt; &gt; &gt; s390x system(2cpus) in the background then setrlimit06(patch=
ed) still<br>
&gt; &gt; &gt; easily gets failed:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0setrlimit06.c:98: FAIL: Got only SIGXCPU =
after reaching both limit<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Another way I can think of is to raise the priority before i=
ts running,<br>
&gt; &gt; not<br>
&gt; &gt; &gt; sure if that will disturb the original test but from my test=
, it always<br>
&gt; &gt; &gt; gets a pass even with too much overload.<br>
&gt; &gt;<br>
&gt; &gt; Is this in addition to my patch? Because on its own I don&#39;t s=
ee how this<br>
&gt; &gt; will help when load is coming from different guests.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Yes, this is only solving for itself loads. Besides the high steal tim=
e,<br>
&gt; that&#39;s another reason I guess it causes the same failure, so do yo=
u think<br>
&gt; it makes sense to merge two methods together?<br>
<br>
For now I&#39;d go with just original patch. Until there is parallel test e=
xecution,<br>
there shouldn&#39;t be any local load during this test.<br></blockquote><di=
v><br></div><div class=3D"gmail_default" style=3D"font-size:small">Ok sure.=
 Let&#39;s apply the original first, then keep watching the status in the n=
ext testing.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div=
></div></div></div>

--000000000000f924ed059e4bda7e--


--===============1532218822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1532218822==--

