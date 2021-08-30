Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A463FB379
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 11:55:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36C5C3C2B34
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 11:55:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DAEE13C2AAC
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 11:55:40 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D966A20090A
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 11:55:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630317338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uazqkVct9uM13q9sY59TRABd+4mrnkInZlpeyEsz/PA=;
 b=IGeteZe/Y9Lkj7VHQZqACA9jTbvBIChRjhJlusY01maXSlEiOYg5Lzum7zS1JC+asigPRM
 GuiPNLikpzcKWWov0Ylv8s3XzWF/XrLFij/rIsvhTh2awkhUhX3lKK7Sm8Ep32Gvdj115X
 5Q1Ah7k2MA0DSf/agF0m9IcOTEdm/cM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-WYKZ1XAEOkGXU-7l8aENbw-1; Mon, 30 Aug 2021 05:55:27 -0400
X-MC-Unique: WYKZ1XAEOkGXU-7l8aENbw-1
Received: by mail-yb1-f199.google.com with SMTP id
 131-20020a251489000000b0059bdeb10a84so1398064ybu.15
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 02:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uazqkVct9uM13q9sY59TRABd+4mrnkInZlpeyEsz/PA=;
 b=Lepn2fsIajt/VLMrB2sARQ3lRvJ+E2jNPJchW9vpMe16+x2pmByan2t3gKdL6gLmiU
 P6x4LivLOQhlemi2yxV2I6VObP4t0+n1Cg8T+nKZl45WDgoX8e59ATwXgQ/KvplZeSfv
 tKG0CMk5l4pYUEciM0yejY03NkC0D2n/cx4FhMg31KjARrjyraA8HQYPPyX77A+1wnbj
 k9J1jxSM3w7elVfV1noR9UAwhVBcth9f9vv4bn4KhkE29AO7Fl2ZYjchWoX6NeCX62yw
 AUcvnwx9bzsDXO25Ib5K0kdVh1xNJAkINU14q2r3JxJylnD3Rbe72arjPMfUsp+F8UvC
 yAKw==
X-Gm-Message-State: AOAM533CpuBWJD2cEeJaWGyCYbjR6ZgHdfnFD+wcfr/5Ds9yNMcHf9Og
 WGaExlZiSZMjoXJ91OZ7CjLiBdwqUMdVrLu37i1zTMDFyHNPgulhQZbbl9PUlyloWVIbHj0gLz6
 j3FvMiYppiyPHX8rHgPvQ8rVY1Ds=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr22656191ybc.252.1630317326732; 
 Mon, 30 Aug 2021 02:55:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb/swukyratoabjpc1iV+jewWqetBEJDgqt+aATfAH3fBjSa6ZaWJ52Od6VKwNtYa2YrdTVR082LRQlhHGl34=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr22656175ybc.252.1630317326532; 
 Mon, 30 Aug 2021 02:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210830073544.19620-1-zhanglianjie@uniontech.com>
In-Reply-To: <20210830073544.19620-1-zhanglianjie@uniontech.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Aug 2021 17:55:15 +0800
Message-ID: <CAEemH2fo_Vg=+0+Hf+E+Vp8cO9uvgFXNgmGfXyykhP8gn7ir3Q@mail.gmail.com>
To: zhanglianjie <zhanglianjie@uniontech.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_test_macros: Add test_macros06 tests
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
Content-Type: multipart/mixed; boundary="===============0197401234=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0197401234==
Content-Type: multipart/alternative; boundary="0000000000001e988305cac3d55c"

--0000000000001e988305cac3d55c
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 30, 2021 at 3:36 PM zhanglianjie <zhanglianjie@uniontech.com>
wrote:

> Test the TST_EXP_VAL and TST_EXP_VAL_SILENT macros.
>
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>
 Reviewed-by: Li Wang <liwang@redhat.com>


