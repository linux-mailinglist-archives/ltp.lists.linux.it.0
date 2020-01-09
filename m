Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FAC135401
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 09:03:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 595803C23FC
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 09:03:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5137D3C23AF
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 09:03:18 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 82147601023
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 09:03:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578556995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ekIHj5pExhqea90k82jJSGlYc4Q1u/YiOGwcm5Rm3Qo=;
 b=iH0vBt0BTbZFSZRQ9CrOeUfoSNIdnSh3vFiaeSKLo3/qcZIriXXepvq8tZ3bWh0Ov+zRyf
 a0LYZEQk4PKmY+mG+1LyJzjniHr0dvA1nSNhYJ9JDB5EmKMU77IF5JkCutdUogZqZgD5q8
 g/SyfsEkH1u6GWrT3NIhXXa6tjWjeQE=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-xXpvWExSM7uUthGBS80oiQ-1; Thu, 09 Jan 2020 03:03:09 -0500
Received: by mail-ot1-f72.google.com with SMTP id t10so3269424otc.9
 for <ltp@lists.linux.it>; Thu, 09 Jan 2020 00:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fmtCu2tOSugQauf/dDcBD0Orp9QaDFp+grWMYRTGSQ0=;
 b=VA/wCUQAsZk7OTUVzdXvthPaWdrJCIfY+pxil935+fLyQ8eVar7QZbE/lV6OeCVme4
 nesCohPyxLlpHrtBRopaggk6URREMm4v64F89bMn0zIhIIqEwQyd8XfIOG7djBLuS2xy
 bPN0Kqd6ujm0g7QnXPpYzWbpcNojOA7quo3X1KCKRCFkgsT22J6yQTg9CUEbFqUlajhz
 rMtggSbAu6s4qPQdo854+8pif9pTWKT6usf397uD6Eh0tljuzk2r8WsqcAw8COnRseet
 7Y5mXJcIfiZcVXhgG5mM/cg/oYGImRuDyArfzdh38hDjJfEMURVmU5d27xtlvoYKoFkz
 uK4w==
X-Gm-Message-State: APjAAAWK4eb1gj2Z5nQWb5EKrD7SYAAun1E/pOQIPQMlk5IHDONeO0X8
 Cok/N0ALTSmuHDH24cE/gcwNQpTSb0NuDJFhfi0k0D68oysXpoy42ZhWpPmyk61DJJqscqFdamJ
 4Ax7MHbLqAfBSjfp25CGTGQ3ITQc=
X-Received: by 2002:a05:6830:3003:: with SMTP id
 a3mr7448516otn.118.1578556988304; 
 Thu, 09 Jan 2020 00:03:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqwaqlcdpBTOmVdI60UkiOgk8/09afBtAf1cJFtELiYmRMRXgcT1y7RstTNyP5S3ByaFYxctzjv4TH7C5rWPsfI=
X-Received: by 2002:a05:6830:3003:: with SMTP id
 a3mr7448504otn.118.1578556988075; 
 Thu, 09 Jan 2020 00:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20200109071510.11223-1-liwang@redhat.com>
 <20200109074537.GA12486@dell5510>
In-Reply-To: <20200109074537.GA12486@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Thu, 9 Jan 2020 16:02:57 +0800
Message-ID: <CAEemH2dEfE5A8Dipu671TgzU0MxHF9hTRVeTNgMsi-igPbrDMA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: xXpvWExSM7uUthGBS80oiQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: use raw syscall in the tst_device.h
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
Content-Type: multipart/mixed; boundary="===============1160056748=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1160056748==
Content-Type: multipart/alternative; boundary="000000000000884a82059bb07028"

--000000000000884a82059bb07028
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Thu, Jan 9, 2020 at 3:45 PM Petr Vorel <pvorel@suse.cz> wrote:

> ...
> > Cc: Petr Vorel <pvorel@suse.cz>
> BTW I wonder if my sieve filter is bad, because I didn't get this mail or
> git
> send-email didn't sent it.
>

I guess that might because of your email filter configuration, the
Cc'ed name will be kicked out if he/she has subscribed to the mailing list,
especially for my Gmail-client always do that.

This is git-send-email log FYI:
----------------------------
$ git send-email 0001-tst_device-use-raw-syscall-in-the-tst_device.h.patch
--to ltp@lists.linux.it
0001-tst_device-use-raw-syscall-in-the-tst_device.h.patch
(body) Adding cc: Petr Vorel <pvorel@suse.cz> from line 'Cc: Petr Vorel <
pvorel@suse.cz>'
(body) Adding cc: Cyril Hrubis <chrubis@suse.cz> from line 'Cc: Cyril
Hrubis <chrubis@suse.cz>'
OK. Log says:
Server: smtp.corp.redhat.com
MAIL FROM:<liwang@redhat.com>
RCPT TO:<ltp@lists.linux.it>
RCPT TO:<pvorel@suse.cz>
RCPT TO:<chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Cc: Petr Vorel <pvorel@suse.cz>,
Cyril Hrubis <chrubis@suse.cz>
Subject: [PATCH] tst_device: use raw syscall in the tst_device.h
Date: Thu,  9 Jan 2020 15:15:10 +0800
Message-Id: <20200109071510.11223-1-liwang@redhat.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Result: 250


