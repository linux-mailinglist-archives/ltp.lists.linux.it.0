Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939735EAC
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:07:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F25D83EA6C0
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:07:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1BDB53EA3C0
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:07:25 +0200 (CEST)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2B5A91000EB5
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:07:20 +0200 (CEST)
Received: by mail-ua1-f67.google.com with SMTP id p5so3382268uar.11
 for <ltp@lists.linux.it>; Wed, 05 Jun 2019 07:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjYKObwlit6yiKeGgOWVXyMJCDEnf0kr84IZE0FqZGc=;
 b=Wuo+giW51mNw5/uXlS2iEtXm3YrEvb4F6sJN+wuq0qKOaSQyfpchN34HuHXDmflico
 zK385N38GQDLUjogpJZZO6se4CD96BeUEm2MDYnXdZwg1L4O1Z4mStvtiMJzY/oTukJK
 gjz8yH+sSbN4ymUUY41Ckf4wA+8haa7PLaVjFimFd+u/mAzoaImuaNoxSFt4bWS6+9De
 sDizHr2DiU3CzjKWRWBrT2Izi+le6gF/3Dz+E6QytLcTYVadAShi9WUQaYbNOzSJ54pZ
 sf34MQHRhZDKU+4NhXH7z6iQDSZX5VwYapUeYscgpu43enSnHlAGp3OPWNVqHJh5FPAH
 nNDQ==
X-Gm-Message-State: APjAAAVFwxFft3neo6a8KgRO7F2eP4s+GWHr+5oWdQkneQZgS/UT/4b0
 ow7b8gwHIDHkBPrmyq8GSHjdxVSPDqhDoMKB2mqkhXP29nZlSQ==
X-Google-Smtp-Source: APXvYqzxCLvJyzOoaINJd/hi9qcSbM/DPRPyBW70L5DIxgfV7sdz0x8KdEArne/caBCvG7cXLXloOZ4CNX6PJeSsXSg=
X-Received: by 2002:ab0:67c3:: with SMTP id w3mr17107818uar.68.1559743641960; 
 Wed, 05 Jun 2019 07:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190605072126.19856-1-pvorel@suse.cz>
 <20190605072126.19856-2-pvorel@suse.cz>
In-Reply-To: <20190605072126.19856-2-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 5 Jun 2019 22:07:09 +0800
Message-ID: <CAEemH2doAQ7=b-zutgHnY469rz-JThw0E_3b4o79zx+n2-uX_A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH 2/2] inotify: Add SAFE_MYINOTIFY_ADD_WATCH() helper
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
Content-Type: multipart/mixed; boundary="===============1193946000=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1193946000==
Content-Type: multipart/alternative; boundary="000000000000b89986058a941df8"

