Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2631CBF86
	for <lists+linux-ltp@lfdr.de>; Sat,  9 May 2020 11:03:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0EC93C25EB
	for <lists+linux-ltp@lfdr.de>; Sat,  9 May 2020 11:02:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E09D63C1D8A
 for <ltp@lists.linux.it>; Sat,  9 May 2020 11:02:54 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 61B841000445
 for <ltp@lists.linux.it>; Sat,  9 May 2020 11:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589014971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aSklen+/OYZG75CsvPk0FEaQJJNcqRVqHwUExLU3d04=;
 b=iI8oxfTlXKionCvX7840HzEIRIDlszZeoYjVMHczInozQN2mO5jOsfKGw/z6TslplVVDW6
 QKzXb9/u+SbYvoJfNDI/6B4BzlUQ0ei4t5EmC7rKexyFMdJ4zIk/B0gBuYCsS44BKOxcyI
 rAM7i5eyGPRPowi1pfpRYEjaQUWCePU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-5P_CgRDWO7mwcV9ZXfj0Kg-1; Sat, 09 May 2020 05:02:49 -0400
X-MC-Unique: 5P_CgRDWO7mwcV9ZXfj0Kg-1
Received: by mail-lf1-f72.google.com with SMTP id 74so1527052lfn.4
 for <ltp@lists.linux.it>; Sat, 09 May 2020 02:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aSklen+/OYZG75CsvPk0FEaQJJNcqRVqHwUExLU3d04=;
 b=KfMd782q0Ha54E//Ij+m+LCXqulgE/GfQ+D5afftp0c+8mQ6tyRkPErHlZl6rOFF/q
 RTlBt4AjqvykL2PT7NxgMlgqIxOS/mg1eyRgR3/CRgtUgfPDexYIaYMOfbKmchHNKTqV
 /SvBjniTsFS6DYy7Yy2lz/GqvYRlKLCsn1x7rYQ8pAFOqDAYru4erqb/LXgPIvBI9ShT
 90O5427gxJHPw1e2xi2aGl0ldP80tRkC5AYBE5U2TzlCCq4AovijiXb3i03UMg3/ihg/
 NPgU454DK5cNRzyFU6W2qGazyJyGrmuLwJ4Ci1VUSfsBH0nAjWKVI95lknvwC4qjRQJK
 DdSQ==
X-Gm-Message-State: AOAM5305ak/KVOtnb3/IjGE6QepjV7YTLyDhHabURiIbrkBXdh0dAr1d
 xCRtcJNpZmzrTkCYs3D4cTQ4+z9ZcO88f+Yk039G1/aOvX+77UtQSoBHTwQGXEdbcjNE0jTOLQx
 JDPDc2OftoniNaWNVZHI35T90rHk=
X-Received: by 2002:a05:6512:202:: with SMTP id
 a2mr4551826lfo.42.1589014967481; 
 Sat, 09 May 2020 02:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzhMYvw8oD8GfzpIuHjEe+pqJwjUPziHR2aPuEp+9MF7oQroCM88wIE6JYUwsVH7YucYpiy26GU0JTGMISXZ8=
X-Received: by 2002:a05:6512:202:: with SMTP id
 a2mr4551809lfo.42.1589014967212; 
 Sat, 09 May 2020 02:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <5432ab11234b37bf7f46db7c1a624a432c8aedf3.1588911607.git.viresh.kumar@linaro.org>
In-Reply-To: <5432ab11234b37bf7f46db7c1a624a432c8aedf3.1588911607.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Sat, 9 May 2020 17:02:35 +0800
Message-ID: <CAEemH2f8fQ58f_sJBkF4j2gnRORYm28g5Bzy21TF_M_wKuANUg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 06/17] syscalls/futex: Add support for time64
 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2026643404=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2026643404==
Content-Type: multipart/alternative; boundary="000000000000a9f94d05a53360a4"

--000000000000a9f94d05a53360a4
Content-Type: text/plain; charset="UTF-8"

