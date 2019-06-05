Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BC47235647
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:40:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B8663EA6CB
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:40:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1849C3EA603
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:40:22 +0200 (CEST)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F108E600A8C
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:40:22 +0200 (CEST)
Received: by mail-vk1-f196.google.com with SMTP id r23so4019647vkd.12
 for <ltp@lists.linux.it>; Tue, 04 Jun 2019 22:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qID9f+l0Rt54WPywJ/GKZiPGUB/L42uyt11662QftSA=;
 b=h3rS1qyGpiaFJUsoqA5JuKRcdopTWU9mUq27Q2Z96wh/4rfa/y7MvgHhjLBAMhzpM7
 okcPEucY6PjvJxUXicV+NYc9zoU/0cpIY0rL7VBX/9WcfcmvDX3hHOShAjHPMbv4/Qvf
 qQ2Lg10zM23EHGvua/6X4mZQiZRGWNii+tpWS7SMBnBsbyI5KLw4NoWf3BFd03t2uGwc
 eyrR/zip+xolWcCWGjwY9ORSLO4e67MLV/OHUllSAHPsspMn7N6mmLqQjaP38a6Hytsz
 sqkjVxjMt7kf8gfertqENyzdsrDerPzHSrK9ytVFa1wOBPjX1I3AYe7IX0fnOvNlHXjO
 HBLw==
X-Gm-Message-State: APjAAAX3+0v31pCLi0zlv0thUWVjq1k0HZrdxRFA4pLe57XKN/Es/1BR
 n1TLTMOpTG7NXUS4NaJVyQims66E6jBBllfsiSSRGw==
X-Google-Smtp-Source: APXvYqxwQHTY3dbVE+9vUV66AkHhyPxgxCQUSWAVeChI9awA7Cqwn2Mz1HyfgBqmf3BPHfKdbaT+paWFx9Dr09IGEQw=
X-Received: by 2002:a1f:56c3:: with SMTP id k186mr10209708vkb.24.1559713219209; 
 Tue, 04 Jun 2019 22:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
 <20190528141214.18752-1-xzhou@redhat.com>
In-Reply-To: <20190528141214.18752-1-xzhou@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 5 Jun 2019 13:40:07 +0800
Message-ID: <CAEemH2c7P7DGZP97z+TnNoRx9=Dhju51vPTH3S2JeUjU3jCRMQ@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v6 1/4] lib/tst_ioctl.c: add helper tst_fibmap
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1230460584=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1230460584==
Content-Type: multipart/alternative; boundary="00000000000062115d058a8d0844"

--00000000000062115d058a8d0844
Content-Type: text/plain; charset="UTF-8"

On Tue, May 28, 2019 at 10:13 PM Murphy Zhou <xzhou@redhat.com> wrote:

