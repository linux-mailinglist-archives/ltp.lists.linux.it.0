Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA43315FD
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 19:27:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B1513C6BE8
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 19:27:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AD14F3C063A
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 19:27:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BA36A1400964
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 19:27:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E901CAC24;
 Mon,  8 Mar 2021 18:27:39 +0000 (UTC)
Date: Mon, 8 Mar 2021 19:29:16 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YEZs/MTW0Pcyz6Ml@yuki.lan>
References: <20210308154421.2002-1-pvorel@suse.cz> <YEZTd+CT/Gag1ejK@yuki.lan>
 <YEZoCOqGeb4dVnpV@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEZoCOqGeb4dVnpV@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: Martin Loviska <mloviska@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I do wonder if this should be replaced with something that includes a
> > shell pipe instead. It has been selected here to make sure we pass the
> > command line correctly to a shell interpreter.
> 
> > Maybe something as:
> 
> > shell_test01 echo "SUCCESS" | cat
> 
> I guess you mean to add another test to cover shell pipe.
> Makes sense to me, but I'd wrap it to a test file, e.g. something like:
> 
> cat shell01.sh
> #!/bin/sh
> TST_TESTFUNC=do_test
> TST_NEEDS_CMDS="cat"
> . tst_test.sh
> 
> do_test()
> {
> 	EXPECT_PASS [ "$(echo 'SUCCESS' | cat)" = "SUCCESS" ]
> }
> 
> tst_run

That would not work, the pipe is supposed to be in the runtest file.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
