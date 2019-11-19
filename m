Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C08110148A
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 06:35:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2F0B3C2219
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 06:35:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8ED723C131B
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 06:35:07 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 710B760252D
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 06:35:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574141703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rn1TwvPeoEVhyhkgDgL76WKV3xrbZMZ4N13xYkVZ8KU=;
 b=CSTbWJoYQ6/pUC/BBI4ssQ+3PsGtpahFea6TyRCzWLmtyzSOeCJHiRKZivFeuOdZBHclF7
 aBxoLvREOxstzB4HXhsIBMSiufQm+VCrLh/l/i5i4kkxwDWpgLSohaUeLj8omnzd5HyzPG
 EOYDwglxOpe7r/WpZQkq3kW6enmAr/0=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-HnV9gyNYPKyX97cyDlpaIQ-1; Tue, 19 Nov 2019 00:35:01 -0500
Received: by mail-ot1-f70.google.com with SMTP id m7so11412964otr.12
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 21:35:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jcz6uvv23ADFUdhMg4l4S8i7z4MssjGv1MpjCn8D+mI=;
 b=IBnhhR16vn29IAA2lqvpFyA3fzWREgos80VUVbNK2nttIRjh3xz7GWebLPAmqsCGrK
 SpZae0pjUpI7WqbZWAkCye9eDD8evbua7UCvB7MvVyg1sxuM+ZCKAazbkrTaC7OPnanU
 zRhWCFhJVMX+T0/7J1C8ztrvHq6vyVH9YFUGtiVa8uEN5GGMzncbn8i3RcMsIKPd7bvm
 wrs7rEr0hTScJlwVXRHg0DVStt3oUX8OXQygKvosMuRzFSerIp0KlGuagV+3sdteF5Xb
 Y1kM6lN2UTu1AinriAEChnloxurDrimu+FDGTy7iDFP7PcP+TU8UMDvhUwyEvE9QuiSa
 OAkA==
X-Gm-Message-State: APjAAAX/UwV2xXO9LE1v64oQqYqbX1f/F6cXSmYvBPKsDJJUykZGBjGF
 LXc0Dj2VWgno2XWzXIfvnyvDQiBJJnDqjR2eftnyFx6oeKpD/xFjxHpWUjY8Aj7bQ/BZzp2onui
 ChZmNMDDXaKKk9biwhUOHAe4zU1M=
X-Received: by 2002:a9d:870:: with SMTP id 103mr2405622oty.67.1574141700948;
 Mon, 18 Nov 2019 21:35:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxkN/6pYga33t/hSGp6fog1LnilEdGSxdP2wZBQooIl0JTFFwhrWhy+2LA8h8IPlPl2pt4ykc5FsktXb+/gwNM=
X-Received: by 2002:a9d:870:: with SMTP id 103mr2405599oty.67.1574141700619;
 Mon, 18 Nov 2019 21:35:00 -0800 (PST)
MIME-Version: 1.0
References: <d8ad4bab26557fdf70e7ebc3f771bbb37ae889d7.1574093242.git.jstancek@redhat.com>
In-Reply-To: <d8ad4bab26557fdf70e7ebc3f771bbb37ae889d7.1574093242.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 19 Nov 2019 13:34:49 +0800
Message-ID: <CAEemH2eu8HcQ90+BxUL0Hu+No6P5je4xC3oqVSU_ZnwMXEG=7Q@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: HnV9gyNYPKyX97cyDlpaIQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fallocate05: increase FALLOCATE_SIZE
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
Content-Type: multipart/mixed; boundary="===============1476583102=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1476583102==
Content-Type: multipart/alternative; boundary="000000000000e45b0e0597ac6c29"

--000000000000e45b0e0597ac6c29
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Nov 19, 2019 at 12:08 AM Jan Stancek <jstancek@redhat.com> wrote:

> write() returning ENOSPC doesn't guarantee that filesystem after
> some internal book-keeping, flushing, finishing transactions, etc.
> won't still find some extra space.
>

Thanks for the patch, I have drafted a similar one but you sent out first
:).

Another patch I was thinking is to enhance the tst_fill_fs routine, which
as Eric suggested, makes more reliably to get to a full filesystem.
Something like what xfstest does to cut the trial write size in half and
try again until the size is less than the filesystem block size.

Comments?

--- a/lib/tst_fill_fs.c
+++ b/lib/tst_fill_fs.c
@@ -6,6 +6,7 @@
 #include <errno.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <sys/statvfs.h>

 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
@@ -19,6 +20,8 @@ void tst_fill_fs(const char *path, int verbose)
        size_t len;
        ssize_t ret;
        int fd;