On Fri, May 8, 2020 at 12:27 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> This adds support for time64 tests to the existing futex() syscall
> tests.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> ---
>  include/tst_timer.h                           |  12 ++
>  .../syscalls/futex/futex_cmp_requeue01.c      |  35 +++-
>  .../syscalls/futex/futex_cmp_requeue02.c      |  25 ++-
>  testcases/kernel/syscalls/futex/futex_utils.h |  52 ++++--
>  .../kernel/syscalls/futex/futex_wait01.c      |  83 +++++-----
>  .../kernel/syscalls/futex/futex_wait02.c      | 104 ++++++------
>  .../kernel/syscalls/futex/futex_wait03.c      |  91 +++++------
>  .../kernel/syscalls/futex/futex_wait04.c      |  85 +++++-----
>  .../kernel/syscalls/futex/futex_wait05.c      |   2 +-
>  .../syscalls/futex/futex_wait_bitset01.c      |  50 ++++--
>  .../kernel/syscalls/futex/futex_wake01.c      |  71 ++++-----
>  .../kernel/syscalls/futex/futex_wake02.c      |  99 ++++++------
>  .../kernel/syscalls/futex/futex_wake03.c      | 111 +++++++------
>  .../kernel/syscalls/futex/futex_wake04.c      | 150 +++++++++---------
>  testcases/kernel/syscalls/futex/futextest.h   | 111 ++++++++-----
>  15 files changed, 609 insertions(+), 472 deletions(-)
>
> diff --git a/include/tst_timer.h b/include/tst_timer.h
> index a726298b407d..b4280042c77f 100644
> --- a/include/tst_timer.h
> +++ b/include/tst_timer.h
> @@ -243,6 +243,18 @@ static inline int sys_clock_nanosleep64(clockid_t
> clk_id, int flags,
>                            request, remain);
>  }
>
> +static inline int sys_futex(int *uaddr, int futex_op, int val, void *to,
> +                           int *uaddr2, int val3)
> +{
> +       return tst_syscall(__NR_futex, uaddr, futex_op, val, to, uaddr2,
> val3);
> +}
> +
> +static inline int sys_futex_time64(int *uaddr, int futex_op, int val,
> void *to,
> +                                  int *uaddr2, int val3)
> +{
> +       return tst_syscall(__NR_futex_time64, uaddr, futex_op, val, to,
> uaddr2, val3);
> +}
> +
>  static inline int libc_sched_rr_get_interval(pid_t pid, void *ts)
>  {
>         return sched_rr_get_interval(pid, ts);
> diff --git a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
> b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
> index c50fade9f969..bc9d2a6bee37 100644
> --- a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
> +++ b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
> @@ -18,6 +18,7 @@
>  #include "tst_timer_test.h"
>  #include "tst_test.h"
>  #include "futextest.h"
> +#include "lapi/abisize.h"
>
>  struct shared_data {
>         futex_t futexes[2];
> @@ -42,14 +43,33 @@ static struct tcase {
>         {1000, 300, 500},
>  };
>
> +static struct test_variants {
> +       enum futex_fn_type fntype;
> +       enum tst_ts_type tstype;
> +       char *desc;
> +} variants[] = {
> +#if defined(TST_ABI32)
> +       { .fntype = FUTEX_FN_FUTEX, .tstype = TST_KERN_OLD_TIMESPEC, .desc
> = "syscall with kernel spec32"},
> +#endif
> +
> +#if defined(TST_ABI64)
> +       { .fntype = FUTEX_FN_FUTEX, .tstype = TST_KERN_TIMESPEC, .desc =
> "syscall with kernel spec64"},
> +#endif
> +
> +#if (__NR_futex_time64 != __LTP__NR_INVALID_SYSCALL)
>

This might not safe to use it directly if only check __NR_futex_time64 being
defined. i.e Test it on the platform without achieving the system
syscall(but
define __NR_futex_time64), the test children exit with TCONF will cause
kind of issues.


RHEL-8.2(ppc64le) failed as:
--------------------------------------

tag=futex_cmp_requeue01 stime=1588947939
cmdline="futex_cmp_requeue01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_cmp_requeue01.c:202: INFO: Testing variant: syscall with kernel spec64
futex_cmp_requeue01.c:114: INFO: Test 0: waiters: 10, wakes: 3, requeues: 7
futex_cmp_requeue01.c:136: INFO: futex_cmp_requeue() returned 10
futex_cmp_requeue01.c:152: INFO: children woken, futex0: 0, futex1: 7,
spurious wakeups: 0
futex_cmp_requeue01.c:197: PASS: futex_cmp_requeue()
futex_cmp_requeue01.c:114: INFO: Test 1: waiters: 10, wakes: 0, requeues: 10
futex_cmp_requeue01.c:136: INFO: futex_cmp_requeue() returned 10
futex_cmp_requeue01.c:152: INFO: children woken, futex0: 0, futex1:
10, spurious wakeups: 0
futex_cmp_requeue01.c:197: PASS: futex_cmp_requeue()
futex_cmp_requeue01.c:114: INFO: Test 2: waiters: 10, wakes: 2, requeues: 6
...
futex_cmp_requeue01.c:152: INFO: children woken, futex0: 200, futex1:
500, spurious wakeups: 0
futex_cmp_requeue01.c:197: PASS: futex_cmp_requeue()
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_cmp_requeue01.c:202: INFO: Testing variant: syscall time64 with
kernel spec64
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported
...
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported
Test timeouted, sending SIGKILL!
tst_test.c:1286: INFO: If you are running on slow machine, try
exporting LTP_TIMEOUT_MUL > 1
tst_test.c:1287: BROK: Test killed! (timeout?)


cmdline="futex_wake02"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_wake02.c:155: INFO: Testing variant: syscall with kernel spec64
futex_wake02.c:105: PASS: futex_wake() woken up 1 threads
futex_wake02.c:105: PASS: futex_wake() woken up 2 threads
futex_wake02.c:105: PASS: futex_wake() woken up 3 threads
futex_wake02.c:105: PASS: futex_wake() woken up 4 threads
futex_wake02.c:105: PASS: futex_wake() woken up 5 threads
futex_wake02.c:105: PASS: futex_wake() woken up 6 threads
futex_wake02.c:105: PASS: futex_wake() woken up 7 threads
futex_wake02.c:105: PASS: futex_wake() woken up 8 threads
futex_wake02.c:105: PASS: futex_wake() woken up 9 threads
futex_wake02.c:105: PASS: futex_wake() woken up 10 threads
futex_wake02.c:118: PASS: futex_wake() woken up 0 threads
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_wake02.c:155: INFO: Testing variant: syscall time64 with kernel spec64
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported
tst_test.c:1063: BROK: Test haven't reported results!


futex_wake03.c:111: INFO: Testing variant: syscall with kernel spec64
futex_wake03.c:71: PASS: futex_wake() woken up 1 childs
futex_wake03.c:71: PASS: futex_wake() woken up 2 childs
futex_wake03.c:71: PASS: futex_wake() woken up 3 childs
futex_wake03.c:71: PASS: futex_wake() woken up 4 childs
futex_wake03.c:71: PASS: futex_wake() woken up 5 childs
futex_wake03.c:71: PASS: futex_wake() woken up 6 childs
futex_wake03.c:71: PASS: futex_wake() woken up 7 childs
futex_wake03.c:71: PASS: futex_wake() woken up 8 childs
futex_wake03.c:71: PASS: futex_wake() woken up 9 childs
futex_wake03.c:71: PASS: futex_wake() woken up 10 childs
futex_wake03.c:105: PASS: futex_wake() woken up 0 children
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_wake03.c:111: INFO: Testing variant: syscall time64 with kernel spec64
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported...
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported
Test timeouted, sending SIGKILL!
tst_test.c:1286: INFO: If you are running on slow machine, try
exporting LTP_TIMEOUT_MUL > 1
tst_test.c:1287: BROK: Test killed! (timeout?)


cmdline="futex_wake04"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_wake04.c:69: INFO: Testing variant: syscall with kernel spec64
futex_wake04.c:142: INFO: Hugepagesize 16777216
futex_wake04.c:127: PASS: Hi hydra, thread2 awake!
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_wake04.c:69: INFO: Testing variant: syscall time64 with kernel spec64
futex_wake04.c:142: INFO: Hugepagesize 16777216
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported
../../../../include/tst_timer.h:256: CONF: syscall(422)
__NR_futex_time64 not supported
futex_wake04.c:129: FAIL: Bug: wait_thread2 did not wake after 30
secs.: SUCCESS (0)


-- 
Regards,
Li Wang

--000000000000a9f94d05a53360a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 8, 2020 at 12:27 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This adds s=
upport for time64 tests to the existing futex() syscall<br>
tests.<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br>
---<br>
=C2=A0include/tst_timer.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 ++<br>
=C2=A0.../syscalls/futex/futex_cmp_requeue01.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
35 +++-<br>
=C2=A0.../syscalls/futex/futex_cmp_requeue02.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
25 ++-<br>
=C2=A0testcases/kernel/syscalls/futex/futex_utils.h |=C2=A0 52 ++++--<br>
=C2=A0.../kernel/syscalls/futex/futex_wait01.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
83 +++++-----<br>
=C2=A0.../kernel/syscalls/futex/futex_wait02.c=C2=A0 =C2=A0 =C2=A0 | 104 ++=
++++------<br>
=C2=A0.../kernel/syscalls/futex/futex_wait03.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
91 +++++------<br>
=C2=A0.../kernel/syscalls/futex/futex_wait04.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
85 +++++-----<br>
=C2=A0.../kernel/syscalls/futex/futex_wait05.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../syscalls/futex/futex_wait_bitset01.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
50 ++++--<br>
=C2=A0.../kernel/syscalls/futex/futex_wake01.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
71 ++++-----<br>
=C2=A0.../kernel/syscalls/futex/futex_wake02.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
99 ++++++------<br>
=C2=A0.../kernel/syscalls/futex/futex_wake03.c=C2=A0 =C2=A0 =C2=A0 | 111 ++=
+++++------<br>
=C2=A0.../kernel/syscalls/futex/futex_wake04.c=C2=A0 =C2=A0 =C2=A0 | 150 ++=
+++++++---------<br>
=C2=A0testcases/kernel/syscalls/futex/futextest.h=C2=A0 =C2=A0| 111 +++++++=
+-----<br>
=C2=A015 files changed, 609 insertions(+), 472 deletions(-)<br>
<br>
diff --git a/include/tst_timer.h b/include/tst_timer.h<br>
index a726298b407d..b4280042c77f 100644<br>
--- a/include/tst_timer.h<br>
+++ b/include/tst_timer.h<br>
@@ -243,6 +243,18 @@ static inline int sys_clock_nanosleep64(clockid_t clk_=
id, int flags,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0request, remain);<br>
=C2=A0}<br>
<br>
+static inline int sys_futex(int *uaddr, int futex_op, int val, void *to,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int *uaddr2, int val3)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tst_syscall(__NR_futex, uaddr, futex_op,=
 val, to, uaddr2, val3);<br>
+}<br>
+<br>
+static inline int sys_futex_time64(int *uaddr, int futex_op, int val, void=
 *to,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int *uaddr2, int val3)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tst_syscall(__NR_futex_time64, uaddr, fu=
tex_op, val, to, uaddr2, val3);<br>
+}<br>
+<br>
=C2=A0static inline int libc_sched_rr_get_interval(pid_t pid, void *ts)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sched_rr_get_interval(pid, ts);<br>
diff --git a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c b/testca=
ses/kernel/syscalls/futex/futex_cmp_requeue01.c<br>
index c50fade9f969..bc9d2a6bee37 100644<br>
--- a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c<br>
+++ b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c<br>
@@ -18,6 +18,7 @@<br>
=C2=A0#include &quot;tst_timer_test.h&quot;<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;futextest.h&quot;<br>
+#include &quot;lapi/abisize.h&quot;<br>
<br>
=C2=A0struct shared_data {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 futex_t futexes[2];<br>
@@ -42,14 +43,33 @@ static struct tcase {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {1000, 300, 500},<br>
=C2=A0};<br>
<br>
+static struct test_variants {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum futex_fn_type fntype;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum tst_ts_type tstype;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *desc;<br>
+} variants[] =3D {<br>
+#if defined(TST_ABI32)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .fntype =3D FUTEX_FN_FUTEX, .tstype =3D TST_K=
ERN_OLD_TIMESPEC, .desc =3D &quot;syscall with kernel spec32&quot;},<br>
+#endif<br>
+<br>
+#if defined(TST_ABI64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .fntype =3D FUTEX_FN_FUTEX, .tstype =3D TST_K=
ERN_TIMESPEC, .desc =3D &quot;syscall with kernel spec64&quot;},<br>
+#endif<br>
+<br>
+#if (<span class=3D"gmail_default" style=3D"font-size:small"></span>__NR_f=
utex_time64 !=3D __LTP__NR_INVALID_SYSCALL)<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small"></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">This might not safe to use it=
 directly if only check=C2=A0__NR_futex_time64 being</div><div class=3D"gma=
