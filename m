Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2651833097A
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 09:37:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C273C3C4C06
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 09:37:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 867943C0638
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 09:37:43 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 2638A1A009AD
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 09:37:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615192660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XH4GgtSY2p0DOSFVyWIUFVk5JnL6wmCfqR6xnrtfbag=;
 b=e6GJDSBMYCFFBIi/Ff6yqHsrxTLIvksxBhlwpgpUD/bK3+7hGbV4mr1kQalZNr3LFFdaCg
 J5aUW+zUVm/7HAm1awtc1bxWUpA5semsNp+lP44+4EmPQGmUydXAP38afByUzgYZ9DefpY
 /EwzjjR799gtZmkviIR/9Ue1nACT53g=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-v-Rtk22VNq-UjqxVgl4kBg-1; Mon, 08 Mar 2021 03:37:38 -0500
X-MC-Unique: v-Rtk22VNq-UjqxVgl4kBg-1
Received: by mail-yb1-f200.google.com with SMTP id u1so12015722ybu.14
 for <ltp@lists.linux.it>; Mon, 08 Mar 2021 00:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XH4GgtSY2p0DOSFVyWIUFVk5JnL6wmCfqR6xnrtfbag=;
 b=caSdlgMzNHkAdyryDFolfs1eekRnnKUzdxcz/4+WfWHSoHOjMX6Y7gv7wqQdCbUOy5
 v4uRfsOe5ExUIVeZ8kIgxf3eOlkEBWNT4l+1KlFurnM2BX1cASbThA9Y/3sd3vSV+QH1
 ZWs8mQzhHHHbdxVecGacmyShH04400pMauDwgk37Az6YJegUVx8+eaSvjvng8t9hOzAf
 oJE/a7XEiA9zQLck1WMNK+HAFPkvx1l2ANXcfzDUKMM1843ytUFkntRGRTE/tJidwb5w
 Wt/jzMyBSlJAbCA3g6y2Anfna7eiHh4QczMpM5Qp3g+nwLniuzsoBbV/OU6sZYVIaQxf
 KhOw==
X-Gm-Message-State: AOAM533FTDR7cI5iSPuYElJa29JP7KBjiMa2TNBVc+g9RBAnGVBv8NM9
 6alnCT42cG9uk4MBG0p0jGzJgej2X7H9zHVn8O4ijwtHcQV64To8gwjK2TMGuoCFfLgWe+zvyoy
 v6fnIxCMvaz2KJ1JE8YaBz5oktrk=
X-Received: by 2002:a25:58c5:: with SMTP id
 m188mr32120717ybb.286.1615192658015; 
 Mon, 08 Mar 2021 00:37:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZnBwrt82bqEV861ptFV6tY96NXE3Osicg+cmEbL6U2jJQGo8NpebyCqfWMZXm3oNFyPs25r0JRCMAOsacpog=
X-Received: by 2002:a25:58c5:: with SMTP id
 m188mr32120699ybb.286.1615192657828; 
 Mon, 08 Mar 2021 00:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20210302152510.15116-1-rpalethorpe@suse.com>
 <20210302152510.15116-2-rpalethorpe@suse.com>
In-Reply-To: <20210302152510.15116-2-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 8 Mar 2021 16:37:26 +0800
Message-ID: <CAEemH2euh6gV2C163izom9S=xHvRsRbydjdztQW=r-3cTdFGUQ@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/7] API: Add safe openat, printfat,
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
Content-Type: multipart/mixed; boundary="===============0373017446=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0373017446==
Content-Type: multipart/alternative; boundary="0000000000009d356b05bd0258a4"

--0000000000009d356b05bd0258a4
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Richard Palethorpe <rpalethorpe@suse.com> wrote:

...
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
>

I guess these prototypes should be moved to "safe_file_ops_fn.h"?
(It seems the author did that on purpose to separate macros and function
declaration)


--- /dev/null
> +++ b/lib/tst_safe_file_ops.c
>

Then we can achieve all the above functions in "lib/safe_file_ops.c"
without creating a new file.



