Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E022B59D3
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 07:44:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC1363C4F07
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 07:44:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4FBC23C3078
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 07:44:15 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 86018600A66
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 07:44:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605595452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Al4yGJDbv8E37BEE9ZKofvYQsRxwAs6RbHbasmk1nuM=;
 b=IZpmbDWLkTCuAD/nJdVcjbiWlCFUb0KJkpr8Ut7Icpj8fpklvkRQBU88KjYZ7lvKvaP9r/
 Y10EIf860FLfcDtObhKLxg0+sRlMR8EFDcY11IBJZxKoIcPSDy7kEGtsoUrPeSZjx/IDGr
 0ctvV6hER6l0IsXHBEFk1Uk0+WtjhkA=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-xsDlYRU0OnCZ_Ce7Ouaf-g-1; Tue, 17 Nov 2020 01:44:09 -0500
X-MC-Unique: xsDlYRU0OnCZ_Ce7Ouaf-g-1
Received: by mail-yb1-f200.google.com with SMTP id e19so18718563ybc.5
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 22:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Al4yGJDbv8E37BEE9ZKofvYQsRxwAs6RbHbasmk1nuM=;
 b=nqavyNX9X/1fN5SkugjM928u2MTSicMkgpOobJsv2i0P5qq1DT0vzcyuIDEtgM7FgX
 ZStKHhXzwLGA/iJrQFVl7tJhbeVovbWu2slP50P5sRP26IPiOdNvgBedkC0RCw4r0lWA
 jwjgwzibU58xIKF4+6RA7b5P1WtgM6N73mgnthe+FlSfdj3E8LAblotHuImBRnXHAmr4
 UF4bRTAZOoOIgNKZFZd3b4h84AyMWrd/kTT8FfPoi7gDRc6kIWMiHsAsL11oHBJ3wNQa
 ZkzUWACnShLybXtJfLUj1Lg3wANx5saGElu6asRGLUbWRBFbqYkoUA2UTS+xFqvsxLrO
 6KDg==
X-Gm-Message-State: AOAM533dP4HzmjfXHhzsf1eTIHG+2vwRhdJM1DxIF7y9wMqeD2S0LAJd
 2TKLcr8PqYqxzfbqZMGIELSxQL0aqWWgE5XO8jwPienWPzcvV/ODpPWTxiSauJe9g8eBWO1vgBJ
 qgOLeeG1WXWM6btyN4S0oQdkLJqU=
X-Received: by 2002:a25:dbcf:: with SMTP id
 g198mr25442088ybf.110.1605595449261; 
 Mon, 16 Nov 2020 22:44:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3hx/B047R2szY7KKoeCYznJN8eIDlmYo4ewh9weBslf+k3XeqhflUEiYZfNZP8vqZmKzb82ZcaqN2+BlHOSw=
X-Received: by 2002:a25:dbcf:: with SMTP id
 g198mr25442075ybf.110.1605595449095; 
 Mon, 16 Nov 2020 22:44:09 -0800 (PST)
MIME-Version: 1.0
References: <20201116105209.20395-1-rpalethorpe@suse.com>
In-Reply-To: <20201116105209.20395-1-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 17 Nov 2020 14:43:57 +0800
Message-ID: <CAEemH2cLAygaDZcohNwZ7Yx_tnjtywYXD7MmXs=J0upwgBdE-Q@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
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
Subject: Re: [LTP] [PATCH] madvise06: Allow for kmem and memsw counters
 being disabled
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
Content-Type: multipart/mixed; boundary="===============0545829242=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0545829242==
Content-Type: multipart/alternative; boundary="000000000000658fe905b447d275"

--000000000000658fe905b447d275
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

This one looks good to me.

On Mon, Nov 16, 2020 at 6:52 PM Richard Palethorpe <rpalethorpe@suse.com>
wrote:

> These may be missing and we only access them for printing diagnostic
> info.
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>
Reviewed-by: Li Wang <liwang@redhat.com>