il_default" style=3D"font-size:small">defined. i.e Test it on the platform =
without achieving the system syscall(but=C2=A0</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">define=C2=A0<span class=3D"gmail_default"><=
/span>__NR_futex_time64), the test children exit=C2=A0with TCONF will cause=
</div><div class=3D"gmail_default" style=3D"font-size:small">kind of issues=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">RHEL-8.2(ppc64le) failed as:</div=
><div class=3D"gmail_default" style=3D"font-size:small">-------------------=
-------------------</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><pre style=3D"color:rgb(0,0,0);white-space:pre-wrap"><pre style=3D"whi=
te-space:pre-wrap">tag=3Dfutex_cmp_requeue01 stime=3D1588947939
cmdline=3D&quot;futex_cmp_requeue01&quot;
contacts=3D&quot;&quot;
analysis=3Dexit
&lt;&lt;&lt;test_output&gt;&gt;&gt;
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_cmp_requeue01.c:202: INFO: Testing variant: syscall with kernel spec6=
4
futex_cmp_requeue01.c:114: INFO: Test 0: waiters: 10, wakes: 3, requeues: 7
futex_cmp_requeue01.c:136: INFO: futex_cmp_requeue() returned 10
futex_cmp_requeue01.c:152: INFO: children woken, futex0: 0, futex1: 7, spur=
ious wakeups: 0
futex_cmp_requeue01.c:197: PASS: futex_cmp_requeue()
futex_cmp_requeue01.c:114: INFO: Test 1: waiters: 10, wakes: 0, requeues: 1=
0
futex_cmp_requeue01.c:136: INFO: futex_cmp_requeue() returned 10
futex_cmp_requeue01.c:152: INFO: children woken, futex0: 0, futex1: 10, spu=
rious wakeups: 0
futex_cmp_requeue01.c:197: PASS: futex_cmp_requeue()
futex_cmp_requeue01.c:114: INFO: Test 2: waiters: 10, wakes: 2, requeues: 6
...
futex_cmp_requeue01.c:152: INFO: children woken, futex0: 200, futex1: 500, =
spurious wakeups: 0
futex_cmp_requeue01.c:197: PASS: futex_cmp_requeue()
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_cmp_requeue01.c:202: INFO: Testing variant: syscall time64 with kerne=
l spec64
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
...
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
Test timeouted, sending SIGKILL!
tst_test.c:1286: INFO: If you are running on slow machine, try exporting LT=
P_TIMEOUT_MUL &gt; 1
tst_test.c:1287: BROK: Test killed! (timeout?)</pre></pre><pre style=3D"col=
or:rgb(0,0,0);white-space:pre-wrap"><br></pre><pre style=3D"color:rgb(0,0,0=
);white-space:pre-wrap">cmdline=3D&quot;futex_wake02&quot;
contacts=3D&quot;&quot;
analysis=3Dexit
&lt;&lt;&lt;test_output&gt;&gt;&gt;
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_wake02.c:155: INFO: Testing variant: syscall with kernel spec64
futex_wake02.c:105: PASS: futex_wake() woken up 1 threads
futex_wake02.c:105: PASS: futex_wake() woken up 2 threads
futex_wake02.c:105: PASS: futex_wake() woken up 3 threads
futex_wake02.c:105: PASS: futex_wake() woken up 4 threads
futex_wake02.c:105: PASS: futex_wake() woken up 5 threads
futex_wake02.c:105: PASS: futex_wake() woken up 6 threads
futex_wake02.c:105: PASS: futex_wake() woken up 7 threads
futex_wake02.c:105: PASS: futex_wake() woken up 8 threads
futex_wake02.c:105: PASS: futex_wake() woken up 9 threads
futex_wake02.c:105: PASS: futex_wake() woken up 10 threads
futex_wake02.c:118: PASS: futex_wake() woken up 0 threads
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_wake02.c:155: INFO: Testing variant: syscall time64 with kernel spec6=
4
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
tst_test.c:1063: BROK: Test haven&#39;t reported results!
</pre></div></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><pre style=3D"color:rgb(0,0,0);white-space:pre-wrap">futex_wak=
e03.c:111: INFO: Testing variant: syscall with kernel spec64
futex_wake03.c:71: PASS: futex_wake() woken up 1 childs
futex_wake03.c:71: PASS: futex_wake() woken up 2 childs
futex_wake03.c:71: PASS: futex_wake() woken up 3 childs
futex_wake03.c:71: PASS: futex_wake() woken up 4 childs
futex_wake03.c:71: PASS: futex_wake() woken up 5 childs
futex_wake03.c:71: PASS: futex_wake() woken up 6 childs
futex_wake03.c:71: PASS: futex_wake() woken up 7 childs
futex_wake03.c:71: PASS: futex_wake() woken up 8 childs
futex_wake03.c:71: PASS: futex_wake() woken up 9 childs
futex_wake03.c:71: PASS: futex_wake() woken up 10 childs
futex_wake03.c:105: PASS: futex_wake() woken up 0 children
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_wake03.c:111: INFO: Testing variant: syscall time64 with kernel spec6=
4
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
<span class=3D"gmail_default" style=3D"font-size:small">...</span>
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
Test timeouted, sending SIGKILL!
tst_test.c:1286: INFO: If you are running on slow machine, try exporting LT=
P_TIMEOUT_MUL &gt; 1
tst_test.c:1287: BROK: Test killed! (timeout?)
</pre><div class=3D"gmail_default" style=3D"font-size:small"><br></div><pre=
 style=3D"color:rgb(0,0,0);white-space:pre-wrap">cmdline=3D&quot;futex_wake=
04&quot;
contacts=3D&quot;&quot;
analysis=3Dexit
&lt;&lt;&lt;test_output&gt;&gt;&gt;
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_wake04.c:69: INFO: Testing variant: syscall with kernel spec64
futex_wake04.c:142: INFO: Hugepagesize 16777216
futex_wake04.c:127: PASS: Hi hydra, thread2 awake!
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
futex_wake04.c:69: INFO: Testing variant: syscall time64 with kernel spec64
futex_wake04.c:142: INFO: Hugepagesize 16777216
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
../../../../include/tst_timer.h:256: CONF: syscall(422) __NR_futex_time64 n=
ot supported
futex_wake04.c:129: FAIL: Bug: wait_thread2 did not wake after 30 secs.: SU=
CCESS (0)=C2=A0</pre><pre style=3D"color:rgb(0,0,0);white-space:pre-wrap"><=
br></pre></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div=
 dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div=
>

--000000000000a9f94d05a53360a4--


--===============2026643404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2026643404==--