>
> diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
> index a0bad78c1..cf467b5a0 100644
> --- a/lib/newlib_tests/.gitignore
> +++ b/lib/newlib_tests/.gitignore
> @@ -42,6 +42,7 @@ test_macros02
>  test_macros03
>  test_macros04
>  test_macros05
> +test_macros06
>  tst_fuzzy_sync01
>  tst_fuzzy_sync02
>  tst_fuzzy_sync03
> diff --git a/lib/newlib_tests/test_macros06.c
> b/lib/newlib_tests/test_macros06.c
> new file mode 100644
> index 000000000..626f233d2
> --- /dev/null
> +++ b/lib/newlib_tests/test_macros06.c
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 zhanglianjie <zhanglianjie@uniontech.com>
> + */
> +
> +/*
> + * Test TST_EXP_VAL and TST_EXP_VAL_SILENT macro.
> + */
> +
> +#include "tst_test.h"
> +
> +static int fail_val(void)
> +{
> +       errno = EINVAL;
> +       return 42;
> +}
> +
> +static int pass_val(void)
> +{
> +       return 42;
> +}
> +
> +static void do_test(void)
> +{
> +       tst_res(TINFO, "Testing TST_EXP_VAL macro");
> +       TST_EXP_VAL(fail_val(), 40, "fail_val()");
> +       tst_res(TINFO, "TST_PASS = %i", TST_PASS);
> +       TST_EXP_VAL(pass_val(), 42, "fail_val()");
> +       tst_res(TINFO, "TST_PASS = %i", TST_PASS);
> +
> +       tst_res(TINFO, "Testing TST_EXP_PID_SILENT macro");
> +       TST_EXP_VAL_SILENT(fail_val(), 40, "fail_val()");
> +       tst_res(TINFO, "TST_PASS = %i", TST_PASS);
> +       TST_EXP_VAL_SILENT(pass_val(), 42, "%s", "pass_val()");
> +       tst_res(TINFO, "TST_PASS = %i", TST_PASS);
> +}
> +
> +static struct tst_test test = {
> +       .test_all = do_test,
> +};
> --
> 2.20.1
>
>
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--0000000000001e988305cac3d55c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Aug 30, 2021 at 3:36 PM zhanglianjie &lt;<a=
 href=3D"mailto:zhanglianjie@uniontech.com">zhanglianjie@uniontech.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Test =
the TST_EXP_VAL and TST_EXP_VAL_SILENT macros.<br>
<br>
Signed-off-by: zhanglianjie &lt;<a href=3D"mailto:zhanglianjie@uniontech.co=
m" target=3D"_blank">zhanglianjie@uniontech.com</a>&gt;<br></blockquote><di=
v><span class=3D"gmail_default" style=3D"font-size:small">=C2=A0Reviewed-by=
: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt=
;</span></div><div><span class=3D"gmail_default" style=3D"font-size:small">=
</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore<br>
index a0bad78c1..cf467b5a0 100644<br>
--- a/lib/newlib_tests/.gitignore<br>
+++ b/lib/newlib_tests/.gitignore<br>
@@ -42,6 +42,7 @@ test_macros02<br>
=C2=A0test_macros03<br>
=C2=A0test_macros04<br>
=C2=A0test_macros05<br>
+test_macros06<br>
=C2=A0tst_fuzzy_sync01<br>
=C2=A0tst_fuzzy_sync02<br>
=C2=A0tst_fuzzy_sync03<br>
diff --git a/lib/newlib_tests/test_macros06.c b/lib/newlib_tests/test_macro=
s06.c<br>
new file mode 100644<br>
index 000000000..626f233d2<br>
--- /dev/null<br>
+++ b/lib/newlib_tests/test_macros06.c<br>
@@ -0,0 +1,40 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+ * Copyright (c) 2021 zhanglianjie &lt;<a href=3D"mailto:zhanglianjie@unio=
ntech.com" target=3D"_blank">zhanglianjie@uniontech.com</a>&gt;<br>
+ */<br>
+<br>
+/*<br>
+ * Test TST_EXP_VAL and TST_EXP_VAL_SILENT macro.<br>
+ */<br>
+<br>
+#include &quot;tst_test.h&quot;<br>
+<br>
+static int fail_val(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 42;<br>
+}<br>
+<br>
+static int pass_val(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 42;<br>
+}<br>
+<br>
+static void do_test(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Testing TST_EXP_VAL macro&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_EXP_VAL(fail_val(), 40, &quot;fail_val()&qu=
ot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;TST_PASS =3D %i&quot;, TST=
_PASS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_EXP_VAL(pass_val(), 42, &quot;fail_val()&qu=
ot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;TST_PASS =3D %i&quot;, TST=
_PASS);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Testing TST_EXP_PID_SILENT=
 macro&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_EXP_VAL_SILENT(fail_val(), 40, &quot;fail_v=
al()&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;TST_PASS =3D %i&quot;, TST=
_PASS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_EXP_VAL_SILENT(pass_val(), 42, &quot;%s&quo=
t;, &quot;pass_val()&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;TST_PASS =3D %i&quot;, TST=
_PASS);<br>
+}<br>
+<br>
+static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D do_test,<br>
+};<br>
--<br>
2.20.1<br>
<br>
<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000001e988305cac3d55c--


--===============0197401234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0197401234==--