+       struct statvfs fi;
+       statvfs(path, &fi);

        for (;;) {
                len =3D random() % (1024 * 102400);
@@ -41,6 +44,12 @@ void tst_fill_fs(const char *path, int verbose)
                        ret =3D write(fd, buf, MIN(len, sizeof(buf)));

                        if (ret < 0) {
+                               if (errno =3D=3D ENOSPC) {
+                                       len /=3D 2;
+                                       if (len >=3D fi.f_bsize)
+                                               continue;
+                               }
+
                                SAFE_CLOSE(fd);

                                if (errno !=3D ENOSPC)



>
> Increase FALLOCATE_SIZE to minimize chance of hitting sporadic
> failures when that happens.
>
> Thanks to Carlos Maiolino and Eric Sandeen for their comments
> and suggestions.
>
> Fixes #610
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>
Reviewed-by: Li Wang <liwang@redhat.com>


> ---
>  testcases/kernel/syscalls/fallocate/fallocate05.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/syscalls/fallocate/fallocate05.c
> b/testcases/kernel/syscalls/fallocate/fallocate05.c
> index 50c610c448ba..17034e5b11e7 100644
> --- a/testcases/kernel/syscalls/fallocate/fallocate05.c
> +++ b/testcases/kernel/syscalls/fallocate/fallocate05.c
> @@ -17,7 +17,7 @@
>  #include "lapi/fallocate.h"
>
>  #define MNTPOINT "mntpoint"
> -#define FALLOCATE_SIZE 8192
> +#define FALLOCATE_SIZE (1024*1024)
>  #define TESTED_FLAGS "fallocate(FALLOC_FL_PUNCH_HOLE |
> FALLOC_FL_KEEP_SIZE)"
>
>  static int fd;
> --
> 1.8.3.1
>
>

--=20
Regards,
Li Wang

--000000000000e45b0e0597ac6c29
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Jan,</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Nov 19, 2019 at 12:08 AM Jan Stancek &lt=
;<a href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">write() returnin=
g ENOSPC doesn&#39;t guarantee that filesystem after<br>
some internal book-keeping, flushing, finishing transactions, etc.<br>
won&#39;t still find some extra space.<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">Thanks for the patch=
, I have drafted a similar one but you sent out first :).</div><br></div><d=
iv><div class=3D"gmail_default" style=3D"">Another patch I was thinking is =
to enhance the tst_fill_fs routine, which as Eric suggested,=C2=A0makes=C2=
=A0more reliably to get to a full filesystem. Something like what xfstest d=
oes to cut the trial write size in half and try again until the size is les=
s than the filesystem block size.</div><div class=3D"gmail_default" style=
=3D""><br></div><div class=3D"gmail_default" style=3D"">Comments?</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">--- a/lib/tst_fill_fs.c<br>+++ b/l=
ib/tst_fill_fs.c<br>@@ -6,6 +6,7 @@<br>=C2=A0#include &lt;errno.h&gt;<br>=
=C2=A0#include &lt;stdio.h&gt;<br>=C2=A0#include &lt;stdlib.h&gt;<br>+#incl=
ude &lt;sys/statvfs.h&gt;<br>=C2=A0<br>=C2=A0#define TST_NO_DEFAULT_MAIN<br=
>=C2=A0#include &quot;tst_test.h&quot;<br>@@ -19,6 +20,8 @@ void tst_fill_f=
s(const char *path, int verbose)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len;=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssize_t ret;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int fd;<br>+ =C2=A0 =C2=A0 =C2=A0 struct statvfs fi;<br>+ =C2=A0 =C2=A0 =
=C2=A0 statvfs(path, &amp;fi);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 for=
 (;;) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D =
random() % (1024 * 102400);<br>@@ -41,6 +44,12 @@ void tst_fill_fs(const ch=
ar *path, int verbose)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D write(fd, buf, MIN(len, sizeof(b=
uf)));<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (errno =3D=3D ENOSPC) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 len /=3D 2;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt;=3D fi.f_bsize)<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>+<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_CLOSE(fd);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (errno !=3D ENOSPC)<br></div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Increase FALLOCATE_SIZE to minimize chance of hitting sporadic<br>
failures when that happens.<br>
<br>
Thanks to Carlos Maiolino and Eric Sandeen for their comments<br>
and suggestions.<br>
<br>
Fixes #610<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br></blockquote><div><span class=
=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a hr=
ef=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div>=
<span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0testcases/kernel/syscalls/fallocate/fallocate05.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/fallocate/fallocate05.c b/testcases/=
kernel/syscalls/fallocate/fallocate05.c<br>
index 50c610c448ba..17034e5b11e7 100644<br>
--- a/testcases/kernel/syscalls/fallocate/fallocate05.c<br>
+++ b/testcases/kernel/syscalls/fallocate/fallocate05.c<br>
@@ -17,7 +17,7 @@<br>
=C2=A0#include &quot;lapi/fallocate.h&quot;<br>
<br>
=C2=A0#define MNTPOINT &quot;mntpoint&quot;<br>
-#define FALLOCATE_SIZE 8192<br>
+#define FALLOCATE_SIZE (1024*1024)<br>
=C2=A0#define TESTED_FLAGS &quot;fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL=
_KEEP_SIZE)&quot;<br>
<br>
=C2=A0static int fd;<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000e45b0e0597ac6c29--


--===============1476583102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1476583102==--

