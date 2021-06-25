Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464E3B3F54
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 10:31:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B13F03C6EF3
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 10:30:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B78CF3C6EE2
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 10:30:54 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 033C91401253
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 10:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624609850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IH6nd/b0/bfvMnJLp6ZKlzoh840pUgMtYaPGjJmcVmY=;
 b=A2WLlzBIYQEtaC0yj/TBltNntoKeDhBjDy9/WV7mlvKxbywtRYr+HlK4zDcuE5+f1Fqipc
 dGz7ipWUl12l+9zE6NTi6msmWKF/3MJ7FrkoDCZuqEz3KCj8yGu5Y9yy+EYsheXesp5jne
 z72/XOV/88BS+7XKKAv/1OB1o01O2I8=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-MyDWjlKnPramZcyd9o7-dA-1; Fri, 25 Jun 2021 04:30:46 -0400
X-MC-Unique: MyDWjlKnPramZcyd9o7-dA-1
Received: by mail-yb1-f200.google.com with SMTP id
 j7-20020a258b870000b029052360b1e3e2so3248111ybl.8
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 01:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IH6nd/b0/bfvMnJLp6ZKlzoh840pUgMtYaPGjJmcVmY=;
 b=NV3DZm/B1UHUiS2wJYoqo7zPO6CgaDnbfpJxBrp6YcHXYWn/oUxlaObJ2HT8oppyZW
 9QpsD5edsKzNOyOxQpUtd+lWiRxAqyY9VRSc61Wteu7pU3KZ9NcfqyJ02n3clNPf1w5z
 vF8QiSi8ps6lzhGfEjh5w3xXqnVRKsM+RiDOxtSS380xl38B+WHn1G00KZA8DFljBsrf
 LWBbesl9UFnpQnlTsmU6diDk4Epbppil99Z4khsonvHgY3dvvRVqxadyWI/SgchjZetA
 Kckr9O8Y2GpWgpissoIDRhEXOPHMdaUWsDHD3cMuQvzL5hrQshu7U/NLgDEZ0FSTcTHl
 thjg==
X-Gm-Message-State: AOAM533XfcK13GqDB2sT+9SwteYphfxgEI33g9A3HeBbzXv78P3IZ54J
 mZ+Qd2sn5EL7Z1Q7fPAsrMOHRGtXLjYxqNyU0l95+9nLHJmpLOwaGKRpG/Gs4CuPrGDTOpIen43
 j3fhEByIVsdAEFDFlDN+zunEBPSo=
X-Received: by 2002:a25:6986:: with SMTP id
 e128mr10927081ybc.366.1624609845532; 
 Fri, 25 Jun 2021 01:30:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5ZShyIfPI1MMbJAuxbTrH8sWPAn0TdT9pSk3a9K2FqbOTJTJmjlmsZfyRaf2bcBTnk8SGSLKCctSJdOtc88U=
X-Received: by 2002:a25:6986:: with SMTP id
 e128mr10927065ybc.366.1624609845308; 
 Fri, 25 Jun 2021 01:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210621143056.2724-1-rpalethorpe@suse.com>
 <YNNV1NeXNUyLNE4a@pevik>
In-Reply-To: <YNNV1NeXNUyLNE4a@pevik>
From: Li Wang <liwang@redhat.com>
Date: Fri, 25 Jun 2021 16:30:33 +0800
Message-ID: <CAEemH2dG8kH9ExofdAh3U1_n_kNpU53ZGsmLT-w9v2fL83K93Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [RFC PATCH] rm unused controllers/io-throttle tests
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
Cc: LTP List <ltp@lists.linux.it>, Richard Palethorpe <rpalethorpe@suse.com>,
 automated-testing@yoctoproject.org
Content-Type: multipart/mixed; boundary="===============0876825600=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0876825600==
Content-Type: multipart/alternative; boundary="000000000000ba855f05c592f423"