--000000000000b89986058a941df8
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 5, 2019 at 3:22 PM Petr Vorel <pvorel@suse.cz> wrote:

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> with reap_wd defined in inotify.h there could be also
> SAFE_MYINOTIFY_RM_WATCH().
>
> Kind regards,
> Petr
> ---
>  testcases/kernel/syscalls/inotify/inotify.h   | 13 +++++++++++++
>  testcases/kernel/syscalls/inotify/inotify01.c |  9 ++-------
>  testcases/kernel/syscalls/inotify/inotify02.c |  9 ++-------
>  testcases/kernel/syscalls/inotify/inotify03.c |  7 +------
>  testcases/kernel/syscalls/inotify/inotify04.c | 13 ++-----------
>  testcases/kernel/syscalls/inotify/inotify05.c |  8 +-------
>  testcases/kernel/syscalls/inotify/inotify07.c |  8 ++------
>  testcases/kernel/syscalls/inotify/inotify08.c | 11 +++--------
>  testcases/kernel/syscalls/inotify/inotify09.c |  4 +---
>  9 files changed, 27 insertions(+), 55 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/inotify/inotify.h
> b/testcases/kernel/syscalls/inotify/inotify.h
> index c82a7e75e..57669bc15 100644
> --- a/testcases/kernel/syscalls/inotify/inotify.h
> +++ b/testcases/kernel/syscalls/inotify/inotify.h
> @@ -50,4 +50,17 @@ static inline int safe_myinotify_init(const char *file,
> const int lineno, int fd
>  #define SAFE_MYINOTIFY_INIT1(flags) \
>         safe_myinotify_init(__FILE__, __LINE__, myinotify_init1(flags))
>
> +static inline int safe_myinotify_watch(const char *file, const int
> lineno, int wd, int fd, const char* fname, const char* mask)
> +{
> +       if (wd < 0) {
> +               tst_brk(TBROK | TERRNO,
> +                       "%s:%d: inotify_add_watch (%d, %s, %s) failed.",
> +                       file, lineno, fd, fname, mask);
> +       }
> +       return wd;
> +}
> +
> +#define SAFE_MYINOTIFY_ADD_WATCH(fd, pathname, mask)   \
> +       safe_myinotify_watch(__FILE__, __LINE__, myinotify_add_watch(fd,
> pathname, mask), fd, pathname, #mask)
> +
>  #endif /* _INOTIFY_H */
> diff --git a/testcases/kernel/syscalls/inotify/inotify01.c
> b/testcases/kernel/syscalls/inotify/inotify01.c
> index f08a75dcf..eee98b4fa 100644
> --- a/testcases/kernel/syscalls/inotify/inotify01.c
> +++ b/testcases/kernel/syscalls/inotify/inotify01.c
> @@ -169,13 +169,8 @@ static void setup(void)
>
>         fd_notify = SAFE_MYINOTIFY_INIT();
>
> -       if ((wd = myinotify_add_watch(fd_notify, fname, IN_ALL_EVENTS)) <
> 0) {
> -               tst_brk(TBROK | TERRNO,
> -                       "inotify_add_watch (%d, %s, IN_ALL_EVENTS) failed",
> -                       fd_notify, fname);
> -               reap_wd = 1;
>

If test exit with TBROK the reap_wd will never get a chance to set as 1,
and the cleanup() also make no sense in tst_brk() calling.

> -       };

-
> +       wd = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, fname, IN_ALL_EVENTS);
> +       reap_wd = 1;
>

Even wrap into safe macro the problem is still there, the 'reap_wd = 1;'
make no sense to the whole test.

 }
>
>  static void cleanup(void)
> diff --git a/testcases/kernel/syscalls/inotify/inotify02.c
> b/testcases/kernel/syscalls/inotify/inotify02.c
> index ca70b4e9e..21e7fb3e8 100644
> --- a/testcases/kernel/syscalls/inotify/inotify02.c
> +++ b/testcases/kernel/syscalls/inotify/inotify02.c
> @@ -236,12 +236,8 @@ static void setup(void)
>  {
>         fd_notify = SAFE_MYINOTIFY_INIT();
>
> -       if ((wd = myinotify_add_watch(fd_notify, ".", IN_ALL_EVENTS)) < 0)
> {
> -               tst_brk(TBROK | TERRNO,
> -                        "inotify_add_watch (%d, \".\", IN_ALL_EVENTS)
> failed",
> -                        fd_notify);
> -               reap_wd = 1;

-       };
> +       wd = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, ".", IN_ALL_EVENTS);
> +       reap_wd = 1;


here as well.

