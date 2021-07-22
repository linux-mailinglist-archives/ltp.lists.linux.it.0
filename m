Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E743D1D32
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 06:56:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42F1C3C818C
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 06:56:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4C6F63C59C4
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 06:56:27 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 255DA1A01149
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 06:56:25 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 16M4tfKd071419;
 Thu, 22 Jul 2021 12:55:41 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 22 Jul 2021
 12:55:38 +0800
Date: Thu, 22 Jul 2021 12:55:36 +0800
From: Leo Liang <ycliang@andestech.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20210722045536.GA10325@andestech.com>
References: <20210719092239.GA1475@atcfdc88>
 <YPgxJwx795fhXgLa@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPgxJwx795fhXgLa@pevik>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 16M4tfKd071419
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4,
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
On Wed, Jul 21, 2021 at 10:37:27PM +0800, Petr Vorel wrote:
> Hi Leo,
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> >  	rmdir cgroup/0 cgroup/1
> > -	umount cgroup/
> > +	tst_umount cgroup/	# Avoid possible EBUSY error
> >  }
> 
> >  #---------------------------------------------------------------------------
> > @@ -193,7 +193,7 @@ test3()
> >  	wait $pid2 2>/dev/null
> 
> >  	rmdir $cpu_subsys_path/0 2> /dev/null
> > -	umount cgroup/ 2> /dev/null
> > +	tst_umount cgroup/ 2> /dev/null		# Avoid possible EBUSY error
> I'd prefer: # keep "/" to avoid possible EBUSY error
> But that can be changed before merge.
> 
> More I'm interested if other maintainers agree with me about this approach.
> (keep / here instead of in tst_umount())
> 
> >  	check_kernel_bug
> >  }
> 
> > @@ -222,7 +222,7 @@ test4()
> >  	mount -t cgroup -o none,name=foo cgroup cgroup/
> >  	mkdir cgroup/0
> >  	rmdir cgroup/0
> > -	umount cgroup/
> > +	tst_umount cgroup/		# Avoid possible EBUSY error
> 
> >  	if dmesg | grep -q "MAX_LOCKDEP_SUBCLASSES too low"; then
> >  		tst_res TFAIL "lockdep BUG was found"
> > @@ -254,7 +254,7 @@ test5()
> >  	mount -t cgroup none cgroup 2> /dev/null
> >  	mkdir cgroup/0
> >  	rmdir cgroup/0
> > -	umount cgroup/ 2> /dev/null
> > +	tst_umount cgroup/ 2> /dev/null		# Avoid possible EBUSY error
> I'd drop stderr redirection here. It was here originally, but I suppose it's not
> needed when using tst_umount. But that can be done during merge.
> 

OK got it.
Thanks for the review!
Let's wait for other maintainer's comment on the aaproach for keeping '/' here or not.

Best regards,
Leo
> ...
> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