--000000000000ba855f05c592f423
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 23, 2021 at 11:40 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Richie,
>
> [Cc automated-testing ML ]
> > These files do not appear in any runtest file nor are they called from
> > anywhere else.
>
> A bit of googling Documentation/controllers/io-throttle.txt mentioned in
> README
> was sent to kernel ML in 2008 [1] for 2.6.26-rc6, from this time our memory
> tests originated [2]. But it looks like it never got merged
> (<linux/blk-io-throttle.h> mentioned in patch "i/o bandwidth controller
> infrastructure" [3] didn't get into git).
>
> myfunctions-io.sh uses /dev/blockioctl, which IMHO never got into mainline.
>

Thanks to provide the details info.

Acked-by: Li Wang <liwang@redhat.com>

>
> IMHO it should have never even got in. Thanks for asking for delete.
>
> Acked-by: Petr Vorel <pvorel@suse.cz>
>
> Kind regards,
> Petr
>
> [1]
> https://lists.linuxfoundation.org/pipermail/containers/2008-June/011372.html
> [2]
> https://lists.linuxfoundation.org/pipermail/containers/2008-June/011384.html
> [3]
> https://lists.linuxfoundation.org/pipermail/containers/2008-June/011373.html
>
> > Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> > ---
>
> > .../kernel/controllers/io-throttle/.gitignore |   1 -
> >  .../kernel/controllers/io-throttle/Makefile   |  32 --
> >  .../kernel/controllers/io-throttle/README     |  56 ----
> >  .../io-throttle/io_throttle_testplan.txt      |  36 ---
> >  .../kernel/controllers/io-throttle/iobw.c     | 281 ------------------
> >  .../controllers/io-throttle/myfunctions-io.sh |  61 ----
> >  .../io-throttle/run_io_throttle_test.sh       | 123 --------
> >  7 files changed, 590 deletions(-)
> >  delete mode 100644 testcases/kernel/controllers/io-throttle/.gitignore
> >  delete mode 100644 testcases/kernel/controllers/io-throttle/Makefile
> >  delete mode 100644 testcases/kernel/controllers/io-throttle/README
> >  delete mode 100644
> testcases/kernel/controllers/io-throttle/io_throttle_testplan.txt
> >  delete mode 100644 testcases/kernel/controllers/io-throttle/iobw.c
> >  delete mode 100755
> testcases/kernel/controllers/io-throttle/myfunctions-io.sh
> >  delete mode 100755
> testcases/kernel/controllers/io-throttle/run_io_throttle_test.sh
>
> > diff --git a/testcases/kernel/controllers/io-throttle/.gitignore
> b/testcases/kernel/controllers/io-throttle/.gitignore
> > deleted file mode 100644
> > index 6836f7b74..000000000
> > --- a/testcases/kernel/controllers/io-throttle/.gitignore
> > +++ /dev/null
> > @@ -1 +0,0 @@
> > -/iobw
> > diff --git a/testcases/kernel/controllers/io-throttle/Makefile
> b/testcases/kernel/controllers/io-throttle/Makefile
> > deleted file mode 100644
> > index ceeba7362..000000000
> > --- a/testcases/kernel/controllers/io-throttle/Makefile
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -#
> > -#    kernel/controllers/io-throttle testcase suite Makefile.
> > -#
> > -#    Copyright (C) 2009, Cisco Systems Inc.
> > -#
> > -#    This program is free software; you can redistribute it and/or
> modify
> > -#    it under the terms of the GNU General Public License as published
> by
> > -#    the Free Software Foundation; either version 2 of the License, or
> > -#    (at your option) any later version.
> > -#
> > -#    This program is distributed in the hope that it will be useful,
> > -#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> > -#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > -#    GNU General Public License for more details.
> > -#
> > -#    You should have received a copy of the GNU General Public License
> along
> > -#    with this program; if not, write to the Free Software Foundation,
> Inc.,
> > -#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > -#
> > -# Ngie Cooper, July 2009
> > -#
> > -
> > -top_srcdir           ?= ../../../..
> > -
> > -include $(top_srcdir)/include/mk/testcases.mk
> > -include $(abs_srcdir)/../Makefile.inc
> > -
> > -INSTALL_TARGETS              :=  run_io_throttle_test.sh
> myfunctions-io.sh
> > -
> > -LDLIBS                       += -lm -lcontrollers
> > -
> > -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> > diff --git a/testcases/kernel/controllers/io-throttle/README
> b/testcases/kernel/controllers/io-throttle/README
> > deleted file mode 100644
> > index e5980fb6c..000000000
> > --- a/testcases/kernel/controllers/io-throttle/README
> > +++ /dev/null
> > @@ -1,56 +0,0 @@
> > -TEST SUITE:
> > -
> > -The directory io-throttle contains the tests related to block device I/O
> > -bandwdith controller.
> > -
> > -More testcases are expected to be added in future.
> > -
> > -TESTS AIM:
> > -
> > -The aim of the tests is to check the block device I/O throttling
> functionality
> > -for cgroups.
> > -
> > -FILES DESCRIPTION:
> > -
> > -iobw.c
> > ----------------
> > -Simple benchmark to generate parallel streams of direct I/O (O_DIRECT).
> This
> > -benchmark fork()s one task per stream. Each task creates a separate
> file in the
> > -current working directory, fills it with data using O_DIRECT writes and
> re-read
> > -the whole file always in O_DIRECT mode. Different timestamps are used to
> > -evaluate per-task I/O rate and total I/O rate (seen by the parent).
> > -
> > -myfunctions.sh
> > -----------
> > -This file contains the functions which are common for the io-throttle
> tests.
> > -For ex.  the setup and cleanup functions which do the setup for running
> the
> > -test and do the cleanup once the test finishes. The setup() function
> creates
> > -/dev/blockioctl directory and mounts cgroup filesystem on it with memory
> > -controller. It then creates a number(n) of groups in /dev/blockioctl.
> The
> > -cleanup function does a complete cleanup of the system.
> > -
> > -Most of the error scenarios have been taken care of for a sane cleanup
> of the
> > -system. However if cleanup fails in any case, just manually execute the
> > -commands written in cleanup function in myfunctions.sh.
> > -One of the most common causes of failed cleanup is that you have done
> cd into
> > -any of the groups in controller dir tree.
> > -
> > -run_io_throttle_test.sh
> > -------------------
> > -This script creates different scenarios for I/O bandwidth controller
> testing
> > -and fires (n) tasks in different groups to write and read different I/O
> streams
> > -etc. It waits for the return status from tasks and reports test
> pass/fail
> > -accordingly.
> > -
> > -Makefile
> > ---------
> > -The usual makefile for this directory
> > -
> > -PASS/FAIL CRITERION:
> > -==================
> > -The test cases are intelligent enough in deciding the pass or failure
> of a
> > -test.
> > -
> > -README:
> > ---------
> > -This file.
> > diff --git
> a/testcases/kernel/controllers/io-throttle/io_throttle_testplan.txt
> b/testcases/kernel/controllers/io-throttle/io_throttle_testplan.txt
> > deleted file mode 100644
> > index fa5b85b42..000000000
> > --- a/testcases/kernel/controllers/io-throttle/io_throttle_testplan.txt
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -The I/O bandwidth controller testplan includes a complete set of
> testcases to
> > -verify the effectiveness of the block device I/O throttling
> capabilities for
> > -cgroups.
> > -
> > -I/O bandwidth limitations are imposed by the testcase script and
> verified doing
> > -I/O activity on a limited block device. Tests are supposed to be passed
> if the
> > -I/O rates of all the different workloads always respect the I/O
> limitations.
> > -
> > -TESTCASE DESCRIPTION:
> > -====================
> > -First of all we evaluate the physical I/O bandwidth (physical-io-bw) of
> the
> > -block device where the current working directory resides.
> > -
> > -Based on the physical I/O bandwidth three cgroups are created: cgroup-1,
> > -cgroup-2, cgroup-3. Cgroups use respectively the following I/O bandwidth
> > -limitations:
> > -- cgroup-1: physical-io-bw / 2
> > -- cgroup-2: physical-io-bw / 4
> > -- cgroup-3: physical-io-bw / 8
> > -
> > -Each test is considered passed only if the I/O limitations above are
> respected.
> > -
> > -Currently the following different scenarios are tested:
> > -- 1 single stream per cgroup using leaky-bucket I/O throttling
> > -- 1 single stream per cgroup using token-bucket I/O throttling
> > -- 2 parallel streams per cgroup using leaky-bucket I/O throttling
> > -- 2 parallel streams per cgroup using token-bucket I/O throttling
> > -- 4 parallel streams per cgroup using leaky-bucket I/O throttling
> > -- 4 parallel streams per cgroup using token-bucket I/O throttling
> > -
> > -For any other information please refer to
> > -Documentation/controllers/io-throttle.txt in kernel documentation.
> > -
> > -Questions?
> > -----------
> > -Send email to: righi.andrea@gmail.com
> > diff --git a/testcases/kernel/controllers/io-throttle/iobw.c
> b/testcases/kernel/controllers/io-throttle/iobw.c
> > deleted file mode 100644
> > index e4d9c9bb6..000000000
> > --- a/testcases/kernel/controllers/io-throttle/iobw.c
> > +++ /dev/null
> > @@ -1,281 +0,0 @@
> > -/*
> > - * iobw.c - simple I/O bandwidth benchmark
> > - *
> > - * This program is free software; you can redistribute it and/or
> > - * modify it under the terms of the GNU General Public
> > - * License as published by the Free Software Foundation; either
> > - * version 2 of the License, or (at your option) any later version.
> > - *
> > - * This program is distributed in the hope that it will be useful,
> > - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > - * General Public License for more details.
> > - *
> > - * You should have received a copy of the GNU General Public
> > - * License along with this program; if not, write to the
> > - * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> > - * Boston, MA 021110-1307, USA.
> > - *
> > - * Copyright (C) 2008 Andrea Righi <righi.andrea@gmail.com>
> > - */
> > -
> > -#define _GNU_SOURCE
> > -#define __USE_GNU
> > -
> > -#include <errno.h>
> > -#include <stdio.h>
> > -#include <stdlib.h>
> > -#include <fcntl.h>
> > -#include <signal.h>
> > -#include <string.h>
> > -#include <unistd.h>
> > -#include <limits.h>
> > -#include <sys/types.h>
> > -#include <sys/stat.h>
> > -#include <sys/time.h>
> > -#include <sys/wait.h>
> > -
> > -#ifndef PAGE_SIZE
> > -#define PAGE_SIZE sysconf(_SC_PAGE_SIZE)
> > -#endif
> > -
> > -#define align(x,a)           __align_mask(x,(typeof(x))(a)-1)
> > -#define __align_mask(x,mask) (((x)+(mask))&~(mask))
> > -#define kb(x)                        ((x) >> 10)
> > -
> > -const char usage[] = "Usage: iobw [-direct] threads chunk_size
> data_size\n";
> > -const char child_fmt[] = "(%s) task %3d: time %4lu.%03lu bw %7lu KiB/s
> (%s)\n";
> > -const char parent_fmt[] =
> > -    "(%s) parent %d: time %4lu.%03lu bw %7lu KiB/s (%s)\n";
> > -
> > -static int directio = 0;
> > -static size_t data_size = 0;
> > -static size_t chunk_size = 0;
> > -
> > -typedef enum {
> > -     OP_WRITE,
> > -     OP_READ,
> > -     NUM_IOPS,
> > -} iops_t;
> > -
> > -static const char *iops[] = {
> > -     "WRITE",
> > -     "READ ",
> > -     "TOTAL",
> > -};
> > -
> > -static int threads;
> > -pid_t *children;
> > -
> > -char *mygroup;
> > -
> > -static void print_results(int id, iops_t op, size_t bytes, struct
> timeval *diff)
> > -{
> > -     fprintf(stdout, id ? child_fmt : parent_fmt,
> > -             mygroup, id, diff->tv_sec, diff->tv_usec / 1000,
> > -             (bytes / (diff->tv_sec * 1000000L + diff->tv_usec))
> > -             * 1000000L / 1024, iops[op]);
> > -}
> > -
> > -static void thread(int id)
> > -{
> > -     struct timeval start, stop, diff;
> > -     int fd, i, ret;
> > -     size_t n;
> > -     void *buf;
> > -     int flags = O_CREAT | O_RDWR | O_LARGEFILE;
> > -     char filename[32];
> > -
> > -     ret = posix_memalign(&buf, PAGE_SIZE, chunk_size);
> > -     if (ret < 0) {
> > -             fprintf(stderr,
> > -                     "ERROR: task %d couldn't allocate %zu bytes
> (%s)\n",
> > -                     id, chunk_size, strerror(errno));
> > -             exit(1);
> > -     }
> > -     memset(buf, 0xaa, chunk_size);
> > -
> > -     snprintf(filename, sizeof(filename), "%s-%d-iobw.tmp", mygroup,
> id);
> > -     if (directio)
> > -             flags |= O_DIRECT;
> > -     fd = open(filename, flags, 0600);
> > -     if (fd < 0) {
> > -             fprintf(stderr, "ERROR: task %d couldn't open %s (%s)\n",
> > -                     id, filename, strerror(errno));
> > -             free(buf);
> > -             exit(1);
> > -     }
> > -
> > -     /* Write */
> > -     lseek(fd, 0, SEEK_SET);
> > -     n = 0;
> > -     gettimeofday(&start, NULL);
> > -     while (n < data_size) {
> > -             i = write(fd, buf, chunk_size);
> > -             if (i < 0) {
> > -                     fprintf(stderr, "ERROR: task %d writing to %s
> (%s)\n",
> > -                             id, filename, strerror(errno));
> > -                     ret = 1;
> > -                     goto out;
> > -             }
> > -             n += i;
> > -     }
> > -     gettimeofday(&stop, NULL);
> > -     timersub(&stop, &start, &diff);
> > -     print_results(id + 1, OP_WRITE, data_size, &diff);
> > -
> > -     /* Read */
> > -     lseek(fd, 0, SEEK_SET);
> > -     n = 0;
> > -     gettimeofday(&start, NULL);
> > -     while (n < data_size) {
> > -             i = read(fd, buf, chunk_size);
> > -             if (i < 0) {
> > -                     fprintf(stderr, "ERROR: task %d reading to %s
> (%s)\n",
> > -                             id, filename, strerror(errno));
> > -                     ret = 1;
> > -                     goto out;
> > -             }
> > -             n += i;
> > -     }
> > -     gettimeofday(&stop, NULL);
> > -     timersub(&stop, &start, &diff);
> > -     print_results(id + 1, OP_READ, data_size, &diff);
> > -out:
> > -     close(fd);
> > -     unlink(filename);
> > -     free(buf);
> > -     exit(ret);
> > -}
> > -
> > -static void spawn(int id)
> > -{
> > -     pid_t pid;
> > -
> > -     pid = fork();
> > -     switch (pid) {
> > -     case -1:
> > -             fprintf(stderr, "ERROR: couldn't fork thread %d\n", id);
> > -             exit(1);
> > -     case 0:
> > -             thread(id);
> > -     default:
> > -             children[id] = pid;
> > -     }
> > -}
> > -
> > -void signal_handler(int sig)
> > -{
> > -     char filename[32];
> > -     int i;
> > -
> > -     for (i = 0; i < threads; i++)
> > -             if (children[i])
> > -                     kill(children[i], SIGKILL);
> > -
> > -     for (i = 0; i < threads; i++) {
> > -             struct stat mystat;
> > -
> > -             snprintf(filename, sizeof(filename), "%s-%d-iobw.tmp",
> > -                      mygroup, i);
> > -             if (stat(filename, &mystat) < 0)
> > -                     continue;
> > -             unlink(filename);
> > -     }
> > -
> > -     fprintf(stdout, "received signal %d, exiting\n", sig);
> > -     exit(0);
> > -}
> > -
> > -unsigned long long memparse(char *ptr, char **retptr)
> > -{
> > -     unsigned long long ret = strtoull(ptr, retptr, 0);
> > -
> > -     switch (**retptr) {
> > -     case 'G':
> > -     case 'g':
> > -             ret <<= 10;
> > -     case 'M':
> > -     case 'm':
> > -             ret <<= 10;
> > -     case 'K':
> > -     case 'k':
> > -             ret <<= 10;
> > -             (*retptr)++;
> > -     default:
> > -             break;
> > -     }
> > -     return ret;
> > -}
> > -
> > -int main(int argc, char *argv[])
> > -{
> > -     struct timeval start, stop, diff;
> > -     char *end;
> > -     int i;
> > -
> > -     if (argv[1] && strcmp(argv[1], "-direct") == 0) {
> > -             directio = 1;
> > -             argc--;
> > -             argv++;
> > -     }
> > -     if (argc != 4) {
> > -             fprintf(stderr, usage);
> > -             exit(1);
> > -     }
> > -     if ((threads = atoi(argv[1])) == 0) {
> > -             fprintf(stderr, usage);
> > -             exit(1);
> > -     }
> > -     chunk_size = align(memparse(argv[2], &end), PAGE_SIZE);
> > -     if (*end) {
> > -             fprintf(stderr, usage);
> > -             exit(1);
> > -     }
> > -     data_size = align(memparse(argv[3], &end), PAGE_SIZE);
> > -     if (*end) {
> > -             fprintf(stderr, usage);
> > -             exit(1);
> > -     }
> > -
> > -     /* retrieve group name */
> > -     mygroup = getenv("MYGROUP");
> > -     if (!mygroup) {
> > -             fprintf(stderr,
> > -                     "ERROR: undefined environment variable MYGROUP\n");
> > -             exit(1);
> > -     }
> > -
> > -     children = malloc(sizeof(pid_t) * threads);
> > -     if (!children) {
> > -             fprintf(stderr, "ERROR: not enough memory\n");
> > -             exit(1);
> > -     }
> > -
> > -     /* handle user interrupt */
> > -     signal(SIGINT, signal_handler);
> > -     /* handle kill from shell */
> > -     signal(SIGTERM, signal_handler);
> > -
> > -     fprintf(stdout, "chunk_size %zuKiB, data_size %zuKiB\n",
> > -             kb(chunk_size), kb(data_size));
> > -     fflush(stdout);
> > -
> > -     gettimeofday(&start, NULL);
> > -     for (i = 0; i < threads; i++)
> > -             spawn(i);
> > -     for (i = 0; i < threads; i++) {
> > -             int status;
> > -             wait(&status);
> > -             if (!WIFEXITED(status))
> > -                     exit(1);
> > -     }
> > -     gettimeofday(&stop, NULL);
> > -
> > -     timersub(&stop, &start, &diff);
> > -     print_results(0, NUM_IOPS, data_size * threads * NUM_IOPS, &diff);
> > -     fflush(stdout);
> > -     free(children);
> > -
> > -     exit(0);
> > -}
> > diff --git a/testcases/kernel/controllers/io-throttle/myfunctions-io.sh
> b/testcases/kernel/controllers/io-throttle/myfunctions-io.sh
> > deleted file mode 100755
> > index bf4bb2b9a..000000000
> > --- a/testcases/kernel/controllers/io-throttle/myfunctions-io.sh
> > +++ /dev/null
> > @@ -1,61 +0,0 @@
> > -#!/bin/sh
> > -#
> > -# This program is free software; you can redistribute it and/or
> > -# modify it under the terms of the GNU General Public
> > -# License as published by the Free Software Foundation; either
> > -# version 2 of the License, or (at your option) any later version.
> > -#
> > -# This program is distributed in the hope that it will be useful,
> > -# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > -# General Public License for more details.
> > -#
> > -# You should have received a copy of the GNU General Public
> > -# License along with this program; if not, write to the
> > -# Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> > -# Boston, MA 021110-1307, USA.
> > -#
> > -# Copyright (C) 2008 Andrea Righi <righi.andrea@gmail.com>
> > -#
> > -# usage . myfunctions.sh
> > -
> > -setup()
> > -{
> > -     # create testcase cgroups
> > -     if [ -e /dev/blockioctl ]; then
> > -             echo "WARN: /dev/blockioctl already exist! overwriting."
> > -             cleanup
> > -     fi
> > -     mkdir /dev/blockioctl
> > -     mount -t cgroup -o blockio cgroup /dev/blockioctl
> > -     if [ $? -ne 0 ]; then
> > -             echo "ERROR: could not mount cgroup filesystem " \
> > -                     " on /dev/blockioctl. Exiting test."
> > -             cleanup
> > -             exit 1
> > -     fi
> > -     for i in `seq 1 3`; do
> > -             if [ -e /dev/blockioctl/cgroup-$i ]; then
> > -                     rmdir /dev/blockioctl/cgroup-$i
> > -                     echo "WARN: earlier cgroup-$i found and removed"
> > -             fi
> > -             mkdir /dev/blockioctl/cgroup-$i
> > -             if [ $? -ne 0 ]; then
> > -                     echo "ERROR: could not create cgroup-$i" \
> > -                             "Check your permissions. Exiting test."
> > -                     cleanup
> > -                     exit 1
> > -             fi
> > -     done
> > -}
> > -
> > -cleanup()
> > -{
> > -     echo "Cleanup called"
> > -     for i in `seq 1 3`; do
> > -             rmdir /dev/blockioctl/cgroup-$i
> > -             rm -f /tmp/cgroup-$i.out
> > -     done
> > -     umount /dev/blockioctl
> > -     rmdir /dev/blockioctl
> > -}
> > diff --git
> a/testcases/kernel/controllers/io-throttle/run_io_throttle_test.sh
> b/testcases/kernel/controllers/io-throttle/run_io_throttle_test.sh
> > deleted file mode 100755
> > index c855fd052..000000000
> > --- a/testcases/kernel/controllers/io-throttle/run_io_throttle_test.sh
> > +++ /dev/null
> > @@ -1,123 +0,0 @@
> > -#!/bin/bash
> > -#
> > -# This program is free software; you can redistribute it and/or
> > -# modify it under the terms of the GNU General Public
> > -# License as published by the Free Software Foundation; either
> > -# version 2 of the License, or (at your option) any later version.
> > -#
> > -# This program is distributed in the hope that it will be useful,
> > -# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > -# General Public License for more details.
> > -#
> > -# You should have received a copy of the GNU General Public
> > -# License along with this program; if not, write to the
> > -# Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> > -# Boston, MA 021110-1307, USA.
> > -#
> > -# Copyright (C) 2008 Andrea Righi <righi.andrea@gmail.com>
> > -#
> > -# Usage: ./run_io_throttle_test.sh
> > -# Description: test block device I/O bandwidth controller
> functionalities
> > -
> > -. ./myfunctions-io.sh
> > -
> > -trap cleanup SIGINT
> > -
> > -BUFSIZE=16m
> > -DATASIZE=64m
> > -
> > -setup
> > -
> > -# get the device name of the entire mounted block device
> > -dev=`df -P . | sed '1d' | cut -d' ' -f1 | sed 's/[p]*[0-9]*$//'`
> > -
> > -# evaluate device bandwidth
> > -export MYGROUP=
> > -phys_bw=`./iobw -direct 1 $BUFSIZE $DATASIZE | grep TOTAL | awk '{print
> $7}'`
> > -if [ $? -ne 0 ]; then
> > -     echo "ERROR: could not evaluate i/o bandwidth of $dev. Exiting
> test."
> > -     cleanup
> > -     exit 1
> > -fi
> > -echo ">> physical i/o bandwidth limit is: $phys_bw KiB/s"
> > -# show cgroup i/o bandwidth limits
> > -for i in `seq 1 3`; do
> > -     MYGROUP=cgroup-$i
> > -     echo "($MYGROUP) max i/o bw: " \
> > -             "$(($phys_bw / `echo 2^$i | bc`)) KiB/s + O_DIRECT"
> > -done
> > -
> > -for tasks in 1 2 4; do
> > -for strategy in 0 1; do
> > -     # set bw limiting rules
> > -     if [ -f /dev/blockioctl/blockio.bandwidth ]; then
> > -             io_throttle_file=blockio.bandwidth
> > -     elif [ -f /dev/blockioctl/blockio.bandwidth-max ]; then
> > -             io_throttle_file=blockio.bandwidth-max
> > -     else
> > -             echo "ERROR: unknown kernel ABI. Exiting test."
> > -             cleanup
> > -             exit 1
> > -     fi
> > -     for i in `seq 1 3`; do
> > -             limit=$(($phys_bw * 1024 / `echo 2^$i | bc`))
> > -             IOBW[$i]=$(($limit / 1024))
> > -             /bin/echo $dev:$limit:$strategy:$limit > \
> > -                     /dev/blockioctl/cgroup-$i/${io_throttle_file}
> > -             if [ $? -ne 0 ]; then
> > -                     echo "ERROR: could not set i/o bandwidth limit for
> cgroup-$i. Exiting test."
> > -                     cleanup
> > -                     exit 1
> > -             fi
> > -     done
> > -
> > -     # run benchmark
> > -     if [ $tasks -eq 1 ]; then
> > -             stream="stream"
> > -     else
> > -             stream="streams"
> > -     fi
> > -     echo -n ">> testing $tasks parallel $stream per cgroup "
> > -     if [ $strategy -eq 0 ]; then
> > -             echo "(leaky-bucket i/o throttling)"
> > -     else
> > -             echo "(token-bucket i/o throttling)"
> > -     fi
> > -     for i in `seq 1 3`; do
> > -             MYGROUP=cgroup-$i
> > -             /bin/echo $$ > /dev/blockioctl/$MYGROUP/tasks
> > -             if [ $? -ne 0 ]; then
> > -                     echo "ERROR: could not set i/o bandwidth limit for
> cgroup-$i. Exiting test."
> > -                     cleanup
> > -                     exit 1
> > -             fi
> > -             # exec i/o benchmark
> > -             ./iobw -direct $tasks $BUFSIZE $DATASIZE >
> /tmp/$MYGROUP.out &
> > -             PID[$i]=$!
> > -     done
> > -     /bin/echo $$ > /dev/blockioctl/tasks
> > -
> > -     # wait for children completion
> > -     for i in `seq 1 3`; do
> > -             MYGROUP=cgroup-$i
> > -             wait ${PID[$i]}
> > -             ret=$?
> > -             if [ $ret -ne 0 ]; then
> > -                     echo "ERROR: error code $ret during test
> $tasks.$strategy.$i. Exiting test."
> > -                     cleanup
> > -                     exit 1
> > -             fi
> > -             iorate=`grep parent /tmp/${MYGROUP}.out | awk '{print $7}'`
> > -             diff=$((${IOBW[$i]} - $iorate))
> > -             echo "($MYGROUP) i/o-bw ${IOBW[$i]} KiB/s, i/o-rate
> $iorate KiB/s, err $diff KiB/s"
> > -             if [ ${IOBW[$i]} -ge $iorate ]; then
> > -                     echo "TPASS   Block device I/O bandwidth
> controller: test $tasks.$strategy.$i PASSED";
> > -             else
> > -                     echo "TFAIL   Block device I/O bandwidth
> controller: test $tasks.$strategy.$i FAILED";
> > -             fi
> > -     done
> > -done
> > -done
> > -
> > -cleanup
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000ba855f05c592f423
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jun 23, 2021 at 11:40 PM Petr Vorel &lt;<a =
href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Richie,<br>
<br>
[Cc automated-testing ML ]<br>
&gt; These files do not appear in any runtest file nor are they called from=
<br>
&gt; anywhere else.<br>
<br>
A bit of googling Documentation/controllers/io-throttle.txt mentioned in RE=
ADME<br>
was sent to kernel ML in 2008 [1] for 2.6.26-rc6, from this time our memory=
<br>
tests originated [2]. But it looks like it never got merged<br>
(&lt;linux/blk-io-throttle.h&gt; mentioned in patch &quot;i/o bandwidth con=
troller<br>
infrastructure&quot; [3] didn&#39;t get into git).<br>
<br>
myfunctions-io.sh uses /dev/blockioctl, which IMHO never got into mainline.=
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Thanks to=C2=A0provide the details info.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small"><span class=3D"gmail_default"></span>Acked-by:=
=C2=A0Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">li=
wang@redhat.com</a>&gt;</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
IMHO it should have never even got in. Thanks for asking for delete.<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>Acked-by: Pe=
tr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@sus=
e.cz</a>&gt;<br>
<br>
Kind regards,<br>
Petr<br>
<br>
[1] <a href=3D"https://lists.linuxfoundation.org/pipermail/containers/2008-=
June/011372.html" rel=3D"noreferrer" target=3D"_blank">https://lists.linuxf=
oundation.org/pipermail/containers/2008-June/011372.html</a><br>
[2] <a href=3D"https://lists.linuxfoundation.org/pipermail/containers/2008-=
June/011384.html" rel=3D"noreferrer" target=3D"_blank">https://lists.linuxf=
oundation.org/pipermail/containers/2008-June/011384.html</a><br>
[3] <a href=3D"https://lists.linuxfoundation.org/pipermail/containers/2008-=
June/011373.html" rel=3D"noreferrer" target=3D"_blank">https://lists.linuxf=
oundation.org/pipermail/containers/2008-June/011373.html</a><br>
<br>
&gt; Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@su=
se.com" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
&gt; ---<br>
<br>
&gt; .../kernel/controllers/io-throttle/.gitignore |=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 .../kernel/controllers/io-throttle/Makefile=C2=A0 =C2=A0|=C2=A0 =
32 --<br>
&gt;=C2=A0 .../kernel/controllers/io-throttle/README=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 56 ----<br>
&gt;=C2=A0 .../io-throttle/io_throttle_testplan.txt=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 36 ---<br>
&gt;=C2=A0 .../kernel/controllers/io-throttle/iobw.c=C2=A0 =C2=A0 =C2=A0| 2=
81 ------------------<br>
&gt;=C2=A0 .../controllers/io-throttle/myfunctions-io.sh |=C2=A0 61 ----<br=
>
&gt;=C2=A0 .../io-throttle/run_io_throttle_test.sh=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 123 --------<br>
&gt;=C2=A0 7 files changed, 590 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 testcases/kernel/controllers/io-throttle/.git=
ignore<br>
&gt;=C2=A0 delete mode 100644 testcases/kernel/controllers/io-throttle/Make=
file<br>
&gt;=C2=A0 delete mode 100644 testcases/kernel/controllers/io-throttle/READ=
ME<br>
&gt;=C2=A0 delete mode 100644 testcases/kernel/controllers/io-throttle/io_t=
hrottle_testplan.txt<br>
&gt;=C2=A0 delete mode 100644 testcases/kernel/controllers/io-throttle/iobw=
.c<br>
&gt;=C2=A0 delete mode 100755 testcases/kernel/controllers/io-throttle/myfu=
nctions-io.sh<br>
&gt;=C2=A0 delete mode 100755 testcases/kernel/controllers/io-throttle/run_=
io_throttle_test.sh<br>
<br>
&gt; diff --git a/testcases/kernel/controllers/io-throttle/.gitignore b/tes=
tcases/kernel/controllers/io-throttle/.gitignore<br>
&gt; deleted file mode 100644<br>
&gt; index 6836f7b74..000000000<br>
&gt; --- a/testcases/kernel/controllers/io-throttle/.gitignore<br>
&gt; +++ /dev/null<br>
&gt; @@ -1 +0,0 @@<br>
&gt; -/iobw<br>
&gt; diff --git a/testcases/kernel/controllers/io-throttle/Makefile b/testc=
ases/kernel/controllers/io-throttle/Makefile<br>
&gt; deleted file mode 100644<br>
&gt; index ceeba7362..000000000<br>
&gt; --- a/testcases/kernel/controllers/io-throttle/Makefile<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,32 +0,0 @@<br>
&gt; -#<br>
&gt; -#=C2=A0 =C2=A0 kernel/controllers/io-throttle testcase suite Makefile=
.<br>
&gt; -#<br>
&gt; -#=C2=A0 =C2=A0 Copyright (C) 2009, Cisco Systems Inc.<br>
&gt; -#<br>
&gt; -#=C2=A0 =C2=A0 This program is free software; you can redistribute it=
 and/or modify<br>
&gt; -#=C2=A0 =C2=A0 it under the terms of the GNU General Public License a=
s published by<br>
&gt; -#=C2=A0 =C2=A0 the Free Software Foundation; either version 2 of the =
License, or<br>
&gt; -#=C2=A0 =C2=A0 (at your option) any later version.<br>
&gt; -#<br>
&gt; -#=C2=A0 =C2=A0 This program is distributed in the hope that it will b=
e useful,<br>
&gt; -#=C2=A0 =C2=A0 but WITHOUT ANY WARRANTY; without even the implied war=
ranty of<br>
&gt; -#=C2=A0 =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=
=C2=A0 See the<br>
&gt; -#=C2=A0 =C2=A0 GNU General Public License for more details.<br>
&gt; -#<br>
&gt; -#=C2=A0 =C2=A0 You should have received a copy of the GNU General Pub=
lic License along<br>
&gt; -#=C2=A0 =C2=A0 with this program; if not, write to the Free Software =
Foundation, Inc.,<br>
&gt; -#=C2=A0 =C2=A0 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301=
 USA.<br>
&gt; -#<br>
&gt; -# Ngie Cooper, July 2009<br>
&gt; -#<br>
&gt; -<br>
&gt; -top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D ../../../..<b=
r>
&gt; -<br>
&gt; -include $(top_srcdir)/include/mk/<a href=3D"http://testcases.mk" rel=
=3D"noreferrer" target=3D"_blank">testcases.mk</a><br>
&gt; -include $(abs_srcdir)/../Makefile.inc<br>
&gt; -<br>
&gt; -INSTALL_TARGETS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D=
=C2=A0 run_io_throttle_test.sh myfunctions-io.sh<br>
&gt; -<br>
&gt; -LDLIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0+=3D -lm -lcontrollers<br>
&gt; -<br>
&gt; -include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_targe=
t.mk" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
&gt; diff --git a/testcases/kernel/controllers/io-throttle/README b/testcas=
es/kernel/controllers/io-throttle/README<br>
&gt; deleted file mode 100644<br>
&gt; index e5980fb6c..000000000<br>
&gt; --- a/testcases/kernel/controllers/io-throttle/README<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,56 +0,0 @@<br>
&gt; -TEST SUITE:<br>
&gt; -<br>
&gt; -The directory io-throttle contains the tests related to block device =
I/O<br>
&gt; -bandwdith controller.<br>
&gt; -<br>
&gt; -More testcases are expected to be added in future.<br>
&gt; -<br>
&gt; -TESTS AIM:<br>
&gt; -<br>
&gt; -The aim of the tests is to check the block device I/O throttling func=
tionality<br>
&gt; -for cgroups.<br>
&gt; -<br>
&gt; -FILES DESCRIPTION:<br>
&gt; -<br>
&gt; -iobw.c<br>
&gt; ----------------<br>
&gt; -Simple benchmark to generate parallel streams of direct I/O (O_DIRECT=
). This<br>
&gt; -benchmark fork()s one task per stream. Each task creates a separate f=
ile in the<br>
&gt; -current working directory, fills it with data using O_DIRECT writes a=
nd re-read<br>
&gt; -the whole file always in O_DIRECT mode. Different timestamps are used=
 to<br>
&gt; -evaluate per-task I/O rate and total I/O rate (seen by the parent).<b=
r>
&gt; -<br>
&gt; -myfunctions.sh<br>
&gt; -----------<br>
&gt; -This file contains the functions which are common for the io-throttle=
 tests.<br>
&gt; -For ex.=C2=A0 the setup and cleanup functions which do the setup for =
running the<br>
&gt; -test and do the cleanup once the test finishes. The setup() function =
creates<br>
&gt; -/dev/blockioctl directory and mounts cgroup filesystem on it with mem=
ory<br>
&gt; -controller. It then creates a number(n) of groups in /dev/blockioctl.=
 The<br>
&gt; -cleanup function does a complete cleanup of the system.<br>
&gt; -<br>
&gt; -Most of the error scenarios have been taken care of for a sane cleanu=
p of the<br>
&gt; -system. However if cleanup fails in any case, just manually execute t=
he<br>
&gt; -commands written in cleanup function in myfunctions.sh.<br>
&gt; -One of the most common causes of failed cleanup is that you have done=
 cd into<br>
&gt; -any of the groups in controller dir tree.<br>
&gt; -<br>
&gt; -run_io_throttle_test.sh<br>
&gt; -------------------<br>
&gt; -This script creates different scenarios for I/O bandwidth controller =
testing<br>
&gt; -and fires (n) tasks in different groups to write and read different I=
/O streams<br>
&gt; -etc. It waits for the return status from tasks and reports test pass/=
fail<br>
&gt; -accordingly.<br>
&gt; -<br>
&gt; -Makefile<br>
&gt; ---------<br>
&gt; -The usual makefile for this directory<br>
&gt; -<br>
&gt; -PASS/FAIL CRITERION:<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; -The test cases are intelligent enough in deciding the pass or failure=
 of a<br>
&gt; -test.<br>
&gt; -<br>
&gt; -README:<br>
&gt; ---------<br>
&gt; -This file.<br>
&gt; diff --git a/testcases/kernel/controllers/io-throttle/io_throttle_test=
plan.txt b/testcases/kernel/controllers/io-throttle/io_throttle_testplan.tx=
t<br>
&gt; deleted file mode 100644<br>
&gt; index fa5b85b42..000000000<br>
&gt; --- a/testcases/kernel/controllers/io-throttle/io_throttle_testplan.tx=
t<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,36 +0,0 @@<br>
&gt; -The I/O bandwidth controller testplan includes a complete set of test=
cases to<br>
&gt; -verify the effectiveness of the block device I/O throttling capabilit=
ies for<br>
&gt; -cgroups.<br>
&gt; -<br>
&gt; -I/O bandwidth limitations are imposed by the testcase script and veri=
fied doing<br>
&gt; -I/O activity on a limited block device. Tests are supposed to be pass=
ed if the<br>
&gt; -I/O rates of all the different workloads always respect the I/O limit=
ations.<br>
&gt; -<br>
&gt; -TESTCASE DESCRIPTION:<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; -First of all we evaluate the physical I/O bandwidth (physical-io-bw) =
of the<br>
&gt; -block device where the current working directory resides.<br>
&gt; -<br>
&gt; -Based on the physical I/O bandwidth three cgroups are created: cgroup=
-1,<br>
&gt; -cgroup-2, cgroup-3. Cgroups use respectively the following I/O bandwi=
dth<br>
&gt; -limitations:<br>
&gt; -- cgroup-1: physical-io-bw / 2<br>
&gt; -- cgroup-2: physical-io-bw / 4<br>
&gt; -- cgroup-3: physical-io-bw / 8<br>
&gt; -<br>
&gt; -Each test is considered passed only if the I/O limitations above are =
respected.<br>
&gt; -<br>
&gt; -Currently the following different scenarios are tested:<br>
&gt; -- 1 single stream per cgroup using leaky-bucket I/O throttling<br>
&gt; -- 1 single stream per cgroup using token-bucket I/O throttling<br>
&gt; -- 2 parallel streams per cgroup using leaky-bucket I/O throttling<br>
&gt; -- 2 parallel streams per cgroup using token-bucket I/O throttling<br>
&gt; -- 4 parallel streams per cgroup using leaky-bucket I/O throttling<br>
&gt; -- 4 parallel streams per cgroup using token-bucket I/O throttling<br>
&gt; -<br>
&gt; -For any other information please refer to<br>
&gt; -Documentation/controllers/io-throttle.txt in kernel documentation.<br=
>
&gt; -<br>
&gt; -Questions?<br>
&gt; -----------<br>
&gt; -Send email to: <a href=3D"mailto:righi.andrea@gmail.com" target=3D"_b=
lank">righi.andrea@gmail.com</a><br>
&gt; diff --git a/testcases/kernel/controllers/io-throttle/iobw.c b/testcas=
es/kernel/controllers/io-throttle/iobw.c<br>
&gt; deleted file mode 100644<br>
&gt; index e4d9c9bb6..000000000<br>
&gt; --- a/testcases/kernel/controllers/io-throttle/iobw.c<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,281 +0,0 @@<br>
&gt; -/*<br>
&gt; - * iobw.c - simple I/O bandwidth benchmark<br>
&gt; - *<br>
&gt; - * This program is free software; you can redistribute it and/or<br>
&gt; - * modify it under the terms of the GNU General Public<br>
&gt; - * License as published by the Free Software Foundation; either<br>
&gt; - * version 2 of the License, or (at your option) any later version.<b=
r>
&gt; - *<br>
&gt; - * This program is distributed in the hope that it will be useful,<br=
>
&gt; - * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
 GNU<br>
&gt; - * General Public License for more details.<br>
&gt; - *<br>
&gt; - * You should have received a copy of the GNU General Public<br>
&gt; - * License along with this program; if not, write to the<br>
&gt; - * Free Software Foundation, Inc., 59 Temple Place - Suite 330,<br>
&gt; - * Boston, MA 021110-1307, USA.<br>
&gt; - *<br>
&gt; - * Copyright (C) 2008 Andrea Righi &lt;<a href=3D"mailto:righi.andrea=
@gmail.com" target=3D"_blank">righi.andrea@gmail.com</a>&gt;<br>
&gt; - */<br>
&gt; -<br>
&gt; -#define _GNU_SOURCE<br>
&gt; -#define __USE_GNU<br>
&gt; -<br>
&gt; -#include &lt;errno.h&gt;<br>
&gt; -#include &lt;stdio.h&gt;<br>
&gt; -#include &lt;stdlib.h&gt;<br>
&gt; -#include &lt;fcntl.h&gt;<br>
&gt; -#include &lt;signal.h&gt;<br>
&gt; -#include &lt;string.h&gt;<br>
&gt; -#include &lt;unistd.h&gt;<br>
&gt; -#include &lt;limits.h&gt;<br>
&gt; -#include &lt;sys/types.h&gt;<br>
&gt; -#include &lt;sys/stat.h&gt;<br>
&gt; -#include &lt;sys/time.h&gt;<br>
&gt; -#include &lt;sys/wait.h&gt;<br>
&gt; -<br>
&gt; -#ifndef PAGE_SIZE<br>
&gt; -#define PAGE_SIZE sysconf(_SC_PAGE_SIZE)<br>
&gt; -#endif<br>
&gt; -<br>
&gt; -#define align(x,a)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__align_ma=
sk(x,(typeof(x))(a)-1)<br>
&gt; -#define __align_mask(x,mask) (((x)+(mask))&amp;~(mask))<br>
&gt; -#define kb(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((x) &gt;&gt; 10)<br>
&gt; -<br>
&gt; -const char usage[] =3D &quot;Usage: iobw [-direct] threads chunk_size=
 data_size\n&quot;;<br>
&gt; -const char child_fmt[] =3D &quot;(%s) task %3d: time %4lu.%03lu bw %7=
lu KiB/s (%s)\n&quot;;<br>
&gt; -const char parent_fmt[] =3D<br>
&gt; -=C2=A0 =C2=A0 &quot;(%s) parent %d: time %4lu.%03lu bw %7lu KiB/s (%s=
)\n&quot;;<br>
&gt; -<br>
&gt; -static int directio =3D 0;<br>
&gt; -static size_t data_size =3D 0;<br>
&gt; -static size_t chunk_size =3D 0;<br>
&gt; -<br>
&gt; -typedef enum {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0OP_WRITE,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0OP_READ,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0NUM_IOPS,<br>
&gt; -} iops_t;<br>
&gt; -<br>
&gt; -static const char *iops[] =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&quot;WRITE&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&quot;READ &quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&quot;TOTAL&quot;,<br>
&gt; -};<br>
&gt; -<br>
&gt; -static int threads;<br>
&gt; -pid_t *children;<br>
&gt; -<br>
&gt; -char *mygroup;<br>
&gt; -<br>
&gt; -static void print_results(int id, iops_t op, size_t bytes, struct tim=
eval *diff)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fprintf(stdout, id ? child_fmt : parent_fmt,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mygroup, id, diff-&gt=
;tv_sec, diff-&gt;tv_usec / 1000,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(bytes / (diff-&gt;tv=
_sec * 1000000L + diff-&gt;tv_usec))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 1000000L / 1024, io=
ps[op]);<br>
&gt; -}<br>
&gt; -<br>
&gt; -static void thread(int id)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct timeval start, stop, diff;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int fd, i, ret;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0size_t n;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0void *buf;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int flags =3D O_CREAT | O_RDWR | O_LARGEFILE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char filename[32];<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D posix_memalign(&amp;buf, PAGE_SIZE, chunk=
_size);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;ERROR: task %d couldn&#39;t allocate %zu bytes (%s)\n&quot;,<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0id, chunk_size, strerror(errno));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0memset(buf, 0xaa, chunk_size);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0snprintf(filename, sizeof(filename), &quot;%s-%d-=
iobw.tmp&quot;, mygroup, id);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (directio)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D O_DIRECT;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0fd =3D open(filename, flags, 0600);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot=
;ERROR: task %d couldn&#39;t open %s (%s)\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0id, filename, strerror(errno));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(buf);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Write */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0lseek(fd, 0, SEEK_SET);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0n =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gettimeofday(&amp;start, NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0while (n &lt; data_size) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D write(fd, buf, =
chunk_size);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0fprintf(stderr, &quot;ERROR: task %d writing to %s (%s)\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id, filename, strerror(errno));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto out;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n +=3D i;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gettimeofday(&amp;stop, NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0timersub(&amp;stop, &amp;start, &amp;diff);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0print_results(id + 1, OP_WRITE, data_size, &amp;d=
iff);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Read */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0lseek(fd, 0, SEEK_SET);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0n =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gettimeofday(&amp;start, NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0while (n &lt; data_size) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D read(fd, buf, c=
hunk_size);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0fprintf(stderr, &quot;ERROR: task %d reading to %s (%s)\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id, filename, strerror(errno));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto out;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n +=3D i;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gettimeofday(&amp;stop, NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0timersub(&amp;stop, &amp;start, &amp;diff);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0print_results(id + 1, OP_READ, data_size, &amp;di=
ff);<br>
&gt; -out:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0close(fd);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unlink(filename);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0free(buf);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0exit(ret);<br>
&gt; -}<br>
&gt; -<br>
&gt; -static void spawn(int id)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pid_t pid;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pid =3D fork();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0switch (pid) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case -1:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot=
;ERROR: couldn&#39;t fork thread %d\n&quot;, id);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thread(id);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0children[id] =3D pid;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -}<br>
&gt; -<br>
&gt; -void signal_handler(int sig)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char filename[32];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; threads; i++)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (children[i])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kill(children[i], SIGKILL);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; threads; i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat mystat;<b=
r>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(filename, si=
zeof(filename), &quot;%s-%d-iobw.tmp&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 mygroup, i);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (stat(filename, &a=
mp;mystat) &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(filename);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fprintf(stdout, &quot;received signal %d, exiting=
\n&quot;, sig);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0exit(0);<br>
&gt; -}<br>
&gt; -<br>
&gt; -unsigned long long memparse(char *ptr, char **retptr)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned long long ret =3D strtoull(ptr, retptr, =
0);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0switch (**retptr) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case &#39;G&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case &#39;g&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret &lt;&lt;=3D 10;<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0case &#39;M&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case &#39;m&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret &lt;&lt;=3D 10;<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0case &#39;K&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case &#39;k&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret &lt;&lt;=3D 10;<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*retptr)++;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; -}<br>
&gt; -<br>
&gt; -int main(int argc, char *argv[])<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct timeval start, stop, diff;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char *end;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (argv[1] &amp;&amp; strcmp(argv[1], &quot;-dir=
ect&quot;) =3D=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0directio =3D 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argc--;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv++;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (argc !=3D 4) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, usage=
);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if ((threads =3D atoi(argv[1])) =3D=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, usage=
);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0chunk_size =3D align(memparse(argv[2], &amp;end),=
 PAGE_SIZE);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (*end) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, usage=
);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0data_size =3D align(memparse(argv[3], &amp;end), =
PAGE_SIZE);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (*end) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, usage=
);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* retrieve group name */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mygroup =3D getenv(&quot;MYGROUP&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!mygroup) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;ERROR: undefined environment variable MYGROUP\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0children =3D malloc(sizeof(pid_t) * threads);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!children) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot=
;ERROR: not enough memory\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* handle user interrupt */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0signal(SIGINT, signal_handler);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* handle kill from shell */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0signal(SIGTERM, signal_handler);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fprintf(stdout, &quot;chunk_size %zuKiB, data_siz=
e %zuKiB\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kb(chunk_size), kb(da=
ta_size));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fflush(stdout);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gettimeofday(&amp;start, NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; threads; i++)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spawn(i);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; threads; i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int status;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wait(&amp;status);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!WIFEXITED(status=
))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0exit(1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gettimeofday(&amp;stop, NULL);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0timersub(&amp;stop, &amp;start, &amp;diff);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0print_results(0, NUM_IOPS, data_size * threads * =
NUM_IOPS, &amp;diff);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fflush(stdout);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0free(children);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0exit(0);<br>
&gt; -}<br>
&gt; diff --git a/testcases/kernel/controllers/io-throttle/myfunctions-io.s=
h b/testcases/kernel/controllers/io-throttle/myfunctions-io.sh<br>
&gt; deleted file mode 100755<br>
&gt; index bf4bb2b9a..000000000<br>
&gt; --- a/testcases/kernel/controllers/io-throttle/myfunctions-io.sh<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,61 +0,0 @@<br>
&gt; -#!/bin/sh<br>
&gt; -#<br>
&gt; -# This program is free software; you can redistribute it and/or<br>
&gt; -# modify it under the terms of the GNU General Public<br>
&gt; -# License as published by the Free Software Foundation; either<br>
&gt; -# version 2 of the License, or (at your option) any later version.<br=
>
&gt; -#<br>
&gt; -# This program is distributed in the hope that it will be useful,<br>
&gt; -# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the =
GNU<br>
&gt; -# General Public License for more details.<br>
&gt; -#<br>
&gt; -# You should have received a copy of the GNU General Public<br>
&gt; -# License along with this program; if not, write to the<br>
&gt; -# Free Software Foundation, Inc., 59 Temple Place - Suite 330,<br>
&gt; -# Boston, MA 021110-1307, USA.<br>
&gt; -#<br>
&gt; -# Copyright (C) 2008 Andrea Righi &lt;<a href=3D"mailto:righi.andrea@=
gmail.com" target=3D"_blank">righi.andrea@gmail.com</a>&gt;<br>
&gt; -#<br>
&gt; -# usage . myfunctions.sh<br>
&gt; -<br>
&gt; -setup()<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# create testcase cgroups<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ -e /dev/blockioctl ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;WARN: /dev=
/blockioctl already exist! overwriting.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cleanup<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mkdir /dev/blockioctl<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mount -t cgroup -o blockio cgroup /dev/blockioctl=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;ERROR: cou=
ld not mount cgroup filesystem &quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot; on /dev/blockioctl. Exiting test.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cleanup<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for i in `seq 1 3`; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e /dev/blockioc=
tl/cgroup-$i ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rmdir /dev/blockioctl/cgroup-$i<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;WARN: earlier cgroup-$i found and removed&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir /dev/blockioctl=
/cgroup-$i<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;ERROR: could not create cgroup-$i&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Check your permissions. Exiting te=
st.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cleanup<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0exit 1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -}<br>
&gt; -<br>
&gt; -cleanup()<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo &quot;Cleanup called&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for i in `seq 1 3`; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir /dev/blockioctl=
/cgroup-$i<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f /tmp/cgroup-$i.=
out<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -=C2=A0 =C2=A0 =C2=A0umount /dev/blockioctl<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rmdir /dev/blockioctl<br>
&gt; -}<br>
&gt; diff --git a/testcases/kernel/controllers/io-throttle/run_io_throttle_=
test.sh b/testcases/kernel/controllers/io-throttle/run_io_throttle_test.sh<=
br>
&gt; deleted file mode 100755<br>
&gt; index c855fd052..000000000<br>
&gt; --- a/testcases/kernel/controllers/io-throttle/run_io_throttle_test.sh=
<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,123 +0,0 @@<br>
&gt; -#!/bin/bash<br>
&gt; -#<br>
&gt; -# This program is free software; you can redistribute it and/or<br>
&gt; -# modify it under the terms of the GNU General Public<br>
&gt; -# License as published by the Free Software Foundation; either<br>
&gt; -# version 2 of the License, or (at your option) any later version.<br=
>
&gt; -#<br>
&gt; -# This program is distributed in the hope that it will be useful,<br>
&gt; -# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the =
GNU<br>
&gt; -# General Public License for more details.<br>
&gt; -#<br>
&gt; -# You should have received a copy of the GNU General Public<br>
&gt; -# License along with this program; if not, write to the<br>
&gt; -# Free Software Foundation, Inc., 59 Temple Place - Suite 330,<br>
&gt; -# Boston, MA 021110-1307, USA.<br>
&gt; -#<br>
&gt; -# Copyright (C) 2008 Andrea Righi &lt;<a href=3D"mailto:righi.andrea@=
gmail.com" target=3D"_blank">righi.andrea@gmail.com</a>&gt;<br>
&gt; -#<br>
&gt; -# Usage: ./run_io_throttle_test.sh<br>
&gt; -# Description: test block device I/O bandwidth controller functionali=
ties<br>
&gt; -<br>
&gt; -. ./myfunctions-io.sh<br>
&gt; -<br>
&gt; -trap cleanup SIGINT<br>
&gt; -<br>
&gt; -BUFSIZE=3D16m<br>
&gt; -DATASIZE=3D64m<br>
&gt; -<br>
&gt; -setup<br>
&gt; -<br>
&gt; -# get the device name of the entire mounted block device<br>
&gt; -dev=3D`df -P . | sed &#39;1d&#39; | cut -d&#39; &#39; -f1 | sed &#39;=
s/[p]*[0-9]*$//&#39;`<br>
&gt; -<br>
&gt; -# evaluate device bandwidth<br>
&gt; -export MYGROUP=3D<br>
&gt; -phys_bw=3D`./iobw -direct 1 $BUFSIZE $DATASIZE | grep TOTAL | awk &#3=
9;{print $7}&#39;`<br>
&gt; -if [ $? -ne 0 ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo &quot;ERROR: could not evaluate i/o bandwidt=
h of $dev. Exiting test.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cleanup<br>
&gt; -=C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; -fi<br>
&gt; -echo &quot;&gt;&gt; physical i/o bandwidth limit is: $phys_bw KiB/s&q=
uot;<br>
&gt; -# show cgroup i/o bandwidth limits<br>
&gt; -for i in `seq 1 3`; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0MYGROUP=3Dcgroup-$i<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo &quot;($MYGROUP) max i/o bw: &quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$(($phys_bw / `=
echo 2^$i | bc`)) KiB/s + O_DIRECT&quot;<br>
&gt; -done<br>
&gt; -<br>
&gt; -for tasks in 1 2 4; do<br>
&gt; -for strategy in 0 1; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# set bw limiting rules<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ -f /dev/blockioctl/blockio.bandwidth ]; then=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0io_throttle_file=3Dbl=
ockio.bandwidth<br>
&gt; -=C2=A0 =C2=A0 =C2=A0elif [ -f /dev/blockioctl/blockio.bandwidth-max ]=
; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0io_throttle_file=3Dbl=
ockio.bandwidth-max<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;ERROR: unk=
nown kernel ABI. Exiting test.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cleanup<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for i in `seq 1 3`; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0limit=3D$(($phys_bw *=
 1024 / `echo 2^$i | bc`))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOBW[$i]=3D$(($limit =
/ 1024))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/bin/echo $dev:$limit=
:$strategy:$limit &gt; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/dev/blockioctl/cgroup-$i/${io_throttle_file}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;ERROR: could not set i/o bandwidth limit for cgroup-$i. E=
xiting test.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cleanup<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0exit 1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# run benchmark<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ $tasks -eq 1 ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stream=3D&quot;stream=
&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stream=3D&quot;stream=
s&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo -n &quot;&gt;&gt; testing $tasks parallel $s=
tream per cgroup &quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ $strategy -eq 0 ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;(leaky-buc=
ket i/o throttling)&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;(token-buc=
ket i/o throttling)&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for i in `seq 1 3`; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MYGROUP=3Dcgroup-$i<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/bin/echo $$ &gt; /de=
v/blockioctl/$MYGROUP/tasks<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;ERROR: could not set i/o bandwidth limit for cgroup-$i. E=
xiting test.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cleanup<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0exit 1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# exec i/o benchmark<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0./iobw -direct $tasks=
 $BUFSIZE $DATASIZE &gt; /tmp/$MYGROUP.out &amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PID[$i]=3D$!<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/bin/echo $$ &gt; /dev/blockioctl/tasks<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# wait for children completion<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for i in `seq 1 3`; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MYGROUP=3Dcgroup-$i<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wait ${PID[$i]}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=3D$?<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $ret -ne 0 ]; th=
en<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;ERROR: error code $ret during test $tasks.$strategy.$i. E=
xiting test.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cleanup<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0exit 1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iorate=3D`grep parent=
 /tmp/${MYGROUP}.out | awk &#39;{print $7}&#39;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff=3D$((${IOBW[$i]}=
 - $iorate))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;($MYGROUP)=
 i/o-bw ${IOBW[$i]} KiB/s, i/o-rate $iorate KiB/s, err $diff KiB/s&quot;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${IOBW[$i]} -ge =
$iorate ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;TPASS=C2=A0 =C2=A0Block device I/O bandwidth controller: =
test $tasks.$strategy.$i PASSED&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;TFAIL=C2=A0 =C2=A0Block device I/O bandwidth controller: =
test $tasks.$strategy.$i FAILED&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -done<br>
&gt; -done<br>
&gt; -<br>
&gt; -cleanup<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000ba855f05c592f423--


--===============0876825600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0876825600==--

