Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD91CBD28
	for <lists+linux-ltp@lfdr.de>; Sat,  9 May 2020 06:22:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C7AD3C26C3
	for <lists+linux-ltp@lfdr.de>; Sat,  9 May 2020 06:22:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 672CA3C1D8A
 for <ltp@lists.linux.it>; Sat,  9 May 2020 06:22:16 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 97EEE1A011F1
 for <ltp@lists.linux.it>; Sat,  9 May 2020 06:22:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588998133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4hC0CNw8SX6fjBQ3XPwmJsT0LzrNJoManw5vSbHsKaE=;
 b=ZJ0GKBtmni350GfiJIAiGYSI4BCfdh9bGHX7yW5YJs3QRxDg6EoG6ocvjehFdbAFCctm/u
 kVLS8yxZsYsu5ymppDP7GLj08nHsWqwa0Lw5B4ZC1YMNZHjD/DPoOia6tpjoW4a3Ls+th2
 Mxb6Ohu3y1sV6txI+1tvX82jln6fiwc=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-rxfrd6L8N3ydn1Y72PbA4Q-1; Sat, 09 May 2020 00:22:05 -0400
X-MC-Unique: rxfrd6L8N3ydn1Y72PbA4Q-1
Received: by mail-lf1-f72.google.com with SMTP id c6so1374294lfg.0
 for <ltp@lists.linux.it>; Fri, 08 May 2020 21:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4hC0CNw8SX6fjBQ3XPwmJsT0LzrNJoManw5vSbHsKaE=;
 b=S9ZXZB52rKPZMjbOsvbvk6RwRBqGP7tn0eOk8TPNQwDCd1jPZ0KEaYfnJDN+dj+6ru
 O0bxW+9Y55gj7WzKkkG/W1R5CFHncxfRqKIKoTjjL1nN1Kb8MsSjwv1q7iyD+d1r8U39
 zXsLYkkCSM9/6Y7dmqK45fXoG9sSGtaNmNJsb9xTThfMUxF2Fs4gwepdCSCJHOcKTN/m
 7P5zhAWsBwNM7gCdusTWp4gIsam4QhtsZh+U5tag8/idtHAukqIBQ2k6OGOAeZ9ZG6kb
 /5W5v2M3MsQ3cpoQ87xgXuRKDW2O/tldqPL76dAombmKP80LwviI5iSZ7/kto9oTCjHE
 uPLg==
X-Gm-Message-State: AOAM533u95desOvX79oSw0Lugxp1y/A0k+4VqOB6dT5Q7YXnT47oyKeD
 kSKdqomd/4gLYvFQME5Z1RY20cwyC223Kb/Qu4MoKIxaNdT30J7iPlkicQbI2NqoDFmxCra0z8U
 KUExAil4m7WqwEm1fi2xjMcXpAwc=
X-Received: by 2002:a2e:8296:: with SMTP id y22mr66408ljg.194.1588998123244;
 Fri, 08 May 2020 21:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp7qVgdL6ShVyIpaxe67z6cleXSlJvnOwbvbDl5sqGdi0WyVteCEvvhpWytCbBfqAHbrx2pGbkQHoIKYAKe94=
X-Received: by 2002:a2e:8296:: with SMTP id y22mr66400ljg.194.1588998123001;
 Fri, 08 May 2020 21:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
In-Reply-To: <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Sat, 9 May 2020 12:21:51 +0800
Message-ID: <CAEemH2cX=zyULO6qZBV5fBQv74dm2yuiUeRJ8SMe7OXYWJJ_sQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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
Content-Type: multipart/mixed; boundary="===============0458886963=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0458886963==
Content-Type: multipart/alternative; boundary="000000000000abadbd05a52f7411"

--000000000000abadbd05a52f7411
Content-Type: text/plain; charset="UTF-8"

