Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A284137536C
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 14:06:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E0793C5DBC
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 14:06:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CA75F3C5688
 for <ltp@lists.linux.it>; Thu,  6 May 2021 14:06:32 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E426D1A014CB
 for <ltp@lists.linux.it>; Thu,  6 May 2021 14:06:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A520AD05;
 Thu,  6 May 2021 12:06:31 +0000 (UTC)
Date: Thu, 6 May 2021 14:06:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJPbxQikXPap5DHW@pevik>
References: <20210429125255.31510-1-zhaogongyi@huawei.com>
 <YJPImeHT9rVsVtON@pevik> <YJPNgGwlZBLMaJOd@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJPNgGwlZBLMaJOd@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] syscalls/modify_ldt: Replace TINFO with TPASS
 or TFAIL
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

Hi,

> Hi!
> > FYI: since merging this patch (f5e8e6b11) test fails on this. Is it expected?
> > I haven't looked closer whether it's a test bug or real issue.

> What is the test failure output? The only part that was change that

$ ./modify_ldt02
modify_ldt02    1  TPASS  :  value read as expected
modify_ldt02    0  TINFO  :  received signal: 11
modify_ldt02    2  TFAIL  :  modify_ldt02.c:136: Did not generate SEGV

(I wrote my report below affected line)

11 is SIGSEGV, thus there must be a bug in a test, which probably has been there
before (test just didn't check). It's strange that WTERMSIG(status) returns 0
instead of 11.

> could introduce difference in the output is as far as I can tell this:

>                 /*
>                  * Create a new LDT segment.
>                  */
>                 if (create_segment(seg, sizeof(seg)) == -1) {
> -                       tst_brkm(TINFO, cleanup, "Creation of segment failed");
> +                       tst_brkm(TBROK, cleanup, "Creation of segment failed");
>                 }


> Which would mean that the test was broken before the change but just
> haven't produced any errors.
Yes.

Old results:
modify_ldt02    0  TINFO  :  Enter block 1
modify_ldt02    0  TINFO  :  block 1 PASSED
modify_ldt02    0  TINFO  :  Exit block 1
modify_ldt02    0  TINFO  :  Enter block 2
modify_ldt02    0  TINFO  :  received signal: 11
modify_ldt02    0  TINFO  :  block 2 PASSED

NOTE: no PASS/FAIL.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
