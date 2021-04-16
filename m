Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9FB361A24
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 09:00:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42D193C6F75
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 09:00:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F8ED3C1A97
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 09:00:16 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4EFDD1401637
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 09:00:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618556413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nLcVaMytEMpn36mlA/xxunOyax8ujsPq2YqZV6pt1OI=;
 b=Pdoq8zjc0LnpiwX4meigqpKECPb+R6hUkLIL2rni3YhawwxuseqqwyjSyHCQUH2Z/KWqnb
 LnlIMUH7PblfSAbp0SixsUjgnRk9M+9vQCMOMThL2X5il2QoWy+iWm0TIBn04NMkmIez1I
 KO7mC/Hh/Sw/3wibxOA1WE5FMsCmtng=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-bhwR_zpxMGKV30BhiXC_vQ-1; Fri, 16 Apr 2021 03:00:11 -0400
X-MC-Unique: bhwR_zpxMGKV30BhiXC_vQ-1
Received: by mail-yb1-f198.google.com with SMTP id r14so3966973ybm.18
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 00:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nLcVaMytEMpn36mlA/xxunOyax8ujsPq2YqZV6pt1OI=;
 b=omZUWKdDQiOpgZ1OD7Kp2RB2dPrRmuLAJqqwFYuoA6D8/9QEFGwKt7bXm6D7KQxbTj
 pFRH+demCVrEVxhF1z+QMVZQNw/6Wp9wlTxaDzdLEyrZl+jha32qmMLgILk3husU37KF
 Fol4UIsAdqS8q/iu+DDy5i/MH5iSiZ2VoNy4Sw7EfBOUb18Fby1I39oIxwPyOrySat4f
 m2NcCntfBTDO+m4KZ2dBjzJyyvCbO5rePNHGz8SknHHv/K+yJYL0+8wRNU/QgMMVyJJQ
 ajvGN3EYsnQsbBqAIDXArvMiLT09hGr92ORotV9SUJrBw7N6m0j+6PVnL6pA2GBs6gB1
 GMLA==
X-Gm-Message-State: AOAM533r+hQnfjamg7xcLpJQMnPxPsZ+WK84418UgcMKpEDJIIzUMpso
 84xyLBcamvYIx7DTXyNhKcntF7bCLT4Cqp83w/vIZCAke5bh0iVLWU+y6Lca1qwvzs5sMcF35S0
 EylIwFm90tW1fBXh3IA58tPn5nUE=
X-Received: by 2002:a25:4b43:: with SMTP id y64mr9775250yba.366.1618556410905; 
 Fri, 16 Apr 2021 00:00:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD6Xid2u8M/+6DXU2sBgH+pHH8x++OTfkw7a4mPoPEiNjdbke8rgjxi3YN24yyy0ZaXUpAYH2H8ulgnrT471U=
X-Received: by 2002:a25:4b43:: with SMTP id y64mr9775220yba.366.1618556410714; 
 Fri, 16 Apr 2021 00:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210412145506.26894-1-rpalethorpe@suse.com>
 <20210412145506.26894-2-rpalethorpe@suse.com>
In-Reply-To: <20210412145506.26894-2-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Apr 2021 14:59:59 +0800
Message-ID: <CAEemH2dqcf+GRL3P5SZKmOxvdvzFN1O1Y6NXoxG_DJ7GGpQmOg@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
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
Subject: Re: [LTP] [PATCH v3 1/7] API: Add safe openat, printfat,
 readat and unlinkat
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
Content-Type: multipart/mixed; boundary="===============0714446942=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0714446942==
Content-Type: multipart/alternative; boundary="000000000000e8f17a05c011875c"

--000000000000e8f17a05c011875c
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

On Mon, Apr 12, 2021 at 10:55 PM Richard Palethorpe <rpalethorpe@suse.com>
wrote:

