Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A53CEBEFDD
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:43:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E3C13C2325
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:43:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 7DA143C22C2
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:43:17 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D47AB1A0106B
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:43:16 +0200 (CEST)
Received: from 201-13-95-194.dsl.telesp.net.br ([201.13.95.194] helo=calabresa)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1iDREw-0000wB-DX; Thu, 26 Sep 2019 10:43:14 +0000
Date: Thu, 26 Sep 2019 07:43:08 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190926104308.GN3877@calabresa>
References: <20190906130707.GA7515@rei.lan>
 <CAEemH2frzqyUmgm2mXTG3dusUtggwX4Y3oRBr34p+NCUJFW7_g@mail.gmail.com>
 <20190910130549.GC18210@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910130549.GC18210@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

On Tue, Sep 10, 2019 at 03:05:53PM +0200, Cyril Hrubis wrote:
> Hi!
> > The one to print errno number.
> >     [PATCH] tst_res: Print errno number in addition to error name
> 
> Pushed the patch as it was, I do not think that reordering the
> statements was important enough.
> 
> > Some test failures:
> > ==============
> > 
> > acct02 (s390x):
> > acct02.c:174: INFO: Verifying using 'struct acct_v3'
> > acct02.c:140: INFO: Number of accounting file entries tested: 2
> > acct02.c:145: FAIL: acct() wrote incorrect file contents!
> 
> I can reproduce it here as well, no idea what is wrong there. I guess
> that modifying the test to be more verbose, i.e. to print if we haven't
> matched the pid or if the contents of the structure were wrong would be
> a good start.
> 
> > timer_create01 (s390x, ppc64le, aarch64):
> > timer_create01.c:48: INFO: Testing notification type: SIGEV_THREAD_ID
> > timer_create01.c:93: PASS: Timer successfully created for CLOCK_REALTIME
> > timer_create01.c:93: PASS: Timer successfully created for CLOCK_MONOTONIC
> > timer_create01.c:93: PASS: Timer successfully created for
> > CLOCK_PROCESS_CPUTIME_ID
> > timer_create01.c:93: PASS: Timer successfully created for
> > CLOCK_THREAD_CPUTIME_ID
> > timer_create01.c:93: PASS: Timer successfully created for CLOCK_BOOTTIME
> > timer_create01.c:87: FAIL: Failed to create timer for CLOCK_BOOTTIME_ALARM:
> > ???
> > timer_create01.c:87: FAIL: Failed to create timer for CLOCK_REALTIME_ALARM:
> > ???
> > timer_create01.c:93: PASS: Timer successfully created for CLOCK_TAI
> 
> I'm pretty sure that we concluded that this is a kernel bug since it
> returns kernel internal errno.
> 

And a pull request has already been sent to Linus to fix this. [1]

Now, the test also needs to check for EOPNOTSUPP instead of only EINVAL. I'll
prepare a patch.

[1] https://lore.kernel.org/lkml/156864062018.3407.10822767012822306757.tglx@nanos.tec.linutronix.de/

> -- 
> Cyril Hrubis
> chrubis@suse.cz
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
