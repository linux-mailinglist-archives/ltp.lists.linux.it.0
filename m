Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C88341B59
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 12:22:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03F8D3C5FBE
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 12:22:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 612FD3C5FA6
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 12:22:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0729B1401134
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 12:22:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 511BAAE05;
 Fri, 19 Mar 2021 11:22:46 +0000 (UTC)
Date: Fri, 19 Mar 2021 12:22:44 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YFSJhNjl17uZUtPt@pevik>
References: <20210318162409.9871-1-mdoucha@suse.cz> <YFOcOJP4innlbIk4@pevik>
 <78ca788f-f24e-61f5-b0c6-a0742b6af176@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78ca788f-f24e-61f5-b0c6-a0742b6af176@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/semctl09: Skip libc test if SEM_STAT_ANY
 not defined
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> >> +#if !HAVE_DECL_SEM_STAT_ANY
> > nit: I'd prefer
> > #ifndef HAVE_DECL_SEM_STAT_ANY

> That will not work. AC_CHECK_DECLS() will always define
> HAVE_DECL_SEM_STAT_ANY, either with the value of 0 (macro not defined)
> or 1 (defined).
Correct, I'm sorry, thanks for catching my error.

> >> +	if (tst_variant == 1)
> >> +		tst_brk(TCONF, "libc does not support semctl(SEM_STAT_ANY)");
> >> +#endif
> > Although I understand why you want to quit only tests with root
> > (only these fail), it's a bit confusing to test with user nobody
> > and then quit the same testing with root.

> tst_variant has nothing to do with UID.
> tst_variant == 0 => run the test using tst_syscall(__NR_semctl)
> tst_variant == 1 => run the test again using libc semctl()
Again, correct, sorry for wrong report.

> But if you want to make the test output a little more clear, I could
> move the test_info() call at the end of setup() a few lines up before
> the new #if.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
