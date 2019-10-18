Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4B6DC602
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 15:27:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A3473C2456
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 15:27:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 728783C220F
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 15:27:39 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A039D1A00E7C
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 15:27:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D4B2418C4287;
 Fri, 18 Oct 2019 13:27:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC4415D70E;
 Fri, 18 Oct 2019 13:27:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C267E1808878;
 Fri, 18 Oct 2019 13:27:36 +0000 (UTC)
Date: Fri, 18 Oct 2019 09:27:36 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <2145309610.6976144.1571405256594.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191018132300.GA27956@dell5510>
References: <c8843f2f4a325e820d030d9c7c36d7624f1baa82.1571393044.git.jstancek@redhat.com>
 <20191018132300.GA27956@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.4]
Thread-Topic: lsmod01.sh: retry test couple times to lower false positives
Thread-Index: uf/Qp7rOl/NHGAspG2oPbUGrcWPfDQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 18 Oct 2019 13:27:36 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lsmod01.sh: retry test couple times to lower
 false positives
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi Jan,
> 
> > Test sporadically fails with:
> >   lsmod01 1 TFAIL: lsmod output different from /proc/modules.
> >   36c36
> >   < loop 42057 2
> >   ---
> >   > loop 42057 1
> 
> > commands runtest file runs mkswap01 before this test. That test is
> > using loop device, and udev is presumably still holding a reference
> > by the time lsmod01 test starts.
> 
> > Repeat the test couple times to avoid racing with rest of the system.
> 
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> ...
> > +++ b/testcases/commands/lsmod/lsmod01.sh
> > @@ -10,31 +10,41 @@ TST_NEEDS_TMPDIR=1
> >  TST_NEEDS_CMDS="lsmod"
> >  . tst_test.sh
> 
> > -lsmod_test()
> > +lsmod_matches_proc_modules()
> >  {
> >  	lsmod_output=$(lsmod | awk '!/Module/{print $1, $2, $3}' | sort)
> >  	if [ -z "$lsmod_output" ]; then
> > -		tst_res TFAIL "Failed to parse the output from lsmod"
> > -		return
> > +		tst_brk TBROK "Failed to parse the output from lsmod"
> >  	fi
> 
> > -	modules_output=$(awk '{print $1, $2, $3}' /proc/modules | sort)
> > +	modules_output=$(awk '{print $1, $2, $3} 1' /proc/modules | sort)
> This is a regression. Please keep the old version (without 1).

My bad, I left it in by accident after testing.

> 
> 
> -	modules_output=$(awk '{print $1, $2, $3} 1' /proc/modules | sort)
> +	modules_output=$(awk '{print $1, $2, $3}' /proc/modules | sort)
> 
> >  	if [ -z "$modules_output" ]; then
> > -		tst_res TFAIL "Failed to parse /proc/modules"
> > -		return
> > +		tst_brk TBROK "Failed to parse /proc/modules"
> >  	fi
> 
> >  	if [ "$lsmod_output" != "$modules_output" ]; then
> > -		tst_res TFAIL "lsmod output different from /proc/modules."
> > +		tst_res TINFO "lsmod output different from /proc/modules."
> nit: please remove dots at the end of messages, when you're touching that
> file.

will do

> 
> The rest looks good to me.
> 
> Kind regards,
> Petr
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