>  }
>
>  static void cleanup(void)
> @@ -249,7 +245,6 @@ static void cleanup(void)
>         if (reap_wd && myinotify_rm_watch(fd_notify, wd) < 0) {
>                 tst_res(TWARN,
>                         "inotify_rm_watch (%d, %d) failed,", fd_notify,
> wd);
> -
>         }
>
>         if (fd_notify > 0)
> diff --git a/testcases/kernel/syscalls/inotify/inotify03.c
> b/testcases/kernel/syscalls/inotify/inotify03.c
> index 772623125..7363df01b 100644
> --- a/testcases/kernel/syscalls/inotify/inotify03.c
> +++ b/testcases/kernel/syscalls/inotify/inotify03.c
> @@ -77,12 +77,7 @@ void verify_inotify(void)
>         SAFE_MOUNT(tst_device->dev, mntpoint, tst_device->fs_type, 0,
> NULL);
>         mount_flag = 1;
>
> -       wd = myinotify_add_watch(fd_notify, fname, IN_ALL_EVENTS);
> -       if (wd < 0) {
> -               tst_brk(TBROK | TERRNO,
> -                       "inotify_add_watch (%d, %s, IN_ALL_EVENTS)
> failed.",
> -                       fd_notify, fname);
> -       }
> +       wd = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, fname, IN_ALL_EVENTS);
>
>         event_set[test_cnt] = IN_UNMOUNT;
>         test_cnt++;
> diff --git a/testcases/kernel/syscalls/inotify/inotify04.c
> b/testcases/kernel/syscalls/inotify/inotify04.c
> index 6adb41701..2cc20fb61 100644
> --- a/testcases/kernel/syscalls/inotify/inotify04.c
> +++ b/testcases/kernel/syscalls/inotify/inotify04.c
> @@ -106,19 +106,10 @@ void verify_inotify(void)
>         SAFE_MKDIR(TEST_DIR, 00700);
>         close(SAFE_CREAT(TEST_FILE, 00600));
>
> -       wd_dir = myinotify_add_watch(fd_notify, TEST_DIR, IN_ALL_EVENTS);
> -       if (wd_dir == -1) {
> -               tst_brk(TBROK | TERRNO,
> -                       "inotify_add_watch(%d, \"%s\", IN_ALL_EVENTS) [1]
> failed",
> -                       fd_notify, TEST_DIR);
> -       }
> +       wd_dir = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, TEST_DIR,
> IN_ALL_EVENTS);
>         reap_wd_dir = 1;
>
> -       wd_file = myinotify_add_watch(fd_notify, TEST_FILE, IN_ALL_EVENTS);
> -       if (wd_file == -1)
> -               tst_brk(TBROK | TERRNO,
> -                       "inotify_add_watch(%d, \"%s\", IN_ALL_EVENTS) [2]
> failed",
> -                       fd_notify, TEST_FILE);
> +       wd_file = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, TEST_FILE,
> IN_ALL_EVENTS);
>         reap_wd_file = 1;
>
>         SAFE_RMDIR(TEST_DIR);
> diff --git a/testcases/kernel/syscalls/inotify/inotify05.c
> b/testcases/kernel/syscalls/inotify/inotify05.c
> index b5813b25b..fa45d09bf 100644
> --- a/testcases/kernel/syscalls/inotify/inotify05.c
> +++ b/testcases/kernel/syscalls/inotify/inotify05.c
> @@ -145,12 +145,7 @@ static void setup(void)
>
>         fd_notify = SAFE_MYINOTIFY_INIT1(O_NONBLOCK);
>
> -       wd = myinotify_add_watch(fd_notify, fname, IN_ALL_EVENTS);
> -       if (wd < 0) {
> -               tst_brk(TBROK | TERRNO,
> -                       "inotify_add_watch (%d, %s, IN_ALL_EVENTS) failed",
> -                       fd_notify, fname);
> -       };
> +       wd = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, fname, IN_ALL_EVENTS);
>
>         SAFE_FILE_SCANF("/proc/sys/fs/inotify/max_queued_events",
>                         "%d", &max_events);
> @@ -161,7 +156,6 @@ static void cleanup(void)
>         if (fd_notify > 0 && myinotify_rm_watch(fd_notify, wd) == -1) {
>                 tst_res(TWARN | TERRNO, "inotify_rm_watch (%d, %d) failed",
>                         fd_notify, wd);
> -
>         }
>
>         if (fd_notify > 0)
> diff --git a/testcases/kernel/syscalls/inotify/inotify07.c
> b/testcases/kernel/syscalls/inotify/inotify07.c
> index 1111b43bf..7099e8dbf 100644
> --- a/testcases/kernel/syscalls/inotify/inotify07.c
> +++ b/testcases/kernel/syscalls/inotify/inotify07.c
> @@ -168,12 +168,8 @@ static void setup(void)
>         fd_notify = SAFE_MYINOTIFY_INIT1(O_NONBLOCK);
>
>         /* Setup a watch on an overlayfs lower directory */
> -       if ((wd = myinotify_add_watch(fd_notify, DIR_PATH, IN_ALL_EVENTS))
> < 0) {
> -               tst_brk(TBROK | TERRNO,
> -                       "inotify_add_watch (%d, " DIR_PATH ",
> IN_ALL_EVENTS) failed",
> -                       fd_notify);
> -               reap_wd = 1;
> -       };
> +       wd = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, DIR_PATH, IN_ALL_EVENTS);
> +       reap_wd = 1;
>