> Add 'at' variants for a number of system calls and LTP SAFE API
> functions. This avoids using sprintf everywhere to build paths.
>
> Also adds tst_decode_fd which allows us to retrieve the path for an FD
> for debugging purposes without having to store it ourselves. However
> the proc symlink may not be available on some systems.
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  include/tst_safe_file_ops.h |  39 ++++++++
>  lib/tst_safe_file_ops.c     | 171 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 210 insertions(+)
>  create mode 100644 lib/tst_safe_file_ops.c
>
> diff --git a/include/tst_safe_file_ops.h b/include/tst_safe_file_ops.h
> index 223eddd1f..dff6a793c 100644
> --- a/include/tst_safe_file_ops.h
> +++ b/include/tst_safe_file_ops.h
> @@ -57,4 +57,43 @@
>  #define TST_MOUNT_OVERLAY() \
>         (mount_overlay(__FILE__, __LINE__, 0) == 0)
>
> +#define SAFE_OPENAT(dirfd, path, oflags, ...)                  \
> +       safe_openat(__FILE__, __LINE__,                         \
> +                   (dirfd), (path), (oflags), ## __VA_ARGS__)
> +
> +#define SAFE_FILE_READAT(dirfd, path, buf, nbyte)                      \
> +       safe_file_readat(__FILE__, __LINE__,                            \
> +                        (dirfd), (path), (buf), (nbyte))
> +
> +
> +#define SAFE_FILE_PRINTFAT(dirfd, path, fmt, ...)                      \
> +       safe_file_printfat(__FILE__, __LINE__,                          \
> +                          (dirfd), (path), (fmt), __VA_ARGS__)
> +
> +#define SAFE_UNLINKAT(dirfd, path, flags)                              \
> +       safe_unlinkat(__FILE__, __LINE__, (dirfd), (path), (flags))
> +
>

The above macros are suggested to leave in this "tst_safe_file_ops.h" file.

But, the function prototypes below should be moved to "safe_file_ops_fn.h",
because that purposely to separate macros and function in different places.
(I remember I had commented this in V2, probably you were missing it:)



> +char *tst_decode_fd(int fd);
> +
> +int safe_openat(const char *file, const int lineno,
> +               int dirfd, const char *path, int oflags, ...);
> +
> +ssize_t safe_file_readat(const char *file, const int lineno,
> +                        int dirfd, const char *path, char *buf, size_t
> nbyte);
> +
> +int tst_file_vprintfat(int dirfd, const char *path, const char *fmt,
> va_list va);
> +int tst_file_printfat(int dirfd, const char *path, const char *fmt, ...)
> +                       __attribute__ ((format (printf, 3, 4)));
> +
> +int safe_file_vprintfat(const char *file, const int lineno,
> +                       int dirfd, const char *path,
> +                       const char *fmt, va_list va);
> +
> +int safe_file_printfat(const char *file, const int lineno,
> +                      int dirfd, const char *path, const char *fmt, ...)
> +                       __attribute__ ((format (printf, 5, 6)));
> +
> +int safe_unlinkat(const char *file, const int lineno,
> +                 int dirfd, const char *path, int flags);

+
>  #endif /* TST_SAFE_FILE_OPS */
>



> diff --git a/lib/tst_safe_file_ops.c b/lib/tst_safe_file_ops.c
> new file mode 100644
> index 000000000..af4157476
> --- /dev/null
> +++ b/lib/tst_safe_file_ops.c
>

And, we'd better achieve all the functions in "lib/safe_file_ops.c"
but not create a separate new C file.

-- 
Regards,
Li Wang

--000000000000e8f17a05c011875c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Apr 12, 2021 at 10:55 PM Richard Pal=
ethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.com" target=3D"_blank">rpale=
thorpe@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Add &#39;at&#39; variants for a number of system calls and L=
TP SAFE API<br>
functions. This avoids using sprintf everywhere to build paths.<br>
<br>
Also adds tst_decode_fd which allows us to retrieve the path for an FD<br>
for debugging purposes without having to store it ourselves. However<br>
the proc symlink may not be available on some systems.<br>
<br>
Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.co=
m" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
---<br>
=C2=A0include/tst_safe_file_ops.h |=C2=A0 39 ++++++++<br>
=C2=A0lib/tst_safe_file_ops.c=C2=A0 =C2=A0 =C2=A0| 171 ++++++++++++++++++++=
++++++++++++++++<br>
=C2=A02 files changed, 210 insertions(+)<br>
=C2=A0create mode 100644 lib/tst_safe_file_ops.c<br>
<br>
diff --git a/include/tst_safe_file_ops.h b/include/tst_safe_file_ops.h<br>
index 223eddd1f..dff6a793c 100644<br>
--- a/include/tst_safe_file_ops.h<br>
+++ b/include/tst_safe_file_ops.h<br>
@@ -57,4 +57,43 @@<br>
=C2=A0#define TST_MOUNT_OVERLAY() \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (mount_overlay(__FILE__, __LINE__, 0) =3D=3D 0)=
<br>
<br>
+#define SAFE_OPENAT(dirfd, path, oflags, ...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_openat(__FILE__, __LINE__,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(dirf=
d), (path), (oflags), ## __VA_ARGS__)<br>
+<br>
+#define SAFE_FILE_READAT(dirfd, path, buf, nbyte)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_file_readat(__FILE__, __LINE__,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (dirfd), (path), (buf), (nbyte))<br>
+<br>
+<br>
+#define SAFE_FILE_PRINTFAT(dirfd, path, fmt, ...)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_file_printfat(__FILE__, __LINE__,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (dirfd), (path), (fmt), __VA_ARGS__)<br>
+<br>
+#define SAFE_UNLINKAT(dirfd, path, flags)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_unlinkat(__FILE__, __LINE__, (dirfd), (pat=
h), (flags))<br>
+<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">The above macros are suggested to leave in=C2=A0this &quo=
t;tst_safe_file_ops.h&quot; file.</div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">But, the function prototypes below should=
 be moved to &quot;safe_file_ops_fn.h&quot;,</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">because=C2=A0that purposely to separate macro=