> To check if FIBMAP ioctl is supported on the filesystem we are
> testing on. It also can check the support status of specific
> files, but that may not needed for now.
>
> Signed-off-by: Murphy Zhou <xzhou@redhat.com>
> ---
> v6:
>   Modify make_swapfile() to check mkswap support status safely
>   Remove whitelist
>   Remove BTRFS EINVAL check
>   Check mkswap status before testing swapon in helper
>   If swapon pass, following swapoff failure will fail the whole test and
> break
>   Also modify swapoff02 to remove whitelist completely
> v5:
>   Split to 4 patches
>   Only take one filename parameter in tst_fibmap
>   Add helper is_swap_supported to check swap operation support status
>   Test fibmap/swapon and swapoff operation in the helper
>   Keep NFS/TMPFS whitelist
>   Keep BTRFS EINVAL handling logic, except above 2 situation:
>     if swapon fails and fibmap is not supported, tst_brk with TCONF
>     if swapon fails and fibmap is supported, tst_brk with TFAIL
>   If swapon test pass in the helper, test swapoff similarly
>   Put is_swap_supported helper in libswapon, link swapoff binaries to it
>   Mute a sprintf filaname wanrning by the way
> v4:
>   Fail softly if FIBMAP nit supported, instead of skip entire testcase
> v3:
>   Fix fs_type undeclared in swapoff01.c
> v2:
>   Test FIBMAP instead of fstype whitelist
>
>  include/tst_fs.h |  5 +++++
>  lib/tst_ioctl.c  | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 lib/tst_ioctl.c
>
> diff --git a/include/tst_fs.h b/include/tst_fs.h
> index ebca065c6..6d03371ec 100644
> --- a/include/tst_fs.h
> +++ b/include/tst_fs.h
> @@ -178,6 +178,11 @@ const char **tst_get_supported_fs_types(void);
>   */
>  void tst_fill_fs(const char *path, int verbose);
>
> +/*
> + * test if FIBMAP ioctl is supported
> + */
> +int tst_fibmap(const char *filename);
> +
>  #ifdef TST_TEST_H__
>  static inline long tst_fs_type(const char *path)
>  {
> diff --git a/lib/tst_ioctl.c b/lib/tst_ioctl.c
> new file mode 100644
> index 000000000..38aa937db
> --- /dev/null
> +++ b/lib/tst_ioctl.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <errno.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/ioctl.h>
> +#include <linux/fs.h>
> +
> +#define TST_NO_DEFAULT_MAIN
> +
> +#include "tst_test.h"
> +
> +int tst_fibmap(const char *filename)
> +{
> +       /* test if FIBMAP ioctl is supported */
> +       int fd, block = 0;
> +
> +       fd = open(filename, O_RDWR | O_CREAT, 0666);
> +       if (fd < 0) {
> +               tst_res(TWARN | TERRNO,
> +                        "open(%s, O_RDWR | O_CREAT, 0666) failed",
> filename);
> +               return 1;
>

what about return -1 here?  Calling this tst_fibmap() in otherplace, we
don't know that
the reruened 1 means a open/close() fail or FIBMAP ioctl is NOT supported.

> +       }
> +
> +       if (ioctl(fd, FIBMAP, &block)) {
> +               tst_res(TINFO, "FIBMAP ioctl is NOT supported");
> +               close(fd);
> +               return 1;
> +       }
> +       tst_res(TINFO, "FIBMAP ioctl is supported");
> +
> +       if (close(fd)) {
> +               tst_res(TWARN | TERRNO, "close(fd) failed");
> +               return 1;
>

return -1;

> +       }
> +       return 0;
> +}
> --
> 2.21.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--00000000000062115d058a8d0844
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, May 28, 2019 at 10:13 PM Murphy Zhou &lt;<a=
 href=3D"mailto:xzhou@redhat.com">xzhou@redhat.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">To check if FIBMAP ioctl =
is supported on the filesystem we are<br>
testing on. It also can check the support status of specific<br>
files, but that may not needed for now.<br>
<br>
Signed-off-by: Murphy Zhou &lt;<a href=3D"mailto:xzhou@redhat.com" target=
=3D"_blank">xzhou@redhat.com</a>&gt;<br>
---<br>
v6:<br>
=C2=A0 Modify make_swapfile() to check mkswap support status safely<br>
=C2=A0 Remove whitelist<br>
=C2=A0 Remove BTRFS EINVAL check<br>
=C2=A0 Check mkswap status before testing swapon in helper<br>
=C2=A0 If swapon pass, following swapoff failure will fail the whole test a=
nd break<br>
=C2=A0 Also modify swapoff02 to remove whitelist completely<br>
v5:<br>
=C2=A0 Split to 4 patches<br>
=C2=A0 Only take one filename parameter in tst_fibmap<br>
=C2=A0 Add helper is_swap_supported to check swap operation support status<=
br>
=C2=A0 Test fibmap/swapon and swapoff operation in the helper<br>
=C2=A0 Keep NFS/TMPFS whitelist<br>
=C2=A0 Keep BTRFS EINVAL handling logic, except above 2 situation:<br>
=C2=A0 =C2=A0 if swapon fails and fibmap is not supported, tst_brk with TCO=
NF<br>
=C2=A0 =C2=A0 if swapon fails and fibmap is supported, tst_brk with TFAIL<b=
r>
=C2=A0 If swapon test pass in the helper, test swapoff similarly<br>
=C2=A0 Put is_swap_supported helper in libswapon, link swapoff binaries to =
it<br>
=C2=A0 Mute a sprintf filaname wanrning by the way<br>
v4:<br>
=C2=A0 Fail softly if FIBMAP nit supported, instead of skip entire testcase=
<br>
v3:<br>
=C2=A0 Fix fs_type undeclared in swapoff01.c<br>
v2:<br>
=C2=A0 Test FIBMAP instead of fstype whitelist<br>
<br>
=C2=A0include/tst_fs.h |=C2=A0 5 +++++<br>
=C2=A0lib/tst_ioctl.c=C2=A0 | 37 +++++++++++++++++++++++++++++++++++++<br>
=C2=A02 files changed, 42 insertions(+)<br>
=C2=A0create mode 100644 lib/tst_ioctl.c<br>
<br>
diff --git a/include/tst_fs.h b/include/tst_fs.h<br>
index ebca065c6..6d03371ec 100644<br>
--- a/include/tst_fs.h<br>
+++ b/include/tst_fs.h<br>
@@ -178,6 +178,11 @@ const char **tst_get_supported_fs_types(void);<br>
=C2=A0 */<br>
=C2=A0void tst_fill_fs(const char *path, int verbose);<br>
<br>
+/*<br>
+ * test if FIBMAP ioctl is supported<br>
+ */<br>
+int tst_fibmap(const char *filename);<br>
+<br>
=C2=A0#ifdef TST_TEST_H__<br>
=C2=A0static inline long tst_fs_type(const char *path)<br>
=C2=A0{<br>
diff --git a/lib/tst_ioctl.c b/lib/tst_ioctl.c<br>
new file mode 100644<br>
index 000000000..38aa937db<br>
--- /dev/null<br>
+++ b/lib/tst_ioctl.c<br>
@@ -0,0 +1,37 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+<br>
+#include &lt;errno.h&gt;<br>
+#include &lt;stdio.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
+#include &lt;sys/ioctl.h&gt;<br>
+#include &lt;linux/fs.h&gt;<br>
+<br>
+#define TST_NO_DEFAULT_MAIN<br>
+<br>
+#include &quot;tst_test.h&quot;<br>
+<br>
+int tst_fibmap(const char *filename)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* test if FIBMAP ioctl is supported */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, block =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D open(filename, O_RDWR | O_CREAT, 0666);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TWARN | TER=
RNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;open(%s, O_RDWR | O_CREAT, 0666) failed&quot;, filename);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br></bloc=
kquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">what about return -1 here?=C2=A0 Calling this tst_fibmap() in otherplace,=
 we don&#39;t know that</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">the reruened 1 means a open/close() fail or FIBMAP ioctl is NOT su=
pported.</div><div class=3D"gmail_default" style=3D"font-size:small"></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ioctl(fd, FIBMAP, &amp;block)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quo=
t;FIBMAP ioctl is NOT supported&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;FIBMAP ioctl is supported&=
quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (close(fd)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TWARN | TER=
RNO, &quot;close(fd) failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br></bloc=
kquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">return -1;</div><div class=3D"gmail_default" style=3D"font-size:small"></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
-- <br>
2.21.0<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000062115d058a8d0844--

--===============1230460584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1230460584==--