here as well.

>
>         SAFE_STAT(DIR_PATH, &buf);
>         tst_res(TINFO, DIR_PATH " ino=%lu", buf.st_ino);
> diff --git a/testcases/kernel/syscalls/inotify/inotify08.c
> b/testcases/kernel/syscalls/inotify/inotify08.c
> index ee8e44fe1..73fdf497f 100644
> --- a/testcases/kernel/syscalls/inotify/inotify08.c
> +++ b/testcases/kernel/syscalls/inotify/inotify08.c
> @@ -160,14 +160,9 @@ static void setup(void)
>         fd_notify = SAFE_MYINOTIFY_INIT1(O_NONBLOCK);
>
>         /* Setup a watch on an overlayfs lower file */
> -       if ((wd = myinotify_add_watch(fd_notify, FILE_PATH,
> -                               IN_ATTRIB | IN_OPEN | IN_CLOSE_WRITE)) <
> 0) {
> -               tst_brk(TBROK | TERRNO,
> -                       "inotify_add_watch (%d, " FILE_PATH ", "
> -                       "IN_ATTRIB | IN_OPEN | IN_CLOSE_WRITE) failed",
> -                       fd_notify);
> -               reap_wd = 1;
> -       };
> +       wd = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, FILE_PATH,
> +                               IN_ATTRIB | IN_OPEN | IN_CLOSE_WRITE);
> +       reap_wd = 1;
>

and here.

