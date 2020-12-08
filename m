Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A012D210B
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 03:44:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AC763C53F0
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 03:44:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B11E43C24FD
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 03:44:35 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 5F102600852
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 03:44:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607395472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pHk0zfKkFm1TDnmf209FWnrht2DwsSAGHcviurJmm0A=;
 b=QAc+aMj+jzejpc4nJruHS+nUeppr+OtiaMdZBh4U1wMEZbviSKKzDe5d1AchhsZ/l0Oofk
 CSg40luh8K5GirXqNi8XxiVpFGil61epwatSP1J+hIWmyFhSmi3gNlx4V7a+bO82JKKUWw
 TgwzP/KoPn6cQDknyG0IoV1QHMuMy/Q=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-Ce_HWZ6VNia1OkHZOqc9Uw-1; Mon, 07 Dec 2020 21:44:30 -0500
X-MC-Unique: Ce_HWZ6VNia1OkHZOqc9Uw-1
Received: by mail-yb1-f197.google.com with SMTP id j1so8699086ybj.11
 for <ltp@lists.linux.it>; Mon, 07 Dec 2020 18:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pHk0zfKkFm1TDnmf209FWnrht2DwsSAGHcviurJmm0A=;
 b=evATgOG8DkkzzIX0rK7IaiMlty4I5di68MZ4AzQGrn2edUMjyCl9dtGNjZf9X31opY
 rMX1G4h8XeundCFF0V/897B4UUpYrgm+Se39BFgZAsQjWIO25z2piPGXJoRueuo1x5AQ
 7f30Vg4V9PS/S9I4WMDKXtR6NDq7W/FdlsloCjFmMo+CnIiE11+hQ9Wnipxy0kft5ag8
 cxmHhIKTryEl/YD1b/bz8NEz/2K+oIpLK23LQkf5uUP59cCyFSPl7UjAtPlIwEMWB8SN
 IK3fJzY+ToSGAkKMQzv+sfGXTMTUi2Dn/hh9RtmX+uMJtRIRMIlYWxcQug2ZTKkdr3qc
 AHjw==
X-Gm-Message-State: AOAM531v3DHXeaTmg0Po74AosB3VQGnSWbYZfh9QWpt6+fyn0JHMfXCi
 yqeeY0jiBH8HUwNykXSNha3JP+O2W9Q6JGWgfhPV85YX7cvkddqAl6NkHdo3WNhQG0qZxZzbVZj
 Qw4wDQgamTCjoU7uHFukbCih6A7E=
X-Received: by 2002:a25:4444:: with SMTP id r65mr27663726yba.86.1607395469947; 
 Mon, 07 Dec 2020 18:44:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzz1rboB1/DFD1JxpsFgGn1z+gn21zQSP1ysDjIf6Xkvho0nAgSHgi/FgmYjJ00zzkhSdl0aff7ckwT6m59bkQ=
X-Received: by 2002:a25:4444:: with SMTP id r65mr27663706yba.86.1607395469727; 
 Mon, 07 Dec 2020 18:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20201207145639.8424-1-pvorel@suse.cz>
In-Reply-To: <20201207145639.8424-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 8 Dec 2020 10:44:18 +0800
Message-ID: <CAEemH2eWAvsyveMm6kaJ=UwMcuPSWZif8yDXr4zBpc-V5MpOGg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] doc: Document .min_cpus
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
Content-Type: multipart/mixed; boundary="===============1450723137=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1450723137==
Content-Type: multipart/alternative; boundary="000000000000fcb46f05b5eaebd2"

--000000000000fcb46f05b5eaebd2
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

I didn't write down this since I thought it's easy to understand the
.min_cpus.
(sounds like an excuse to mask my lazy :)
But it's nice to have, thanks for writing this!

Just a minor comment below.

On Mon, Dec 7, 2020 at 10:56 PM Petr Vorel <pvorel@suse.cz> wrote:

> Recently added (in fa32a727d).
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>
Acked-by: Li Wang <liwang@redhat.com>


> ---
> Feel free to document it more.
>
> Kind regards,
> Petr
>
>  doc/test-writing-guidelines.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/doc/test-writing-guidelines.txt
> b/doc/test-writing-guidelines.txt
> index 3c2ab7166..dcb5d9d43 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -2134,8 +2134,14 @@ struct tst_test test = {
>         .test_all = run,
>         ...
>  };
> -
>
>  -------------------------------------------------------------------------------
> +
> +2.2.37 Require minimum numbers of CPU for a testcase
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Some tests require more than single CPU. It can be defined with
>

single --> specific number of



> +`.min_cpus = N`.
> +
>  2.3 Writing a testcase in shell
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> --
> 2.29.2
>
>

-- 
Regards,
Li Wang

--000000000000fcb46f05b5eaebd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I =
didn&#39;t write down this since I thought it&#39;s easy to understand the =
.min_cpus.</div><div class=3D"gmail_default" style=3D"font-size:small">(sou=
nds like an excuse to mask my lazy :)</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">But it&#39;s nice to have, thanks for writing this!<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Just a minor comment belo=
w.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Mon, Dec 7, 2020 at 10:56 PM Petr Vorel &lt;<a href=3D"mailto:pv=
orel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Recently added (in fa32a727d).<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br></blockquote><div><span class=3D"gmail_def=
ault" style=3D"font-size:small">Acked-by: Li Wang &lt;<a href=3D"mailto:liw=
ang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><span class=3D"g=
mail_default" style=3D"font-size:small"></span>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
---<br>
Feel free to document it more.<br>
<br>
Kind regards,<br>
Petr<br>
<br>
=C2=A0doc/test-writing-guidelines.txt | 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.=
txt<br>
index 3c2ab7166..dcb5d9d43 100644<br>
--- a/doc/test-writing-guidelines.txt<br>
+++ b/doc/test-writing-guidelines.txt<br>
@@ -2134,8 +2134,14 @@ struct tst_test test =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .test_all =3D run,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0};<br>
-<br>
=C2=A0---------------------------------------------------------------------=
----------<br>
+<br>
+2.2.37 Require minimum numbers of CPU for a testcase<br>
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
+Some tests require more than single CPU. It can be defined with<br></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">single --&gt; specific number of</div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+`.min_cpus =3D N`.<br>
+<br>
=C2=A02.3 Writing a testcase in shell<br>
=C2=A0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000fcb46f05b5eaebd2--


--===============1450723137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1450723137==--