> ---
>  testcases/kernel/syscalls/madvise/madvise06.c | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/madvise/madvise06.c
> b/testcases/kernel/syscalls/madvise/madvise06.c
> index 2ba2bac6f..dc515d528 100644
> --- a/testcases/kernel/syscalls/madvise/madvise06.c
> +++ b/testcases/kernel/syscalls/madvise/madvise06.c
> @@ -64,14 +64,16 @@ static void check_path(const char *path)
>  }
>
>  #define READ_CGMEM(item)                                               \
> -       ({long tst_rval;                                                \
> -         SAFE_FILE_LINES_SCANF(MNT_NAME"/"GROUP_NAME"/memory."item,    \
> -                               "%ld",                                  \
> -                               &tst_rval);                             \
> +       ({long tst_rval = 0;                                            \
> +         const char *cgpath = MNT_NAME"/"GROUP_NAME"/memory."item;     \
> +         if (!access(cgpath, R_OK))                                    \
> +                 SAFE_FILE_LINES_SCANF(cgpath, "%ld", &tst_rval);      \
>           tst_rval;})
>
>  static void meminfo_diag(const char *point)
>  {
> +       long rval;
> +
>         FILE_PRINTF("/proc/sys/vm/stat_refresh", "1");
>         tst_res(TINFO, "%s", point);
>         tst_res(TINFO, "\tSwap: %ld Kb",
> @@ -82,10 +84,14 @@ static void meminfo_diag(const char *point)
>                 SAFE_READ_MEMINFO("Cached:") - init_cached);
>         tst_res(TINFO, "\tcgmem.usage_in_bytes: %ld Kb",
>                 READ_CGMEM("usage_in_bytes") / 1024);
> -       tst_res(TINFO, "\tcgmem.memsw.usage_in_bytes: %ld Kb",
> -               READ_CGMEM("memsw.usage_in_bytes") / 1024);
> -       tst_res(TINFO, "\tcgmem.kmem.usage_in_bytes: %ld Kb",
> -               READ_CGMEM("kmem.usage_in_bytes") / 1024);
> +
> +       rval = READ_CGMEM("memsw.usage_in_bytes") / 1024;
> +       if (rval)
> +               tst_res(TINFO, "\tcgmem.memsw.usage_in_bytes: %ld Kb",
> rval);
> +
> +       rval = READ_CGMEM("kmem.usage_in_bytes") / 1024;
> +       if (rval)
> +               tst_res(TINFO, "\tcgmem.kmem.usage_in_bytes: %ld Kb",
> rval);
>  }
>
>  static void setup(void)
> --
> 2.29.1
>
>

-- 
Regards,
Li Wang

--000000000000658fe905b447d275
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,=C2=A0</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">This one looks good to me.</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 16, 2020 at 6:52 PM Rich=
ard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.com">rpalethorpe@suse=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">These may be missing and we only access them for printing diagnostic<br=
>
info.<br>
<br>
Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.co=
m" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br></blockquote><div><spa=
n class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &l=
t;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></di=
v><div><span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0testcases/kernel/syscalls/madvise/madvise06.c | 22 ++++++++++++------=
-<br>
=C2=A01 file changed, 14 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kern=
el/syscalls/madvise/madvise06.c<br>
index 2ba2bac6f..dc515d528 100644<br>
--- a/testcases/kernel/syscalls/madvise/madvise06.c<br>
+++ b/testcases/kernel/syscalls/madvise/madvise06.c<br>
@@ -64,14 +64,16 @@ static void check_path(const char *path)<br>
=C2=A0}<br>
<br>
=C2=A0#define READ_CGMEM(item)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0({long tst_rval;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_LINES_SCANF(MNT_NAME&quot;/&qu=
ot;GROUP_NAME&quot;/memory.&quot;item,=C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%ld&quot;,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tst_rval);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0({long tst_rval =3D 0;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *cgpath =3D MNT_NAME&quot;/&q=
uot;GROUP_NAME&quot;/memory.&quot;item;=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!access(cgpath, R_OK))=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_LI=
NES_SCANF(cgpath, &quot;%ld&quot;, &amp;tst_rval);=C2=A0 =C2=A0 =C2=A0 \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_rval;})<br>
<br>
=C2=A0static void meminfo_diag(const char *point)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long rval;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE_PRINTF(&quot;/proc/sys/vm/stat_refresh&quo=
t;, &quot;1&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;%s&quot;, point);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;\tSwap: %ld Kb&quot;,<br>
@@ -82,10 +84,14 @@ static void meminfo_diag(const char *point)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_READ_MEMINFO(&=
quot;Cached:&quot;) - init_cached);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;\tcgmem.usage_in_bytes: %l=
d Kb&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 READ_CGMEM(&quot;us=
age_in_bytes&quot;) / 1024);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;\tcgmem.memsw.usage_in_byt=
es: %ld Kb&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0READ_CGMEM(&quot;me=
msw.usage_in_bytes&quot;) / 1024);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;\tcgmem.kmem.usage_in_byte=
s: %ld Kb&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0READ_CGMEM(&quot;km=
em.usage_in_bytes&quot;) / 1024);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rval =3D READ_CGMEM(&quot;memsw.usage_in_bytes&=
quot;) / 1024;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rval)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quo=
t;\tcgmem.memsw.usage_in_bytes: %ld Kb&quot;, rval);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rval =3D READ_CGMEM(&quot;kmem.usage_in_bytes&q=
uot;) / 1024;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rval)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quo=
t;\tcgmem.kmem.usage_in_bytes: %ld Kb&quot;, rval);<br>
=C2=A0}<br>
<br>
=C2=A0static void setup(void)<br>
-- <br>
2.29.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000658fe905b447d275--


--===============0545829242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0545829242==--

