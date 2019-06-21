Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4742C4E050
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 08:09:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E5403EAEC2
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 08:09:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E02B03EAEB0
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 08:09:13 +0200 (CEST)
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
 [209.85.221.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 677F8601BF0
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 08:09:10 +0200 (CEST)
Received: by mail-vk1-f195.google.com with SMTP id s16so1064555vke.7
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 23:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NVdTHzAmExdOIpi2CfzmkJzPMRH/CqGfOfBJAHtUcuk=;
 b=C07gC+qI5rQp7bxUYqs4hi5iCU/os4dveLuqZRjxtAhvmoy3K3dtfIcgVZxgbtQQ+O
 S7WdnZyeDE+omHgMTcKpPOBVgcyx+ydV/hcdWeZybR5V6kPkAVEYn6wX/4FJ/NDRwbB5
 TST+7oLobcWxwC7G5la0zoSzRgD266kaAgEwA6iwmocvvu2izbXRUi2Za7b0NIIDqjpI
 P8ZKdDVXFACcMpWzwS4PX/bxScZVj+EgJwZVMkmlwnTo1Tvoy+Qh1gbOTh6EzR5aAm0s
 hlzKa+pxMm8cIRM38hEmlf++tFQNN5f492iWWZYxQcFF6rZLXt41wW0KEiFOjIF+kI45
 EDwg==
X-Gm-Message-State: APjAAAUDo3JZnum7r/MXgGMpMzfA4qTIzi1cOLZ3JfnWgBV3/4o30Mhd
 aH8DzOHztOBaisYh/BS1vKUAkA2TSIcUGleJV/IQ4w==
X-Google-Smtp-Source: APXvYqwEaS1xcd7aQCKgHRZCNtoVJ8QcM2GHr2l77nhtbpdvA4ozvoPndK3t/tjEcKWLtamXHiVBCofii+bCfrY8Rso=
X-Received: by 2002:a1f:56c3:: with SMTP id k186mr6650425vkb.24.1561097348842; 
 Thu, 20 Jun 2019 23:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190620095548.28335-1-liwang@redhat.com>
 <222124720.29320832.1561035923712.JavaMail.zimbra@redhat.com>
In-Reply-To: <222124720.29320832.1561035923712.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 21 Jun 2019 14:08:57 +0800
Message-ID: <CAEemH2cO1MFLRuPOsOesB9Cr6PuwqyYZ9_CfE=JtbUuDK26bFA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] pkey: Add test for memory protection keys
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
Content-Type: multipart/mixed; boundary="===============1667452610=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1667452610==
Content-Type: multipart/alternative; boundary="000000000000f02938058bcf4c76"

