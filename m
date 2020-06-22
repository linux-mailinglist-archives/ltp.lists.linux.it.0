Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A332034A8
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 12:18:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60A323C227B
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 12:18:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 719573C1D32
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 12:18:09 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id DAF7E601204
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 12:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592821087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0QALCfx3izsWFZSRgYbw29F+44MfPU03krkSwxSjF2k=;
 b=F3M7Ka0PuNVARnNs+6XLmCEgvTM/pi4BIQr8ExjyAVJ6ftwe5GzgwWObAYKWcxqGLOo93c
 JxKm+wbGmafwjGMRyUpeDo+Ri/KzMrprBrq6UV+Q91pWA6gZiMUxtVlrM4C36CNE1LxEL3
 T9vKbCVwSLKhC1C8whf8ZHYeuqs4jX4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-0CaUoY5NP-qqRT0X146LeQ-1; Mon, 22 Jun 2020 06:18:03 -0400
X-MC-Unique: 0CaUoY5NP-qqRT0X146LeQ-1
Received: by mail-lf1-f72.google.com with SMTP id r10so6088854lfc.6
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 03:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=0QALCfx3izsWFZSRgYbw29F+44MfPU03krkSwxSjF2k=;
 b=bdrbyNkpG0Fx93OnS+5KOX0joHnNo/mdYfz4eosjMzoxkfxuTEzu8ANs8HRd9x1BM8
 2RUv7SzoG5f5M4PH6tHu5u9wGGbTHrgGjJp0xBGWgDb/469N9HcKMIzxaNpHs2MxPV6p
 eX6S4lA/Lks0Lf/Ybvs1w9AEzemHHqzfMaVsecCDhN0thAv+8F4KzNS1xcRzAFVlxOGS
 gMxShrD1VvxDuM/uorBehmC1hOabqZbZzQv452rJaGxXi1S0TdKBBiZccSGnzV3vZTEj
 4h2+9cm5/yXSzZr8RN9xTYL3sTgHynsmU11LkEJ6GG1ElR5M2tDiqWUKL4zln2F3o3J1
 sZ/g==
X-Gm-Message-State: AOAM531FGdS/ycRAnh83GZAYcqP1xhgxpa6zUV6mQJmhvhcU01L28sLm
 81BxbAcUS0Uw+KoEDYAvj++VPnullvquAW7qNi7qBVYmoOQikxeddBzMxmnj3RGlQ3f0cyv6Pcx
 8RotMdJtOfVMFgmuOrcUolWYaGGo=
X-Received: by 2002:a05:6512:3089:: with SMTP id
 z9mr9274759lfd.83.1592821080988; 
 Mon, 22 Jun 2020 03:18:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8dhLM3UdD9/DbR26f1uIT+zab8tba9q0EssEGXKMyUc85d9+EbK341RfGRvDNvTfk1p/6kYcTn+Z7setG868=
X-Received: by 2002:a05:6512:3089:: with SMTP id
 z9mr9274748lfd.83.1592821080796; 
 Mon, 22 Jun 2020 03:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200622100506.4285-1-liwang@redhat.com>
In-Reply-To: <20200622100506.4285-1-liwang@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 22 Jun 2020 18:17:46 +0800
Message-ID: <CAEemH2fqTMuHhBx6FjYy68shwsYk5K6WyQk=8JcAWhYHpXVM0g@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>, Pter Vorel <pvorel@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_cgroup: fix tst_cgroup_version to cover
 more situations
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
Content-Type: multipart/mixed; boundary="===============1786864845=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1786864845==
Content-Type: multipart/alternative; boundary="000000000000b6455405a8a98e27"

--000000000000b6455405a8a98e27
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 22, 2020 at 6:05 PM Li Wang <liwang@redhat.com> wrote:

