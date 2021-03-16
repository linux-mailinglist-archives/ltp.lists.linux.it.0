Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE5733D98E
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 17:37:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BCF13C642C
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 17:37:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2DA973C2D51
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 17:37:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C1F86600BAD
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 17:37:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A566AD74;
 Tue, 16 Mar 2021 16:37:20 +0000 (UTC)
Date: Tue, 16 Mar 2021 17:37:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Message-ID: <YFDevk/wNwd3epod@pevik>
References: <20210304021304.1126635-1-ruansy.fnst@fujitsu.com>
 <20210304021304.1126635-2-ruansy.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304021304.1126635-2-ruansy.fnst@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/getppid02: Convert to the new API
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

Hi Ruan,

> The logic is same as syscalls/getpid02, which is to check whether
> parent's pid equals child's ppid.
...

> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -
> -		ppid = getpid();
> -		pid = FORK_OR_VFORK();
> -		if (pid == -1)
> -			tst_brkm(TBROK, cleanup, "fork failed");
> -
> -		if (pid == 0) {
> -			TEST(getppid());
> -
> -			if (TEST_RETURN != ppid)
> -				errx(1, "getppid failed (%ld != %d)",
> -				     TEST_RETURN, ppid);
> -			else
> -				printf("return value and parent's pid "
> -				       "value match\n");
> -			exit(0);
> -		} else {
> -			SAFE_WAIT(cleanup, &status);
> -			if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
> -				tst_resm(TFAIL,
> -					 "getppid functionality incorrect");
> -		}
Right, else part is safe to drop as it's being tested in fork_testrun(void).

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
