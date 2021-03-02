Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CD32A173
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 14:50:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D3DC3C56DD
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 14:50:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D723F3C4D28
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 14:50:26 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 41104603E44
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 14:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614693023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0X/HShI5SQCJ7CrNYsmrdqOG4wKl8u4Ct9L9pAwUTYk=;
 b=LdAkAVmEadBchwiIIiGbHgsGkHxMFoBNgAaJqmm6g9vbDJQxf1Z9g09zMGTTzyTiaWsE/J
 Ajb2dIo9PCZALZLVgvxTUYjd6YKrpM1kww6f0dudRLbXYp0ide8XLY948qhYFWLFDsaN6M
 ax7omLvpvrYmHEyiwiENXwy2FaBEW3o=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-TPKS1vaXN7C_pjpjSqWNPQ-1; Tue, 02 Mar 2021 08:50:21 -0500
X-MC-Unique: TPKS1vaXN7C_pjpjSqWNPQ-1
Received: by mail-yb1-f200.google.com with SMTP id s187so22694099ybs.22
 for <ltp@lists.linux.it>; Tue, 02 Mar 2021 05:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0X/HShI5SQCJ7CrNYsmrdqOG4wKl8u4Ct9L9pAwUTYk=;
 b=Tx+s+V+NRX4Tu1vrBjvWlWrwBTkCtEj8mvg06Vd3iKpgtbbQOXW4qKQ+JRgvw8/HSl
 gWhu4BOsH9yOfA1OmhQNNWX1NTCHs9JRHUWzSs4KpLfEf3/B3wkGKH472Jo91jdof9va
 kkpsZq9grD0BW7COdOKjxYvimCX/Woa2kLBp48wnbFN1gF6MCExNPsSIUkqtRNqMPQtD
 n5xx+XIfnqRLbgP/aNzQFEubhG2TbvoAq+vXZN/4W8hdAnXMT0SLhSa7grhf0qx6T64x
 1WQl6mGHAcw7JRwY1RPJn9oYUVAKseCxgSt2urY/X9Z2ECRH0Qgqihq2fqzA3DlfSc9x
 ZdGw==
X-Gm-Message-State: AOAM532r2+eFYTZWIj0Q6Nwnh+NWCZZzKVZpqmQPe9qeePouOuYJHw/Y
 nlZ10Y3Vt/dj4tDjPnmhm57DaAvg6nS68wOUbfjIrVd4/7shmTfyK3UaVffFCUAQdw10/g2ie0M
 lMyepjRgdp5vnuY9eINC9Y2w8ixw=
X-Received: by 2002:a25:af05:: with SMTP id a5mr31661897ybh.86.1614693020760; 
 Tue, 02 Mar 2021 05:50:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsJeE2dMFqG//8Hx9Pt8U1PPgc39o7bHa6U8E8Wuk8n2GpAAu2iZzWQafPHwVoeHZD//eY2MjGhNlXGz6HEwQ=
X-Received: by 2002:a25:af05:: with SMTP id a5mr31661869ybh.86.1614693020544; 
 Tue, 02 Mar 2021 05:50:20 -0800 (PST)
MIME-Version: 1.0
References: <20210301220222.22705-1-pvorel@suse.cz>
 <20210301220222.22705-6-pvorel@suse.cz>
 <CAEemH2cr0TFvFiis_05Fh4bEe1ZUmFtMO5ysYFped5ZQYucvAg@mail.gmail.com>
 <YD4Ny76lh0+ydBqQ@yuki.lan> <YD4SwkQYyBxMWaay@pevik>
In-Reply-To: <YD4SwkQYyBxMWaay@pevik>
From: Li Wang <liwang@redhat.com>
Date: Tue, 2 Mar 2021 21:50:09 +0800
Message-ID: <CAEemH2dFEWxRbucAs1q2ea8RZi9RaYOWRKv10Ja-4-yybEYHeg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH 5/7] tst_test.sh: Introduce
 tst_set_timeout(timeout)
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1166918799=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1166918799==
Content-Type: multipart/alternative; boundary="000000000000e944ad05bc8e03b6"

--000000000000e944ad05bc8e03b6
Content-Type: text/plain; charset="UTF-8"

Hi Petr, Cyril,

On Tue, Mar 2, 2021 at 6:26 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Cyril,
>
> > Hi!
> > > > +tst_set_timeout()
> > > > +{
> > > > +       TST_TIMEOUT="$1"
>
>
> > > Not sure if we should check "$1" is valid again before using it.
>
> > > I guess in most scenarios, the function is invoked by tests, so
> > > just needs to guarantee $1 > $TST_TIMEOUT, otherwise, it
> > > looks meaningless to reset TST_TIMEOUT?
> > > (especially to avoid people set a smaller value by a typo)
>
> > I can image where it may make sense to set the timeout smaller than
> > default dynamically. If we had a test that consists of many iterations
> > whose number depends on the actuall system we run on (the same as the
> > supported filesystem) but if the iterations are rather quick we may end
> > up in a situation where we run only one iteration and we will attempt to
> > set a timeout smaller than default in the setup() which wouldn't be
> > wrong.
> +1, I couldn't agree more.
>

Sounds reasonable. Thanks for the explanation on this.

>
> > Hence I would check that the value is greater than zero here instead.
> I'd allow also to disable timeout with -1. And the rest of the checks
> (i.e. int -1 or > 0) is in _tst_setup_timer().
>

Allow setting -1 is good to me.

-- 
Regards,
Li Wang

--000000000000e944ad05bc8e03b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr, Cyril,</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 6:26 PM Petr Vore=
l &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi =
Cyril,<br>
<br>
&gt; Hi!<br>
&gt; &gt; &gt; +tst_set_timeout()<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_TIMEOUT=3D&quot;$1&quot;<br>
<br>
<br>
&gt; &gt; Not sure if we should check &quot;$1&quot; is valid again before =
using it.<br>
<br>
&gt; &gt; I guess in most scenarios, the function is invoked by tests, so<b=
r>
&gt; &gt; just needs to guarantee $1 &gt; $TST_TIMEOUT, otherwise, it<br>
&gt; &gt; looks meaningless to reset TST_TIMEOUT?<br>
&gt; &gt; (especially to avoid people set a smaller value by a typo)<br>
<br>
&gt; I can image where it may make sense to set the timeout smaller than<br=
>
&gt; default dynamically. If we had a test that consists of many iterations=
<br>
&gt; whose number depends on the actuall system we run on (the same as the<=
br>
&gt; supported filesystem) but if the iterations are rather quick we may en=
d<br>
&gt; up in a situation where we run only one iteration and we will attempt =
to<br>
&gt; set a timeout smaller than default in the setup() which wouldn&#39;t b=
e<br>
&gt; wrong.<br>
+1, I couldn&#39;t agree more.<br></blockquote><div><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Sounds reasonable. Thanks for the=
 explanation on this.</div><div class=3D"gmail_default" style=3D"font-size:=
small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Hence I would check that the value is greater than zero here instead.<=
br>
I&#39;d allow also to disable timeout with -1. And the rest of the checks<b=
r>
(i.e. int -1 or &gt; 0) is in _tst_setup_timer().<br></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">Allow set=
ting -1 is good to me.</div></div></div><div><br></div>-- <br><div dir=3D"l=
tr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--000000000000e944ad05bc8e03b6--


--===============1166918799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1166918799==--

