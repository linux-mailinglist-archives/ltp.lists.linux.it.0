Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ED6D9135
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 14:42:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 287173C2386
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 14:42:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 623793C1CB7
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 14:42:43 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DC913600E5E
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 14:42:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2D0B110C0946;
 Wed, 16 Oct 2019 12:42:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2247060852;
 Wed, 16 Oct 2019 12:42:41 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1424E18089DC;
 Wed, 16 Oct 2019 12:42:41 +0000 (UTC)
Date: Wed, 16 Oct 2019 08:42:40 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1321370412.6455436.1571229760838.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191016114424.GB27278@rei.lan>
References: <9c5134dc4b39f870f6e6cfab55c193f05b204b78.1571225074.git.jstancek@redhat.com>
 <51dce875f4ad2c234031101cd5c7a85eace53caa.1571225074.git.jstancek@redhat.com>
 <20191016114424.GB27278@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.17]
Thread-Topic: perf_event_open02: make test more reliable on -rt kernels
Thread-Index: 1xlqgcv8rzVHBEJ2m6d48GZayDhN7g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Wed, 16 Oct 2019 12:42:41 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] perf_event_open02: make test more reliable on
 -rt kernels
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
Cc: jlelli@redhat.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Hi!
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > ---
> >  .../kernel/syscalls/perf_event_open/perf_event_open02.c   | 15
> >  +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
> > b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
> > index 1cfe29bb3d8a..6fc6f4afa119 100644
> > --- a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
> > +++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
> > @@ -52,6 +52,7 @@ Usage is: ./performance_counter02  [-v]
> >  The -v flag makes it print out the values of each counter.
> >  */
> >  
> > +#define _GNU_SOURCE
> >  #include <stdio.h>
> >  #include <stddef.h>
> >  #include <stdlib.h>
> > @@ -222,6 +223,20 @@ static void setup(void)
> >  	int i;
> >  	struct perf_event_attr tsk_event, hw_event;
> >  
> > +#ifdef HAVE_SCHED_GETCPU
> > +	cpu_set_t mask;
> 
> Don't we have to allocate the mask dynamically so that we do not fail on
> systems with more than CPU_SETSIZE (1024) CPUs?
> 
> We already have fallback macros for older libc in include/lapi/cpuset.h
> so that we can use CPU_ALLOC() unconditionally.

Haven't thought of that. I'll look into adding that for v2.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
