Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E1B3B450
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 14:04:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC7253EB02C
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 14:04:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F414F3EB014
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 14:04:30 +0200 (CEST)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EB3DB600B03
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 14:04:30 +0200 (CEST)
Received: by mail-ua1-f68.google.com with SMTP id n2so2902223uad.8
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 05:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K7KO5MAKiu4X5iap/+WKfamfTIMvUMA38S6vMr6xq7w=;
 b=rGUutx68ClThDAZQJXnRvipNLLekfC58I8WmoWqFxk6TWi3QPtI9RCME3wy7FRZwO2
 eSlG16W05uzlLLSEz++Sruuraj4yKbDMRuBCIYxBiHmxYjxwxkCLW0UFaDmVA6cuABsg
 5rmjeRNnF01c8bcf/frJz48g6BEPs0c9rQwCsuXzRZK0UABl+ZVPkn6vzDqHz62eHul+
 D3YNu62BccBdPidA+YQCDIR2YOqE10hFeG/Pylgl41FYiY4Fd8Qvv9guSooGZx5wKhea
 0tmco63jmK5XTnFkvOrUA97v5QMqkciP0+/+SVqbkDlAZikkIDsiuu8Sssf/Sbmc2QIh
 mWlQ==
X-Gm-Message-State: APjAAAXCYOe9J8H2x1NiYa+gGeEcng79IR3QhYEa0sdFgh+yNLkUNms2
 FEyYRPH6UlpMUFVehONtHx2uXTJaYm6/vrFlnSIwsA==
X-Google-Smtp-Source: APXvYqxL5A/wyHCcEB88u2sxoOgZgQmC92Chdc8hiE6FwJW5jjiX0lZXdhWbPCZeFRNPxmmrTotaQvoaugBhxPkWOBw=
X-Received: by 2002:ab0:4147:: with SMTP id j65mr34230486uad.142.1560168267006; 
 Mon, 10 Jun 2019 05:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Mon, 10 Jun 2019 20:04:15 +0800
Message-ID: <CAEemH2eLToM0D+XwHop5jzsfCb3psGbtM7ygZ1Zgm9ZN0UhzYg@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v4] syscalls/sync_file_range: add partial file
	sync test-cases
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
Content-Type: multipart/mixed; boundary="===============0701223111=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0701223111==
Content-Type: multipart/alternative; boundary="0000000000005859dc058af6fbcc"

--0000000000005859dc058af6fbcc
Content-Type: text/plain; charset="UTF-8"

Hi Sumit,

On Mon, Jun 10, 2019 at 6:14 PM Sumit Garg <sumit.garg@linaro.org> wrote:

