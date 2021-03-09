Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCED331EF2
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 07:03:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 935233C6A7E
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 07:03:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 352D53C4DF3
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 07:03:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7C64F6008D9
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 07:03:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0019AD73;
 Tue,  9 Mar 2021 06:03:41 +0000 (UTC)
Date: Tue, 9 Mar 2021 07:03:40 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YEcPvIckAEbmMBi9@pevik>
References: <20210308154421.2002-1-pvorel@suse.cz> <YEZTd+CT/Gag1ejK@yuki.lan>
 <YEZoCOqGeb4dVnpV@pevik> <YEZs/MTW0Pcyz6Ml@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEZs/MTW0Pcyz6Ml@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] splice02: Generate input in C
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
Cc: Martin Loviska <mloviska@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > > I do wonder if this should be replaced with something that includes a
> > > shell pipe instead. It has been selected here to make sure we pass the
> > > command line correctly to a shell interpreter.

> > > Maybe something as:

> > > shell_test01 echo "SUCCESS" | cat

> > I guess you mean to add another test to cover shell pipe.
> > Makes sense to me, but I'd wrap it to a test file, e.g. something like:

> > cat shell01.sh
> > #!/bin/sh
> > TST_TESTFUNC=do_test
> > TST_NEEDS_CMDS="cat"
> > . tst_test.sh

> > do_test()
> > {
> > 	EXPECT_PASS [ "$(echo 'SUCCESS' | cat)" = "SUCCESS" ]
> > }

> > tst_run

> That would not work, the pipe is supposed to be in the runtest file.
Do you want to test that runtest is working with pipe?
I considered anything but shell script with getopt parameters a bit strange and
thought it'd be removed in new shell runner. But obviously you want to keep it.

But in case of failure script don't detect it. e.g.:

echo "SUCCESS" | cat /asdf
cat: /asdf: No such file or directory

=> there is no TFAIL/TBROK/TCONF. Not sure if all users check exit status (which
they should now, because that is the only common thing so far).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
