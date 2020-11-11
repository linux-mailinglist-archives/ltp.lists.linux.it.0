Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6B32AF470
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 16:08:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9C533C602D
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 16:08:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C34693C2F2E
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 16:08:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 63049600670
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 16:08:39 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C96D8AC82;
 Wed, 11 Nov 2020 15:08:38 +0000 (UTC)
Date: Wed, 11 Nov 2020 16:09:26 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20201111150926.GA21539@yuki.lan>
References: <1604317409-22871-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604317409-22871-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/ptrace02: Add another EPERM error
 test
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

Hi!
> +static void verify_ptrace(void)
> +{
> +	int child_pid;
> +
> +	tst_res(TINFO, "Trace a process that don't have CAP_SYS_PTRACE capability(nobody user) for it");

I wouldn't be printing this verbose info here, anyone who will have to
debug the test failures will look into the source code and at the test
description in the top level comment.

> +	child_pid = SAFE_FORK();
> +	if (!child_pid)
> +		pause();
> +
> +	if (!SAFE_FORK()) {
> +		SAFE_SETUID(uid);
> +		TEST(ptrace(PTRACE_ATTACH, child_pid, NULL, NULL));
> +		if (TST_RET == 0) {
> +			tst_res(TFAIL, "ptrace() succeeded unexpectedly");
> +			TST_CHECKPOINT_WAKE(0);
> +			exit(0);
> +		}
> +		if (TST_ERR == EPERM)
> +			tst_res(TPASS | TTERRNO, "ptrace() failed as expected");
> +		else
> +			tst_res(TFAIL | TTERRNO, "ptrace() expected EPERM, but got");
> +		TST_CHECKPOINT_WAKE(0);
> +		exit(0);
> +	}
> +	TST_CHECKPOINT_WAIT(0);
> +	SAFE_KILL(child_pid, SIGKILL);
> +	SAFE_WAITPID(child_pid, NULL, 0);

We do not need the checkpoints here at all, we just need to waitpid for
the second child before we kill the first one.

> +	tst_reap_children();
> +}
> +
> +static void setup(void)
> +{
> +	struct passwd *pw;
> +
> +	pw = SAFE_GETPWNAM("nobody");
> +	uid = pw->pw_uid;
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test_all = verify_ptrace,
> +	.forks_child = 1,
> +	.needs_root = 1,
> +	.needs_checkpoints = 1,
> +};
> -- 
> 2.23.0
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
