Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8173CCF67
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 10:36:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A97F83C6486
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 10:36:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 975763C1D75
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 10:35:59 +0200 (CEST)
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A8FBB14002DE
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 10:35:56 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 16J8ZNIq057789;
 Mon, 19 Jul 2021 16:35:23 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 19 Jul 2021
 16:35:24 +0800
Date: Mon, 19 Jul 2021 16:35:21 +0800
From: Leo Liang <ycliang@andestech.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20210719083521.GA18406@andestech.com>
References: <20210716140235.GA22205@andestech.com>
 <YPUgKpSqTLYVCSRF@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPUgKpSqTLYVCSRF@pevik>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 16J8ZNIq057789
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3,
 2/2] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: "richiejp@f-m.fm" <richiejp@f-m.fm>,
 Alan Quey-Liang =?utf-8?B?S2FvKOmrmOmtgeiJryk=?= <alankao@andestech.com>,
 "metan@ucw.cz" <metan@ucw.cz>,
 "ycliang@cs.nctu.edu.tw" <ycliang@cs.nctu.edu.tw>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On Mon, Jul 19, 2021 at 02:48:10PM +0800, Petr Vorel wrote:
> > The test sequence
> > 	mount -t cgroup -o <controllers> <path>
> > 	mkdir <path>/<dir>
> > 	rmdir <path>/<dir>
> > 	umount <path>
> > 	mount -t cgroup -o <controllers> <path>
> > would easily fail at the last mount with -EBUSY on certain platform.
> 
> > The reason is that this test sequence would have the chance of
> > missing a release code path when doing rmdir and umount.
> 
> > Adding a little delay between "rmdir" and "umount" could fix the problem,
> > so use tst_umount API instead of umount in "rmdir, umount" sequence.
> 
> > Fixes: #839
> 
> > Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> > ---
> >  .../controllers/cgroup/cgroup_regression_test.sh       | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> > diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> > index 1f7f3820e..056166f11 100755
> > --- a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> > +++ b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> > @@ -145,7 +145,7 @@ test2()
> >  	fi
> 
> >  	rmdir cgroup/0 cgroup/1
> > -	umount cgroup/
> > +	tst_umount cgroup/
> As I note in previous patch, with suggested change to tst_umount() to always add
> trailing "/" it'd be enough just "tst_umount cgroup".
> 

I think your method is better that we don't alter the argument passed into tst_umount.
Let users decide the argument and honor the choice.

I will send a v4 patch later and still keep the trailing slash.

Thanks!

Best regards,
Leo

> I'm not sure what is better: automatic handling or having to explicitly add
> trailing "/".
> 
> Kind regards,
> Petr
> 
> >  }
> 
> >  #---------------------------------------------------------------------------
> > @@ -193,7 +193,7 @@ test3()
> >  	wait $pid2 2>/dev/null
> 
> >  	rmdir $cpu_subsys_path/0 2> /dev/null
> > -	umount cgroup/ 2> /dev/null
> > +	tst_umount cgroup/ 2> /dev/null
> >  	check_kernel_bug
> >  }
> 
> > @@ -222,7 +222,7 @@ test4()
> >  	mount -t cgroup -o none,name=foo cgroup cgroup/
> >  	mkdir cgroup/0
> >  	rmdir cgroup/0
> > -	umount cgroup/
> > +	tst_umount cgroup/
> 
> >  	if dmesg | grep -q "MAX_LOCKDEP_SUBCLASSES too low"; then
> >  		tst_res TFAIL "lockdep BUG was found"
> > @@ -254,7 +254,7 @@ test5()
> >  	mount -t cgroup none cgroup 2> /dev/null
> >  	mkdir cgroup/0
> >  	rmdir cgroup/0
> > -	umount cgroup/ 2> /dev/null
> > +	tst_umount cgroup/ 2> /dev/null
> >  	check_kernel_bug
> >  }
> 
> > @@ -290,7 +290,7 @@ test6()
> 
> >  	mount -t cgroup -o ns xxx cgroup/ > /dev/null 2>&1
> >  	rmdir cgroup/[1-9]* > /dev/null 2>&1
> > -	umount cgroup/
> > +	tst_umount cgroup/
> >  	check_kernel_bug
> >  }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
