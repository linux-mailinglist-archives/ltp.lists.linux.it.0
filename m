Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2311B216F
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 10:19:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F53D3C29AA
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 10:19:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E08C13C2999
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 10:19:51 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 7004F1401740
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 10:19:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587457185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sIUMwA5hI+DiNMqWVHxA76Q1HaKYhacMOxCaWz4Pc90=;
 b=d60r192EmM+Zf5JWcrwECjL29fp7SJ+RPsHBbTO2TsfCV22hytCl6zZrchylwy9Lk1Itzu
 GQhGUpyEy0ufifa8nWRUxm61srIuVXRdh9KL13Pl793sFEP7XvOypobZeqCGz4X4WXBzPY
 O9h38s1tcyJSdPW60Wl3vEJCrU6Rn/4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-5YbnGUtSNUmJEalxwdB-6A-1; Tue, 21 Apr 2020 04:19:22 -0400
X-MC-Unique: 5YbnGUtSNUmJEalxwdB-6A-1
Received: by mail-lf1-f69.google.com with SMTP id t194so5494190lff.20
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 01:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sIUMwA5hI+DiNMqWVHxA76Q1HaKYhacMOxCaWz4Pc90=;
 b=JtzZPPY+70QMyhl9pk0hnFvI4LEOcwxESB0UFQ//pJPPa8NdkSFx1Y4WT/V7f2BjDV
 g6gBBvtKwXKL9UFVb6aiSyB3X8VSx0UhwkJpEeR94kQFnNF0tOT+gHAQI9P4jXqxU2nl
 HWTgMqPay1xqP+SjnMJKZII/zeJFARLvtZpUXQv0RnPHIXcFFraBtG2W1FZ+7pu3zOYS
 lRqixBLxZZE5RMj9ucMzv+/CwAsY+CvJHJe9tXXA/AQNitqpwhHbeAp5ipoiiTtHeYcl
 ilqb5VUPoPIiV7FhN9pdMdZ4kfizEuK1TsOKAbXc3+b1FL7O7Fse/9fXecqsNjJnkcgN
 8YEw==
X-Gm-Message-State: AGi0Pubig1NZc94E6dZgL+UuTn1yIYrwdIby0yU6B8rldDhg9akTmN6U
 b4HJZm9A6/a72DLt/016UZi6dK/0SZ06W5MwhU+N+XLOlDZ93nF/FqoPe4bBMM5cDiW5fLRdwpA
 hM6xMwT7ynFFwll9+52mr9qU0xYc=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr2792355ljg.217.1587457161203; 
 Tue, 21 Apr 2020 01:19:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypJiwdcJWlODx5rDR4jokIZBoA4E62R2eujsQZAs3+dNH4vDyEzdUhLPEKwvYumQoGwG2EfJcoyAv5gFV5z+z5M=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr2792347ljg.217.1587457160870; 
 Tue, 21 Apr 2020 01:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1587022142-32122-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 21 Apr 2020 16:19:08 +0800
Message-ID: <CAEemH2dfPZs_DQxm33hsaYTXcsxddA0TTTMcbCuZgjekvCCGPA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] syscalls/pipe2_01: convert into new API
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
Content-Type: multipart/mixed; boundary="===============1831553330=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1831553330==
Content-Type: multipart/alternative; boundary="0000000000002b8f5e05a3c8ac1e"

--0000000000002b8f5e05a3c8ac1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