On Fri, May 8, 2020 at 12:28 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> This adds support for semtimedop() and its time64 variant to the
> existing semop() syscall tests.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  testcases/kernel/syscalls/ipc/semop/semop.h   | 52 +++++++++++++++++++
>  testcases/kernel/syscalls/ipc/semop/semop01.c | 11 +++-
>  testcases/kernel/syscalls/ipc/semop/semop02.c | 12 ++++-
>  testcases/kernel/syscalls/ipc/semop/semop03.c | 12 ++++-
>  testcases/kernel/syscalls/ipc/semop/semop04.c | 12 ++++-
>  testcases/kernel/syscalls/ipc/semop/semop05.c | 12 ++++-
>  6 files changed, 106 insertions(+), 5 deletions(-)
>  create mode 100644 testcases/kernel/syscalls/ipc/semop/semop.h
>
> diff --git a/testcases/kernel/syscalls/ipc/semop/semop.h
> b/testcases/kernel/syscalls/ipc/semop/semop.h
> new file mode 100644
> index 000000000000..8d1245b65ec0
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/semop/semop.h
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#ifndef SEMOP_VAR__
> +#define SEMOP_VAR__
> +
> +#include <sys/sem.h>
> +#include "tst_timer.h"
> +#include "lapi/abisize.h"
> +
> +static inline int sys_semtimedop(int semid, struct sembuf *sops, size_t
> nsops,
> +               void *timeout)
> +{
> +       return tst_syscall(__NR_semtimedop, semid, sops, nsops, timeout);
> +}
> +
> +static inline int sys_semtimedop_time64(int semid, struct sembuf *sops,
> +                                       size_t nsops, void *timeout)
> +{
> +       return tst_syscall(__NR_semtimedop_time64, semid, sops, nsops,
> timeout);
> +}
> +
> +struct test_variants {
> +       int (*semop)(int semid, struct sembuf *sops, size_t nsops);
> +       int (*semtimedop)(int semid, struct sembuf *sops, size_t nsops,
> void *timeout);
> +       enum tst_ts_type type;
> +       char *desc;
> +} variants[] = {
> +       { .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO
> or syscall"},
> +#if defined(TST_ABI32)
> +       { .semtimedop = sys_semtimedop, .type = TST_LIBC_TIMESPEC, .desc =
> "semtimedop: syscall with libc spec"},
> +       { .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC,
> .desc = "semtimedop: syscall with kernel spec32"},
> +#endif
> +
> +#if defined(TST_ABI64)
> +       { .semtimedop = sys_semtimedop, .type = TST_KERN_TIMESPEC, .desc =
> "semtimedop: syscall with kernel spec64"},
> +#endif
> +
> +#if (__NR_semtimedop_time64 != __LTP__NR_INVALID_SYSCALL)
> +       { .semtimedop = sys_semtimedop_time64, .type = TST_KERN_TIMESPEC,
> .desc = "semtimedop: syscall time64 with kernel spec64"},
> +#endif
> +};
> +
> +static inline int call_semop(struct test_variants *tv, int semid,
> +               struct sembuf *sops, size_t nsops, struct tst_ts *timeout)
> +{
> +       if (tv->semop)
> +               return tv->semop(semid, sops, nsops);
> +
> +       return tv->semtimedop(semid, sops, nsops, tst_ts_get(timeout));
> +}
> +
> +#endif /* SEMOP_VAR__ */
> diff --git a/testcases/kernel/syscalls/ipc/semop/semop01.c
> b/testcases/kernel/syscalls/ipc/semop/semop01.c
> index bcb45fa69320..a4924376e32c 100644
> --- a/testcases/kernel/syscalls/ipc/semop/semop01.c
> +++ b/testcases/kernel/syscalls/ipc/semop/semop01.c
> @@ -41,6 +41,7 @@
>  #include "tst_test.h"
>  #include "libnewipc.h"
>  #include "lapi/semun.h"
> +#include "semop.h"
>
>  #define NSEMS  4               /* the number of primitive semaphores to
> test */
>
> @@ -52,11 +53,16 @@ static struct sembuf sops[PSEMS];
>
>  static void run(void)
>  {
> +       struct test_variants *tv = &variants[tst_variant];
>         union semun arr = { .val = 0 };
> +       struct tst_ts timeout;
>         int fail = 0;
>         int i;
>
> -       TEST(semop(sem_id, sops, NSEMS));
> +       timeout.type = tv->type;
> +       tst_ts_set_nsec(&timeout, 10000);
> +
> +       TEST(call_semop(tv, sem_id, sops, NSEMS, &timeout));
>
>         if (TST_RET == -1) {
>                 tst_res(TFAIL | TTERRNO, "semop() failed");
> @@ -94,6 +100,8 @@ static void setup(void)
>  {
>         int i;
>
> +       tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
> +
>         get_arr.array = malloc(sizeof(unsigned short int) * PSEMS);
>         if (get_arr.array == NULL)
>                 tst_brk(TBROK, "malloc failed");
> @@ -124,6 +132,7 @@ static void cleanup(void)
>
>  static struct tst_test test = {
>         .test_all = run,
> +       .test_variants = ARRAY_SIZE(variants),
>         .setup = setup,
>         .cleanup = cleanup,
>         .needs_tmpdir = 1,
> diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c
> b/testcases/kernel/syscalls/ipc/semop/semop02.c
> index f24d284776a4..a51906340400 100644
> --- a/testcases/kernel/syscalls/ipc/semop/semop02.c
> +++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
> @@ -20,6 +20,7 @@
>  #include "tst_test.h"
>  #include "libnewipc.h"
>  #include "lapi/semun.h"
> +#include "semop.h"
>
>  static int sem_id_1 = -1;      /* a semaphore set with read & alter
> permissions */
>  static int sem_id_2 = -1;      /* a semaphore set without read & alter
> permissions */
> @@ -52,6 +53,8 @@ static void setup(void)
>         struct seminfo ipc_buf;
>         union semun arr;
>
> +       tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
> +
>         ltpuser = SAFE_GETPWNAM(nobody_uid);
>         SAFE_SETUID(ltpuser->pw_uid);
>
> @@ -84,7 +87,13 @@ static void setup(void)
>
>  static void run(unsigned int i)
>  {
> -       TEST(semop(*(tc[i].semid), tc[i].t_sbuf, tc[i].t_ops));
> +       struct test_variants *tv = &variants[tst_variant];
> +       struct tst_ts timeout;
> +
> +       timeout.type = tv->type;
> +       tst_ts_set_nsec(&timeout, 10000);
> +
> +       TEST(call_semop(tv, *(tc[i].semid), tc[i].t_sbuf, tc[i].t_ops,
> &timeout));
>
>         if (TST_RET != -1) {
>                 tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
> @@ -117,6 +126,7 @@ static void cleanup(void)
>  static struct tst_test test = {
>         .test = run,
>         .tcnt = ARRAY_SIZE(tc),
> +       .test_variants = ARRAY_SIZE(variants),
>         .setup = setup,
>         .cleanup = cleanup,
>         .needs_tmpdir = 1,
> diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c
> b/testcases/kernel/syscalls/ipc/semop/semop03.c
> index 4f5f78eb6d8d..d36194ce1f41 100644
> --- a/testcases/kernel/syscalls/ipc/semop/semop03.c
> +++ b/testcases/kernel/syscalls/ipc/semop/semop03.c
> @@ -38,6 +38,7 @@
>  #include "tst_test.h"
>  #include "libnewipc.h"
>  #include "lapi/semun.h"
> +#include "semop.h"
>
>  static key_t semkey;
>  static int sem_id = -1;
> @@ -47,6 +48,12 @@ static int tc[] = { -1, PSEMS + 1 }; /* negative and
> too many "primitive" semas
>
>  static void run(unsigned int i)
>  {
> +       struct test_variants *tv = &variants[tst_variant];
> +       struct tst_ts timeout;
> +
> +       timeout.type = tv->type;
> +       tst_ts_set_nsec(&timeout, 10000);
> +
>         /* initialize two fields in the sembuf structure here */
>         s_buf.sem_op = 1;       /* add this value to struct sem.semval */
>         s_buf.sem_flg = SEM_UNDO;       /* undo when process exits */
> @@ -61,7 +68,7 @@ static void run(unsigned int i)
>          * use the TEST macro to make the call
>          */
>
> -       TEST(semop(sem_id, &s_buf, 1));
> +       TEST(call_semop(tv, sem_id, &s_buf, 1, &timeout));
>
>         if (TST_RET != -1) {
>                 tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
> @@ -80,6 +87,8 @@ static void run(unsigned int i)
>
>  static void setup(void)
>  {
> +       tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
> +
>         /* get an IPC resource key */
>         semkey = GETIPCKEY();
>
> @@ -102,6 +111,7 @@ static void cleanup(void)
>  static struct tst_test test = {
>         .test = run,
>         .tcnt = ARRAY_SIZE(tc),
> +       .test_variants = ARRAY_SIZE(variants),
>         .setup = setup,
>         .cleanup = cleanup,
>         .needs_tmpdir = 1,
> diff --git a/testcases/kernel/syscalls/ipc/semop/semop04.c
> b/testcases/kernel/syscalls/ipc/semop/semop04.c
> index 0faf00a3585f..033065e7bbfc 100644
> --- a/testcases/kernel/syscalls/ipc/semop/semop04.c
> +++ b/testcases/kernel/syscalls/ipc/semop/semop04.c
> @@ -38,6 +38,7 @@
>  #include "tst_test.h"
>  #include "libnewipc.h"
>  #include "lapi/semun.h"
> +#include "semop.h"
>
>  static int sem_id = -1;
>  static int val; /* value for SETVAL */
> @@ -62,6 +63,12 @@ static struct test_case_t {
>
>  static void run(unsigned int i)
>  {
> +       struct test_variants *tv = &variants[tst_variant];
> +       struct tst_ts timeout;
> +
> +       timeout.type = tv->type;
> +       tst_ts_set_nsec(&timeout, 10000);
> +
>         /* initialize the s_buf buffer */
>         s_buf.sem_op = tc[i].op;
>         s_buf.sem_flg = tc[i].flg;
> @@ -72,7 +79,7 @@ static void run(unsigned int i)
>         if (semctl(sem_id, tc[i].num, SETVAL, tc[i].get_arr) == -1)
>                 tst_brk(TBROK | TERRNO, "semctl() failed");
>
> -       TEST(semop(sem_id, &s_buf, 1));
> +       TEST(call_semop(tv, sem_id, &s_buf, 1, &timeout));
>         if (TST_RET != -1) {
>                 tst_res(TFAIL, "call succeeded unexpectedly");
>                 return;
> @@ -86,6 +93,8 @@ static void run(unsigned int i)
>
>  static void setup(void)
>  {
> +       tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
> +
>         val = 1;
>
>         /* get an IPC resource key */
> @@ -114,6 +123,7 @@ static void cleanup(void)
>  static struct tst_test test = {
>         .test = run,
>         .tcnt = ARRAY_SIZE(tc),
> +       .test_variants = ARRAY_SIZE(variants),
>         .setup = setup,
>         .cleanup = cleanup,
>         .needs_tmpdir = 1,
> diff --git a/testcases/kernel/syscalls/ipc/semop/semop05.c
> b/testcases/kernel/syscalls/ipc/semop/semop05.c
> index 9e8e040b0b19..f892cd519ecf 100644
> --- a/testcases/kernel/syscalls/ipc/semop/semop05.c
> +++ b/testcases/kernel/syscalls/ipc/semop/semop05.c
> @@ -52,6 +52,7 @@
>  #include "tst_test.h"
>  #include "libnewipc.h"
>  #include "lapi/semun.h"
> +#include "semop.h"
>
>  static key_t semkey;
>  static int sem_id = -1;
> @@ -115,7 +116,13 @@ static inline int process_state_wait2(pid_t pid,
> const char state)
>
>  static void do_child(int i)
>  {
> -       TEST(semop(sem_id, &s_buf, 1));
> +       struct test_variants *tv = &variants[tst_variant];
> +       struct tst_ts timeout;
> +
> +       timeout.type = tv->type;
> +       tst_ts_set_nsec(&timeout, 10000);
> +
> +       TEST(call_semop(tv, sem_id, &s_buf, 1, &timeout));
>         if (TST_RET != -1) {
>                 tst_res(TFAIL, "call succeeded when error expected");
>                 exit(-1);
> @@ -137,6 +144,8 @@ static void sighandler(int sig)
>
>  static void setup(void)
>  {
> +       tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
> +
>         SAFE_SIGNAL(SIGHUP, sighandler);
>
>         /* get an IPC resource key */
> @@ -238,6 +247,7 @@ static void do_child_uclinux(void)
>  static struct tst_test test = {
>         .test = run,
>         .tcnt = ARRAY_SIZE(tc),
> +       .test_variants = ARRAY_SIZE(variants),
>

RHEL8.2(x84_64) failed as:

# ./semop05
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
semop05.c:147: INFO: Testing variant: semop: vDSO or syscall
semop05.c:132: PASS: expected failure: EIDRM (43)
semop05.c:132: PASS: expected failure: EIDRM (43)
semop05.c:132: PASS: expected failure: EINTR (4)
semop05.c:132: PASS: expected failure: EINTR (4)
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
semop05.c:147: INFO: Testing variant: semtimedop: syscall with kernel spec64
semop05.c:134: FAIL: unexpected failure: EAGAIN/EWOULDBLOCK (11)
Test timeouted, sending SIGKILL!
tst_test.c:1286: INFO: If you are running on slow machine, try exporting
LTP_TIMEOUT_MUL > 1
tst_test.c:1287: BROK: Test killed! (timeout?)


RHEL8.2(s390x) failed as:

tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
semop05.c:147: INFO: Testing variant: semop: vDSO or syscall
semop05.c:132: PASS: expected failure: EIDRM (43)
semop05.c:132: PASS: expected failure: EIDRM (43)
semop05.c:132: PASS: expected failure: EINTR (4)
semop05.c:132: PASS: expected failure: EINTR (4)
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
semop05.c:147: INFO: Testing variant: semtimedop: syscall with kernel spec64
semop.h:13: CONF: syscall(392) __NR_semtimedop not supported
Test timeouted, sending SIGKILL!
tst_test.c:1286: INFO: If you are running on slow machine, try exporting
LTP_TIMEOUT_MUL > 1
tst_test.c:1287: BROK: Test killed! (timeout?)



>         .setup = setup,
>         .cleanup = cleanup,
>         .needs_tmpdir = 1,
> --
> 2.25.0.rc1.19.g042ed3e048af
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000abadbd05a52f7411
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 8, 2020 at 12:28 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This adds s=
upport for semtimedop() and its time64 variant to the<br>
existing semop() syscall tests.<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/ipc/semop/semop.h=C2=A0 =C2=A0| 52 ++++++++=
+++++++++++<br>
=C2=A0testcases/kernel/syscalls/ipc/semop/semop01.c | 11 +++-<br>
=C2=A0testcases/kernel/syscalls/ipc/semop/semop02.c | 12 ++++-<br>
=C2=A0testcases/kernel/syscalls/ipc/semop/semop03.c | 12 ++++-<br>
=C2=A0testcases/kernel/syscalls/ipc/semop/semop04.c | 12 ++++-<br>
=C2=A0testcases/kernel/syscalls/ipc/semop/semop05.c | 12 ++++-<br>
=C2=A06 files changed, 106 insertions(+), 5 deletions(-)<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/ipc/semop/semop.h<br>
<br>
diff --git a/testcases/kernel/syscalls/ipc/semop/semop.h b/testcases/kernel=
/syscalls/ipc/semop/semop.h<br>
new file mode 100644<br>
index 000000000000..8d1245b65ec0<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/ipc/semop/semop.h<br>
@@ -0,0 +1,52 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+<br>
+#ifndef SEMOP_VAR__<br>
+#define SEMOP_VAR__<br>
+<br>
+#include &lt;sys/sem.h&gt;<br>
+#include &quot;tst_timer.h&quot;<br>
+#include &quot;lapi/abisize.h&quot;<br>
+<br>
+static inline int sys_semtimedop(int semid, struct sembuf *sops, size_t ns=
ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *timeout)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tst_syscall(__NR_semtimedop, semid, sops=
, nsops, timeout);<br>
+}<br>
+<br>
+static inline int sys_semtimedop_time64(int semid, struct sembuf *sops,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t ns=
ops, void *timeout)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tst_syscall(__NR_semtimedop_time64, semi=
d, sops, nsops, timeout);<br>
+}<br>
+<br>
+struct test_variants {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*semop)(int semid, struct sembuf *sops, si=
ze_t nsops);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*semtimedop)(int semid, struct sembuf *sop=
s, size_t nsops, void *timeout);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum tst_ts_type type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *desc;<br>
+} variants[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .semop =3D semop, .type =3D TST_LIBC_TIMESPEC=
, .desc =3D &quot;semop: vDSO or syscall&quot;},<br>
+#if defined(TST_ABI32)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .semtimedop =3D sys_semtimedop, .type =3D TST=
_LIBC_TIMESPEC, .desc =3D &quot;semtimedop: syscall with libc spec&quot;},<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .semtimedop =3D sys_semtimedop, .type =3D TST=
_KERN_OLD_TIMESPEC, .desc =3D &quot;semtimedop: syscall with kernel spec32&=
quot;},<br>
+#endif<br>
+<br>
+#if defined(TST_ABI64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .semtimedop =3D sys_semtimedop, .type =3D TST=
_KERN_TIMESPEC, .desc =3D &quot;semtimedop: syscall with kernel spec64&quot=
;},<br>
+#endif<br>
+<br>
+#if (__NR_semtimedop_time64 !=3D __LTP__NR_INVALID_SYSCALL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .semtimedop =3D sys_semtimedop_time64, .type =
=3D TST_KERN_TIMESPEC, .desc =3D &quot;semtimedop: syscall time64 with kern=
el spec64&quot;},<br>
+#endif<br>
+};<br>
+<br>
+static inline int call_semop(struct test_variants *tv, int semid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct sembuf *sops=
, size_t nsops, struct tst_ts *timeout)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tv-&gt;semop)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tv-&gt;semop=
(semid, sops, nsops);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tv-&gt;semtimedop(semid, sops, nsops, ts=
t_ts_get(timeout));<br>
+}<br>
+<br>
+#endif /* SEMOP_VAR__ */<br>
diff --git a/testcases/kernel/syscalls/ipc/semop/semop01.c b/testcases/kern=
el/syscalls/ipc/semop/semop01.c<br>
index bcb45fa69320..a4924376e32c 100644<br>
--- a/testcases/kernel/syscalls/ipc/semop/semop01.c<br>
+++ b/testcases/kernel/syscalls/ipc/semop/semop01.c<br>
@@ -41,6 +41,7 @@<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;libnewipc.h&quot;<br>
=C2=A0#include &quot;lapi/semun.h&quot;<br>
+#include &quot;semop.h&quot;<br>
<br>
=C2=A0#define NSEMS=C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* the number of primitive semaphores to test */<br>
<br>
@@ -52,11 +53,16 @@ static struct sembuf sops[PSEMS];<br>
<br>
=C2=A0static void run(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct test_variants *tv =3D &amp;variants[tst_=
variant];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 union semun arr =3D { .val =3D 0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tst_ts timeout;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fail =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(semop(sem_id, sops, NSEMS));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0timeout.type =3D tv-&gt;type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_ts_set_nsec(&amp;timeout, 10000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(call_semop(tv, sem_id, sops, NSEMS, &amp;t=
imeout));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TST_RET =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL | TTE=
RRNO, &quot;semop() failed&quot;);<br>
@@ -94,6 +100,8 @@ static void setup(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Testing variant: %s&quot;,=
 variants[tst_variant].desc);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_arr.array =3D malloc(sizeof(unsigned short =
int) * PSEMS);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_arr.array =3D=3D NULL)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBROK, &quo=
t;malloc failed&quot;);<br>
@@ -124,6 +132,7 @@ static void cleanup(void)<br>
<br>
=C2=A0static struct tst_test test =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .test_all =3D run,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_variants =3D ARRAY_SIZE(variants),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cleanup =3D cleanup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .needs_tmpdir =3D 1,<br>
diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kern=
el/syscalls/ipc/semop/semop02.c<br>
index f24d284776a4..a51906340400 100644<br>
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c<br>
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c<br>
@@ -20,6 +20,7 @@<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;libnewipc.h&quot;<br>
=C2=A0#include &quot;lapi/semun.h&quot;<br>
+#include &quot;semop.h&quot;<br>
<br>
=C2=A0static int sem_id_1 =3D -1;=C2=A0 =C2=A0 =C2=A0 /* a semaphore set wi=
th read &amp; alter permissions */<br>
=C2=A0static int sem_id_2 =3D -1;=C2=A0 =C2=A0 =C2=A0 /* a semaphore set wi=
thout read &amp; alter permissions */<br>
@@ -52,6 +53,8 @@ static void setup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct seminfo ipc_buf;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 union semun arr;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Testing variant: %s&quot;,=
 variants[tst_variant].desc);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ltpuser =3D SAFE_GETPWNAM(nobody_uid);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_SETUID(ltpuser-&gt;pw_uid);<br>
<br>
@@ -84,7 +87,13 @@ static void setup(void)<br>
<br>
=C2=A0static void run(unsigned int i)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(semop(*(tc[i].semid), tc[i].t_sbuf, tc[i].=
t_ops));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct test_variants *tv =3D &amp;variants[tst_=
variant];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tst_ts timeout;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0timeout.type =3D tv-&gt;type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_ts_set_nsec(&amp;timeout, 10000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(call_semop(tv, *(tc[i].semid), tc[i].t_sbu=
f, tc[i].t_ops, &amp;timeout));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TST_RET !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL | TTE=
RRNO, &quot;call succeeded unexpectedly&quot;);<br>
@@ -117,6 +126,7 @@ static void cleanup(void)<br>
=C2=A0static struct tst_test test =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .test =3D run,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .tcnt =3D ARRAY_SIZE(tc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_variants =3D ARRAY_SIZE(variants),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cleanup =3D cleanup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .needs_tmpdir =3D 1,<br>
diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c b/testcases/kern=
el/syscalls/ipc/semop/semop03.c<br>
index 4f5f78eb6d8d..d36194ce1f41 100644<br>
--- a/testcases/kernel/syscalls/ipc/semop/semop03.c<br>
+++ b/testcases/kernel/syscalls/ipc/semop/semop03.c<br>
@@ -38,6 +38,7 @@<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;libnewipc.h&quot;<br>
=C2=A0#include &quot;lapi/semun.h&quot;<br>
+#include &quot;semop.h&quot;<br>
<br>
=C2=A0static key_t semkey;<br>
=C2=A0static int sem_id =3D -1;<br>
@@ -47,6 +48,12 @@ static int tc[] =3D { -1, PSEMS + 1 }; /* negative and t=
oo many &quot;primitive&quot; semas<br>
<br>
=C2=A0static void run(unsigned int i)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct test_variants *tv =3D &amp;variants[tst_=
variant];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tst_ts timeout;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0timeout.type =3D tv-&gt;type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_ts_set_nsec(&amp;timeout, 10000);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* initialize two fields in the sembuf structur=
e here */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s_buf.sem_op =3D 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* add this value to struct sem.semval */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s_buf.sem_flg =3D SEM_UNDO;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* undo when process exits */<br>
@@ -61,7 +68,7 @@ static void run(unsigned int i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* use the TEST macro to make the call<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(semop(sem_id, &amp;s_buf, 1));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(call_semop(tv, sem_id, &amp;s_buf, 1, &amp=
;timeout));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TST_RET !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL | TTE=
RRNO, &quot;call succeeded unexpectedly&quot;);<br>
@@ -80,6 +87,8 @@ static void run(unsigned int i)<br>
<br>
=C2=A0static void setup(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Testing variant: %s&quot;,=
 variants[tst_variant].desc);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* get an IPC resource key */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 semkey =3D GETIPCKEY();<br>
<br>
@@ -102,6 +111,7 @@ static void cleanup(void)<br>
=C2=A0static struct tst_test test =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .test =3D run,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .tcnt =3D ARRAY_SIZE(tc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_variants =3D ARRAY_SIZE(variants),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cleanup =3D cleanup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .needs_tmpdir =3D 1,<br>
diff --git a/testcases/kernel/syscalls/ipc/semop/semop04.c b/testcases/kern=
el/syscalls/ipc/semop/semop04.c<br>
index 0faf00a3585f..033065e7bbfc 100644<br>
--- a/testcases/kernel/syscalls/ipc/semop/semop04.c<br>
+++ b/testcases/kernel/syscalls/ipc/semop/semop04.c<br>
@@ -38,6 +38,7 @@<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;libnewipc.h&quot;<br>
=C2=A0#include &quot;lapi/semun.h&quot;<br>
+#include &quot;semop.h&quot;<br>
<br>
=C2=A0static int sem_id =3D -1;<br>
=C2=A0static int val; /* value for SETVAL */<br>
@@ -62,6 +63,12 @@ static struct test_case_t {<br>
<br>
=C2=A0static void run(unsigned int i)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct test_variants *tv =3D &amp;variants[tst_=
variant];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tst_ts timeout;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0timeout.type =3D tv-&gt;type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_ts_set_nsec(&amp;timeout, 10000);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* initialize the s_buf buffer */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s_buf.sem_op =3D tc[i].op;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s_buf.sem_flg =3D tc[i].flg;<br>
@@ -72,7 +79,7 @@ static void run(unsigned int i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (semctl(sem_id, tc[i].num, SETVAL, tc[i].get=
_arr) =3D=3D -1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBROK | TER=
RNO, &quot;semctl() failed&quot;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(semop(sem_id, &amp;s_buf, 1));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(call_semop(tv, sem_id, &amp;s_buf, 1, &amp=
;timeout));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TST_RET !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quo=
t;call succeeded unexpectedly&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
@@ -86,6 +93,8 @@ static void run(unsigned int i)<br>
<br>
=C2=A0static void setup(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Testing variant: %s&quot;,=
 variants[tst_variant].desc);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* get an IPC resource key */<br>
@@ -114,6 +123,7 @@ static void cleanup(void)<br>
=C2=A0static struct tst_test test =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .test =3D run,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .tcnt =3D ARRAY_SIZE(tc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_variants =3D ARRAY_SIZE(variants),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cleanup =3D cleanup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .needs_tmpdir =3D 1,<br>
diff --git a/testcases/kernel/syscalls/ipc/semop/semop05.c b/testcases/kern=
el/syscalls/ipc/semop/semop05.c<br>
index 9e8e040b0b19..f892cd519ecf 100644<br>
--- a/testcases/kernel/syscalls/ipc/semop/semop05.c<br>
+++ b/testcases/kernel/syscalls/ipc/semop/semop05.c<br>
@@ -52,6 +52,7 @@<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;libnewipc.h&quot;<br>
=C2=A0#include &quot;lapi/semun.h&quot;<br>
+#include &quot;semop.h&quot;<br>
<br>
=C2=A0static key_t semkey;<br>
=C2=A0static int sem_id =3D -1;<br>
@@ -115,7 +116,13 @@ static inline int process_state_wait2(pid_t pid, const=
 char state)<br>
<br>
=C2=A0static void do_child(int i)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(semop(sem_id, &amp;s_buf, 1));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct test_variants *tv =3D &amp;variants[tst_=
variant];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tst_ts timeout;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0timeout.type =3D tv-&gt;type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_ts_set_nsec(&amp;timeout, 10000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(call_semop(tv, sem_id, &amp;s_buf, 1, &amp=
;timeout));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TST_RET !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quo=
t;call succeeded when error expected&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
@@ -137,6 +144,8 @@ static void sighandler(int sig)<br>
<br>
=C2=A0static void setup(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Testing variant: %s&quot;,=
 variants[tst_variant].desc);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_SIGNAL(SIGHUP, sighandler);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* get an IPC resource key */<br>
@@ -238,6 +247,7 @@ static void do_child_uclinux(void)<br>
=C2=A0static struct tst_test test =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .test =3D run,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .tcnt =3D ARRAY_SIZE(tc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_variants =3D ARRAY_SIZE(variants),<br></b=
lockquote><div><div class=3D"gmail_default" style=3D"font-size:small"></div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">RHEL=
8.2(x84_64) failed as:</div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-size:small"># ./semop05=C2=A0</div>tst_test.c:1246: INFO: Timeou=
t per run is 0h 05m 00s<br>semop05.c:147: INFO: Testing variant: semop: vDS=
O or syscall<br>semop05.c:132: PASS: expected failure: EIDRM (43)<br>semop0=
5.c:132: PASS: expected failure: EIDRM (43)<br>semop05.c:132: PASS: expecte=
d failure: EINTR (4)<br>semop05.c:132: PASS: expected failure: EINTR (4)<br=
>tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s<br>semop05.c:147: INF=
O: Testing variant: semtimedop: syscall with kernel spec64<br>semop05.c:134=
: FAIL: unexpected failure: EAGAIN/EWOULDBLOCK (11)<br>Test timeouted, send=
ing SIGKILL!<br>tst_test.c:1286: INFO: If you are running on slow machine, =
try exporting LTP_TIMEOUT_MUL &gt; 1<br>tst_test.c:1287: BROK: Test killed!=
 (timeout?)<br><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small"></div><div><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">RHEL8.2(s390x) failed as:</div></div><div><br></div><div>tst_tes=
t.c:1246: INFO: Timeout per run is 0h 05m 00s<br>semop05.c:147: INFO: Testi=
ng variant: semop: vDSO or syscall<br>semop05.c:132: PASS: expected failure=
: EIDRM (43)<br>semop05.c:132: PASS: expected failure: EIDRM (43)<br>semop0=
5.c:132: PASS: expected failure: EINTR (4)<br>semop05.c:132: PASS: expected=
 failure: EINTR (4)<br>tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s=
<br>semop05.c:147: INFO: Testing variant: semtimedop: syscall with kernel s=
pec64<br>semop.h:13: CONF: syscall(392) __NR_semtimedop not supported<br>Te=
st timeouted, sending SIGKILL!<br>tst_test.c:1286: INFO: If you are running=
 on slow machine, try exporting LTP_TIMEOUT_MUL &gt; 1<br>tst_test.c:1287: =
BROK: Test killed! (timeout?)<br class=3D"gmail-Apple-interchange-newline">=
<div class=3D"gmail_default" style=3D"font-size:small"></div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cleanup =3D cleanup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .needs_tmpdir =3D 1,<br>
-- <br>
2.25.0.rc1.19.g042ed3e048af<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000abadbd05a52f7411--


--===============0458886963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0458886963==--

