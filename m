Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2786CD7996
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 17:19:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C46D93C220F
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 17:19:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 472293C1CAD
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 17:19:39 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id ACE38601D6A
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 17:19:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BDA28693F3;
 Tue, 15 Oct 2019 15:19:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B30996012C;
 Tue, 15 Oct 2019 15:19:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A78674EE95;
 Tue, 15 Oct 2019 15:19:36 +0000 (UTC)
Date: Tue, 15 Oct 2019 11:19:36 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <701658846.6304240.1571152776451.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191015143852.GA8454@rei.lan>
References: <20190918053519.26244-1-liwang@redhat.com>
 <20190919100205.GA26642@rei>
 <679691068.6290837.1571148027820.JavaMail.zimbra@redhat.com>
 <20191015143852.GA8454@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.24]
Thread-Topic: tst_taint: TCONF when kernel is alreay tainted
Thread-Index: PPf5Az6YywBSSseqABu3eaMnKwarmw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 15 Oct 2019 15:19:36 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] tst_taint: TCONF when kernel is alreay tainted
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
Cc: Chang Yin <cyin@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi!
> > > > As the tst_taint_init comments described, If the tainted-flags are
> > > > already
> > > > set
> > > > by the kernel, there is no reason to continue and TCONF is generated.
> > > > But
> > > > in
> > > > the function achieve, it uses TBROK.
> > > > 
> > > >   cmdline="cve-2017-17053"
> > > >   tst_test.c:1096: INFO: Timeout per run is 0h 10m 00s
> > > >   tst_taint.c:88: BROK: Kernel is already tainted: 536871424
> > > 
> > > There is a reason for generating TBROK, we do not want the test to be
> > > skipped silently in this case.
> > 
> > It can still run and maybe trigger worse problem. IMO if test wants
> > to report taint flags it should only report _new_ taint flags.
> 
> IMHO this is more complex than this, we look for a specific subset of
> taint flags. One is the warn flag, that is not well defined and may be
> harmless and the second is the died flag, which is set on OOPS or BUG. I
> I would say that in case of the died flag any subseqent testing is
> pointless since the machine is in inconsistent state and has to be
> rebooted anyways. Hence we may weaken the check for a warning flag, i.e.
> ignore it if it was set at the start of the test, but certainly not for
> the died flag, which would solve this problem as well.

OK, I'd vote for getting rid of warn flag then or ignore it on test start.
Upstream devel trees tend to trigger lot of random warnings during boot,
e.g. a random driver warning from device that isn't even used by LTP.

> 
> > We could add a dummy test to end of runtest file, which would check
> > selected taint flags and report WARN/FAIL, so they are guaranteed
> > to appear on report.
> 
> Actually the new testrunner runltp-ng checks the taint flags after each
> test and reboots the machine if needed, which is, as far as I can tell,
> the right place for such checks.

It is right place, but I think it (reboot) should be configurable behavior.
Some harnesses might want to handle it themselves or just stop testing.
For example on 1TB box that takes 45min to boot, I'd probably turn it off.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
