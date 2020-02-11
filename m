Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A5063158DC8
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 12:53:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 693583C2387
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 12:53:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 39C333C224B
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 12:53:45 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 080CD1401A09
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 12:53:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581422022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wPp/YMQU8JUTBZVLmA7vEH30zPA+o91DdzXKOwjqyLM=;
 b=VVNQcwhoiSXaxxLVDqAVB5Krb1iuk/Regxl3FbkeKle3gNtyZaFXELKUfEZLSeXvYtbfJm
 z8C1wOMg45hCInN65dm1zeB8flNs+HMRy/1ubryuTyVVY+liHtpEnGGHLPIs2j0PtMRqLG
 NP+mOnfGrTAZ6w+A3XZdjDY0m7sSCYI=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-gJOW3tr6NTWz0oYybyrkHg-1; Tue, 11 Feb 2020 06:53:40 -0500
Received: by mail-oi1-f198.google.com with SMTP id n4so5861112oih.12
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 03:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W4CGMrVD83YKNRzCoFomH9nZHytymcHNcLTpIj/FVHY=;
 b=S4DXaDahvP4LtxdmLTwdToFaPzgOPNOSW6idBuWhyPt/6IcHqpqbN/LJIRjnv5hl+4
 pKXOBBzsx4qPn6ZwQqWXRgjbgfvm1VO5G4mkx3QBmemX70E3/iIQuHkfzjzcWY9h4hzQ
 kNZszNAtwJNWaw37x7WZ1LKjivUi8RTpbefVXYuV+Vb83RqAHEHSeJgxKZYxpfH0D0Xe
 qHon+BJ6RIhRzIc3o8tPaHe5OPS7Tv4YvkP1wuvetWOGvqy867r8bnVg3gjzexr/oSXh
 uFYGZ+de3TJ5f7Vc9VOSKgN9IDEwyUE500oXtaX7vG8bkMMnzs0NbG/hYf6ROheU2Osc
 km4A==
X-Gm-Message-State: APjAAAVEfElxKlgRYqvzWfh1Ho1YI7SPs3c6Z9G1XofU5lkUUtYD8ZzO
 a8Hm8LeLl4UuCzdJ0k9vUtEnQrNUovg8wR7LuJvjpr4zj7t+yBrWkp4uff7OAYzwkBT3zuD89i8
 VjWaIb6wd/88WQ5xDC6RqJP9ZD9Y=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr4753871otl.118.1581422019111; 
 Tue, 11 Feb 2020 03:53:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqyG3namuzGUHLtDAZBxZdlIUi9Nsgd6wDm4g6XiG2aunNQAggOKnIX9DcTpPl4pMwEPbR+M9Zzj3IH2BS0pzv4=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr4753864otl.118.1581422018878; 
 Tue, 11 Feb 2020 03:53:38 -0800 (PST)
MIME-Version: 1.0
References: <87e6761eb699c7912e2064dea222f5ac7fd04a6b.1581338640.git.jstancek@redhat.com>
 <CAEemH2f90MPBV_w2+gw331cg0Fiu-=aqgp3M1BHhBCXcFUbyyg@mail.gmail.com>
 <1734212650.7000036.1581418326024.JavaMail.zimbra@redhat.com>
In-Reply-To: <1734212650.7000036.1581418326024.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 11 Feb 2020 19:53:27 +0800
Message-ID: <CAEemH2cJhxWcMj3k1ayasQegL-aPgjkkdypk881dXmjeV=MQmA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: gJOW3tr6NTWz0oYybyrkHg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1082139014=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1082139014==
Content-Type: multipart/alternative; boundary="000000000000acf73b059e4b8183"

--000000000000acf73b059e4b8183
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 6:52 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > On Mon, Feb 10, 2020 at 8:47 PM Jan Stancek <jstancek@redhat.com> wrote=
:
> >
> > > Lower the parameters so that test completes faster where possible.
> > >
> > > This also increases alarm timer slightly, which in combination with
> > > lower RLIMIT_CPU aims to avoid false positives in environments with
> > > high steal time, where it can take multiple of wall clock seconds
> > > to spend single second on a cpu.
> > >
> >
> > This patch could reduce the test failure possibility, but I'm afraid it
> > can't fix the problem radically, because with `stress -c 20' to overloa=
d
> an
> > s390x system(2cpus) in the background then setrlimit06(patched) still
> > easily gets failed:
> >     setrlimit06.c:98: FAIL: Got only SIGXCPU after reaching both limit
> >
> > Another way I can think of is to raise the priority before its running,
> not
> > sure if that will disturb the original test but from my test, it always
> > gets a pass even with too much overload.
>
> Is this in addition to my patch? Because on its own I don't see how this
> will help when load is coming from different guests.
>

Yes, this is only solving for itself loads. Besides the high steal time,
that's another reason I guess it causes the same failure, so do you think
it makes sense to merge two methods together?

--=20
Regards,
Li Wang

--000000000000acf73b059e4b8183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Feb 11, 2020 at 6:52 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; On Mon, Feb 10, 2020 at 8:47 PM Jan Stancek &lt;<a href=3D"mailto:jsta=
ncek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Lower the parameters so that test completes faster where possible=
.<br>
&gt; &gt;<br>
&gt; &gt; This also increases alarm timer slightly, which in combination wi=
th<br>
&gt; &gt; lower RLIMIT_CPU aims to avoid false positives in environments wi=
th<br>
&gt; &gt; high steal time, where it can take multiple of wall clock seconds=
<br>
&gt; &gt; to spend single second on a cpu.<br>
&gt; &gt;<br>
&gt; <br>
&gt; This patch could reduce the test failure possibility, but I&#39;m afra=
id it<br>
&gt; can&#39;t fix the problem radically, because with `stress -c 20&#39; t=
o overload an<br>
&gt; s390x system(2cpus) in the background then setrlimit06(patched) still<=
br>
&gt; easily gets failed:<br>
&gt;=C2=A0 =C2=A0 =C2=A0setrlimit06.c:98: FAIL: Got only SIGXCPU after reac=
hing both limit<br>
&gt; <br>
&gt; Another way I can think of is to raise the priority before its running=
, not<br>
&gt; sure if that will disturb the original test but from my test, it alway=
s<br>
&gt; gets a pass even with too much overload.<br>
<br>
Is this in addition to my patch? Because on its own I don&#39;t see how thi=
s<br>
will help when load is coming from different guests.<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Yes, t=
his is only solving for itself loads. Besides the high steal time, that&#39=
;s another reason I guess it causes the same failure, so do you think it ma=
kes sense to merge two methods together?</div></div><div>=C2=A0</div></div>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Reg=
ards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000acf73b059e4b8183--


--===============1082139014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1082139014==--