> > Cc: Cyril Hrubis <chrubis@suse.cz>
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Nice, thanks for a fix. + Note about _XOPEN_SOURCE below.
>

Thanks for the quick reply.


>
> Tested-by: Petr Vorel <pvorel@suse.cz>
> https://travis-ci.org/pevik/ltp/builds/634613112
> NOTE: it works, failures to Debian testing are caused by bug in libtirpc
> 1.2.5,
> fixed in a86b4ff Add authdes_seccreate() stub [1].
>
> ...

> +#define _GNU_SOURCE
> >  #define _XOPEN_SOURCE 600
> If we define _GNU_SOURCE we probably don't need _XOPEN_SOURCE 600, do we?
>

Ah, right. I will remove it in patch merging.

--=20
Regards,
Li Wang

--000000000000884a82059bb07028
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jan 9, 2020 at 3:45 PM Petr Vorel &lt=
;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; Cc: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank"=
>pvorel@suse.cz</a>&gt;<br>
BTW I wonder if my sieve filter is bad, because I didn&#39;t get this mail =
or git<br>
send-email didn&#39;t sent it.<br></blockquote><div><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">I guess that might because of you=
r email filter configuration, the Cc&#39;ed=C2=A0name will be kicked=C2=A0o=
ut if he/she has subscribed=C2=A0to the mailing list, especially for my Gma=
il-client always do that.</div><div><br></div><div><div class=3D"gmail_defa=
ult">This is git-send-email log FYI:</div></div><div><div class=3D"gmail_de=
fault">----------------------------</div></div><div><div class=3D"gmail_def=
ault">$ git send-email 0001-tst_device-use-raw-syscall-in-the-tst_device.h.=
patch --to <a href=3D"mailto:ltp@lists.linux.it" target=3D"_blank">ltp@list=
s.linux.it</a></div>0001-tst_device-use-raw-syscall-in-the-tst_device.h.pat=
ch<br>(body) Adding cc: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" ta=
rget=3D"_blank">pvorel@suse.cz</a>&gt; from line &#39;Cc: Petr Vorel &lt;<a=
 href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt;&#3=
9;<br>(body) Adding cc: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz"=
 target=3D"_blank">chrubis@suse.cz</a>&gt; from line &#39;Cc: Cyril Hrubis =
&lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a=
>&gt;&#39;<br>OK. Log says:<br>Server: <a href=3D"http://smtp.corp.redhat.c=
om" target=3D"_blank">smtp.corp.redhat.com</a><br>MAIL FROM:&lt;<a href=3D"=
mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt;<br>RC=
PT TO:&lt;<a href=3D"mailto:ltp@lists.linux.it" target=3D"_blank">ltp@lists=
.linux.it</a>&gt;<br>RCPT TO:&lt;<a href=3D"mailto:pvorel@suse.cz" target=
=3D"_blank">pvorel@suse.cz</a>&gt;<br>RCPT TO:&lt;<a href=3D"mailto:chrubis=
@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt;<br>From: Li Wang &lt;<a=
 href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&=
gt;<br>To: <a href=3D"mailto:ltp@lists.linux.it" target=3D"_blank">ltp@list=
s.linux.it</a><br>Cc: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" targ=
et=3D"_blank">pvorel@suse.cz</a>&gt;,<br>=09Cyril Hrubis &lt;<a href=3D"mai=
lto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt;<br>Subject: =
[PATCH] tst_device: use raw syscall in the tst_device.h<br>Date: Thu, =C2=
=A09 Jan 2020 15:15:10 +0800<br>Message-Id: &lt;<a href=3D"mailto:202001090=
71510.11223-1-liwang@redhat.com" target=3D"_blank">20200109071510.11223-1-l=
iwang@redhat.com</a>&gt;<br>X-Mailer: git-send-email 2.20.1<br>MIME-Version=
: 1.0<br>Content-Transfer-Encoding: 8bit<br><br></div><div class=3D"gmail_d=
efault" style=3D"font-size:small">Result: 250</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
&gt; Cc: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_bla=
nk">chrubis@suse.cz</a>&gt;<br>
<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br>
Nice, thanks for a fix. + Note about _XOPEN_SOURCE below.<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">T=
hanks for the quick reply.</div></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
Tested-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blan=
k">pvorel@suse.cz</a>&gt;<br>
<a href=3D"https://travis-ci.org/pevik/ltp/builds/634613112" rel=3D"norefer=
rer" target=3D"_blank">https://travis-ci.org/pevik/ltp/builds/634613112</a>=
<br>
NOTE: it works, failures to Debian testing are caused by bug in libtirpc 1.=
2.5,<br>
fixed in a86b4ff Add authdes_seccreate() stub [1].<br>
<br>
...=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +#define _GNU_SOURCE<br>
&gt;=C2=A0 #define _XOPEN_SOURCE 600<br>
If we define _GNU_SOURCE we probably don&#39;t need _XOPEN_SOURCE 600, do w=
e?<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Ah, right. I will remove it in patch merging.</div></d=
iv><div><br></div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regar=
ds,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000884a82059bb07028--


--===============1160056748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1160056748==--

