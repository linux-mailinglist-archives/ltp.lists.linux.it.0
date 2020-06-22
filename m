Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE62032EF
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 11:08:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 791C93C2BF6
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 11:08:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 438CF3C202D
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 11:08:28 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id A40E36010AF
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 11:07:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592816905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a0VjSZ+TBgDvW/cFQtZlms5Bj00PCqSQtcGrdjkuFxc=;
 b=OsjmGDclism8EjH10/YqJke8pustG9h7UlJAC57KlmIXRLlnGdcoXEcyxlR+gIablCfINt
 OiuZB1IYYpKg2jlGRePAq/YGWC4qujKkHCz6C0Ug3/O8cwRQvq1gV7fT00M+3TSd8vIFwr
 YfZ/M2FqrO3EiJelwrmYwcCJM7NGRpk=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-gX9fY-juPYWCLyXCd-fcaw-1; Mon, 22 Jun 2020 05:08:22 -0400
X-MC-Unique: gX9fY-juPYWCLyXCd-fcaw-1
Received: by mail-lf1-f70.google.com with SMTP id i22so1878692lfj.5
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 02:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0VjSZ+TBgDvW/cFQtZlms5Bj00PCqSQtcGrdjkuFxc=;
 b=DONJoYz/er+TVfSJR4CIyYQT/6OA+iNCUsvEPjW6mFyd8TAd/n4CGCa3KUJ6kCL8YG
 zTbxdGIcg+5528YdCGyatszTViogxTOjpX5bidkNKTXE36OJvYCIbqsSQWUzlFm7/JVV
 i7FMJdYFvrVChDWA09LsN0vF5KkXSqCTI5Q3kZpc3F1fEGbE7xySNOxzTZ+pf8swgWr0
 FHwhbMtKLAXG7/IE2w7uVfo8c8TNLkoSzX8drXBfOJYwZSSpT2ml66uSpFNn4/fG9IdN
 9RjSWe195/8xBY35Jhz+N8WNSPZhNMV16TsGasm4Vvor6J95CY29YYRZXAw3cJNj2C/z
 7qvw==
X-Gm-Message-State: AOAM533UPMq2kXfajKLtOSAcCn2oXbjD25hdNbHRZ+1Hmv0+jfAKTKIo
 yCuPQ7a1ezBzZ4dGvYd1oj2CqvC1yu8OaDxcpyuxruybu/M5+h2dpTqcaUjU6LZ308UxGJqsifa
 B7Ft4mV0pVRXw1wal6rPjZ0GF+/Q=
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr9199017lfa.60.1592816901086; 
 Mon, 22 Jun 2020 02:08:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyilJ8F+7Z01R03W+FdUEH/qI2on0YDZTXcAMdDiWhugrBO2ZQMh+9rtTis6aUAkoobPKtbC8NZYdOAreIh9rI=
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr9198982lfa.60.1592816900086; 
 Mon, 22 Jun 2020 02:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200622074314.22098-1-petr.vorel@suse.com>
In-Reply-To: <20200622074314.22098-1-petr.vorel@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 22 Jun 2020 17:08:08 +0800
Message-ID: <CAEemH2cz9s71E+VidezUAfYGarOzgpPTf0VucY+OYCYmjBjTGQ@mail.gmail.com>
To: Petr Vorel <petr.vorel@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] cgroup: Fix build with -Werror=return-type
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
Content-Type: multipart/mixed; boundary="===============0058855283=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0058855283==
Content-Type: multipart/alternative; boundary="00000000000085b2b305a8a89588"

--00000000000085b2b305a8a89588
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 22, 2020 at 3:43 PM Petr Vorel <petr.vorel@suse.com> wrote:

> From: Petr Vorel <pvorel@suse.cz>
>
> Adding bogus return to keep compiler happy.
>
> Fixes: 3b716981b ("lib: add new cgroup test API")
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> IMHO using pragma would be better, but I don't know how to write it
> portable way.
>
> Kind regards,
> Petr
>
>  lib/tst_cgroup.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index f55d8818d..0118dd7b2 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -49,6 +49,7 @@ enum tst_cgroup_ver tst_cgroup_version(void)
>                 return TST_CGROUP_V1;
>
>         tst_brk(TCONF, "Cgroup is not configured");
> +       return TST_CGROUP_V1; /* fix -Werror=return-type */
>

This return looks strange since it will never go to here.

How about this?

enum tst_cgroup_ver tst_cgroup_version(void)
{
        enum tst_cgroup_ver cg_ver;

        if (tst_cgroup_check("cgroup2")) {
                if (!tst_is_mounted("cgroup2") && tst_is_mounted("cgroup"))
                        cg_ver = TST_CGROUP_V1;
                else
                        cg_ver = TST_CGROUP_V2;

                goto out;
        }

        if (tst_cgroup_check("cgroup"))
                cg_ver = TST_CGROUP_V1;

        if (!tg_ver)
                tst_brk(TCONF, "Cgroup is not configured");

out:
        return cg_ver;
}


-- 
Regards,
Li Wang

--00000000000085b2b305a8a89588
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 22, 2020 at 3:43 PM Petr Vorel &lt;<a h=
ref=3D"mailto:petr.vorel@suse.com">petr.vorel@suse.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">From: Petr Vorel &lt;=
<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt;<=
br>
<br>
Adding bogus return to keep compiler happy.<br>
<br>
Fixes: 3b716981b (&quot;lib: add new cgroup test API&quot;)<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
Hi,<br>
<br>
IMHO using pragma would be better, but I don&#39;t know how to write it por=
table way.<br>
<br>
Kind regards,<br>
Petr<br>
<br>
=C2=A0lib/tst_cgroup.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c<br>
index f55d8818d..0118dd7b2 100644<br>
--- a/lib/tst_cgroup.c<br>
+++ b/lib/tst_cgroup.c<br>
@@ -49,6 +49,7 @@ enum tst_cgroup_ver tst_cgroup_version(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return TST_CGROUP_V=
1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TCONF, &quot;Cgroup is not configured&q=
uot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return TST_CGROUP_V1; /* fix -Werror=3Dreturn-t=
ype */<br></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-size:small">This return looks strange since it will never go to =
here.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">How about this?</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">enum tst_cgroup_ver tst_cgro=
up_version(void)<br>{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum tst_cgroup_ver cg=
_ver;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_cgroup_check(&quot;cgroup2=
&quot;)) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!=
tst_is_mounted(&quot;cgroup2&quot;) &amp;&amp; tst_is_mounted(&quot;cgroup&=
quot;))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 cg_ver =3D TST_CGROUP_V1;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cg_ver =3D TST_CGROUP_V2;<=
br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_c=
group_check(&quot;cgroup&quot;))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 cg_ver =3D TST_CGROUP_V1;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (!tg_ver)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 tst_brk(TCONF, &quot;Cgroup is not configured&quot;);<br><br>out:<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return cg_ver;<br>}<br></div><br></div><div>=C2=A0=
</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000085b2b305a8a89588--


--===============0058855283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0058855283==--