>
>         SAFE_STAT(FILE_PATH, &buf);
>         tst_res(TINFO, FILE_PATH " ino=%lu, dev=%u:%u", buf.st_ino,
> diff --git a/testcases/kernel/syscalls/inotify/inotify09.c
> b/testcases/kernel/syscalls/inotify/inotify09.c
> index cf2d38f27..e6fed7d9d 100644
> --- a/testcases/kernel/syscalls/inotify/inotify09.c
> +++ b/testcases/kernel/syscalls/inotify/inotify09.c
> @@ -89,9 +89,7 @@ static void verify_inotify(void)
>
>         tst_fzsync_pair_reset(&fzsync_pair, write_seek);
>         while (tst_fzsync_run_a(&fzsync_pair)) {
> -               wd = myinotify_add_watch(inotify_fd, FNAME, IN_MODIFY);
> -               if (wd < 0)
> -                       tst_brk(TBROK | TERRNO, "inotify_add_watch()
> failed.");
> +               wd = SAFE_MYINOTIFY_ADD_WATCH(inotify_fd, FNAME,
> IN_MODIFY);
>
>                 tst_fzsync_start_race_a(&fzsync_pair);
>                 wd = myinotify_rm_watch(inotify_fd, wd);
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

--000000000000b89986058a941df8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jun 5, 2019 at 3:22 PM Petr Vorel &lt;<a hr=
ef=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Petr Vorel &lt;<a=
 href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt;<br=
>
---<br>
Hi,<br>
<br>
with reap_wd defined in inotify.h there could be also SAFE_MYINOTIFY_RM_WAT=
CH().<br>
<br>
Kind regards,<br>
Petr<br>
---<br>
=C2=A0testcases/kernel/syscalls/inotify/inotify.h=C2=A0 =C2=A0| 13 ++++++++=
+++++<br>
=C2=A0testcases/kernel/syscalls/inotify/inotify01.c |=C2=A0 9 ++-------<br>
=C2=A0testcases/kernel/syscalls/inotify/inotify02.c |=C2=A0 9 ++-------<br>
=C2=A0testcases/kernel/syscalls/inotify/inotify03.c |=C2=A0 7 +------<br>
=C2=A0testcases/kernel/syscalls/inotify/inotify04.c | 13 ++-----------<br>
=C2=A0testcases/kernel/syscalls/inotify/inotify05.c |=C2=A0 8 +-------<br>
=C2=A0testcases/kernel/syscalls/inotify/inotify07.c |=C2=A0 8 ++------<br>
=C2=A0testcases/kernel/syscalls/inotify/inotify08.c | 11 +++--------<br>
=C2=A0testcases/kernel/syscalls/inotify/inotify09.c |=C2=A0 4 +---<br>
=C2=A09 files changed, 27 insertions(+), 55 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/inotify/inotify.h b/testcases/kernel=
/syscalls/inotify/inotify.h<br>
index c82a7e75e..57669bc15 100644<br>
--- a/testcases/kernel/syscalls/inotify/inotify.h<br>
+++ b/testcases/kernel/syscalls/inotify/inotify.h<br>
@@ -50,4 +50,17 @@ static inline int safe_myinotify_init(const char *file, =
const int lineno, int fd<br>
=C2=A0#define SAFE_MYINOTIFY_INIT1(flags) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 safe_myinotify_init(__FILE__, __LINE__, myinoti=
fy_init1(flags))<br>
<br>
+static inline int safe_myinotify_watch(const char *file, const int lineno,=
 int wd, int fd, const char* fname, const char* mask)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;%s:%d: inotify_add_watch (%d, %s, %s) failed.&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0file, lineno, fd, fname, mask);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return wd;<br>
+}<br>
+<br>
+#define SAFE_MYINOTIFY_ADD_WATCH(fd, pathname, mask)=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_myinotify_watch(__FILE__, __LINE__, myinot=
ify_add_watch(fd, pathname, mask), fd, pathname, #mask)<br>
+<br>
=C2=A0#endif /* _INOTIFY_H */<br>
diff --git a/testcases/kernel/syscalls/inotify/inotify01.c b/testcases/kern=
el/syscalls/inotify/inotify01.c<br>
index f08a75dcf..eee98b4fa 100644<br>
--- a/testcases/kernel/syscalls/inotify/inotify01.c<br>
+++ b/testcases/kernel/syscalls/inotify/inotify01.c<br>
@@ -169,13 +169,8 @@ static void setup(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_notify =3D SAFE_MYINOTIFY_INIT();<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((wd =3D myinotify_add_watch(fd_notify, fnam=
e, IN_ALL_EVENTS)) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;inotify_add_watch (%d, %s, IN_ALL_EVENTS) failed&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd_notify, fname);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reap_wd =3D 1;<br><=
/blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">If test exit with TBROK the reap_wd will never get a chance to set a=
s 1, and the cleanup() also make no sense in tst_brk() calling.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};</blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wd =3D SAFE_MYINOTIFY_ADD_WATCH(fd_notify, fnam=
e, IN_ALL_EVENTS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reap_wd =3D 1;<br></blockquote><div><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Even wrap into safe m=
acro the problem is still there, the &#39;reap_wd =3D 1;&#39; make no sense=
 to the whole test.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0static void cleanup(void)<br>
diff --git a/testcases/kernel/syscalls/inotify/inotify02.c b/testcases/kern=
el/syscalls/inotify/inotify02.c<br>
index ca70b4e9e..21e7fb3e8 100644<br>
--- a/testcases/kernel/syscalls/inotify/inotify02.c<br>
+++ b/testcases/kernel/syscalls/inotify/inotify02.c<br>
@@ -236,12 +236,8 @@ static void setup(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_notify =3D SAFE_MYINOTIFY_INIT();<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((wd =3D myinotify_add_watch(fd_notify, &quo=
t;.&quot;, IN_ALL_EVENTS)) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;inotify_add_watch (%d, \&quot;.\&quot;, IN_ALL_EVENTS) fai=
led&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fd_notify);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reap_wd =3D 1;</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wd =3D SAFE_MYINOTIFY_ADD_WATCH(fd_notify, &quo=
t;.&quot;, IN_ALL_EVENTS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reap_wd =3D 1;</blockquote><div><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">here as well.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0static void cleanup(void)<br>
@@ -249,7 +245,6 @@ static void cleanup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reap_wd &amp;&amp; myinotify_rm_watch(fd_no=
tify, wd) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TWARN,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;inotify_rm_watch (%d, %d) failed,&quot;, fd_notify, wd);<b=
r>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd_notify &gt; 0)<br>
diff --git a/testcases/kernel/syscalls/inotify/inotify03.c b/testcases/kern=
el/syscalls/inotify/inotify03.c<br>
index 772623125..7363df01b 100644<br>
--- a/testcases/kernel/syscalls/inotify/inotify03.c<br>
+++ b/testcases/kernel/syscalls/inotify/inotify03.c<br>
@@ -77,12 +77,7 @@ void verify_inotify(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_MOUNT(tst_device-&gt;dev, mntpoint, tst_de=
vice-&gt;fs_type, 0, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount_flag =3D 1;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wd =3D myinotify_add_watch(fd_notify, fname, IN=
_ALL_EVENTS);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wd &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;inotify_add_watch (%d, %s, IN_ALL_EVENTS) failed.&quot;,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd_notify, fname);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wd =3D SAFE_MYINOTIFY_ADD_WATCH(fd_notify, fnam=
e, IN_ALL_EVENTS);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 event_set[test_cnt] =3D IN_UNMOUNT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_cnt++;<br>
diff --git a/testcases/kernel/syscalls/inotify/inotify04.c b/testcases/kern=
el/syscalls/inotify/inotify04.c<br>
index 6adb41701..2cc20fb61 100644<br>
--- a/testcases/kernel/syscalls/inotify/inotify04.c<br>
+++ b/testcases/kernel/syscalls/inotify/inotify04.c<br>
@@ -106,19 +106,10 @@ void verify_inotify(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_MKDIR(TEST_DIR, 00700);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(SAFE_CREAT(TEST_FILE, 00600));<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wd_dir =3D myinotify_add_watch(fd_notify, TEST_=
DIR, IN_ALL_EVENTS);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wd_dir =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;inotify_add_watch(%d, \&quot;%s\&quot;, IN_ALL_EVENTS) [1] =
failed&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd_notify, TEST_DIR);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wd_dir =3D SAFE_MYINOTIFY_ADD_WATCH(fd_notify, =
TEST_DIR, IN_ALL_EVENTS);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 reap_wd_dir =3D 1;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wd_file =3D myinotify_add_watch(fd_notify, TEST=
_FILE, IN_ALL_EVENTS);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wd_file =3D=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;inotify_add_watch(%d, \&quot;%s\&quot;, IN_ALL_EVENTS) [2] =
failed&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd_notify, TEST_FILE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wd_file =3D SAFE_MYINOTIFY_ADD_WATCH(fd_notify,=
 TEST_FILE, IN_ALL_EVENTS);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 reap_wd_file =3D 1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_RMDIR(TEST_DIR);<br>
diff --git a/testcases/kernel/syscalls/inotify/inotify05.c b/testcases/kern=
el/syscalls/inotify/inotify05.c<br>
index b5813b25b..fa45d09bf 100644<br>
--- a/testcases/kernel/syscalls/inotify/inotify05.c<br>
+++ b/testcases/kernel/syscalls/inotify/inotify05.c<br>
@@ -145,12 +145,7 @@ static void setup(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_notify =3D SAFE_MYINOTIFY_INIT1(O_NONBLOCK);=
<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wd =3D myinotify_add_watch(fd_notify, fname, IN=
_ALL_EVENTS);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wd &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;inotify_add_watch (%d, %s, IN_ALL_EVENTS) failed&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd_notify, fname);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wd =3D SAFE_MYINOTIFY_ADD_WATCH(fd_notify, fnam=
e, IN_ALL_EVENTS);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_FILE_SCANF(&quot;/proc/sys/fs/inotify/max_=
queued_events&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;%d&quot;, &amp;max_events);<br>
@@ -161,7 +156,6 @@ static void cleanup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd_notify &gt; 0 &amp;&amp; myinotify_rm_wa=
tch(fd_notify, wd) =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TWARN | TER=
RNO, &quot;inotify_rm_watch (%d, %d) failed&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fd_notify, wd);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd_notify &gt; 0)<br>
diff --git a/testcases/kernel/syscalls/inotify/inotify07.c b/testcases/kern=
el/syscalls/inotify/inotify07.c<br>
index 1111b43bf..7099e8dbf 100644<br>
--- a/testcases/kernel/syscalls/inotify/inotify07.c<br>
+++ b/testcases/kernel/syscalls/inotify/inotify07.c<br>
@@ -168,12 +168,8 @@ static void setup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_notify =3D SAFE_MYINOTIFY_INIT1(O_NONBLOCK);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Setup a watch on an overlayfs lower director=
y */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((wd =3D myinotify_add_watch(fd_notify, DIR_=
PATH, IN_ALL_EVENTS)) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;inotify_add_watch (%d, &quot; DIR_PATH &quot;, IN_ALL_EVENT=
S) failed&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd_notify);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reap_wd =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wd =3D SAFE_MYINOTIFY_ADD_WATCH(fd_notify, DIR_=
PATH, IN_ALL_EVENTS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reap_wd =3D 1;<br></blockquote><div><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">here as well.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_STAT(DIR_PATH, &amp;buf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, DIR_PATH &quot; ino=3D%lu&quot;,=
 buf.st_ino);<br>
diff --git a/testcases/kernel/syscalls/inotify/inotify08.c b/testcases/kern=
el/syscalls/inotify/inotify08.c<br>
index ee8e44fe1..73fdf497f 100644<br>
--- a/testcases/kernel/syscalls/inotify/inotify08.c<br>
+++ b/testcases/kernel/syscalls/inotify/inotify08.c<br>
@@ -160,14 +160,9 @@ static void setup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_notify =3D SAFE_MYINOTIFY_INIT1(O_NONBLOCK);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Setup a watch on an overlayfs lower file */<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((wd =3D myinotify_add_watch(fd_notify, FILE=
_PATH,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IN_ATTRIB | IN_OPEN | IN_CLOSE_WRITE)=
) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;inotify_add_watch (%d, &quot; FILE_PATH &quot;, &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;IN_ATTRIB | IN_OPEN | IN_CLOSE_WRITE) failed&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd_notify);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reap_wd =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wd =3D SAFE_MYINOTIFY_ADD_WATCH(fd_notify, FILE=
_PATH,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IN_ATTRIB | IN_OPEN | IN_CLOSE_WRITE)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reap_wd =3D 1;<br></blockquote><div><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">and here.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_STAT(FILE_PATH, &amp;buf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, FILE_PATH &quot; ino=3D%lu, dev=
=3D%u:%u&quot;, buf.st_ino,<br>
diff --git a/testcases/kernel/syscalls/inotify/inotify09.c b/testcases/kern=
el/syscalls/inotify/inotify09.c<br>
index cf2d38f27..e6fed7d9d 100644<br>
--- a/testcases/kernel/syscalls/inotify/inotify09.c<br>
+++ b/testcases/kernel/syscalls/inotify/inotify09.c<br>
@@ -89,9 +89,7 @@ static void verify_inotify(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_fzsync_pair_reset(&amp;fzsync_pair, write_s=
eek);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (tst_fzsync_run_a(&amp;fzsync_pair)) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wd =3D myinotify_ad=
d_watch(inotify_fd, FNAME, IN_MODIFY);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (wd &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TBROK | TERRNO, &quot;inotify_add_watch() failed.&quot;);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wd =3D SAFE_MYINOTI=
FY_ADD_WATCH(inotify_fd, FNAME, IN_MODIFY);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_fzsync_start_ra=
ce_a(&amp;fzsync_pair);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wd =3D myinotify_rm=
_watch(inotify_fd, wd);<br>
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

--000000000000b89986058a941df8--

--===============1193946000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1193946000==--