>   * system doesn't support any cgroup(v1, v2): TCONF
>   * system only support cgroup v1: choose v1
>   * system only support cgroup v2: choose v2
>   * system support v1 & v2 but mounting v1: chosse v1
>   * systep support v1 & v2 but mounting v2: choose v2
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  lib/tst_cgroup.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index 0118dd7b2..010baa69e 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -38,18 +38,19 @@ static int tst_cgroup_check(const char *cgroup)
>
>  enum tst_cgroup_ver tst_cgroup_version(void)
>  {
> -       if (tst_cgroup_check("cgroup2")) {
> -               if (!tst_is_mounted("cgroup2") && tst_is_mounted("cgroup"))
> -                       return TST_CGROUP_V1;
> -               else
> -                       return TST_CGROUP_V2;
> -       }
> +       enum tst_cgroup_ver cg_ver;
>
>         if (tst_cgroup_check("cgroup"))
> -               return TST_CGROUP_V1;
> +               cg_ver = TST_CGROUP_V1;
>

Ah sorry, it seems we shouldn't searching "cgroup" first, because that will
be misled by "cgroup2" too. Plz ignore this patch

This is a little bit tricky, let me think over.



> +
> +       if (tst_cgroup_check("cgroup2"))
> +               if (!cg_ver || tst_is_mounted("cgroup2"))
> +                       cg_ver = TST_CGROUP_V2;
> +
> +       if (!cg_ver)
> +               tst_brk(TCONF, "Cgroup is not configured");
>
> -       tst_brk(TCONF, "Cgroup is not configured");
> -       return TST_CGROUP_V1; /* fix -Werror=return-type */
> +       return cg_ver;
>  }
>
>  static void tst_cgroup1_mount(const char *name, const char *option,
> --
> 2.21.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000b6455405a8a98e27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 22, 2020 at 6:05 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 * system doesn&#39;t =
support any cgroup(v1, v2): TCONF<br>
=C2=A0 * system only support cgroup v1: choose v1<br>
=C2=A0 * system only support cgroup v2: choose v2<br>
=C2=A0 * system support v1 &amp; v2 but mounting v1: chosse v1<br>
=C2=A0 * systep support v1 &amp; v2 but mounting v2: choose v2<br>
<br>
Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_=
blank">liwang@redhat.com</a>&gt;<br>
---<br>
=C2=A0lib/tst_cgroup.c | 19 ++++++++++---------<br>
=C2=A01 file changed, 10 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c<br>
index 0118dd7b2..010baa69e 100644<br>
--- a/lib/tst_cgroup.c<br>
+++ b/lib/tst_cgroup.c<br>
@@ -38,18 +38,19 @@ static int tst_cgroup_check(const char *cgroup)<br>
<br>
=C2=A0enum tst_cgroup_ver tst_cgroup_version(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cgroup_check(&quot;cgroup2&quot;)) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tst_is_mounted=
(&quot;cgroup2&quot;) &amp;&amp; tst_is_mounted(&quot;cgroup&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return TST_CGROUP_V1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return TST_CGROUP_V2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum tst_cgroup_ver cg_ver;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_cgroup_check(&quot;cgroup&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TST_CGROUP_V=
1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cg_ver =3D TST_CGRO=
UP_V1;<br></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Ah sorry, it=C2=A0seems we shouldn&#39;t searching &=
quot;cgroup&quot; first, because=C2=A0that will be misled by &quot;cgroup2&=
quot; too. Plz ignore this patch</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">This is a little bit tricky, let me think over.</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cgroup_check(&quot;cgroup2&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cg_ver || tst_=
is_mounted(&quot;cgroup2&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cg_ver =3D TST_CGROUP_V2;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cg_ver)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quo=
t;Cgroup is not configured&quot;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quot;Cgroup is not configured&q=
uot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return TST_CGROUP_V1; /* fix -Werror=3Dreturn-t=
ype */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return cg_ver;<br>
=C2=A0}<br>
<br>
=C2=A0static void tst_cgroup1_mount(const char *name, const char *option,<b=
r>
-- <br>
2.21.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000b6455405a8a98e27--


--===============1786864845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1786864845==--