> Add partial file sync tests as part of sync_file_range02 test-case.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changes in v4:
> vfat FS doesn't support sparse files. So handle this via pre-filling the
> test file in case of "test3".
>
> Changes in v3:
> 1. Add upper bound check for synced size to device.
> 2. Refactor tests for more code reuse.
> 3. Add another test to check sync over partial write.
>
> Changes in v2:
> 1. Do full file write instead of partial and test sync partial file.
>
>  .../syscalls/sync_file_range/sync_file_range02.c   | 53
> ++++++++++++++++++----
>  1 file changed, 43 insertions(+), 10 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> index 82d77f7..9454a56 100644
> --- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> @@ -22,23 +22,36 @@
>  #include "check_sync_file_range.h"
>
>  #define MNTPOINT               "mnt_point"
> -#define FNAME          MNTPOINT"/test"
> -#define FILE_SIZE_MB   32
> -#define FILE_SIZE (FILE_SIZE_MB * TST_MB)
> +#define FNAME1                 MNTPOINT"/test1"
> +#define FNAME2                 MNTPOINT"/test2"
> +#define FNAME3                 MNTPOINT"/test3"
> +#define FILE_SZ_MB             32
> +#define FILE_SZ                        (FILE_SZ_MB * TST_MB)
>  #define MODE                   0644
>
> -static void verify_sync_file_range(void)
> +struct testcase {
> +       char *fname;
> +       off64_t sync_off;
> +       off64_t sync_size;
> +       size_t exp_sync_size;
> +       off64_t write_off;
> +       size_t write_size_mb;
> +};
> +
> +static void verify_sync_file_range(struct testcase *tc)
>  {
>         int fd;
>         unsigned long written;
>
> -       fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
> +       fd = SAFE_OPEN(tc->fname, O_RDWR|O_CREAT, MODE);
> +
> +       lseek(fd, tc->write_off, SEEK_SET);
>
>         tst_dev_bytes_written(tst_device->dev);
>
> -       tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
> +       tst_fill_fd(fd, 0, TST_MB, tc->write_size_mb);
>
> -       TEST(sync_file_range(fd, 0, FILE_SIZE,
> +       TEST(sync_file_range(fd, tc->sync_off, tc->sync_size,
>                              SYNC_FILE_RANGE_WAIT_BEFORE |
>                              SYNC_FILE_RANGE_WRITE |
>                              SYNC_FILE_RANGE_WAIT_AFTER));
> @@ -50,23 +63,43 @@ static void verify_sync_file_range(void)
>
>         SAFE_CLOSE(fd);
>
> -       if (written >= FILE_SIZE)
> +       if ((written >= tc->exp_sync_size) &&
> +           (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
>                 tst_res(TPASS, "Test file range synced to device");
>         else
> -               tst_res(TFAIL, "Synced %li, expected %i", written,
> FILE_SIZE);
> +               tst_res(TFAIL, "Synced %li, expected %li", written,
> +                       tc->exp_sync_size);
> +}
> +
> +static struct testcase testcases[] = {
> +       { FNAME1, 0, FILE_SZ, FILE_SZ, 0, FILE_SZ_MB },
> +       { FNAME2, FILE_SZ/4, FILE_SZ/2, FILE_SZ/2, 0, FILE_SZ_MB },
> +       { FNAME3, FILE_SZ/4, FILE_SZ/2, FILE_SZ/4, FILE_SZ/2, FILE_SZ_MB/4
> },
> +};
> +
> +static void run(unsigned int i)
> +{
> +       verify_sync_file_range(&testcases[i]);
>  }
>
>  static void setup(void)
>  {
>         if (!check_sync_file_range())
>                 tst_brk(TCONF, "sync_file_range() not supported");
>

Reviewed-by: Li Wang <liwang@redhat.com>

That'd be great if we have code comments here, anyway the patch makes sense
to me.

/*
 * vfat FS doesn't support sparse files. So handle this via pre-filling the
 * test file in case of "test3".
*/

+
> +       if (!strcmp(tst_device->fs_type, "vfat")) {
> +               tst_res(TINFO, "Pre-filling file");
> +               tst_fill_file(FNAME3, 0, TST_MB, FILE_SZ_MB);
> +               sync();
> +       }
>  }
>
>  static struct tst_test test = {
> +       .tcnt = ARRAY_SIZE(testcases),
>         .needs_root = 1,
>         .mount_device = 1,
>         .all_filesystems = 1,
>         .mntpoint = MNTPOINT,
>         .setup = setup,
> -       .test_all = verify_sync_file_range,
> +       .test = run,
>  };
> --
> 2.7.4
>
>

-- 
Regards,
Li Wang

--0000000000005859dc058af6fbcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Sumit,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jun 10, 2019 at 6:14 PM Sumit Garg &l=
t;<a href=3D"mailto:sumit.garg@linaro.org">sumit.garg@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add partial=
 file sync tests as part of sync_file_range02 test-case.<br>
<br>
Signed-off-by: Sumit Garg &lt;<a href=3D"mailto:sumit.garg@linaro.org" targ=
et=3D"_blank">sumit.garg@linaro.org</a>&gt;<br>
---<br>
<br>
Changes in v4:<br>
vfat FS doesn&#39;t support sparse files. So handle this via pre-filling th=
e<br>
test file in case of &quot;test3&quot;.<br>
<br>
Changes in v3:<br>
1. Add upper bound check for synced size to device.<br>
2. Refactor tests for more code reuse.<br>
3. Add another test to check sync over partial write.<br>
<br>
Changes in v2:<br>
1. Do full file write instead of partial and test sync partial file.<br>
<br>
=C2=A0.../syscalls/sync_file_range/sync_file_range02.c=C2=A0 =C2=A0| 53 +++=
+++++++++++++++----<br>
=C2=A01 file changed, 43 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c =
b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c<br>
index 82d77f7..9454a56 100644<br>
--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c<br>
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c<br>
@@ -22,23 +22,36 @@<br>
=C2=A0#include &quot;check_sync_file_range.h&quot;<br>
<br>
=C2=A0#define MNTPOINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;mnt_point&quot;<br>
-#define FNAME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MNTPOINT&quot;/test&quot;<=
br>
-#define FILE_SIZE_MB=C2=A0 =C2=A032<br>
-#define FILE_SIZE (FILE_SIZE_MB * TST_MB)<br>
+#define FNAME1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MNTPOINT&quot;/test1&quot;<br>
+#define FNAME2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MNTPOINT&quot;/test2&quot;<br>
+#define FNAME3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MNTPOINT&quot;/test3&quot;<br>
+#define FILE_SZ_MB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A032<br>
+#define FILE_SZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (FILE_SZ_MB * TST_MB)<br>
=C2=A0#define MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00644<br>
<br>
-static void verify_sync_file_range(void)<br>
+struct testcase {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *fname;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t sync_off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t sync_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t exp_sync_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t write_off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t write_size_mb;<br>
+};<br>
+<br>
+static void verify_sync_file_range(struct testcase *tc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long written;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D SAFE_OPEN(tc-&gt;fname, O_RDWR|O_CREAT, =
MODE);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek(fd, tc-&gt;write_off, SEEK_SET);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_dev_bytes_written(tst_device-&gt;dev);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_fill_fd(fd, 0, TST_MB, tc-&gt;write_size_mb=
);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(sync_file_range(fd, 0, FILE_SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(sync_file_range(fd, tc-&gt;sync_off, tc-&g=
t;sync_size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYNC_FILE_RANGE_WAIT_BEFORE |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYNC_FILE_RANGE_WRITE |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYNC_FILE_RANGE_WAIT_AFTER));<br>
@@ -50,23 +63,43 @@ static void verify_sync_file_range(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_CLOSE(fd);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (written &gt;=3D FILE_SIZE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((written &gt;=3D tc-&gt;exp_sync_size) &amp=
;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(written &lt;=3D (tc-&gt;exp_sync=
_size + tc-&gt;exp_sync_size/10)))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quo=
t;Test file range synced to device&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;Synced %li, expected %i&quot;, written, FILE_SIZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;Synced %li, expected %li&quot;, written,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tc-&gt;exp_sync_size);<br>
+}<br>
+<br>
+static struct testcase testcases[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ FNAME1, 0, FILE_SZ, FILE_SZ, 0, FILE_SZ_MB },=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ FNAME2, FILE_SZ/4, FILE_SZ/2, FILE_SZ/2, 0, F=
ILE_SZ_MB },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ FNAME3, FILE_SZ/4, FILE_SZ/2, FILE_SZ/4, FILE=
_SZ/2, FILE_SZ_MB/4 },<br>
+};<br>
+<br>
+static void run(unsigned int i)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0verify_sync_file_range(&amp;testcases[i]);<br>
=C2=A0}<br>
<br>
=C2=A0static void setup(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!check_sync_file_range())<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TCONF, &quo=
t;sync_file_range() not supported&quot;);<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li W=
ang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">That=
&#39;d be great if we have code comments here, anyway the patch makes sense=
 to me.</div></div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">/*=C2=A0=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0* vfa=
t FS doesn&#39;t support sparse files. So handle this via pre-filling the</=
div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0* test fil=
e in case of &quot;test3&quot;.=C2=A0</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">*/</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(tst_device-&gt;fs_type, &quot;vfat&=
quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quo=
t;Pre-filling file&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_fill_file(FNAME=
3, 0, TST_MB, FILE_SZ_MB);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sync();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
=C2=A0static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.tcnt =3D ARRAY_SIZE(testcases),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .needs_root =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .mount_device =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .all_filesystems =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .mntpoint =3D MNTPOINT,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D verify_sync_file_range,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test =3D run,<br>
=C2=A0};<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000005859dc058af6fbcc--

--===============0701223111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0701223111==--
