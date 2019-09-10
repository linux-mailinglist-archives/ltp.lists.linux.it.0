Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA378AEB19
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 15:05:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98FCB3C209D
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 15:05:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 407EF3C2083
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 15:05:57 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B4B4B1401178
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 15:05:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ED246B71B;
 Tue, 10 Sep 2019 13:05:55 +0000 (UTC)
Date: Tue, 10 Sep 2019 15:05:53 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190910130549.GC18210@rei.lan>
References: <20190906130707.GA7515@rei.lan>
 <CAEemH2frzqyUmgm2mXTG3dusUtggwX4Y3oRBr34p+NCUJFW7_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2frzqyUmgm2mXTG3dusUtggwX4Y3oRBr34p+NCUJFW7_g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] LTP Release
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> The one to print errno number.
>     [PATCH] tst_res: Print errno number in addition to error name

Pushed the patch as it was, I do not think that reordering the
statements was important enough.

> Some test failures:
> ==============
> 
> acct02 (s390x):
> acct02.c:174: INFO: Verifying using 'struct acct_v3'
> acct02.c:140: INFO: Number of accounting file entries tested: 2
> acct02.c:145: FAIL: acct() wrote incorrect file contents!

I can reproduce it here as well, no idea what is wrong there. I guess
that modifying the test to be more verbose, i.e. to print if we haven't
matched the pid or if the contents of the structure were wrong would be
a good start.

> timer_create01 (s390x, ppc64le, aarch64):
> timer_create01.c:48: INFO: Testing notification type: SIGEV_THREAD_ID
> timer_create01.c:93: PASS: Timer successfully created for CLOCK_REALTIME
> timer_create01.c:93: PASS: Timer successfully created for CLOCK_MONOTONIC
> timer_create01.c:93: PASS: Timer successfully created for
> CLOCK_PROCESS_CPUTIME_ID
> timer_create01.c:93: PASS: Timer successfully created for
> CLOCK_THREAD_CPUTIME_ID
> timer_create01.c:93: PASS: Timer successfully created for CLOCK_BOOTTIME
> timer_create01.c:87: FAIL: Failed to create timer for CLOCK_BOOTTIME_ALARM:
> ???
> timer_create01.c:87: FAIL: Failed to create timer for CLOCK_REALTIME_ALARM:
> ???
> timer_create01.c:93: PASS: Timer successfully created for CLOCK_TAI

I'm pretty sure that we concluded that this is a kernel bug since it
returns kernel internal errno.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