> @@ -0,0 +1,171 @@
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include "lapi/fcntl.h"
> +
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +
> +char fd_path[PATH_MAX];
> +
> +char *tst_decode_fd(int fd)
> +{
> +       ssize_t ret;
> +       char proc_path[32];
> +
> +       if (fd < 0)
> +               return "!";
> +
> +       sprintf(proc_path, "/proc/self/fd/%d", fd);
> +       ret = readlink(proc_path, fd_path, sizeof(fd_path));
> +
> +       if (ret < 0)
> +               return "?";
> +
> +       fd_path[ret] = '\0';
> +
> +       return fd_path;
> +}
> +
> +int safe_openat(const char *file, const int lineno,
> +               int dirfd, const char *path, int oflags, ...)
> +{
> +       va_list ap;
> +       int fd;
> +       mode_t mode;
> +
> +       va_start(ap, oflags);
> +       mode = va_arg(ap, int);
> +       va_end(ap);
> +
> +       fd = openat(dirfd, path, oflags, mode);
> +       if (fd > -1)
> +               return fd;
> +
> +       tst_brk_(file, lineno, TBROK | TERRNO,
> +                "openat(%d<%s>, '%s', %o, %o)",
> +                dirfd, tst_decode_fd(dirfd), path, oflags, mode);
> +
> +       return fd;
> +}
> +
> +ssize_t safe_file_readat(const char *file, const int lineno,
> +                        int dirfd, const char *path, char *buf, size_t
> nbyte)
> +{
> +       int fd = safe_openat(file, lineno, dirfd, path, O_RDONLY);
> +       ssize_t rval;
> +
> +       if (fd < 0)
> +               return -1;
> +
> +       rval = safe_read(file, lineno, NULL, 0, fd, buf, nbyte - 1);
> +       if (rval < 0)
> +               return -1;
> +
> +       close(fd);
> +       buf[rval] = '\0';
> +
> +       if (rval >= (ssize_t)nbyte - 1) {
> +               tst_brk_(file, lineno, TBROK,
> +                       "Buffer length %zu too small to read %d<%s>/%s",
> +                       nbyte, dirfd, tst_decode_fd(dirfd), path);
> +       }
> +
> +       return rval;
> +}
> +
> +int tst_file_vprintfat(int dirfd, const char *path, const char *fmt,
> va_list va)
> +{
> +       int fd = openat(dirfd, path, O_WRONLY);
> +
> +       if (fd < 0)
> +               return -1;
> +
> +       TEST(vdprintf(fd, fmt, va));
> +       close(fd);
> +
> +       if (TST_RET < 0) {
> +               errno = TST_ERR;
> +               return -2;
> +       }
> +
> +       return TST_RET;
> +}
> +
> +int tst_file_printfat(int dirfd, const char *path, const char *fmt, ...)
> +{
> +       va_list va;
> +       int rval;
> +
> +       va_start(va, fmt);
> +       rval = tst_file_vprintfat(dirfd, path, fmt, va);
> +       va_end(va);
> +
> +       return rval;
> +}
> +
> +int safe_file_vprintfat(const char *file, const int lineno,
> +                       int dirfd, const char *path,
> +                       const char *fmt, va_list va)
> +{
> +       char buf[16];
> +       va_list vac;
> +       int rval;
> +
> +       va_copy(vac, va);
> +
> +       TEST(tst_file_vprintfat(dirfd, path, fmt, va));
> +
> +       if (TST_RET == -2) {
> +               rval = vsnprintf(buf, sizeof(buf), fmt, vac);
> +               va_end(vac);
> +
> +               if (rval >= (ssize_t)sizeof(buf))
> +                       strcpy(buf + sizeof(buf) - 5, "...");
> +
> +               tst_brk_(file, lineno, TBROK | TTERRNO,
> +                        "vdprintf(%d<%s>, '%s', '%s'<%s>)",
> +                        dirfd, tst_decode_fd(dirfd), path, fmt,
> +                        rval > 0 ? buf : "???");
> +               return -1;
> +       }
> +
> +       va_end(vac);
> +
> +       if (TST_RET == -1) {
> +               tst_brk_(file, lineno, TBROK | TTERRNO,
> +                       "openat(%d<%s>, '%s', O_WRONLY)",
> +                       dirfd, tst_decode_fd(dirfd), path);
> +       }
> +
> +       return TST_RET;
> +}
> +
> +int safe_file_printfat(const char *file, const int lineno,
> +                      int dirfd, const char *path,
> +                      const char *fmt, ...)
> +{
> +       va_list va;
> +       int rval;
> +
> +       va_start(va, fmt);
> +       rval = safe_file_vprintfat(file, lineno, dirfd, path, fmt, va);
> +       va_end(va);
> +
> +       return rval;
> +}
> +
> +int safe_unlinkat(const char *file, const int lineno,
> +                 int dirfd, const char *path, int flags)
> +{
> +       int rval = unlinkat(dirfd, path, flags);
> +
> +       if (rval > -1)
> +               return rval;
> +
> +       tst_brk_(file, lineno, TBROK | TERRNO,
> +                "unlinkat(%d<%s>, '%s', %s)", dirfd,
> tst_decode_fd(dirfd), path,
> +                flags == AT_REMOVEDIR ? "AT_REMOVEDIR" : (flags ? "?" :
> "0"));
> +
> +       return rval;
> +}
> --
> 2.30.0
>
>

-- 
Regards,
Li Wang