s and function=C2=A0in different places.</div><div class=3D"gmail_default" =
style=3D"font-size:small">(I remember I had commented this in V2, probably =
you were missing it:)</div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+char *tst_decode_fd(int fd);<br>
+<br>
+int safe_openat(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int dirfd, const ch=
ar *path, int oflags, ...);<br>
+<br>
+ssize_t safe_file_readat(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int dirfd, const char *path, char *buf, size_t nbyte);<br>
+<br>
+int tst_file_vprintfat(int dirfd, const char *path, const char *fmt, va_li=
st va);<br>
+int tst_file_printfat(int dirfd, const char *path, const char *fmt, ...)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__attribute__ ((format (printf, 3, 4)));<br>
+<br>
+int safe_file_vprintfat(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int dirfd, const char *path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const char *fmt, va_list va);<br>
+<br>
+int safe_file_printfat(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int dirfd, const char *path, const char *fmt, ...)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__attribute__ ((format (printf, 5, 6)));<br>
+<br>
+int safe_unlinkat(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int dirfd, c=
onst char *path, int flags);</blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+<br>
=C2=A0#endif /* TST_SAFE_FILE_OPS */<br></blockquote><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/lib/tst_safe_file_ops.c b/lib/tst_safe_file_ops.c<br>
new file mode 100644<br>
index 000000000..af4157476<br>
--- /dev/null<br>
+++ b/lib/tst_safe_file_ops.c<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">And, we&#39;d better achieve =
all the functions in &quot;lib/safe_file_ops.c&quot;</div><div class=3D"gma=
il_default" style=3D"font-size:small">but not create a separate new C file.=
</div></div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><=
div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000e8f17a05c011875c--


--===============0714446942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0714446942==--

