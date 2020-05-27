Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5391E3B22
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 10:01:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6ED633C3230
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 10:01:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CB3FC3C2466
 for <ltp@lists.linux.it>; Wed, 27 May 2020 10:01:02 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 0E44010014BC
 for <ltp@lists.linux.it>; Wed, 27 May 2020 10:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590566460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sIZ2VJ0+Q0yqEco5J3qprXFr4+4X2l76sBFtow0KSEo=;
 b=Dwk83yhJoOdvJiTKckZSXbbuB5fpLg0xNuUOBGbKCGjesCuYB2G4BdAzX191wBMD0bAm8D
 uBWatm1GVh4rN2/8HTEK21NjlV5tUbZLU6uC2vskJnuw8WfCjj6GE6VpY6iriKVtCAkPrT
 WTjMzT38v1N09tJx27YRDyvSA7E7kVE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-_Sy0hD4fNL-xwp_UPL-PQQ-1; Wed, 27 May 2020 04:00:57 -0400
X-MC-Unique: _Sy0hD4fNL-xwp_UPL-PQQ-1
Received: by mail-lf1-f70.google.com with SMTP id t2so5249260lfq.11
 for <ltp@lists.linux.it>; Wed, 27 May 2020 01:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sIZ2VJ0+Q0yqEco5J3qprXFr4+4X2l76sBFtow0KSEo=;
 b=DwBRGg6YIL43fSy5OdZIK3USyEofvFjFBALGBuDqtvOhiYY9Q+X2fMeOogqz4UJnMz
 IEGNo7VS2HbCnMUrtvT6/q7Rd2V23IMt53UyslWqiDmeFplmTCYpW30R99vpBNThdpKQ
 uEh27yOEAS+V+5RH2tRE1RHxbzHL9F+qZA1KrnpsdMfUN1YNLVvj8TZGMMh/YmlpwfFP
 KXPjRRpdUuKrmoyTbMPSX14jwH46Mj955614N+ilgfRrlroMX6CLsSUzzazXFZaxjVbn
 eXdHXu39xO2HYym1V/V6asfl0uOTIToQbnsV8zx/cGzdzkFeT4b9Zbk82l7yX92VrA8g
 hxTg==
X-Gm-Message-State: AOAM530MZVksIZluIkJf6TDq99xqJt6QoU/8rY/AjusySSCshvTJ64fT
 4gXYEOhdtTiVTvEKKrEkYpRShzs8toDHxPdhWGYQ3OQJ7QQh2V6nELvyTY0EiH/NTWV4SP3P7d+
 3kAfQVyFwJLAdgKU0d/qMU/x5TdM=
X-Received: by 2002:ac2:4641:: with SMTP id s1mr2480614lfo.147.1590566456140; 
 Wed, 27 May 2020 01:00:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsPGzyupsT5ZEKD+FpfwdHd+o7F5nJh2HRm1eGnf1RgyhyMSYRKwYEwVY5cQEf1BhVbUxpuzIaydMsuTLEq+o=
X-Received: by 2002:ac2:4641:: with SMTP id s1mr2480603lfo.147.1590566455892; 
 Wed, 27 May 2020 01:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200527031430.22144-1-liwang@redhat.com>
 <535677442.13762982.1590565251771.JavaMail.zimbra@redhat.com>
In-Reply-To: <535677442.13762982.1590565251771.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 27 May 2020 16:00:41 +0800
Message-ID: <CAEemH2e6Hr7JmdV02P=8SyiVK-q5fHj7=RkF_R8fM+m9b3PrBg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/4] lib: add new cgroup test API
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
Content-Type: multipart/mixed; boundary="===============1298675939=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1298675939==
Content-Type: multipart/alternative; boundary="000000000000987a8705a69c9c6c"

--000000000000987a8705a69c9c6c
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 3:40 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
>
> ----- Original Message -----
> > +
> > +void tst_cgroup_mem_set_maxbytes(long memsz)
> > +{
> > +     tst_cgroup_move_current(TST_CGROUP_MEMCG);
>
> It seems a bit unexpected, that setting a limit also moves current
> process to cgroup. If test forks two processes, it has to set maxbytes
> twice, to get the desired side-effect.
>

Yes, I didn't aware of that before.
Maybe we can remove the tst_cgroup_move_current() from here and invoke it
additionally?

-- 
Regards,
Li Wang

--000000000000987a8705a69c9c6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, May 27, 2020 at 3:40 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
<br>
<br>
----- Original Message -----<br>
&gt; +<br>
&gt; +void tst_cgroup_mem_set_maxbytes(long memsz)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_cgroup_move_current(TST_CGROUP_MEMCG);<br>
<br>
It seems a bit unexpected, that setting a limit also moves current<br>
process to cgroup. If test forks two processes, it has to set maxbytes<br>
twice, to get the desired side-effect.<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">Yes, I didn&#39;t aw=
are of that before.=C2=A0</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Maybe we can remove the tst_cgroup_move_current() from here and =
invoke it additionally?</div></div></div><div><br></div>-- <br><div dir=3D"=
ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></=
div></div>

--000000000000987a8705a69c9c6c--


--===============1298675939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1298675939==--