On Thu, Apr 16, 2020 at 3:29 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Also, add O_DIRECT flag test. This flag was introduced since
> commit 9883035ae7ed ("pipes: add a "packetized pipe" mode for writing").
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  include/lapi/fcntl.h                       |   4 +
>  runtest/syscalls                           |   1 -
>  testcases/kernel/syscalls/pipe2/.gitignore |   1 -
>  testcases/kernel/syscalls/pipe2/pipe2_01.c | 234 ++++++---------------
>  testcases/kernel/syscalls/pipe2/pipe2_02.c | 175 ---------------
>  5 files changed, 65 insertions(+), 350 deletions(-)
>  delete mode 100644 testcases/kernel/syscalls/pipe2/pipe2_02.c
>
> diff --git a/include/lapi/fcntl.h b/include/lapi/fcntl.h
> index 24aa46e1f..576a18daf 100644
> --- a/include/lapi/fcntl.h
> +++ b/include/lapi/fcntl.h
> @@ -9,6 +9,10 @@
>  #include <fcntl.h>
>  #include <sys/socket.h>
>
> +#ifndef O_DIRECT
> +# define O_DIRECT 040000
> +#endif
> +
>  #ifndef O_CLOEXEC
>  # define O_CLOEXEC 02000000
>  #endif
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 44254d7da..79b671d50 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -911,7 +911,6 @@ pipe12 pipe12
>  pipe13 pipe13
>
>  pipe2_01 pipe2_01
> -pipe2_02 pipe2_02
>
>  pivot_root01 pivot_root01
>
> diff --git a/testcases/kernel/syscalls/pipe2/.gitignore
> b/testcases/kernel/syscalls/pipe2/.gitignore
> index cd38bb309..42350bbdc 100644
> --- a/testcases/kernel/syscalls/pipe2/.gitignore
> +++ b/testcases/kernel/syscalls/pipe2/.gitignore
> @@ -1,2 +1 @@
>  /pipe2_01
> -/pipe2_02
> diff --git a/testcases/kernel/syscalls/pipe2/pipe2_01.c
> b/testcases/kernel/syscalls/pipe2/pipe2_01.c
> index 5f3ad8f0f..86f3f18d6 100644
> --- a/testcases/kernel/syscalls/pipe2/pipe2_01.c
> +++ b/testcases/kernel/syscalls/pipe2/pipe2_01.c
> @@ -1,186 +1,74 @@
>
> -/***********************************************************************=
*******/
> -/*
>     */
> -/* Copyright (c) Ulrich Drepper <drepper@redhat.com>
>       */
> -/* Copyright (c) International Business Machines  Corp., 2009
>      */
> -/*
>     */
> -/* This program is free software;  you can redistribute it and/or modify
>     */
> -/* it under the terms of the GNU General Public License as published by
>      */
> -/* the Free Software Foundation; either version 2 of the License, or
>     */
> -/* (at your option) any later version.
>     */
> -/*
>     */
> -/* This program is distributed in the hope that it will be useful,
>     */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of
>     */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>     */
> -/* the GNU General Public License for more details.
>      */
> -/*
>     */
> -/* You should have received a copy of the GNU General Public License
>     */
> -/* along with this program;  if not, write to the Free Software
>      */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301 USA    */
> -/*
>     */
>
> -/***********************************************************************=
*******/
>
> -/***********************************************************************=
*******/
> -/*
>     */
> -/* File:        pipe2_01.c
>     */
> -/*
>     */
> -/* Description: This Program tests the new system call introduced in
> 2.6.27.  */
> -/*              Ulrich=C2=B4s comment as in:
>      */
> -/*
> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dco=
mmit;h=3Ded8cae8ba01348bfd83333f4648dd807b04d7f08
> */
> -/*              says:
>      */
> -/* This patch introduces the new syscall pipe2 which is like pipe but it
> also */
> -/* takes an additional parameter which takes a flag value.  This patch
>     */
> -/* implements the handling of O_CLOEXEC for the flag.  I did not add
> support  */
> -/* for the new syscall for the architectures which have a special
> sys_pipe    */
> -/* implementation.  I think the maintainers of those archs have the
> chance to */
> -/* go with the unified implementation but that's up to them.
>     */
> -/*
>     */
> -/* The implementation introduces do_pipe_flags.  I did that instead of
>     */
> -/* changing all callers of do_pipe because some of the callers are
> written in */
> -/* assembler. I would probably screw up changing the assembly code.  To
> avoid */
> -/* breaking code do_pipe is now a small wrapper around do_pipe_flags.
> Once   */
> -/* all callers are changed over to do_pipe_flags the old do_pipe functio=
n
> can */
> -/* be removed.
>     */
> -/* The following test must be adjusted for architectures other than x86
> and   */
> -/* x86-64 and in case the syscall numbers changed.
>     */
> -/*
>     */
> -/* Usage:  <for command-line>
>      */
> -/* pipe2_01 [-c n] [-e][-i n] [-I x] [-p x] [-t]
>     */
> -/*      where,  -c n : Run n copies concurrently.
>      */
> -/*              -e   : Turn on errno logging.
>      */
> -/*              -i n : Execute test n times.
>     */
> -/*              -I x : Execute test for x seconds.
>     */
> -/*              -P x : Pause for x seconds between iterations.
>     */
> -/*              -t   : Turn on syscall timing.
>     */
> -/*
>     */
> -/* Total Tests: 1
>      */
> -/*
>     */
> -/* Test Name:   pipe2_01
>     */
> -/*
>     */
> -/* Author:      Ulrich Drepper <drepper@redhat.com>
>      */
> -/*
>     */
> -/* History:     Created - Jan 13 2009 - Ulrich Drepper <
> drepper@redhat.com>   */
> -/*              Ported to LTP
>      */
> -/*                      - Jan 13 2009 - Subrata <
> subrata@linux.vnet.ibm.com>  */
>
> -/***********************************************************************=
*******/
> -#include <fcntl.h>
> +// SPDX-License-Identifier: GPL-2.0-or-late
> +/*
> + * Copyright (c) Ulrich Drepper <drepper@redhat.com>
> + * Copyright (c) International Business Machines  Corp., 2009
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + *
> + * Author: Ulrich Drepper <drepper@redhat.com>
> + *
> + * History:
> + * Created - Jan 13 2009 - Ulrich Drepper <drepper@redhat.com>
> + * Ported to LTP - Jan 13 2009 - Subrata <subrata@linux.vnet.ibm.com>
> + * Converted into new api - Apri 15 2020 - Yang Xu <
> xuyang2018.jy@cn.fujitsu.com>
> + */
> +#define _GNU_SOURCE
>  #include <stdio.h>
>  #include <unistd.h>
> -#include <sys/syscall.h>
> -#include <errno.h>
> -
> -#include "test.h"
>  #include "lapi/fcntl.h"
> -#include "lapi/syscalls.h"
> -
> -char *TCID =3D "pipe2_01";
> -int testno;
> -int TST_TOTAL =3D 1;
> +#include "tst_test.h"
>
> -/* Extern Global Functions */
>
> -/***********************************************************************=
*******/
> -/*
>     */
> -/* Function:    cleanup
>      */
> -/*
>     */
> -/* Description: Performs all one time clean up for this test on
> successful    */
> -/*              completion,  premature exit or  failure. Closes all
> temporary */
> -/*              files, removes all temporary directories exits the test
> with  */
> -/*              appropriate return code by calling tst_exit() function.
>      */
> -/*
>     */
> -/* Input:       None.
>      */
> -/*
>     */
> -/* Output:      None.
>      */
> -/*
>     */
> -/* Return:      On failure - Exits calling tst_exit(). Non '0' return
> code.   */
> -/*              On success - Exits calling tst_exit(). With '0' return
> code.  */
> -/*
>     */
>
> -/***********************************************************************=
*******/
> -void cleanup(void)
> -{
> +static int fds[2];
>
> -       tst_rmdir();
> -
> -}
> +static struct tcase {
> +       int flags;
> +       int check_cmd;
>

The 'check_cmd' sounds strange here since we don't do any check for the
cmd, can we use 'cmd' directly?


> +       int check_read_side;
>

A pipe has a read-end and a write-end. So I prefer to call this
'check_read_end', do you agree?


> +       char *message;
> +} tcases[] =3D {
> +       {0, F_GETFD, 1, "Test pipe2 with 0 flag"},
> +       {O_CLOEXEC, F_GETFD, 1, "Test pipe2 using O_CLOEXEC flag"},
> +       /*
> +        * It may get EINVAL error on older kernel because this flag was
> +        * introduced since kernel 3.4. We only test flag in write side
> +        * because this flag was used to make pipe buffer marked with the
> +        * PIPE_BUF_FLAG_PACKET flag. In read side, kernel also check
> buffer
> +        * flag instead of O_DIRECT. So it make no sense to check this fl=
ag
> +        * in fds[0].
> +        */
> +       {O_DIRECT, F_GETFL, 0, "Test pipe2 using O_DIRECT flag"},
> +       {O_NONBLOCK, F_GETFL, 1, "Test pipe2 using O_NONBLOCK flag"},
> +};
>
> -/* Local  Functions */
>
> -/***********************************************************************=
*******/
> -/*
>     */
> -/* Function:    setup
>      */
> -/*
>     */
> -/* Description: Performs all one time setup for this test. This function
> is   */
> -/*              typically used to capture signals, create temporary dirs
>     */
> -/*              and temporary files that may be used in the course of
> this    */
> -/*              test.
>      */
> -/*
>     */
> -/* Input:       None.
>      */
> -/*
>     */
> -/* Output:      None.
>      */
> -/*
>     */
> -/* Return:      On failure - Exits by calling cleanup().
>     */
> -/*              On success - returns 0.
>      */
> -/*
>     */
>
> -/***********************************************************************=
*******/
> -void setup(void)
> +static void cleanup(void)
>  {
> -       /* Capture signals if any */
> -       /* Create temporary directories */
> -       TEST_PAUSE;
> -       tst_tmpdir();
> +       if (fds[0] > 0)
> +               SAFE_CLOSE(fds[0]);
> +       if (fds[1] > 1)
> +               SAFE_CLOSE(fds[1]);
>  }
>
> -int main(int argc, char *argv[])
> +static void verify_pipe2(unsigned int n)
>  {
> -       int fd[2], i, coe;
> -       int lc;
> +       struct tcase *tc =3D &tcases[n];
> +       int get_flag =3D 0, i =3D 0;
>
> -       tst_parse_opts(argc, argv, NULL, NULL);
> -       if ((tst_kvercmp(2, 6, 27)) < 0) {
> -               tst_brkm(TCONF,
> -                        NULL,
> -                        "This test can only run on kernels that are
> 2.6.27 and higher");
> +       tst_res(TINFO, "%s ", tc->message);
> +       SAFE_PIPE2(fds, tc->flags);
> +       for (i =3D 0; i < 2; i++) {
> +               if (i =3D=3D 0 && !tc->check_read_side)
> +                       continue;
> +               get_flag =3D SAFE_FCNTL(fds[i], tc->check_cmd);
> +               if ((get_flag && tc->flags) || (tc->flags =3D=3D get_flag=
))
> +                       tst_res(TPASS, "pipe2 fds[%d] gets expected
> flag(%d)", i, tc->flags);
> +               else
> +                       tst_res(TFAIL, "pipe2 fds[%d] doesn't get expecte=
d
> flag(%d), get flag(%d)",
> +                                       i, tc->flags, get_flag);
>         }
> -       setup();
> -
> -       for (lc =3D 0; TEST_LOOPING(lc); ++lc) {
> -               tst_count =3D 0;
> -               for (testno =3D 0; testno < TST_TOTAL; ++testno) {
> -                       if (ltp_syscall(__NR_pipe2, fd, 0) !=3D 0) {
> -                               tst_brkm(TFAIL, cleanup, "pipe2(0)
> failed");
> -                       }
> -                       for (i =3D 0; i < 2; ++i) {
> -                               coe =3D fcntl(fd[i], F_GETFD);
> -                               if (coe =3D=3D -1) {
> -                                       tst_brkm(TBROK, cleanup,
> -                                                "fcntl failed");
> -                               }
> -                               if (coe & FD_CLOEXEC) {
> -                                       tst_brkm(TFAIL,
> -                                                cleanup, "pipe2(0) set
> close-on-exit for fd[%d]",
> -                                                i);
> -                               }
> -                       }
> -                       close(fd[0]);
> -                       close(fd[1]);
> -
> -                       if (ltp_syscall(__NR_pipe2, fd, O_CLOEXEC) !=3D 0=
) {
> -                               tst_brkm(TFAIL, cleanup,
> -                                        "pipe2(O_CLOEXEC) failed");
> -                       }
> -                       for (i =3D 0; i < 2; ++i) {
> -                               coe =3D fcntl(fd[i], F_GETFD);
> -                               if (coe =3D=3D -1) {
> -                                       tst_brkm(TBROK, cleanup,
> -                                                "fcntl failed");
> -                               }
> -                               if ((coe & FD_CLOEXEC) =3D=3D 0) {
> -                                       tst_brkm(TFAIL,
> -                                                cleanup,
> "pipe2(O_CLOEXEC) does not set close-on-exit for fd[%d]",
> -                                                i);
> -                               }
> -                       }
> -                       close(fd[0]);
> -                       close(fd[1]);
> -                       tst_resm(TPASS, "pipe2(O_CLOEXEC) PASSED");
> -                       cleanup();
> -               }
> -       }
> -       tst_exit();
> +       cleanup();
>  }
> +
> +static struct tst_test test =3D {
> +       .tcnt =3D ARRAY_SIZE(tcases),
> +       .test =3D verify_pipe2,
> +       .cleanup =3D cleanup,
> +};
> diff --git a/testcases/kernel/syscalls/pipe2/pipe2_02.c
> b/testcases/kernel/syscalls/pipe2/pipe2_02.c
> deleted file mode 100644
> index 39f02ff8c..000000000
> --- a/testcases/kernel/syscalls/pipe2/pipe2_02.c
> +++ /dev/null
> @@ -1,175 +0,0 @@
>
> -/***********************************************************************=
*******/
> -/*
>     */
> -/* Copyright (c) Ulrich Drepper <drepper@redhat.com>
>       */
> -/* Copyright (c) International Business Machines  Corp., 2009
>      */
> -/*
>     */
> -/* This program is free software;  you can redistribute it and/or modify
>     */
> -/* it under the terms of the GNU General Public License as published by
>      */
> -/* the Free Software Foundation; either version 2 of the License, or
>     */
> -/* (at your option) any later version.
>     */
> -/*
>     */
> -/* This program is distributed in the hope that it will be useful,
>     */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of
>     */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>     */
> -/* the GNU General Public License for more details.
>      */
> -/*
>     */
> -/* You should have received a copy of the GNU General Public License
>     */
> -/* along with this program;  if not, write to the Free Software
>      */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301 USA    */
> -/*
>     */
>
> -/***********************************************************************=
*******/
>
> -/***********************************************************************=
*******/
> -/*
>     */
> -/* File:        pipe2_02.c
>     */
> -/*
>     */
> -/* Description: This Program tests the new system call introduced in
> 2.6.27.  */
> -/*              Ulrich=C2=B4s comment as in:
>      */
> -/*
> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dco=
mmit;h=3Dbe61a86d7237dd80510615f38ae21d6e1e98660c
> */
> -/* which says:
>     */
> -/* This patch adds O_NONBLOCK support to pipe2.  It is minimally more
> involved*/
> -/* than the patches for eventfd et.al but still trivial.  The interfaces
> of   */
> -/* the create_write_pipe and create_read_pipe helper functions were
> changed   */
> -/* and the one other caller as well.
>     */
> -/* The following test must be adjusted for architectures other than x86
> and   */
> -/* x86-64 and in case the syscall numbers changed.
>     */
> -/*
>     */
> -/* Usage:  <for command-line>
>      */
> -/* pipe2_02 [-c n] [-e][-i n] [-I x] [-p x] [-t]
>     */
> -/*      where,  -c n : Run n copies concurrently.
>      */
> -/*              -e   : Turn on errno logging.
>      */
> -/*              -i n : Execute test n times.
>     */
> -/*              -I x : Execute test for x seconds.
>     */
> -/*              -P x : Pause for x seconds between iterations.
>     */
> -/*              -t   : Turn on syscall timing.
>     */
> -/*
>     */
> -/* Total Tests: 1
>      */
> -/*
>     */
> -/* Test Name:   pipe2_02
>     */
> -/*
>     */
> -/* Author:      Ulrich Drepper <drepper@redhat.com>
>      */
> -/*
>     */
> -/* History:     Created - Jan 13 2009 - Ulrich Drepper <
> drepper@redhat.com>   */
> -/*              Ported to LTP
>      */
> -/*                      - Jan 13 2009 - Subrata <
> subrata@linux.vnet.ibm.com>  */
>
> -/***********************************************************************=
*******/
> -#include <fcntl.h>
> -#include <stdio.h>
> -#include <unistd.h>
> -#include <sys/syscall.h>
> -#include <errno.h>
> -
> -#include "test.h"
> -#include "lapi/fcntl.h"
> -#include "lapi/syscalls.h"
> -
> -char *TCID =3D "pipe2_02";
> -int testno;
> -int TST_TOTAL =3D 1;
> -
> -/* Extern Global Functions */
>
> -/***********************************************************************=
*******/
> -/*
>     */
> -/* Function:    cleanup
>      */
> -/*
>     */
> -/* Description: Performs all one time clean up for this test on
> successful    */
> -/*              completion,  premature exit or  failure. Closes all
> temporary */
> -/*              files, removes all temporary directories exits the test
> with  */
> -/*              appropriate return code by calling tst_exit() function.
>      */
> -/*
>     */
> -/* Input:       None.
>      */
> -/*
>     */
> -/* Output:      None.
>      */
> -/*
>     */
> -/* Return:      On failure - Exits calling tst_exit(). Non '0' return
> code.   */
> -/*              On success - Exits calling tst_exit(). With '0' return
> code.  */
> -/*
>     */
>
> -/***********************************************************************=
*******/
> -void cleanup(void)
> -{
> -
> -       tst_rmdir();
> -
> -}
> -
> -/* Local  Functions */
>
> -/***********************************************************************=
*******/
> -/*
>     */
> -/* Function:    setup
>      */
> -/*
>     */
> -/* Description: Performs all one time setup for this test. This function
> is   */
> -/*              typically used to capture signals, create temporary dirs
>     */
> -/*              and temporary files that may be used in the course of
> this    */
> -/*              test.
>      */
> -/*
>     */
> -/* Input:       None.
>      */
> -/*
>     */
> -/* Output:      None.
>      */
> -/*
>     */
> -/* Return:      On failure - Exits by calling cleanup().
>     */
> -/*              On success - returns 0.
>      */
> -/*
>     */
>
> -/***********************************************************************=
*******/
> -void setup(void)
> -{
> -       /* Capture signals if any */
> -       /* Create temporary directories */
> -       TEST_PAUSE;
> -       tst_tmpdir();
> -}
> -
> -int main(int argc, char *argv[])
> -{
> -       int fds[2], fl, i;
> -       int lc;
> -
> -       tst_parse_opts(argc, argv, NULL, NULL);
> -       if ((tst_kvercmp(2, 6, 27)) < 0) {
> -               tst_brkm(TCONF,
> -                        NULL,
> -                        "This test can only run on kernels that are
> 2.6.27 and higher");
> -       }
> -       setup();
> -
> -       for (lc =3D 0; TEST_LOOPING(lc); ++lc) {
> -               tst_count =3D 0;
> -               for (testno =3D 0; testno < TST_TOTAL; ++testno) {
> -                       if (ltp_syscall(__NR_pipe2, fds, 0) =3D=3D -1) {
> -                               tst_brkm(TFAIL, cleanup, "pipe2(0)
> failed");
> -                       }
> -                       for (i =3D 0; i < 2; ++i) {
> -                               fl =3D fcntl(fds[i], F_GETFL);
> -                               if (fl =3D=3D -1) {
> -                                       tst_brkm(TBROK, cleanup,
> -                                                "fcntl failed");
> -                               }
> -                               if (fl & O_NONBLOCK) {
> -                                       tst_brkm(TFAIL,
> -                                                cleanup, "pipe2(0) set
> non-blocking mode for fds[%d]",
> -                                                i);
> -                               }
> -                               close(fds[i]);
> -                       }
> -
> -                       if (ltp_syscall(__NR_pipe2, fds, O_NONBLOCK) =3D=
=3D
> -1) {
> -                               tst_brkm(TFAIL, cleanup,
> -                                        "pipe2(O_NONBLOCK) failed");
> -                       }
> -                       for (i =3D 0; i < 2; ++i) {
> -                               fl =3D fcntl(fds[i], F_GETFL);
> -                               if (fl =3D=3D -1) {
> -                                       tst_brkm(TBROK, cleanup,
> -                                                "fcntl failed");
> -                               }
> -                               if ((fl & O_NONBLOCK) =3D=3D 0) {
> -                                       tst_brkm(TFAIL,
> -                                                cleanup,
> "pipe2(O_NONBLOCK) does not set non-blocking mode for fds[%d]\n",
> -                                                i);
> -                               }
> -                               close(fds[i]);
> -                       }
> -                       tst_resm(TPASS, "pipe2(O_NONBLOCK) PASSED");
> -                       cleanup();
> -               }
> -       }
> -       tst_exit();
> -}
> --
> 2.23.0
>
>
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


--=20
Regards,
Li Wang

--0000000000002b8f5e05a3c8ac1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIg
c3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+SGkgWHUsPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1LCBB
cHIgMTYsIDIwMjAgYXQgMzoyOSBQTSBZYW5nIFh1ICZsdDs8YSBocmVmPSJtYWlsdG86eHV5YW5n
MjAxOC5qeUBjbi5mdWppdHN1LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnh1eWFuZzIwMTguanlAY24u
ZnVqaXRzdS5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFw
eCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkFsc28sIGFkZCBPX0RJ
UkVDVCBmbGFnIHRlc3QuIFRoaXMgZmxhZyB3YXMgaW50cm9kdWNlZCBzaW5jZTxicj4NCmNvbW1p
dCA5ODgzMDM1YWU3ZWQgKCZxdW90O3BpcGVzOiBhZGQgYSAmcXVvdDtwYWNrZXRpemVkIHBpcGUm
cXVvdDsgbW9kZSBmb3Igd3JpdGluZyZxdW90OykuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTog
WWFuZyBYdSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20i
IHRhcmdldD0iX2JsYW5rIj54dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPC9hPiZndDs8YnI+
DQotLS08YnI+DQrCoGluY2x1ZGUvbGFwaS9mY250bC5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB8wqAgwqA0ICs8YnI+DQrCoHJ1bnRlc3Qvc3lzY2FsbHPCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDEgLTxicj4NCsKgdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9waXBlMi8uZ2l0aWdub3JlIHzCoCDCoDEgLTxicj4NCsKgdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9waXBlMi9waXBlMl8wMS5jIHwgMjM0ICsrKysrKy0tLS0tLS0tLS0t
LS0tLTxicj4NCsKgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waXBlMi9waXBlMl8wMi5jIHwg
MTc1IC0tLS0tLS0tLS0tLS0tLTxicj4NCsKgNSBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25z
KCspLCAzNTAgZGVsZXRpb25zKC0pPGJyPg0KwqBkZWxldGUgbW9kZSAxMDA2NDQgdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9waXBlMi9waXBlMl8wMi5jPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGFwaS9mY250bC5oIGIvaW5jbHVkZS9sYXBpL2ZjbnRsLmg8YnI+DQppbmRleCAy
NGFhNDZlMWYuLjU3NmExOGRhZiAxMDA2NDQ8YnI+DQotLS0gYS9pbmNsdWRlL2xhcGkvZmNudGwu
aDxicj4NCisrKyBiL2luY2x1ZGUvbGFwaS9mY250bC5oPGJyPg0KQEAgLTksNiArOSwxMCBAQDxi
cj4NCsKgI2luY2x1ZGUgJmx0O2ZjbnRsLmgmZ3Q7PGJyPg0KwqAjaW5jbHVkZSAmbHQ7c3lzL3Nv
Y2tldC5oJmd0Ozxicj4NCjxicj4NCisjaWZuZGVmIE9fRElSRUNUPGJyPg0KKyMgZGVmaW5lIE9f
RElSRUNUIDA0MDAwMDxicj4NCisjZW5kaWY8YnI+DQorPGJyPg0KwqAjaWZuZGVmIE9fQ0xPRVhF
Qzxicj4NCsKgIyBkZWZpbmUgT19DTE9FWEVDIDAyMDAwMDAwPGJyPg0KwqAjZW5kaWY8YnI+DQpk
aWZmIC0tZ2l0IGEvcnVudGVzdC9zeXNjYWxscyBiL3J1bnRlc3Qvc3lzY2FsbHM8YnI+DQppbmRl
eCA0NDI1NGQ3ZGEuLjc5YjY3MWQ1MCAxMDA2NDQ8YnI+DQotLS0gYS9ydW50ZXN0L3N5c2NhbGxz
PGJyPg0KKysrIGIvcnVudGVzdC9zeXNjYWxsczxicj4NCkBAIC05MTEsNyArOTExLDYgQEAgcGlw
ZTEyIHBpcGUxMjxicj4NCsKgcGlwZTEzIHBpcGUxMzxicj4NCjxicj4NCsKgcGlwZTJfMDEgcGlw
ZTJfMDE8YnI+DQotcGlwZTJfMDIgcGlwZTJfMDI8YnI+DQo8YnI+DQrCoHBpdm90X3Jvb3QwMSBw
aXZvdF9yb290MDE8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9waXBlMi8uZ2l0aWdub3JlIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waXBlMi8u
Z2l0aWdub3JlPGJyPg0KaW5kZXggY2QzOGJiMzA5Li40MjM1MGJiZGMgMTAwNjQ0PGJyPg0KLS0t
IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waXBlMi8uZ2l0aWdub3JlPGJyPg0KKysrIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waXBlMi8uZ2l0aWdub3JlPGJyPg0KQEAgLTEsMiAr
MSBAQDxicj4NCsKgL3BpcGUyXzAxPGJyPg0KLS9waXBlMl8wMjxicj4NCmRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpcGUyL3BpcGUyXzAxLmMgYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL3BpcGUyL3BpcGUyXzAxLmM8YnI+DQppbmRleCA1ZjNhZDhmMGYuLjg2ZjNm
MThkNiAxMDA2NDQ8YnI+DQotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpcGUyL3Bp
cGUyXzAxLmM8YnI+DQorKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpcGUyL3BpcGUy
XzAxLmM8YnI+DQpAQCAtMSwxODYgKzEsNzQgQEA8YnI+DQotLyoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Ki88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAqLzxicj4NCi0vKiBDb3B5cmlnaHQgKGMpIFVscmljaCBEcmVwcGVyICZsdDs8
YSBocmVmPSJtYWlsdG86ZHJlcHBlckByZWRoYXQuY29tIiB0YXJnZXQ9Il9ibGFuayI+ZHJlcHBl
ckByZWRoYXQuY29tPC9hPiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAqLzxicj4NCi0vKiBDb3B5cmlnaHQgKGMpIEludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGlu
ZXPCoCBDb3JwLiwgMjAwOcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQotLyrCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxi
cj4NCi0vKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTvCoCB5b3UgY2FuIHJlZGlzdHJp
YnV0ZSBpdCBhbmQvb3IgbW9kaWZ5wqAgwqAgwqAgKi88YnI+DQotLyogaXQgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnnCoCDC
oCDCoCDCoCovPGJyPg0KLS8qIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2
ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9ywqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogKGF0
IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8q
IFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUg
dXNlZnVsLMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qIGJ1dCBXSVRIT1VUIEFOWSBXQVJS
QU5UWTvCoCB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2bCoCDCoCDCoCDCoCDC
oCDCoCAqLzxicj4NCi0vKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UuwqAgU2VlwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyog
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qIFlv
dSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07
wqAgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgKi88YnI+DQotLyogRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0
aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQcKgIMKgICovPGJyPg0KLS8qwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+
DQotLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKi88YnI+DQotLyoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi88
YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAqLzxicj4NCi0vKiBGaWxlOsKgIMKgIMKgIMKgIHBpcGUyXzAxLmPCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qIERlc2NyaXB0aW9uOiBUaGlzIFByb2dy
YW0gdGVzdHMgdGhlIG5ldyBzeXN0ZW0gY2FsbCBpbnRyb2R1Y2VkIGluIDIuNi4yNy7CoCAqLzxi
cj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIFVscmljaMK0cyBjb21tZW50IGFzIGluOsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKi88
YnI+DQotLyogPGEgaHJlZj0iaHR0cDovL2dpdC5rZXJuZWwub3JnLz9wPWxpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXgtMi42LmdpdDthPWNvbW1pdDtoPWVkOGNhZThiYTAxMzQ4YmZkODMz
MzNmNDY0OGRkODA3YjA0ZDdmMDgiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHA6Ly9naXQua2VybmVsLm9yZy8/cD1saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LTIu
Ni5naXQ7YT1jb21taXQ7aD1lZDhjYWU4YmEwMTM0OGJmZDgzMzMzZjQ2NDhkZDgwN2IwNGQ3ZjA4
PC9hPiAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIHNheXM6wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAqLzxicj4NCi0vKiBUaGlzIHBhdGNoIGludHJvZHVjZXMgdGhlIG5ldyBz
eXNjYWxsIHBpcGUyIHdoaWNoIGlzIGxpa2UgcGlwZSBidXQgaXQgYWxzbyAqLzxicj4NCi0vKiB0
YWtlcyBhbiBhZGRpdGlvbmFsIHBhcmFtZXRlciB3aGljaCB0YWtlcyBhIGZsYWcgdmFsdWUuwqAg
VGhpcyBwYXRjaMKgIMKgIMKgIMKgICovPGJyPg0KLS8qIGltcGxlbWVudHMgdGhlIGhhbmRsaW5n
IG9mIE9fQ0xPRVhFQyBmb3IgdGhlIGZsYWcuwqAgSSBkaWQgbm90IGFkZCBzdXBwb3J0wqAgKi88
YnI+DQotLyogZm9yIHRoZSBuZXcgc3lzY2FsbCBmb3IgdGhlIGFyY2hpdGVjdHVyZXMgd2hpY2gg
aGF2ZSBhIHNwZWNpYWwgc3lzX3BpcGXCoCDCoCAqLzxicj4NCi0vKiBpbXBsZW1lbnRhdGlvbi7C
oCBJIHRoaW5rIHRoZSBtYWludGFpbmVycyBvZiB0aG9zZSBhcmNocyBoYXZlIHRoZSBjaGFuY2Ug
dG8gKi88YnI+DQotLyogZ28gd2l0aCB0aGUgdW5pZmllZCBpbXBsZW1lbnRhdGlvbiBidXQgdGhh
dCYjMzk7cyB1cCB0byB0aGVtLsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8q
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Ki88YnI+DQotLyogVGhlIGltcGxlbWVudGF0aW9uIGludHJvZHVjZXMgZG9fcGlwZV9mbGFncy7C
oCBJIGRpZCB0aGF0IGluc3RlYWQgb2bCoCDCoCDCoCDCoCAqLzxicj4NCi0vKiBjaGFuZ2luZyBh
bGwgY2FsbGVycyBvZiBkb19waXBlIGJlY2F1c2Ugc29tZSBvZiB0aGUgY2FsbGVycyBhcmUgd3Jp
dHRlbiBpbiAqLzxicj4NCi0vKiBhc3NlbWJsZXIuIEkgd291bGQgcHJvYmFibHkgc2NyZXcgdXAg
Y2hhbmdpbmcgdGhlIGFzc2VtYmx5IGNvZGUuwqAgVG8gYXZvaWQgKi88YnI+DQotLyogYnJlYWtp
bmcgY29kZSBkb19waXBlIGlzIG5vdyBhIHNtYWxsIHdyYXBwZXIgYXJvdW5kIGRvX3BpcGVfZmxh
Z3MuwqAgT25jZcKgIMKgKi88YnI+DQotLyogYWxsIGNhbGxlcnMgYXJlIGNoYW5nZWQgb3ZlciB0
byBkb19waXBlX2ZsYWdzIHRoZSBvbGQgZG9fcGlwZSBmdW5jdGlvbiBjYW4gKi88YnI+DQotLyog
YmUgcmVtb3ZlZC7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4N
Ci0vKiBUaGUgZm9sbG93aW5nIHRlc3QgbXVzdCBiZSBhZGp1c3RlZCBmb3IgYXJjaGl0ZWN0dXJl
cyBvdGhlciB0aGFuIHg4NiBhbmTCoCDCoCovPGJyPg0KLS8qIHg4Ni02NCBhbmQgaW4gY2FzZSB0
aGUgc3lzY2FsbCBudW1iZXJzIGNoYW5nZWQuwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKiBVc2FnZTrCoCAmbHQ7Zm9yIGNvbW1h
bmQtbGluZSZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCovPGJyPg0KLS8qIHBpcGUyXzAxIFstYyBuXSBb
LWVdWy1pIG5dIFstSSB4XSBbLXAgeF0gWy10XcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qwqAgwqAgwqAgd2hlcmUswqAgLWMgbiA6IFJ1biBu
IGNvcGllcyBjb25jdXJyZW50bHkuwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIC1lwqAgwqA6IFR1cm4gb24g
ZXJybm8gbG9nZ2luZy7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgLWkgbiA6IEV4ZWN1dGUgdGVz
dCBuIHRpbWVzLsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgLUkgeCA6IEV4ZWN1dGUgdGVzdCBm
b3IgeCBzZWNvbmRzLsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICov
PGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgLVAgeCA6IFBhdXNlIGZvciB4IHNlY29uZHMg
YmV0d2VlbiBpdGVyYXRpb25zLsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qwqAg
wqAgwqAgwqAgwqAgwqAgwqAgLXTCoCDCoDogVHVybiBvbiBzeXNjYWxsIHRpbWluZy7CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJy
Pg0KLS8qIFRvdGFsIFRlc3RzOiAxwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAq
Lzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICovPGJyPg0KLS8qIFRlc3QgTmFtZTrCoCDCoHBpcGUyXzAxwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKiBBdXRob3I6wqAgwqAgwqAgVWxyaWNo
IERyZXBwZXIgJmx0OzxhIGhyZWY9Im1haWx0bzpkcmVwcGVyQHJlZGhhdC5jb20iIHRhcmdldD0i
X2JsYW5rIj5kcmVwcGVyQHJlZGhhdC5jb208L2E+Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKiBIaXN0b3J5OsKgIMKgIMKg
Q3JlYXRlZCAtIEphbiAxMyAyMDA5IC0gVWxyaWNoIERyZXBwZXIgJmx0OzxhIGhyZWY9Im1haWx0
bzpkcmVwcGVyQHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5kcmVwcGVyQHJlZGhhdC5jb208
L2E+Jmd0O8KgIMKgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCBQb3J0ZWQgdG8gTFRQ
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIC0gSmFuIDEzIDIwMDkgLSBTdWJyYXRhICZsdDs8YSBocmVmPSJtYWlsdG86c3VicmF0YUBs
aW51eC52bmV0LmlibS5jb20iIHRhcmdldD0iX2JsYW5rIj5zdWJyYXRhQGxpbnV4LnZuZXQuaWJt
LmNvbTwvYT4mZ3Q7wqAgKi88YnI+DQotLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi88YnI+DQotI2lu
Y2x1ZGUgJmx0O2ZjbnRsLmgmZ3Q7PGJyPg0KKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9yLWxhdGU8YnI+DQorLyo8YnI+DQorICogQ29weXJpZ2h0IChjKSBVbHJpY2ggRHJl
cHBlciAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRyZXBwZXJAcmVkaGF0LmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmRyZXBwZXJAcmVkaGF0LmNvbTwvYT4mZ3Q7PGJyPg0KKyAqIENvcHlyaWdodCAoYykgSW50
ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNoaW5lc8KgIENvcnAuLCAyMDA5PGJyPg0KKyAqIENvcHly
aWdodCAoYykgMjAyMCBGVUpJVFNVIExJTUlURUQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuPGJyPg0K
KyAqPGJyPg0KKyAqIEF1dGhvcjogVWxyaWNoIERyZXBwZXIgJmx0OzxhIGhyZWY9Im1haWx0bzpk
cmVwcGVyQHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5kcmVwcGVyQHJlZGhhdC5jb208L2E+
Jmd0Ozxicj4NCisgKjxicj4NCisgKiBIaXN0b3J5Ojxicj4NCisgKiBDcmVhdGVkIC0gSmFuIDEz
IDIwMDkgLSBVbHJpY2ggRHJlcHBlciAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRyZXBwZXJAcmVkaGF0
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmRyZXBwZXJAcmVkaGF0LmNvbTwvYT4mZ3Q7PGJyPg0KKyAq
IFBvcnRlZCB0byBMVFAgLSBKYW4gMTMgMjAwOSAtIFN1YnJhdGEgJmx0OzxhIGhyZWY9Im1haWx0
bzpzdWJyYXRhQGxpbnV4LnZuZXQuaWJtLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnN1YnJhdGFAbGlu
dXgudm5ldC5pYm0uY29tPC9hPiZndDs8YnI+DQorICogQ29udmVydGVkIGludG8gbmV3IGFwaSAt
IEFwcmkgMTUgMjAyMCAtIFlhbmcgWHUgJmx0OzxhIGhyZWY9Im1haWx0bzp4dXlhbmcyMDE4Lmp5
QGNuLmZ1aml0c3UuY29tIiB0YXJnZXQ9Il9ibGFuayI+eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1
LmNvbTwvYT4mZ3Q7PGJyPg0KKyAqLzxicj4NCisjZGVmaW5lIF9HTlVfU09VUkNFPGJyPg0KwqAj
aW5jbHVkZSAmbHQ7c3RkaW8uaCZndDs8YnI+DQrCoCNpbmNsdWRlICZsdDt1bmlzdGQuaCZndDs8
YnI+DQotI2luY2x1ZGUgJmx0O3N5cy9zeXNjYWxsLmgmZ3Q7PGJyPg0KLSNpbmNsdWRlICZsdDtl
cnJuby5oJmd0Ozxicj4NCi08YnI+DQotI2luY2x1ZGUgJnF1b3Q7dGVzdC5oJnF1b3Q7PGJyPg0K
wqAjaW5jbHVkZSAmcXVvdDtsYXBpL2ZjbnRsLmgmcXVvdDs8YnI+DQotI2luY2x1ZGUgJnF1b3Q7
bGFwaS9zeXNjYWxscy5oJnF1b3Q7PGJyPg0KLTxicj4NCi1jaGFyICpUQ0lEID0gJnF1b3Q7cGlw
ZTJfMDEmcXVvdDs7PGJyPg0KLWludCB0ZXN0bm87PGJyPg0KLWludCBUU1RfVE9UQUwgPSAxOzxi
cj4NCisjaW5jbHVkZSAmcXVvdDt0c3RfdGVzdC5oJnF1b3Q7PGJyPg0KPGJyPg0KLS8qIEV4dGVy
biBHbG9iYWwgRnVuY3Rpb25zICovPGJyPg0KLS8qKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovPGJyPg0K
LS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgKi88YnI+DQotLyogRnVuY3Rpb246wqAgwqAgY2xlYW51cMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKiBEZXNjcmlwdGlvbjogUGVyZm9ybXMgYWxsIG9u
ZSB0aW1lIGNsZWFuIHVwIGZvciB0aGlzIHRlc3Qgb24gc3VjY2Vzc2Z1bMKgIMKgICovPGJyPg0K
LS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29tcGxldGlvbizCoCBwcmVtYXR1cmUgZXhpdCBvcsKg
IGZhaWx1cmUuIENsb3NlcyBhbGwgdGVtcG9yYXJ5ICovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAg
wqAgwqAgZmlsZXMsIHJlbW92ZXMgYWxsIHRlbXBvcmFyeSBkaXJlY3RvcmllcyBleGl0cyB0aGUg
dGVzdCB3aXRowqAgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcHByb3ByaWF0ZSBy
ZXR1cm4gY29kZSBieSBjYWxsaW5nIHRzdF9leGl0KCkgZnVuY3Rpb24uwqAgwqAgwqAgwqAqLzxi
cj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgICovPGJyPg0KLS8qIElucHV0OsKgIMKgIMKgIMKgTm9uZS7CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogT3V0cHV0OsKgIMKgIMKgIE5vbmUu
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qIFJldHVy
bjrCoCDCoCDCoCBPbiBmYWlsdXJlIC0gRXhpdHMgY2FsbGluZyB0c3RfZXhpdCgpLiBOb24gJiMz
OTswJiMzOTsgcmV0dXJuIGNvZGUuwqAgwqAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKg
IE9uIHN1Y2Nlc3MgLSBFeGl0cyBjYWxsaW5nIHRzdF9leGl0KCkuIFdpdGggJiMzOTswJiMzOTsg
cmV0dXJuIGNvZGUuwqAgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Lzxicj4NCi12b2lkIGNsZWFudXAodm9pZCk8YnI+DQotezxicj4NCitzdGF0aWMgaW50IGZkc1sy
XTs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqB0c3Rfcm1kaXIoKTs8YnI+DQotPGJyPg0KLX08YnI+
DQorc3RhdGljIHN0cnVjdCB0Y2FzZSB7PGJyPg0KK8KgIMKgIMKgIMKgaW50IGZsYWdzOzxicj4N
CivCoCDCoCDCoCDCoGludCBjaGVja19jbWQ7PGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rp
dj48ZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LXNpemU6c21hbGwi
PlRoZSAmIzM5O2NoZWNrX2NtZCYjMzk7IHNvdW5kcyBzdHJhbmdlIGhlcmUgc2luY2Ugd2UgZG9u
JiMzOTt0IGRvIGFueSBjaGVjayBmb3IgdGhlIGNtZCwgY2FuIHdlIHVzZSAmIzM5O2NtZCYjMzk7
IGRpcmVjdGx5PzwvZGl2PjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21h
aWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4
IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+DQorwqAgwqAgwqAgwqBp
bnQgY2hlY2tfcmVhZF9zaWRlOzxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj48
ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj5BIHBpcGUg
aGFzIGEgcmVhZC1lbmQgYW5kIGEgd3JpdGUtZW5kLiBTbyBJIHByZWZlciB0byBjYWxsIHRoaXMg
JiMzOTtjaGVja19yZWFkX2VuZCYjMzk7LCBkbyB5b3UgYWdyZWU/PC9kaXY+PC9kaXY+PGRpdj7C
oDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHgg
MHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRk
aW5nLWxlZnQ6MWV4Ij4NCivCoCDCoCDCoCDCoGNoYXIgKm1lc3NhZ2U7PGJyPg0KK30gdGNhc2Vz
W10gPSB7PGJyPg0KK8KgIMKgIMKgIMKgezAsIEZfR0VURkQsIDEsICZxdW90O1Rlc3QgcGlwZTIg
d2l0aCAwIGZsYWcmcXVvdDt9LDxicj4NCivCoCDCoCDCoCDCoHtPX0NMT0VYRUMsIEZfR0VURkQs
IDEsICZxdW90O1Rlc3QgcGlwZTIgdXNpbmcgT19DTE9FWEVDIGZsYWcmcXVvdDt9LDxicj4NCivC
oCDCoCDCoCDCoC8qPGJyPg0KK8KgIMKgIMKgIMKgICogSXQgbWF5IGdldCBFSU5WQUwgZXJyb3Ig
b24gb2xkZXIga2VybmVsIGJlY2F1c2UgdGhpcyBmbGFnIHdhczxicj4NCivCoCDCoCDCoCDCoCAq
IGludHJvZHVjZWQgc2luY2Uga2VybmVsIDMuNC4gV2Ugb25seSB0ZXN0IGZsYWcgaW4gd3JpdGUg
c2lkZTxicj4NCivCoCDCoCDCoCDCoCAqIGJlY2F1c2UgdGhpcyBmbGFnIHdhcyB1c2VkIHRvIG1h
a2UgcGlwZSBidWZmZXIgbWFya2VkIHdpdGggdGhlPGJyPg0KK8KgIMKgIMKgIMKgICogUElQRV9C
VUZfRkxBR19QQUNLRVQgZmxhZy4gSW4gcmVhZCBzaWRlLCBrZXJuZWwgYWxzbyBjaGVjayBidWZm
ZXI8YnI+DQorwqAgwqAgwqAgwqAgKiBmbGFnIGluc3RlYWQgb2YgT19ESVJFQ1QuIFNvIGl0IG1h
a2Ugbm8gc2Vuc2UgdG8gY2hlY2sgdGhpcyBmbGFnPGJyPg0KK8KgIMKgIMKgIMKgICogaW4gZmRz
WzBdLjxicj4NCivCoCDCoCDCoCDCoCAqLzxicj4NCivCoCDCoCDCoCDCoHtPX0RJUkVDVCwgRl9H
RVRGTCwgMCwgJnF1b3Q7VGVzdCBwaXBlMiB1c2luZyBPX0RJUkVDVCBmbGFnJnF1b3Q7fSw8YnI+
DQorwqAgwqAgwqAgwqB7T19OT05CTE9DSywgRl9HRVRGTCwgMSwgJnF1b3Q7VGVzdCBwaXBlMiB1
c2luZyBPX05PTkJMT0NLIGZsYWcmcXVvdDt9LDxicj4NCit9Ozxicj4NCjxicj4NCi0vKiBMb2Nh
bMKgIEZ1bmN0aW9ucyAqLzxicj4NCi0vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLzxicj4NCi0vKsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICov
PGJyPg0KLS8qIEZ1bmN0aW9uOsKgIMKgIHNldHVwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgICovPGJyPg0KLS8qIERlc2NyaXB0aW9uOiBQZXJmb3JtcyBhbGwgb25lIHRp
bWUgc2V0dXAgZm9yIHRoaXMgdGVzdC4gVGhpcyBmdW5jdGlvbiBpc8KgIMKgKi88YnI+DQotLyrC
oCDCoCDCoCDCoCDCoCDCoCDCoCB0eXBpY2FsbHkgdXNlZCB0byBjYXB0dXJlIHNpZ25hbHMsIGNy
ZWF0ZSB0ZW1wb3JhcnkgZGlyc8KgIMKgIMKgICovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAg
wqAgYW5kIHRlbXBvcmFyeSBmaWxlcyB0aGF0IG1heSBiZSB1c2VkIGluIHRoZSBjb3Vyc2Ugb2Yg
dGhpc8KgIMKgICovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgdGVzdC7CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogSW5wdXQ6wqAgwqAgwqAg
wqBOb25lLsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQotLyrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0v
KiBPdXRwdXQ6wqAgwqAgwqAgTm9uZS7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCovPGJy
Pg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgKi88YnI+DQotLyogUmV0dXJuOsKgIMKgIMKgIE9uIGZhaWx1cmUgLSBFeGl0cyBieSBj
YWxsaW5nIGNsZWFudXAoKS7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4N
Ci0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIE9uIHN1Y2Nlc3MgLSByZXR1cm5zIDAuwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4N
Ci0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICovPGJyPg0KLS8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovPGJyPg0KLXZvaWQgc2V0dXAodm9p
ZCk8YnI+DQorc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKTxicj4NCsKgezxicj4NCi3CoCDCoCDC
oCDCoC8qIENhcHR1cmUgc2lnbmFscyBpZiBhbnkgKi88YnI+DQotwqAgwqAgwqAgwqAvKiBDcmVh
dGUgdGVtcG9yYXJ5IGRpcmVjdG9yaWVzICovPGJyPg0KLcKgIMKgIMKgIMKgVEVTVF9QQVVTRTs8
YnI+DQotwqAgwqAgwqAgwqB0c3RfdG1wZGlyKCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKGZkc1sw
XSAmZ3Q7IDApPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgU0FGRV9DTE9TRShmZHNbMF0p
Ozxicj4NCivCoCDCoCDCoCDCoGlmIChmZHNbMV0gJmd0OyAxKTxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoFNBRkVfQ0xPU0UoZmRzWzFdKTs8YnI+DQrCoH08YnI+DQo8YnI+DQotaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSk8YnI+DQorc3RhdGljIHZvaWQgdmVyaWZ5X3BpcGUy
KHVuc2lnbmVkIGludCBuKTxicj4NCsKgezxicj4NCi3CoCDCoCDCoCDCoGludCBmZFsyXSwgaSwg
Y29lOzxicj4NCi3CoCDCoCDCoCDCoGludCBsYzs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgdGNh
c2UgKnRjID0gJmFtcDt0Y2FzZXNbbl07PGJyPg0KK8KgIMKgIMKgIMKgaW50IGdldF9mbGFnID0g
MCwgaSA9IDA7PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgdHN0X3BhcnNlX29wdHMoYXJnYywgYXJn
diwgTlVMTCwgTlVMTCk7PGJyPg0KLcKgIMKgIMKgIMKgaWYgKCh0c3Rfa3ZlcmNtcCgyLCA2LCAy
NykpICZsdDsgMCkgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9icmttKFRDT05G
LDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBOVUxMLDxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtUaGlzIHRlc3QgY2FuIG9u
bHkgcnVuIG9uIGtlcm5lbHMgdGhhdCBhcmUgMi42LjI3IGFuZCBoaWdoZXImcXVvdDspOzxicj4N
CivCoCDCoCDCoCDCoHRzdF9yZXMoVElORk8sICZxdW90OyVzICZxdW90OywgdGMtJmd0O21lc3Nh
Z2UpOzxicj4NCivCoCDCoCDCoCDCoFNBRkVfUElQRTIoZmRzLCB0Yy0mZ3Q7ZmxhZ3MpOzxicj4N
CivCoCDCoCDCoCDCoGZvciAoaSA9IDA7IGkgJmx0OyAyOyBpKyspIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpZiAoaSA9PSAwICZhbXA7JmFtcDsgIXRjLSZndDtjaGVja19yZWFkX3Np
ZGUpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ2V0X2ZsYWcgPSBTQUZFX0ZDTlRMKGZkc1tpXSwg
dGMtJmd0O2NoZWNrX2NtZCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKChnZXRf
ZmxhZyAmYW1wOyZhbXA7IHRjLSZndDtmbGFncykgfHwgKHRjLSZndDtmbGFncyA9PSBnZXRfZmxh
ZykpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHN0X3JlcyhUUEFT
UywgJnF1b3Q7cGlwZTIgZmRzWyVkXSBnZXRzIGV4cGVjdGVkIGZsYWcoJWQpJnF1b3Q7LCBpLCB0
Yy0mZ3Q7ZmxhZ3MpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVsc2U8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3RfcmVzKFRGQUlMLCAmcXVvdDtwaXBl
MiBmZHNbJWRdIGRvZXNuJiMzOTt0IGdldCBleHBlY3RlZCBmbGFnKCVkKSwgZ2V0IGZsYWcoJWQp
JnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGksIHRjLSZndDtmbGFncywgZ2V0X2ZsYWcpOzxicj4NCsKgIMKgIMKg
IMKgIH08YnI+DQotwqAgwqAgwqAgwqBzZXR1cCgpOzxicj4NCi08YnI+DQotwqAgwqAgwqAgwqBm
b3IgKGxjID0gMDsgVEVTVF9MT09QSU5HKGxjKTsgKytsYykgezxicj4NCi3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHRzdF9jb3VudCA9IDA7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZm9y
ICh0ZXN0bm8gPSAwOyB0ZXN0bm8gJmx0OyBUU1RfVE9UQUw7ICsrdGVzdG5vKSB7PGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGx0cF9zeXNjYWxsKF9fTlJfcGlw
ZTIsIGZkLCAwKSAhPSAwKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgdHN0X2Jya20oVEZBSUwsIGNsZWFudXAsICZxdW90O3BpcGUyKDApIGZh
aWxlZCZxdW90Oyk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZvciAoaSA9IDA7IGkgJmx0
OyAyOyArK2kpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb2UgPSBmY250bChmZFtpXSwgRl9HRVRGRCk7PGJyPg0KLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGNvZSA9PSAtMSkgezxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHRzdF9icmttKFRCUk9LLCBjbGVhbnVwLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtmY250
bCBmYWlsZWQmcXVvdDspOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH08YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpZiAoY29lICZhbXA7IEZEX0NMT0VYRUMpIHs8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3RfYnJrbShU
RkFJTCw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xlYW51cCwgJnF1b3Q7cGlwZTIoMCkgc2V0IGNs
b3NlLW9uLWV4aXQgZm9yIGZkWyVkXSZxdW90Oyw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaSk7PGJy
Pg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9zZShmZFswXSk7PGJyPg0KLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvc2UoZmRbMV0pOzxicj4NCi08YnI+DQotwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAobHRwX3N5c2NhbGwoX19OUl9waXBlMiwgZmQs
IE9fQ0xPRVhFQykgIT0gMCkgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHRzdF9icmttKFRGQUlMLCBjbGVhbnVwLDxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtw
aXBlMihPX0NMT0VYRUMpIGZhaWxlZCZxdW90Oyk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGZvciAoaSA9IDA7IGkgJmx0OyAyOyArK2kpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb2UgPSBmY250bChmZFtpXSwgRl9HRVRGRCk7PGJy
Pg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGNv
ZSA9PSAtMSkgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9icmttKFRCUk9LLCBjbGVhbnVwLDxicj4NCi3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmcXVvdDtmY250bCBmYWlsZWQmcXVvdDspOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoKGNvZSAmYW1wOyBGRF9DTE9FWEVDKSA9
PSAwKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgdHN0X2Jya20oVEZBSUwsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNsZWFu
dXAsICZxdW90O3BpcGUyKE9fQ0xPRVhFQykgZG9lcyBub3Qgc2V0IGNsb3NlLW9uLWV4aXQgZm9y
IGZkWyVkXSZxdW90Oyw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaSk7PGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCi3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjbG9zZShmZFswXSk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY2xvc2UoZmRbMV0pOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHRzdF9yZXNtKFRQQVNTLCAmcXVvdDtwaXBlMihPX0NMT0VYRUMpIFBBU1NFRCZxdW90Oyk7
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xlYW51cCgpOzxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQotwqAgwqAgwqAgwqB9PGJyPg0KLcKgIMKg
IMKgIMKgdHN0X2V4aXQoKTs8YnI+DQorwqAgwqAgwqAgwqBjbGVhbnVwKCk7PGJyPg0KwqB9PGJy
Pg0KKzxicj4NCitzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7PGJyPg0KK8KgIMKgIMKg
IMKgLnRjbnQgPSBBUlJBWV9TSVpFKHRjYXNlcyksPGJyPg0KK8KgIMKgIMKgIMKgLnRlc3QgPSB2
ZXJpZnlfcGlwZTIsPGJyPg0KK8KgIMKgIMKgIMKgLmNsZWFudXAgPSBjbGVhbnVwLDxicj4NCit9
Ozxicj4NCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpcGUyL3BpcGUy
XzAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpcGUyL3BpcGUyXzAyLmM8YnI+DQpk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQppbmRleCAzOWYwMmZmOGMuLjAwMDAwMDAwMDxi
cj4NCi0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlwZTIvcGlwZTJfMDIuYzxicj4N
CisrKyAvZGV2L251bGw8YnI+DQpAQCAtMSwxNzUgKzAsMCBAQDxicj4NCi0vKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qIENvcHlyaWdodCAoYykgVWxyaWNoIERyZXBw
ZXIgJmx0OzxhIGhyZWY9Im1haWx0bzpkcmVwcGVyQHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5r
Ij5kcmVwcGVyQHJlZGhhdC5jb208L2E+Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICovPGJyPg0KLS8qIENvcHlyaWdodCAoYykgSW50ZXJuYXRpb25hbCBCdXNpbmVz
cyBNYWNoaW5lc8KgIENvcnAuLCAyMDA5wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4N
Ci0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICovPGJyPg0KLS8qIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlO8KgIHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnnCoCDCoCDCoCAqLzxicj4NCi0vKiBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hl
ZCBiecKgIMKgIMKgIMKgKi88YnI+DQotLyogdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsg
ZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3LCoCDCoCDCoCDCoCDCoCAqLzxicj4N
Ci0vKiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88
YnI+DQotLyogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQg
d2lsbCBiZSB1c2VmdWwswqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogYnV0IFdJVEhPVVQg
QU5ZIFdBUlJBTlRZO8KgIHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZsKgIMKg
IMKgIMKgIMKgIMKgICovPGJyPg0KLS8qIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRS7CoCBTZWXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxi
cj4NCi0vKiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy7C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCovPGJyPg0KLS8qwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+
DQotLyogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2XCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKiBhbG9uZyB3aXRoIHRoaXMg
cHJvZ3JhbTvCoCBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAqLzxicj4NCi0vKiBGb3VuZGF0aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdHJl
ZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBwqAgwqAgKi88YnI+DQot
LyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAqLzxicj4NCi0vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLzxicj4NCi0vKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qIEZpbGU6wqAgwqAgwqAgwqAgcGlwZTJfMDIuY8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogRGVzY3JpcHRpb246IFRo
aXMgUHJvZ3JhbSB0ZXN0cyB0aGUgbmV3IHN5c3RlbSBjYWxsIGludHJvZHVjZWQgaW4gMi42LjI3
LsKgICovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgVWxyaWNowrRzIGNvbW1lbnQgYXMg
aW46wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAqLzxicj4NCi0vKiA8YSBocmVmPSJodHRwOi8vZ2l0Lmtlcm5lbC5vcmcvP3A9bGludXgv
a2VybmVsL2dpdC90b3J2YWxkcy9saW51eC0yLjYuZ2l0O2E9Y29tbWl0O2g9YmU2MWE4NmQ3MjM3
ZGQ4MDUxMDYxNWYzOGFlMjFkNmUxZTk4NjYwYyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL2dpdC5rZXJuZWwub3JnLz9wPWxpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXgtMi42LmdpdDthPWNvbW1pdDtoPWJlNjFhODZkNzIzN2RkODA1MTA2MTVmMzhhZTIxZDZl
MWU5ODY2MGM8L2E+ICovPGJyPg0KLS8qIHdoaWNoIHNheXM6wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogVGhpcyBwYXRjaCBhZGRzIE9fTk9OQkxPQ0sg
c3VwcG9ydCB0byBwaXBlMi7CoCBJdCBpcyBtaW5pbWFsbHkgbW9yZSBpbnZvbHZlZCovPGJyPg0K
LS8qIHRoYW4gdGhlIHBhdGNoZXMgZm9yIGV2ZW50ZmQgPGEgaHJlZj0iaHR0cDovL2V0LmFsIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5ldC5hbDwvYT4gYnV0IHN0aWxsIHRyaXZp
YWwuwqAgVGhlIGludGVyZmFjZXMgb2bCoCDCoCovPGJyPg0KLS8qIHRoZSBjcmVhdGVfd3JpdGVf
cGlwZSBhbmQgY3JlYXRlX3JlYWRfcGlwZSBoZWxwZXIgZnVuY3Rpb25zIHdlcmUgY2hhbmdlZMKg
IMKgKi88YnI+DQotLyogYW5kIHRoZSBvbmUgb3RoZXIgY2FsbGVyIGFzIHdlbGwuwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88
YnI+DQotLyogVGhlIGZvbGxvd2luZyB0ZXN0IG11c3QgYmUgYWRqdXN0ZWQgZm9yIGFyY2hpdGVj
dHVyZXMgb3RoZXIgdGhhbiB4ODYgYW5kwqAgwqAqLzxicj4NCi0vKiB4ODYtNjQgYW5kIGluIGNh
c2UgdGhlIHN5c2NhbGwgbnVtYmVycyBjaGFuZ2VkLsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogVXNhZ2U6wqAgJmx0O2ZvciBj
b21tYW5kLWxpbmUmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCi0vKiBwaXBlMl8wMiBbLWMg
bl0gWy1lXVstaSBuXSBbLUkgeF0gWy1wIHhdIFstdF3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKsKgIMKgIMKgIHdoZXJlLMKgIC1jIG4gOiBS
dW4gbiBjb3BpZXMgY29uY3VycmVudGx5LsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCAtZcKgIMKgOiBUdXJu
IG9uIGVycm5vIGxvZ2dpbmcuwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIC1pIG4gOiBFeGVjdXRl
IHRlc3QgbiB0aW1lcy7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIC1JIHggOiBFeGVjdXRlIHRl
c3QgZm9yIHggc2Vjb25kcy7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIC1QIHggOiBQYXVzZSBmb3IgeCBzZWNv
bmRzIGJldHdlZW4gaXRlcmF0aW9ucy7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0v
KsKgIMKgIMKgIMKgIMKgIMKgIMKgIC10wqAgwqA6IFR1cm4gb24gc3lzY2FsbCB0aW1pbmcuwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyrC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAq
Lzxicj4NCi0vKiBUb3RhbCBUZXN0czogMcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKiBUZXN0IE5hbWU6wqAgwqBwaXBlMl8wMsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogQXV0aG9yOsKgIMKgIMKgIFVs
cmljaCBEcmVwcGVyICZsdDs8YSBocmVmPSJtYWlsdG86ZHJlcHBlckByZWRoYXQuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+ZHJlcHBlckByZWRoYXQuY29tPC9hPiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogSGlzdG9yeTrCoCDC
oCDCoENyZWF0ZWQgLSBKYW4gMTMgMjAwOSAtIFVscmljaCBEcmVwcGVyICZsdDs8YSBocmVmPSJt
YWlsdG86ZHJlcHBlckByZWRoYXQuY29tIiB0YXJnZXQ9Il9ibGFuayI+ZHJlcHBlckByZWRoYXQu
Y29tPC9hPiZndDvCoCDCoCovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgUG9ydGVkIHRv
IExUUMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAtIEphbiAxMyAyMDA5IC0gU3VicmF0YSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnN1YnJh
dGFAbGludXgudm5ldC5pYm0uY29tIiB0YXJnZXQ9Il9ibGFuayI+c3VicmF0YUBsaW51eC52bmV0
LmlibS5jb208L2E+Jmd0O8KgICovPGJyPg0KLS8qKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovPGJyPg0K
LSNpbmNsdWRlICZsdDtmY250bC5oJmd0Ozxicj4NCi0jaW5jbHVkZSAmbHQ7c3RkaW8uaCZndDs8
YnI+DQotI2luY2x1ZGUgJmx0O3VuaXN0ZC5oJmd0Ozxicj4NCi0jaW5jbHVkZSAmbHQ7c3lzL3N5
c2NhbGwuaCZndDs8YnI+DQotI2luY2x1ZGUgJmx0O2Vycm5vLmgmZ3Q7PGJyPg0KLTxicj4NCi0j
aW5jbHVkZSAmcXVvdDt0ZXN0LmgmcXVvdDs8YnI+DQotI2luY2x1ZGUgJnF1b3Q7bGFwaS9mY250
bC5oJnF1b3Q7PGJyPg0KLSNpbmNsdWRlICZxdW90O2xhcGkvc3lzY2FsbHMuaCZxdW90Ozxicj4N
Ci08YnI+DQotY2hhciAqVENJRCA9ICZxdW90O3BpcGUyXzAyJnF1b3Q7Ozxicj4NCi1pbnQgdGVz
dG5vOzxicj4NCi1pbnQgVFNUX1RPVEFMID0gMTs8YnI+DQotPGJyPg0KLS8qIEV4dGVybiBHbG9i
YWwgRnVuY3Rpb25zICovPGJyPg0KLS8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovPGJyPg0KLS8qwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88
YnI+DQotLyogRnVuY3Rpb246wqAgwqAgY2xlYW51cMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Ki88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAqLzxicj4NCi0vKiBEZXNjcmlwdGlvbjogUGVyZm9ybXMgYWxsIG9uZSB0aW1l
IGNsZWFuIHVwIGZvciB0aGlzIHRlc3Qgb24gc3VjY2Vzc2Z1bMKgIMKgICovPGJyPg0KLS8qwqAg
wqAgwqAgwqAgwqAgwqAgwqAgY29tcGxldGlvbizCoCBwcmVtYXR1cmUgZXhpdCBvcsKgIGZhaWx1
cmUuIENsb3NlcyBhbGwgdGVtcG9yYXJ5ICovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAg
ZmlsZXMsIHJlbW92ZXMgYWxsIHRlbXBvcmFyeSBkaXJlY3RvcmllcyBleGl0cyB0aGUgdGVzdCB3
aXRowqAgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCBhcHByb3ByaWF0ZSByZXR1cm4g
Y29kZSBieSBjYWxsaW5nIHRzdF9leGl0KCkgZnVuY3Rpb24uwqAgwqAgwqAgwqAqLzxicj4NCi0v
KsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ICovPGJyPg0KLS8qIElucHV0OsKgIMKgIMKgIMKgTm9uZS7CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogT3V0cHV0OsKgIMKgIMKgIE5vbmUuwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qIFJldHVybjrCoCDC
oCDCoCBPbiBmYWlsdXJlIC0gRXhpdHMgY2FsbGluZyB0c3RfZXhpdCgpLiBOb24gJiMzOTswJiMz
OTsgcmV0dXJuIGNvZGUuwqAgwqAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIE9uIHN1
Y2Nlc3MgLSBFeGl0cyBjYWxsaW5nIHRzdF9leGl0KCkuIFdpdGggJiMzOTswJiMzOTsgcmV0dXJu
IGNvZGUuwqAgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLzxicj4N
Ci12b2lkIGNsZWFudXAodm9pZCk8YnI+DQotezxicj4NCi08YnI+DQotwqAgwqAgwqAgwqB0c3Rf
cm1kaXIoKTs8YnI+DQotPGJyPg0KLX08YnI+DQotPGJyPg0KLS8qIExvY2FswqAgRnVuY3Rpb25z
ICovPGJyPg0KLS8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovPGJyPg0KLS8qwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotLyogRnVu
Y3Rpb246wqAgwqAgc2V0dXDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCovPGJyPg0KLS8q
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Ki88YnI+DQotLyogRGVzY3JpcHRpb246IFBlcmZvcm1zIGFsbCBvbmUgdGltZSBzZXR1cCBmb3Ig
dGhpcyB0ZXN0LiBUaGlzIGZ1bmN0aW9uIGlzwqAgwqAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKg
IMKgIMKgIHR5cGljYWxseSB1c2VkIHRvIGNhcHR1cmUgc2lnbmFscywgY3JlYXRlIHRlbXBvcmFy
eSBkaXJzwqAgwqAgwqAgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCBhbmQgdGVtcG9y
YXJ5IGZpbGVzIHRoYXQgbWF5IGJlIHVzZWQgaW4gdGhlIGNvdXJzZSBvZiB0aGlzwqAgwqAgKi88
YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCB0ZXN0LsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgKi88YnI+DQotLyrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCi0vKiBJbnB1dDrCoCDCoCDCoCDCoE5vbmUuwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCi0vKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qIE91dHB1dDrCoCDC
oCDCoCBOb25lLsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQotLyrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4N
Ci0vKiBSZXR1cm46wqAgwqAgwqAgT24gZmFpbHVyZSAtIEV4aXRzIGJ5IGNhbGxpbmcgY2xlYW51
cCgpLsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KLS8qwqAgwqAgwqAg
wqAgwqAgwqAgwqAgT24gc3VjY2VzcyAtIHJldHVybnMgMC7CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCovPGJyPg0KLS8qwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQot
LyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKi88YnI+DQotdm9pZCBzZXR1cCh2b2lkKTxicj4NCi17PGJy
Pg0KLcKgIMKgIMKgIMKgLyogQ2FwdHVyZSBzaWduYWxzIGlmIGFueSAqLzxicj4NCi3CoCDCoCDC
oCDCoC8qIENyZWF0ZSB0ZW1wb3JhcnkgZGlyZWN0b3JpZXMgKi88YnI+DQotwqAgwqAgwqAgwqBU
RVNUX1BBVVNFOzxicj4NCi3CoCDCoCDCoCDCoHRzdF90bXBkaXIoKTs8YnI+DQotfTxicj4NCi08
YnI+DQotaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSk8YnI+DQotezxicj4NCi3CoCDC
oCDCoCDCoGludCBmZHNbMl0sIGZsLCBpOzxicj4NCi3CoCDCoCDCoCDCoGludCBsYzs8YnI+DQot
PGJyPg0KLcKgIMKgIMKgIMKgdHN0X3BhcnNlX29wdHMoYXJnYywgYXJndiwgTlVMTCwgTlVMTCk7
PGJyPg0KLcKgIMKgIMKgIMKgaWYgKCh0c3Rfa3ZlcmNtcCgyLCA2LCAyNykpICZsdDsgMCkgezxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9icmttKFRDT05GLDxicj4NCi3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBOVUxMLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtUaGlzIHRlc3QgY2FuIG9ubHkgcnVuIG9uIGtlcm5l
bHMgdGhhdCBhcmUgMi42LjI3IGFuZCBoaWdoZXImcXVvdDspOzxicj4NCi3CoCDCoCDCoCDCoH08
YnI+DQotwqAgwqAgwqAgwqBzZXR1cCgpOzxicj4NCi08YnI+DQotwqAgwqAgwqAgwqBmb3IgKGxj
ID0gMDsgVEVTVF9MT09QSU5HKGxjKTsgKytsYykgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHRzdF9jb3VudCA9IDA7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZm9yICh0ZXN0
bm8gPSAwOyB0ZXN0bm8gJmx0OyBUU1RfVE9UQUw7ICsrdGVzdG5vKSB7PGJyPg0KLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGx0cF9zeXNjYWxsKF9fTlJfcGlwZTIsIGZk
cywgMCkgPT0gLTEpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB0c3RfYnJrbShURkFJTCwgY2xlYW51cCwgJnF1b3Q7cGlwZTIoMCkgZmFpbGVk
JnF1b3Q7KTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZm9yIChpID0gMDsgaSAmbHQ7IDI7
ICsraSkgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGZsID0gZmNudGwoZmRzW2ldLCBGX0dFVEZMKTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoZmwgPT0gLTEpIHs8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3Rf
YnJrbShUQlJPSywgY2xlYW51cCw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7ZmNudGwgZmFp
bGVkJnF1b3Q7KTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaWYgKGZsICZhbXA7IE9fTk9OQkxPQ0spIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3RfYnJrbShURkFJTCw8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xlYW51cCwgJnF1b3Q7cGlwZTIoMCkgc2V0IG5vbi1ibG9j
a2luZyBtb2RlIGZvciBmZHNbJWRdJnF1b3Q7LDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpKTs8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvc2UoZmRz
W2ldKTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KLTxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChsdHBfc3lzY2FsbChf
X05SX3BpcGUyLCBmZHMsIE9fTk9OQkxPQ0spID09IC0xKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHN0X2Jya20oVEZBSUwsIGNsZWFudXAs
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICZxdW90O3BpcGUyKE9fTk9OQkxPQ0spIGZhaWxlZCZxdW90Oyk7PGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGZvciAoaSA9IDA7IGkgJmx0OyAyOyArK2kpIHs8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmbCA9IGZjbnRsKGZk
c1tpXSwgRl9HRVRGTCk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaWYgKGZsID09IC0xKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHN0X2Jya20oVEJST0ssIGNsZWFu
dXAsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90O2ZjbnRsIGZhaWxlZCZxdW90Oyk7PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICgoZmwgJmFt
cDsgT19OT05CTE9DSykgPT0gMCkgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9icmttKFRGQUlMLDxicj4NCi3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBjbGVhbnVwLCAmcXVvdDtwaXBlMihPX05PTkJMT0NLKSBkb2VzIG5vdCBzZXQg
bm9uLWJsb2NraW5nIG1vZGUgZm9yIGZkc1slZF1cbiZxdW90Oyw8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgaSk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNsb3NlKGZkc1tpXSk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9yZXNtKFRQQVNT
LCAmcXVvdDtwaXBlMihPX05PTkJMT0NLKSBQQVNTRUQmcXVvdDspOzxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsZWFudXAoKTs8YnI+DQotwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9PGJyPg0KLcKgIMKgIMKgIMKgfTxicj4NCi3CoCDCoCDCoCDCoHRzdF9leGl0KCk7
PGJyPg0KLX08YnI+DQotLSA8YnI+DQoyLjIzLjA8YnI+DQo8YnI+DQo8YnI+DQo8YnI+DQo8YnI+
DQotLSA8YnI+DQpNYWlsaW5nIGxpc3QgaW5mbzogPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwPC9hPjxicj4NCjwvYmxvY2txdW90ZT48L2Rp
dj48YnIgY2xlYXI9ImFsbCI+PGRpdj48YnI+PC9kaXY+LS0gPGJyPjxkaXYgZGlyPSJsdHIiPjxk
aXYgZGlyPSJsdHIiPjxkaXY+UmVnYXJkcyw8YnI+PC9kaXY+PGRpdj5MaSBXYW5nPGJyPjwvZGl2
PjwvZGl2PjwvZGl2PjwvZGl2Pg0K
--0000000000002b8f5e05a3c8ac1e--


--===============1831553330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1831553330==--

