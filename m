Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD1D275A5B
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 16:40:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 398AC3C5A06
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 16:40:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 35AFC3C29D5
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 16:40:19 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4158C1401168
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 16:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600872016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HDxdVAMewoJjY02sfLZnx6eVvs5p95OJa7c+tKmdy9w=;
 b=Tx/6J+RI9qg/hb4eP/NWn4IDjfIVjYr/OsqV46KVTK2+xPHccxnlmZPHobyV48kcdBrXWe
 tMiSZp2av1wXpn2+XHFD3BMXKuTyui1Q5BOQ9CCzGGmrJthHODhcU6F2psngMtODT9sT+D
 B+Vkmo43tI4mx0X0b/lGo5Gwr6MFWIw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-Szv1d0hjNcWn3-KQsnBLtQ-1; Wed, 23 Sep 2020 10:40:14 -0400
X-MC-Unique: Szv1d0hjNcWn3-KQsnBLtQ-1
Received: by mail-yb1-f198.google.com with SMTP id k3so19265330ybk.16
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 07:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HDxdVAMewoJjY02sfLZnx6eVvs5p95OJa7c+tKmdy9w=;
 b=U6cL4ASUNKYTcTwWKg1Ev9srf1YCBE4WAeHdV0vrXGHc0QX+Zq0CsFc6oD71WasWWG
 kV9kpjPCLk5hDPMX0lLJpBom/69/jEtE4cecjgEfMqcjIWCxIgvryLyKoKiX2pO+hXex
 uiG7SIaZyWvJm4RDDdd4e6kUAmCyMMrNZOXCFm7o162E1JE9b9AWK0w4sCMgUEUChftG
 vdoDjtnF8TdSGUAMdBJ7TT4YNurnDQIUQaWsMwkpMKJbHUKYB6ghzKYT6eG5BABR6qys
 o+xyfvI58Vpouz4HmslYJhjpb4k4Fl5ete33j+rBEBQFcsPwpXzY6vR2ln0DTUJAMmV4
 TTDQ==
X-Gm-Message-State: AOAM531uCrp8REbnBeRjYRVBgrJ6U0QCF3FyjPVZBjFvrLl4P0EBDdV+
 aRjcaVunItXf6Ir9k3QVUfFPIfZg1qBJh7dhgGL24ji7memdCUWMt16ll59EvV2DxfnLRrZaGXI
 OHcml8QSLidcUjWWxkaTrJ5SbXW0=
X-Received: by 2002:a25:69cb:: with SMTP id e194mr421101ybc.243.1600872013976; 
 Wed, 23 Sep 2020 07:40:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjajIiaNjcmWokBkCVAOJI4/ATUosNpILOawUdiWW4T5aA1ZfkX37g2a4boupq4a197dfwjEuIMhvoiu3InQA=
X-Received: by 2002:a25:69cb:: with SMTP id e194mr421075ybc.243.1600872013708; 
 Wed, 23 Sep 2020 07:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200609095102.21153-1-liwang@redhat.com> <87pn6cycui.fsf@suse.de>
 <CAEemH2eqPgS=2n5NAgiVgE6Q+mie0=hiu-wn1OCrxPNEHnd1BA@mail.gmail.com>
 <87mu1gy6r8.fsf@suse.de>
In-Reply-To: <87mu1gy6r8.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 23 Sep 2020 22:40:01 +0800
Message-ID: <CAEemH2eCEyebEBZhuQJ+FHs9UpWw_+A=D0vJbx6g8KixPTH4jA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
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
Subject: Re: [LTP] [PATCH v4 1/4] lib: add new cgroup test API
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
Cc: chrubis@suze.cz, pvorel@suze.cz, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1683586234=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1683586234==
Content-Type: multipart/alternative; boundary="000000000000b556cc05affc0f7f"

--000000000000b556cc05affc0f7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 9:14 PM Richard Palethorpe <rpalethorpe@suse.de>
wrote:

> ...
> > That's on purpose because we don't want the user to mix v1 and v2 in
> using.
> > In other words, if a version of cgroup has been chosen on a SUT then LT=
P
> > follows in the same version.
> >
> > The cgroup lib choose cgroup version likes:
> >       * system doesn't support any cgroup(v1, v2): TCONF
> >       * system only support cgroup v1: choose v1
> >       * system only support cgroup v2: choose v2
> >       * system support v1 & v2 but mounting v1: chosse v1   <=3D=3D=3D =
this is
> > what you met
>
> Perhaps you meant:
>
> if (tst_is_mounted("cgroup"))
>    cg_ver =3D TST_CGROUP_V1;
> else
>    cg_ver =3D TST_CGROUP_V2;
>

This is not enough for the version choice. As tst_is_mounted(=E2=80=9Ccgrou=
p=E2=80=9D) can't
distinguish precisely what "cgroup" or "cgroup2" has been mounted. Because
the function is fuzzy matching a string.



> >
> > To be honest, I hope a Linux distribution provides a pure way in cgroup
> > using, which means just mounting V1 or V2 but not to mix together. Or, =
do
> > you think LTP should handle the situation for the v1&v2 mixing mount?
>
> For now, I think we just need to use V1 if it is mounted. I don't like
> the fact we have both mounted, but it seems most software can handle it,
> so LTP should as well.
>

Agreed.

--=20
Regards,
Li Wang

--000000000000b556cc05affc0f7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 23, 2020 at 9:14 PM Richard Palethorpe =
&lt;<a href=3D"mailto:rpalethorpe@suse.de" target=3D"_blank">rpalethorpe@su=
se.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; That&#39;s on purpose because we don&#39;t want the user to mix v1 and=
 v2 in using.<br>
&gt; In other words, if a version of cgroup has been chosen on a SUT then L=
TP<br>
&gt; follows in the same version.<br>
&gt;<br>
&gt; The cgroup lib choose cgroup version likes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* system doesn&#39;t support any cgroup(v1, =
v2): TCONF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* system only support cgroup v1: choose v1<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* system only support cgroup v2: choose v2<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* system support v1 &amp; v2 but mounting v1=
: chosse v1=C2=A0 =C2=A0&lt;=3D=3D=3D this is<br>
&gt; what you met<br>
<br>
Perhaps you meant:<br>
<br>
if (tst_is_mounted(&quot;cgroup&quot;))<br>
=C2=A0 =C2=A0cg_ver =3D TST_CGROUP_V1;<br>
else<br>
=C2=A0 =C2=A0cg_ver =3D TST_CGROUP_V2;<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">This is not enough f=
or the version choice. As tst_is_mounted(=E2=80=9Ccgroup=E2=80=9D) can&#39;=
t</div><div class=3D"gmail_default" style=3D"font-size:small">distinguish p=
recisely what &quot;cgroup&quot; or &quot;cgroup2&quot; has been mounted. B=
ecause</div><div class=3D"gmail_default" style=3D"font-size:small">the func=
tion is=C2=A0fuzzy matching a string.</div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; To be honest, I hope a Linux distribution provides a pure way in cgrou=
p<br>
&gt; using, which means just mounting V1 or V2 but not to mix together. Or,=
 do<br>
&gt; you think LTP should handle the situation for the v1&amp;v2 mixing mou=
nt?<br>
<br>
For now, I think we just need to use V1 if it is mounted. I don&#39;t like<=
br>
the fact we have both mounted, but it seems most software can handle it,<br=
>
so LTP should as well.<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">Agreed.</div></div></div><div><br></=
div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--000000000000b556cc05affc0f7f--


--===============1683586234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1683586234==--