--000000000000f02938058bcf4c76
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 20, 2019 at 9:05 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > ---
> >  configure.ac                               |   1 +
> >  include/lapi/syscalls/aarch64.in           |   3 +
> >  include/lapi/syscalls/arm.in               |   3 +
> >  include/lapi/syscalls/i386.in              |   3 +
> >  include/lapi/syscalls/ia64.in              |   3 +
> >  include/lapi/syscalls/powerpc.in           |   3 +
> >  include/lapi/syscalls/powerpc64.in         |   3 +
> >  include/lapi/syscalls/s390.in              |   3 +
> >  include/lapi/syscalls/s390x.in             |   3 +
> >  include/lapi/syscalls/sh.in                |   3 +
> >  include/lapi/syscalls/sparc.in             |   3 +
> >  include/lapi/syscalls/sparc64.in           |   3 +
> >  include/lapi/syscalls/x86_64.in            |   3 +
> >  runtest/syscalls                           |   2 +
> >  testcases/kernel/syscalls/pkeys/.gitignore |   1 +
> >  testcases/kernel/syscalls/pkeys/Makefile   |   8 ++
> >  testcases/kernel/syscalls/pkeys/pkey.h     |  44 +++++++++
> >  testcases/kernel/syscalls/pkeys/pkey01.c   | 105 +++++++++++++++++++++
> >  18 files changed, 197 insertions(+)
> >  create mode 100644 testcases/kernel/syscalls/pkeys/.gitignore
> >  create mode 100644 testcases/kernel/syscalls/pkeys/Makefile
> >  create mode 100644 testcases/kernel/syscalls/pkeys/pkey.h
> >  create mode 100644 testcases/kernel/syscalls/pkeys/pkey01.c
> >
> > diff --git a/configure.ac b/configure.ac
> > index 5ecc92781..35997699f 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -76,6 +76,7 @@ AC_CHECK_FUNCS([ \
> >      profil \
> >      pwritev \
> >      pwritev2 \
> > +    pkey_mprotect \
> >      readlinkat \
> >      renameat \
> >      renameat2 \
> > diff --git a/include/lapi/syscalls/aarch64.in
> > b/include/lapi/syscalls/aarch64.in
> > index 177dd0115..4232defbe 100644
> > --- a/include/lapi/syscalls/aarch64.in
> > +++ b/include/lapi/syscalls/aarch64.in
> > @@ -266,3 +266,6 @@ copy_file_range 285
> >  preadv2 286
> >  pwritev2 287
> >  _sysctl 1078
> > +pkey_mprotect 394
> > +pkey_alloc 395
> > +pkey_free 396
>
> 288, 289, 290
>

Good eyes.


>
> > diff --git a/include/lapi/syscalls/arm.in b/include/lapi/syscalls/arm.in
> > index f4adedb2c..48b55b5ff 100644
> > --- a/include/lapi/syscalls/arm.in
> > +++ b/include/lapi/syscalls/arm.in
> > @@ -350,3 +350,6 @@ copy_file_range (__NR_SYSCALL_BASE+391)
> >  preadv2 (__NR_SYSCALL_BASE+392)
> >  pwritev2 (__NR_SYSCALL_BASE+393)
> >  statx (__NR_SYSCALL_BASE+397)
> > +pkey_mprotect (__NR_SYSCALL_BASE+394)
> > +pkey_alloc (__NR_SYSCALL_BASE+395)
> > +pkey_free (__NR_SYSCALL_BASE+396)
> > diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/
> i386.in
> > index af5254f77..c54573547 100644
> > --- a/include/lapi/syscalls/i386.in
> > +++ b/include/lapi/syscalls/i386.in
> > @@ -348,3 +348,6 @@ copy_file_range 377
> >  preadv2 378
> >  pwritev2 379
> >  statx 383
> > +pkey_mprotect 380
> > +pkey_alloc 381
> > +pkey_free 382
> > diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/
> ia64.in
> > index c0aeed08b..56bfd7928 100644
> > --- a/include/lapi/syscalls/ia64.in
> > +++ b/include/lapi/syscalls/ia64.in
> > @@ -305,3 +305,6 @@ mlock2 1346
> >  copy_file_range 1347
> >  preadv2 1348
> >  pwritev2 1349
> > +pkey_mprotect 330
> > +pkey_alloc 331
> > +pkey_free 332
>

And here should be:
    pkey_mprotect 1354
    pkey_alloc 1355
    pkey_free 1356



> > diff --git a/include/lapi/syscalls/powerpc.in
> > b/include/lapi/syscalls/powerpc.in
> > index 6b6be58a7..eaf8d45ed 100644
> > --- a/include/lapi/syscalls/powerpc.in
> > +++ b/include/lapi/syscalls/powerpc.in
> > @@ -355,3 +355,6 @@ copy_file_range 379
> >  preadv2 380
> >  pwritev2 381
> >  statx 383
> > +pkey_mprotect 386
> > +pkey_alloc 384
> > +pkey_free 385
> > diff --git a/include/lapi/syscalls/powerpc64.in
> > b/include/lapi/syscalls/powerpc64.in
> > index 6b6be58a7..eaf8d45ed 100644
> > --- a/include/lapi/syscalls/powerpc64.in
> > +++ b/include/lapi/syscalls/powerpc64.in
> > @@ -355,3 +355,6 @@ copy_file_range 379
> >  preadv2 380
> >  pwritev2 381
> >  statx 383
> > +pkey_mprotect 386
> > +pkey_alloc 384
> > +pkey_free 385
> > diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/
> s390.in
> > index 2a2ffe223..3ee5547f1 100644
> > --- a/include/lapi/syscalls/s390.in
> > +++ b/include/lapi/syscalls/s390.in
> > @@ -338,3 +338,6 @@ mlock2 374
> >  copy_file_range 375
> >  preadv2 376
> >  pwritev2 377
> > +pkey_mprotect 384
> > +pkey_alloc 385
> > +pkey_free 386
> > diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/
> s390x.in
> > index 4c36ce17c..92e882aae 100644
> > --- a/include/lapi/syscalls/s390x.in
> > +++ b/include/lapi/syscalls/s390x.in
> > @@ -337,3 +337,6 @@ mlock2 374
> >  copy_file_range 375
> >  preadv2 376
> >  pwritev2 377
> > +pkey_mprotect 384
> > +pkey_alloc 385
> > +pkey_free 386
> > diff --git a/include/lapi/syscalls/sh.in b/include/lapi/syscalls/sh.in
> > index a942fb506..00726c1cc 100644
> > --- a/include/lapi/syscalls/sh.in
> > +++ b/include/lapi/syscalls/sh.in
> > @@ -369,3 +369,6 @@ mlock2 390
> >  copy_file_range 391
> >  preadv2 392
> >  pwritev2 393
> > +pkey_mprotect 384
> > +pkey_alloc 385
> > +pkey_free 386
> > diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/
> sparc.in
> > index 20dc37b01..1b34ab489 100644
> > --- a/include/lapi/syscalls/sparc.in
> > +++ b/include/lapi/syscalls/sparc.in
> > @@ -343,3 +343,6 @@ mlock2 356
> >  copy_file_range 357
> >  preadv2 358
> >  pwritev2 359
> > +pkey_mprotect 362
> > +pkey_alloc 363
> > +pkey_free 364
> > diff --git a/include/lapi/syscalls/sparc64.in
> > b/include/lapi/syscalls/sparc64.in
> > index c100b8e3e..f3142fbdd 100644
> > --- a/include/lapi/syscalls/sparc64.in
> > +++ b/include/lapi/syscalls/sparc64.in
> > @@ -319,3 +319,6 @@ mlock2 356
> >  copy_file_range 357
> >  preadv2 358
> >  pwritev2 359
> > +pkey_mprotect 362
> > +pkey_alloc 363
> > +pkey_free 364
> > diff --git a/include/lapi/syscalls/x86_64.in
> > b/include/lapi/syscalls/x86_64.in
> > index 87849e5c0..9c77f1c67 100644
> > --- a/include/lapi/syscalls/x86_64.in
> > +++ b/include/lapi/syscalls/x86_64.in
> > @@ -315,3 +315,6 @@ copy_file_range 326
> >  preadv2 327
> >  pwritev2 328
> >  statx 332
> > +pkey_mprotect 329
> > +pkey_alloc 330
> > +pkey_free 331
> > diff --git a/runtest/syscalls b/runtest/syscalls
> > index a1106fb84..a236fce09 100644
> > --- a/runtest/syscalls
> > +++ b/runtest/syscalls
> > @@ -723,6 +723,8 @@ mprotect02 mprotect02
> >  mprotect03 mprotect03
> >  mprotect04 mprotect04
> >
> > +pkey01 pkey01
> > +
> >  mq_notify01 mq_notify01
> >  mq_notify02 mq_notify02
> >  mq_open01 mq_open01
> > diff --git a/testcases/kernel/syscalls/pkeys/.gitignore
> > b/testcases/kernel/syscalls/pkeys/.gitignore
> > new file mode 100644
> > index 000000000..6fd5addb8
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/pkeys/.gitignore
> > @@ -0,0 +1 @@
> > +/pkey01
> > diff --git a/testcases/kernel/syscalls/pkeys/Makefile
> > b/testcases/kernel/syscalls/pkeys/Makefile
> > new file mode 100644
> > index 000000000..9ee2c2ea5
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/pkeys/Makefile
> > @@ -0,0 +1,8 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# Copyright (c) 2019 Red Hat, Inc.
> > +
> > +top_srcdir           ?= ../../../..
> > +
> > +include $(top_srcdir)/include/mk/testcases.mk
> > +
> > +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> > diff --git a/testcases/kernel/syscalls/pkeys/pkey.h
> > b/testcases/kernel/syscalls/pkeys/pkey.h
> > new file mode 100644
> > index 000000000..bd86bebcc
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/pkeys/pkey.h
> > @@ -0,0 +1,44 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2019 Red Hat, Inc.
> > + */
> > +
> > +#ifndef PKEYS_H
> > +#define PKEYS_H
> > +
> > +#include "tst_test.h"
> > +#include "lapi/syscalls.h"
> > +
> > +#ifndef PKEY_DISABLE_ACCESS
> > +# define PKEY_DISABLE_ACCESS 0x1
> > +# define PKEY_DISABLE_WRITE  0x2
> > +#endif
> > +
> > +#ifndef HAVE_PKEY_MPROTECT
> > +static inline int pkey_mprotect(void *addr, size_t len, int prot, int
> pkey)
> > +{
> > +     return tst_syscall(SYS_pkey_mprotect, addr, len, prot, pkey);
> > +}
> > +
> > +static inline int pkey_alloc(unsigned int flags, unsigned int
> access_rights)
> > +{
> > +     return tst_syscall(SYS_pkey_alloc, flags, access_rights);
> > +}
> > +
> > +static inline int pkey_free(int pkey)
> > +{
> > +     return tst_syscall(SYS_pkey_free, pkey);
> > +}
> > +#endif /* HAVE_PKEY_MPROTECT */
> > +
> > +static inline void check_pkey_support(void)
> > +{
> > +     int pkey = pkey_alloc(0, 0);
> > +
> > +     if ((pkey == -1) && (errno == EINVAL))
>
> Shouldn't this handle also ENOSPC?
>

Yes, if all pkeys have been allocated on a system, then we will get this
error in allocating a new pkey.
I will handle this in v2.


>       ENOSPC (pkey_alloc()) All protection keys available for the current
> process have been allocated.  The number of keys available is
>               architecture-specific  and  implementation-specific  and may
> be reduced by kernel-internal use of certain keys.  There are
>               currently 15 keys available to user programs on x86.
>
>               This error will also be returned if the processor or
> operating system does  not  support  protection  keys.   Applications
>               should  always  be prepared to handle this error, since
> factors outside of the application's control can reduce the number
>               of available pkeys.
>
> > +             tst_brk(TCONF, "pkey_alloc is not supported");
> > +     else
> > +             pkey_free(pkey);
> > +}
> > +
> > +#endif /* PKEYS_H */
> > diff --git a/testcases/kernel/syscalls/pkeys/pkey01.c
> > b/testcases/kernel/syscalls/pkeys/pkey01.c
> > new file mode 100644
> > index 000000000..8faa4be4c
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/pkeys/pkey01.c
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2019 Red Hat, Inc.
> > + *
> > + * Test for Memory Protection Keys
> > + * Reference: https://lwn.net/Articles/689395/
> > + */
> > +
> > +#define _GNU_SOURCE
> > +#include <stdio.h>
> > +#include <unistd.h>
> > +#include <errno.h>
> > +#include <stdlib.h>
> > +#include <sys/syscall.h>
> > +#include <sys/mman.h>
> > +#include <sys/wait.h>
> > +
> > +#include "pkey.h"
> > +
> > +static int psize;
> > +static char *buffer;
> > +
> > +static struct tcase {
> > +     unsigned long flags;
> > +     unsigned long access_rights;
> > +     char *name;
> > +} tcases[] = {
> > +     {0, PKEY_DISABLE_ACCESS, "PKEY_DISABLE_ACCESS"},
> > +     {0, PKEY_DISABLE_WRITE, "PKEY_DISABLE_WRITE"},
> > +};
> > +
> > +static void setup(void)
> > +{
> > +     check_pkey_support();
> > +
> > +     psize = getpagesize();
> > +     buffer = SAFE_MMAP(NULL, psize, PROT_READ | PROT_WRITE,
> > +                     MAP_ANONYMOUS | MAP_SHARED, -1, 0);
> > +     memset(buffer, 'a', psize);
> > +}
> > +
> > +static void verify_pkey(unsigned int i)
> > +{
> > +     int pkey, status;
> > +     pid_t pid;
> > +
> > +     struct tcase *tc = &tcases[i];
> > +
> > +     pkey = pkey_alloc(tc->flags, tc->access_rights);
> > +     if (pkey == -1)
> > +             tst_brk(TBROK, "pkey_alloc failed");
> > +
> > +     tst_res(TINFO, "Set %s on buffer", tc->name);
> > +     if (pkey_mprotect(buffer, psize, PROT_READ | PROT_WRITE, pkey) ==
> -1)
> > +             tst_brk(TBROK, "pkey_mprotect failed");
> > +
> > +     pid = SAFE_FORK();
> > +     if (pid == 0) {
>
> I'd suggest something like:
>                 struct rlimit r;
>
>
>                 r.rlim_cur = 1;
>
>                 r.rlim_max = 1;
>
>                 SAFE_SETRLIMIT(RLIMIT_CORE, &r);
>
> to avoid getting cores from this child - since it is expected to segfault.
>

Good advice.


>
> > +             switch (tc->access_rights) {
> > +             case PKEY_DISABLE_ACCESS:
> > +                     tst_res(TFAIL, "Read buffer success, buffer[0] =
> %d", *buffer);
> > +             break;
> > +             case PKEY_DISABLE_WRITE:
> > +                     *buffer = 'b';
> > +             break;
> > +             }
> > +             exit(0);
> > +     }
> > +
> > +     SAFE_WAITPID(pid, &status, 0);
> > +     if (WIFSIGNALED(status)) {
> > +             if (WTERMSIG(status) == SIGSEGV) {
> > +                     tst_res(TPASS, "Child ended by %s as expected",
> > +                             tst_strsig(SIGSEGV));
> > +             } else {
> > +                     tst_res(TFAIL, "Child ended by %s unexpected" ,
> > +                             tst_strsig(WTERMSIG(status)));
> > +             }
> > +     } else {
> > +             tst_res(TFAIL, "Child unexpectedly ended");
> > +     }
> > +
> > +     tst_res(TINFO, "Remove %s from buffer", tc->name);
> > +     if (pkey_mprotect(buffer, psize, PROT_READ | PROT_WRITE, 0x0) ==
> -1)
> > +             tst_brk(TBROK, "pkey_mprotect failed");
> > +     *buffer = i;
> > +     tst_res(TPASS, "Write buffer success, buffer[0] = %d", *buffer);
> > +
> > +     if (pkey_free(pkey) == -1)
> > +             tst_brk(TBROK, "pkey_free failed");
> > +}
> > +
> > +static void cleanup(void)
> > +{
> > +     if (buffer)
> > +             SAFE_MUNMAP(buffer, psize);
> > +}
> > +
> > +static struct tst_test test = {
> > +     .tcnt = ARRAY_SIZE(tcases),
> > +     .forks_child = 1,
> > +     .test = verify_pkey,
> > +     .setup = setup,
> > +     .cleanup = cleanup,
> > +};
> > --
> > 2.20.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> >
>


-- 
Regards,
Li Wang

--000000000000f02938058bcf4c76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 20, 2019 at 9:05 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
<br>
----- Original Message -----<br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
+<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://aarch64.in" rel=3D"noref=
errer" target=3D"_blank">aarch64.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://arm.in" rel=3D"noreferre=
r" target=3D"_blank">arm.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://i386.in" rel=3D"noreferr=
er" target=3D"_blank">i386.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://ia64.in" rel=3D"noreferr=
er" target=3D"_blank">ia64.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://powerpc.in" rel=3D"noref=
errer" target=3D"_blank">powerpc.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=3D"nor=
eferrer" target=3D"_blank">powerpc64.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://s390.in" rel=3D"noreferr=
er" target=3D"_blank">s390.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://s390x.in" rel=3D"norefer=
rer" target=3D"_blank">s390x.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://sh.in" rel=3D"noreferrer=
" target=3D"_blank">sh.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://sparc.in" rel=3D"norefer=
rer" target=3D"_blank">sparc.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://sparc64.in" rel=3D"noref=
errer" target=3D"_blank">sparc64.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://x86_64.in" rel=3D"norefe=
rrer" target=3D"_blank">x86_64.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 runtest/syscalls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 testcases/kernel/syscalls/pkeys/.gitignore |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 testcases/kernel/syscalls/pkeys/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=
=A08 ++<br>
&gt;=C2=A0 testcases/kernel/syscalls/pkeys/pkey.h=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 44 +++++++++<br>
&gt;=C2=A0 testcases/kernel/syscalls/pkeys/pkey01.c=C2=A0 =C2=A0| 105 +++++=
++++++++++++++++<br>
&gt;=C2=A0 18 files changed, 197 insertions(+)<br>
&gt;=C2=A0 create mode 100644 testcases/kernel/syscalls/pkeys/.gitignore<br=
>
&gt;=C2=A0 create mode 100644 testcases/kernel/syscalls/pkeys/Makefile<br>
&gt;=C2=A0 create mode 100644 testcases/kernel/syscalls/pkeys/pkey.h<br>
&gt;=C2=A0 create mode 100644 testcases/kernel/syscalls/pkeys/pkey01.c<br>
&gt; <br>
&gt; diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a><br>
&gt; index 5ecc92781..35997699f 100644<br>
&gt; --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a><br>
&gt; +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a><br>
&gt; @@ -76,6 +76,7 @@ AC_CHECK_FUNCS([ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 profil \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pwritev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pwritev2 \<br>
&gt; +=C2=A0 =C2=A0 pkey_mprotect \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 readlinkat \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 renameat \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 renameat2 \<br>
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://aarch64.in" rel=
=3D"noreferrer" target=3D"_blank">aarch64.in</a><br>
&gt; b/include/lapi/syscalls/<a href=3D"http://aarch64.in" rel=3D"noreferre=
r" target=3D"_blank">aarch64.in</a><br>
&gt; index 177dd0115..4232defbe 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://aarch64.in" rel=3D"noref=
errer" target=3D"_blank">aarch64.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://aarch64.in" rel=3D"noref=
errer" target=3D"_blank">aarch64.in</a><br>
&gt; @@ -266,3 +266,6 @@ copy_file_range 285<br>
&gt;=C2=A0 preadv2 286<br>
&gt;=C2=A0 pwritev2 287<br>
&gt;=C2=A0 _sysctl 1078<br>
&gt; +pkey_mprotect 394<br>
&gt; +pkey_alloc 395<br>
&gt; +pkey_free 396<br>
<br>
288, 289, 290<br></blockquote><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Good eyes.</div><div class=3D"gmail_default" =
style=3D"font-size:small">=C2=A0<br></div></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://arm.in" rel=3D"no=
referrer" target=3D"_blank">arm.in</a> b/include/lapi/syscalls/<a href=3D"h=
ttp://arm.in" rel=3D"noreferrer" target=3D"_blank">arm.in</a><br>
&gt; index f4adedb2c..48b55b5ff 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://arm.in" rel=3D"noreferre=
r" target=3D"_blank">arm.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://arm.in" rel=3D"noreferre=
r" target=3D"_blank">arm.in</a><br>
&gt; @@ -350,3 +350,6 @@ copy_file_range (__NR_SYSCALL_BASE+391)<br>
&gt;=C2=A0 preadv2 (__NR_SYSCALL_BASE+392)<br>
&gt;=C2=A0 pwritev2 (__NR_SYSCALL_BASE+393)<br>
&gt;=C2=A0 statx (__NR_SYSCALL_BASE+397)<br>
&gt; +pkey_mprotect (__NR_SYSCALL_BASE+394)<br>
&gt; +pkey_alloc (__NR_SYSCALL_BASE+395)<br>
&gt; +pkey_free (__NR_SYSCALL_BASE+396)<br>
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://i386.in" rel=3D"n=
oreferrer" target=3D"_blank">i386.in</a> b/include/lapi/syscalls/<a href=3D=
"http://i386.in" rel=3D"noreferrer" target=3D"_blank">i386.in</a><br>
&gt; index af5254f77..c54573547 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://i386.in" rel=3D"noreferr=
er" target=3D"_blank">i386.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://i386.in" rel=3D"noreferr=
er" target=3D"_blank">i386.in</a><br>
&gt; @@ -348,3 +348,6 @@ copy_file_range 377<br>
&gt;=C2=A0 preadv2 378<br>
&gt;=C2=A0 pwritev2 379<br>
&gt;=C2=A0 statx 383<br>
&gt; +pkey_mprotect 380<br>
&gt; +pkey_alloc 381<br>
&gt; +pkey_free 382<br>
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://ia64.in" rel=3D"n=
oreferrer" target=3D"_blank">ia64.in</a> b/include/lapi/syscalls/<a href=3D=
"http://ia64.in" rel=3D"noreferrer" target=3D"_blank">ia64.in</a><br>
&gt; index c0aeed08b..56bfd7928 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://ia64.in" rel=3D"noreferr=
er" target=3D"_blank">ia64.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://ia64.in" rel=3D"noreferr=
er" target=3D"_blank">ia64.in</a><br>
&gt; @@ -305,3 +305,6 @@ mlock2 1346<br>
&gt;=C2=A0 copy_file_range 1347<br>
&gt;=C2=A0 preadv2 1348<br>
&gt;=C2=A0 pwritev2 1349<br>
&gt; +pkey_mprotect 330<br>
&gt; +pkey_alloc 331<br>
&gt; +pkey_free 332<br></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">And here should be:=C2=A0</div><span cl=
ass=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>pkey_m=
protect 1354<br><span class=3D"gmail_default" style=3D"font-size:small">=C2=
=A0 =C2=A0 </span>pkey_alloc 1355<br><span class=3D"gmail_default" style=3D=
"font-size:small">=C2=A0 =C2=A0 </span>pkey_free 1356<br><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://powerpc.in" rel=
=3D"noreferrer" target=3D"_blank">powerpc.in</a><br>
&gt; b/include/lapi/syscalls/<a href=3D"http://powerpc.in" rel=3D"noreferre=
r" target=3D"_blank">powerpc.in</a><br>
&gt; index 6b6be58a7..eaf8d45ed 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://powerpc.in" rel=3D"noref=
errer" target=3D"_blank">powerpc.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://powerpc.in" rel=3D"noref=
errer" target=3D"_blank">powerpc.in</a><br>
&gt; @@ -355,3 +355,6 @@ copy_file_range 379<br>
&gt;=C2=A0 preadv2 380<br>
&gt;=C2=A0 pwritev2 381<br>
&gt;=C2=A0 statx 383<br>
&gt; +pkey_mprotect 386<br>
&gt; +pkey_alloc 384<br>
&gt; +pkey_free 385<br>
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=
=3D"noreferrer" target=3D"_blank">powerpc64.in</a><br>
&gt; b/include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=3D"norefer=
rer" target=3D"_blank">powerpc64.in</a><br>
&gt; index 6b6be58a7..eaf8d45ed 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=3D"nor=
eferrer" target=3D"_blank">powerpc64.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=3D"nor=
eferrer" target=3D"_blank">powerpc64.in</a><br>
&gt; @@ -355,3 +355,6 @@ copy_file_range 379<br>
&gt;=C2=A0 preadv2 380<br>
&gt;=C2=A0 pwritev2 381<br>
&gt;=C2=A0 statx 383<br>
&gt; +pkey_mprotect 386<br>
&gt; +pkey_alloc 384<br>
&gt; +pkey_free 385<br>
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://s390.in" rel=3D"n=
oreferrer" target=3D"_blank">s390.in</a> b/include/lapi/syscalls/<a href=3D=
"http://s390.in" rel=3D"noreferrer" target=3D"_blank">s390.in</a><br>
&gt; index 2a2ffe223..3ee5547f1 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://s390.in" rel=3D"noreferr=
er" target=3D"_blank">s390.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://s390.in" rel=3D"noreferr=
er" target=3D"_blank">s390.in</a><br>
&gt; @@ -338,3 +338,6 @@ mlock2 374<br>
&gt;=C2=A0 copy_file_range 375<br>
&gt;=C2=A0 preadv2 376<br>
&gt;=C2=A0 pwritev2 377<br>
&gt; +pkey_mprotect 384<br>
&gt; +pkey_alloc 385<br>
&gt; +pkey_free 386<br>
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://s390x.in" rel=3D"=
noreferrer" target=3D"_blank">s390x.in</a> b/include/lapi/syscalls/<a href=
=3D"http://s390x.in" rel=3D"noreferrer" target=3D"_blank">s390x.in</a><br>
&gt; index 4c36ce17c..92e882aae 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://s390x.in" rel=3D"norefer=
rer" target=3D"_blank">s390x.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://s390x.in" rel=3D"norefer=
rer" target=3D"_blank">s390x.in</a><br>
&gt; @@ -337,3 +337,6 @@ mlock2 374<br>
&gt;=C2=A0 copy_file_range 375<br>
&gt;=C2=A0 preadv2 376<br>
&gt;=C2=A0 pwritev2 377<br>
&gt; +pkey_mprotect 384<br>
&gt; +pkey_alloc 385<br>
&gt; +pkey_free 386<br>
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://sh.in" rel=3D"nor=
eferrer" target=3D"_blank">sh.in</a> b/include/lapi/syscalls/<a href=3D"htt=
p://sh.in" rel=3D"noreferrer" target=3D"_blank">sh.in</a><br>
&gt; index a942fb506..00726c1cc 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://sh.in" rel=3D"noreferrer=
" target=3D"_blank">sh.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://sh.in" rel=3D"noreferrer=
" target=3D"_blank">sh.in</a><br>
&gt; @@ -369,3 +369,6 @@ mlock2 390<br>
&gt;=C2=A0 copy_file_range 391<br>
&gt;=C2=A0 preadv2 392<br>
&gt;=C2=A0 pwritev2 393<br>
&gt; +pkey_mprotect 384<br>
&gt; +pkey_alloc 385<br>
&gt; +pkey_free 386<br>
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://sparc.in" rel=3D"=
noreferrer" target=3D"_blank">sparc.in</a> b/include/lapi/syscalls/<a href=
=3D"http://sparc.in" rel=3D"noreferrer" target=3D"_blank">sparc.in</a><br>
&gt; index 20dc37b01..1b34ab489 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://sparc.in" rel=3D"norefer=
rer" target=3D"_blank">sparc.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://sparc.in" rel=3D"norefer=
rer" target=3D"_blank">sparc.in</a><br>
&gt; @@ -343,3 +343,6 @@ mlock2 356<br>
&gt;=C2=A0 copy_file_range 357<br>
&gt;=C2=A0 preadv2 358<br>
&gt;=C2=A0 pwritev2 359<br>
&gt; +pkey_mprotect 362<br>
&gt; +pkey_alloc 363<br>
&gt; +pkey_free 364<br>
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://sparc64.in" rel=
=3D"noreferrer" target=3D"_blank">sparc64.in</a><br>
&gt; b/include/lapi/syscalls/<a href=3D"http://sparc64.in" rel=3D"noreferre=
r" target=3D"_blank">sparc64.in</a><br>
&gt; index c100b8e3e..f3142fbdd 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://sparc64.in" rel=3D"noref=
errer" target=3D"_blank">sparc64.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://sparc64.in" rel=3D"noref=
errer" target=3D"_blank">sparc64.in</a><br>
&gt; @@ -319,3 +319,6 @@ mlock2 356<br>
&gt;=C2=A0 copy_file_range 357<br>
&gt;=C2=A0 preadv2 358<br>
&gt;=C2=A0 pwritev2 359<br>
&gt; +pkey_mprotect 362<br>
&gt; +pkey_alloc 363<br>
&gt; +pkey_free 364<br>
&gt; diff --git a/include/lapi/syscalls/<a href=3D"http://x86_64.in" rel=3D=
"noreferrer" target=3D"_blank">x86_64.in</a><br>
&gt; b/include/lapi/syscalls/<a href=3D"http://x86_64.in" rel=3D"noreferrer=
" target=3D"_blank">x86_64.in</a><br>
&gt; index 87849e5c0..9c77f1c67 100644<br>
&gt; --- a/include/lapi/syscalls/<a href=3D"http://x86_64.in" rel=3D"norefe=
rrer" target=3D"_blank">x86_64.in</a><br>
&gt; +++ b/include/lapi/syscalls/<a href=3D"http://x86_64.in" rel=3D"norefe=
rrer" target=3D"_blank">x86_64.in</a><br>
&gt; @@ -315,3 +315,6 @@ copy_file_range 326<br>
&gt;=C2=A0 preadv2 327<br>
&gt;=C2=A0 pwritev2 328<br>
&gt;=C2=A0 statx 332<br>
&gt; +pkey_mprotect 329<br>
&gt; +pkey_alloc 330<br>
&gt; +pkey_free 331<br>
&gt; diff --git a/runtest/syscalls b/runtest/syscalls<br>
&gt; index a1106fb84..a236fce09 100644<br>
&gt; --- a/runtest/syscalls<br>
&gt; +++ b/runtest/syscalls<br>
&gt; @@ -723,6 +723,8 @@ mprotect02 mprotect02<br>
&gt;=C2=A0 mprotect03 mprotect03<br>
&gt;=C2=A0 mprotect04 mprotect04<br>
&gt;=C2=A0 <br>
&gt; +pkey01 pkey01<br>
&gt; +<br>
&gt;=C2=A0 mq_notify01 mq_notify01<br>
&gt;=C2=A0 mq_notify02 mq_notify02<br>
&gt;=C2=A0 mq_open01 mq_open01<br>
&gt; diff --git a/testcases/kernel/syscalls/pkeys/.gitignore<br>
&gt; b/testcases/kernel/syscalls/pkeys/.gitignore<br>
&gt; new file mode 100644<br>
&gt; index 000000000..6fd5addb8<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/syscalls/pkeys/.gitignore<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +/pkey01<br>
&gt; diff --git a/testcases/kernel/syscalls/pkeys/Makefile<br>
&gt; b/testcases/kernel/syscalls/pkeys/Makefile<br>
&gt; new file mode 100644<br>
&gt; index 000000000..9ee2c2ea5<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/syscalls/pkeys/Makefile<br>
&gt; @@ -0,0 +1,8 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +# Copyright (c) 2019 Red Hat, Inc.<br>
&gt; +<br>
&gt; +top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D ../../../..<b=
r>
&gt; +<br>
&gt; +include $(top_srcdir)/include/mk/<a href=3D"http://testcases.mk" rel=
=3D"noreferrer" target=3D"_blank">testcases.mk</a><br>
&gt; +<br>
&gt; +include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_targe=
t.mk" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
&gt; diff --git a/testcases/kernel/syscalls/pkeys/pkey.h<br>
&gt; b/testcases/kernel/syscalls/pkeys/pkey.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000..bd86bebcc<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/syscalls/pkeys/pkey.h<br>
&gt; @@ -0,0 +1,44 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2019 Red Hat, Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef PKEYS_H<br>
&gt; +#define PKEYS_H<br>
&gt; +<br>
&gt; +#include &quot;tst_test.h&quot;<br>
&gt; +#include &quot;lapi/syscalls.h&quot;<br>
&gt; +<br>
&gt; +#ifndef PKEY_DISABLE_ACCESS<br>
&gt; +# define PKEY_DISABLE_ACCESS 0x1<br>
&gt; +# define PKEY_DISABLE_WRITE=C2=A0 0x2<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifndef HAVE_PKEY_MPROTECT<br>
&gt; +static inline int pkey_mprotect(void *addr, size_t len, int prot, int=
 pkey)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return tst_syscall(SYS_pkey_mprotect, addr, len, =
prot, pkey);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline int pkey_alloc(unsigned int flags, unsigned int access_=
rights)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return tst_syscall(SYS_pkey_alloc, flags, access_=
rights);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline int pkey_free(int pkey)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return tst_syscall(SYS_pkey_free, pkey);<br>
&gt; +}<br>
&gt; +#endif /* HAVE_PKEY_MPROTECT */<br>
&gt; +<br>
&gt; +static inline void check_pkey_support(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int pkey =3D pkey_alloc(0, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((pkey =3D=3D -1) &amp;&amp; (errno =3D=3D EIN=
VAL))<br>
<br>
Shouldn&#39;t this handle also ENOSPC?<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">Yes, if all pkeys ha=
ve been allocated on a system, then we will get this error in allocating a =
new pkey.</div></div><div class=3D"gmail_default" style=3D"font-size:small"=
>I will handle this in v2.</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 ENOSPC (pkey_alloc()) All protection keys available fo=
r the current process have been allocated.=C2=A0 The number of keys availab=
le is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 architecture-specific=C2=
=A0 and=C2=A0 implementation-specific=C2=A0 and may be reduced by kernel-in=
ternal use of certain keys.=C2=A0 There are<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currently 15 keys availabl=
e to user programs on x86.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This error will also be re=
turned if the processor or operating system does=C2=A0 not=C2=A0 support=C2=
=A0 protection=C2=A0 keys.=C2=A0 =C2=A0Applications<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 should=C2=A0 always=C2=A0 =
be prepared to handle this error, since factors outside of the application&=
#39;s control can reduce the number<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of available pkeys.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quot;=
pkey_alloc is not supported&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkey_free(pkey);<br>
&gt; +}<br>
&gt; +<br>
&gt; +#endif /* PKEYS_H */<br>
&gt; diff --git a/testcases/kernel/syscalls/pkeys/pkey01.c<br>
&gt; b/testcases/kernel/syscalls/pkeys/pkey01.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000..8faa4be4c<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/syscalls/pkeys/pkey01.c<br>
&gt; @@ -0,0 +1,105 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2019 Red Hat, Inc.<br>
&gt; + *<br>
&gt; + * Test for Memory Protection Keys<br>
&gt; + * Reference: <a href=3D"https://lwn.net/Articles/689395/" rel=3D"nor=
eferrer" target=3D"_blank">https://lwn.net/Articles/689395/</a><br>
&gt; + */<br>
&gt; +<br>
&gt; +#define _GNU_SOURCE<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;unistd.h&gt;<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +#include &lt;stdlib.h&gt;<br>
&gt; +#include &lt;sys/syscall.h&gt;<br>
&gt; +#include &lt;sys/mman.h&gt;<br>
&gt; +#include &lt;sys/wait.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;pkey.h&quot;<br>
&gt; +<br>
&gt; +static int psize;<br>
&gt; +static char *buffer;<br>
&gt; +<br>
&gt; +static struct tcase {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long access_rights;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *name;<br>
&gt; +} tcases[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0, PKEY_DISABLE_ACCESS, &quot;PKEY_DISABLE_ACCES=
S&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0, PKEY_DISABLE_WRITE, &quot;PKEY_DISABLE_WRITE&=
quot;},<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void setup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0check_pkey_support();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0psize =3D getpagesize();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buffer =3D SAFE_MMAP(NULL, psize, PROT_READ | PRO=
T_WRITE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0MAP_ANONYMOUS | MAP_SHARED, -1, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset(buffer, &#39;a&#39;, psize);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void verify_pkey(unsigned int i)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int pkey, status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pid_t pid;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tcase *tc =3D &amp;tcases[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pkey =3D pkey_alloc(tc-&gt;flags, tc-&gt;access_r=
ights);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pkey =3D=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quot;=
pkey_alloc failed&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Set %s on buffer&quot;, tc-&=
gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pkey_mprotect(buffer, psize, PROT_READ | PROT=
_WRITE, pkey) =3D=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quot;=
pkey_mprotect failed&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pid =3D SAFE_FORK();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pid =3D=3D 0) {<br>
<br>
I&#39;d suggest something like:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rlimit r;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r.rlim_cur =3D 1;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r.rlim_max =3D 1;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_SETRLIMIT(RLIM=
IT_CORE, &amp;r); <br>
<br>
to avoid getting cores from this child - since it is expected to segfault.<=
br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Good advice.</div></div><div class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (tc-&gt;access=
_rights) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PKEY_DISABLE_ACC=
ESS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_res(TFAIL, &quot;Read buffer success, buffer[0] =3D %d&quot;, *b=
uffer);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PKEY_DISABLE_WRI=
TE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*buffer =3D &#39;b&#39;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_WAITPID(pid, &amp;status, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WIFSIGNALED(status)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (WTERMSIG(status) =
=3D=3D SIGSEGV) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_res(TPASS, &quot;Child ended by %s as expected&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_strsig(SIGSEGV));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_res(TFAIL, &quot;Child ended by %s unexpected&quot; ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_strsig(WTERMSIG(status)));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quot;=
Child unexpectedly ended&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Remove %s from buffer&quot;,=
 tc-&gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pkey_mprotect(buffer, psize, PROT_READ | PROT=
_WRITE, 0x0) =3D=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quot;=
pkey_mprotect failed&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*buffer =3D i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;Write buffer success, buffer=
[0] =3D %d&quot;, *buffer);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pkey_free(pkey) =3D=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quot;=
pkey_free failed&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void cleanup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (buffer)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_MUNMAP(buffer, p=
size);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct tst_test test =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.tcnt =3D ARRAY_SIZE(tcases),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.forks_child =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.test =3D verify_pkey,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
&gt; +};<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=
=3D"noreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><b=
r>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"m_7944904958832786292gmail_signature"><div dir=3D"ltr"><div>Regar=
ds,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000f02938058bcf4c76--

--===============1667452610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1667452610==--
