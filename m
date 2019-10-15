Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC916D78D6
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 16:38:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7F923C2218
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 16:38:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A4F073C1CB8
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 16:38:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9E7CC1A01228
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 16:38:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D6A33AED6;
 Tue, 15 Oct 2019 14:38:53 +0000 (UTC)
Date: Tue, 15 Oct 2019 16:38:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191015143852.GA8454@rei.lan>
References: <20190918053519.26244-1-liwang@redhat.com>
 <20190919100205.GA26642@rei>
 <679691068.6290837.1571148027820.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <679691068.6290837.1571148027820.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

Hi!
> > > As the tst_taint_init comments described, If the tainted-flags are already
> > > set
> > > by the kernel, there is no reason to continue and TCONF is generated. But
> > > in
> > > the function achieve, it uses TBROK.
> > > 
> > >   cmdline="cve-2017-17053"
> > >   tst_test.c:1096: INFO: Timeout per run is 0h 10m 00s
> > >   tst_taint.c:88: BROK: Kernel is already tainted: 536871424
> > 
> > There is a reason for generating TBROK, we do not want the test to be
> > skipped silently in this case.
> 
> It can still run and maybe trigger worse problem. IMO if test wants
> to report taint flags it should only report _new_ taint flags.

IMHO this is more complex than this, we look for a specific subset of
taint flags. One is the warn flag, that is not well defined and may be
harmless and the second is the died flag, which is set on OOPS or BUG. I
I would say that in case of the died flag any subseqent testing is
pointless since the machine is in inconsistent state and has to be
rebooted anyways. Hence we may weaken the check for a warning flag, i.e.
ignore it if it was set at the start of the test, but certainly not for
the died flag, which would solve this problem as well.

> We could add a dummy test to end of runtest file, which would check
> selected taint flags and report WARN/FAIL, so they are guaranteed
> to appear on report.

Actually the new testrunner runltp-ng checks the taint flags after each
test and reboots the machine if needed, which is, as far as I can tell,
the right place for such checks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