--0000000000009d356b05bd0258a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Richard Palethorpe &lt;<a href=3D"mailto:rpa=
lethorpe@suse.com" target=3D"_blank">rpalethorpe@suse.com</a>&gt; wrote:<br=
></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><span class=3D"gmail_default" style=3D"font-s=
ize:small">...</span><br>
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
onst char *path, int flags);<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I guess these prototypes shoul=
d be moved to &quot;safe_file_ops_fn.h&quot;?</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">(It seems the author did that on purpose to =
separate macros and function declaration)</div><br></div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
--- /dev/null<br>
+++ b/lib/tst_safe_file_ops.c<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Then we can achieve all the a=
bove functions in &quot;lib/safe_file_ops.c&quot; without creating a new fi=
le.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
@@ -0,0 +1,171 @@<br>
+#define _GNU_SOURCE<br>
+#include &lt;stdio.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
+#include &quot;lapi/fcntl.h&quot;<br>
+<br>
+#define TST_NO_DEFAULT_MAIN<br>
+#include &quot;tst_test.h&quot;<br>
+<br>
+char fd_path[PATH_MAX];<br>
+<br>
+char *tst_decode_fd(int fd)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char proc_path[32];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;!&quot=
;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(proc_path, &quot;/proc/self/fd/%d&quot;=
, fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D readlink(proc_path, fd_path, sizeof(fd_=
path));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;?&quot=
;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fd_path[ret] =3D &#39;\0&#39;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return fd_path;<br>
+}<br>
+<br>
+int safe_openat(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int dirfd, const ch=
ar *path, int oflags, ...)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_list ap;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mode_t mode;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_start(ap, oflags);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mode =3D va_arg(ap, int);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(ap);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D openat(dirfd, path, oflags, mode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &gt; -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fd;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk_(file, lineno, TBROK | TERRNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;openat(%d&lt=
;%s&gt;, &#39;%s&#39;, %o, %o)&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirfd, tst_decode_=
fd(dirfd), path, oflags, mode);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return fd;<br>
+}<br>
+<br>
+ssize_t safe_file_readat(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int dirfd, const char *path, char *buf, size_t nbyte)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd =3D safe_openat(file, lineno, dirfd, pat=
h, O_RDONLY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t rval;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rval =3D safe_read(file, lineno, NULL, 0, fd, b=
uf, nbyte - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rval &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf[rval] =3D &#39;\0&#39;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rval &gt;=3D (ssize_t)nbyte - 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk_(file, line=
no, TBROK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Buffer length %zu too small to read %d&lt;%s&gt;/%s&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nbyte, dirfd, tst_decode_fd(dirfd), path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rval;<br>
+}<br>
+<br>
+int tst_file_vprintfat(int dirfd, const char *path, const char *fmt, va_li=
st va)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd =3D openat(dirfd, path, O_WRONLY);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(vdprintf(fd, fmt, va));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D TST_ERR;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return TST_RET;<br>
+}<br>
+<br>
+int tst_file_printfat(int dirfd, const char *path, const char *fmt, ...)<b=
r>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_list va;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int rval;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_start(va, fmt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rval =3D tst_file_vprintfat(dirfd, path, fmt, v=
a);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(va);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rval;<br>
+}<br>
+<br>
+int safe_file_vprintfat(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int dirfd, const char *path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const char *fmt, va_list va)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[16];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_list vac;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int rval;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_copy(vac, va);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(tst_file_vprintfat(dirfd, path, fmt, va));=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rval =3D vsnprintf(=
buf, sizeof(buf), fmt, vac);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(vac);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rval &gt;=3D (s=
size_t)sizeof(buf))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0strcpy(buf + sizeof(buf) - 5, &quot;...&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk_(file, line=
no, TBROK | TTERRNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;vdprintf(%d&lt;%s&gt;, &#39;%s&#39;, &#39;%s&#39;&lt;%s&gt=
;)&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dirfd, tst_decode_fd(dirfd), path, fmt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rval &gt; 0 ? buf : &quot;???&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(vac);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk_(file, line=
no, TBROK | TTERRNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;openat(%d&lt;%s&gt;, &#39;%s&#39;, O_WRONLY)&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dirfd, tst_decode_fd(dirfd), path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return TST_RET;<br>
+}<br>
+<br>
+int safe_file_printfat(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int dirfd, const char *path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *fmt, ...)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_list va;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int rval;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_start(va, fmt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rval =3D safe_file_vprintfat(file, lineno, dirf=
d, path, fmt, va);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(va);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rval;<br>
+}<br>
+<br>
+int safe_unlinkat(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int dirfd, c=
onst char *path, int flags)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int rval =3D unlinkat(dirfd, path, flags);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rval &gt; -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rval;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk_(file, lineno, TBROK | TERRNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unlinkat(%d&=
lt;%s&gt;, &#39;%s&#39;, %s)&quot;, dirfd, tst_decode_fd(dirfd), path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D=3D AT_RE=
MOVEDIR ? &quot;AT_REMOVEDIR&quot; : (flags ? &quot;?&quot; : &quot;0&quot;=
));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rval;<br>
+}<br>
-- <br>
2.30.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--0000000000009d356b05bd0258a4--


--===============0373017446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0373017446==--

