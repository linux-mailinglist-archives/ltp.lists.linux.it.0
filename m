Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC616A68D
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 13:58:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C223C3C2447
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 13:58:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D912C3C223B
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 13:58:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 315871A000B9
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 13:58:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 11F96AEEF;
 Mon, 24 Feb 2020 12:58:03 +0000 (UTC)
Date: Mon, 24 Feb 2020 13:58:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200224125802.GA30073@rei.lan>
References: <1582537946-22098-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582537946-22098-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/pipe13: Add regression test for pipe to
 wake up all readers
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
> +static void verify_pipe(void)
> +{
> +	int fds[2];
> +	int status1, status2;
> +	pid_t p1, p2;
> +	int ret;
> +
> +	SAFE_PIPE(fds);
> +
> +	p1 = SAFE_FORK();
> +	if (p1 == 0) {
> +		SAFE_CLOSE(fds[1]);
> +		SAFE_READ(0, fds[0], &status1, sizeof(status1));
                                        ^
					Why status1 here?

					can't we just pass a dummy
					char buf; and size 1 here?

					It's not being written to
					anyways.
> +		exit(0);
> +	}
> +	p2 = SAFE_FORK();
> +	if (p2 == 0) {
> +		SAFE_CLOSE(fds[1]);
> +		SAFE_READ(0, fds[0], &status2, sizeof(status2));
                                      ^
				      Here as well.
> +		exit(0);
> +	}
> +
> +	sleep(1);

This sleep here has to be replaced by a proper synchronization given
that it's here to make sure both of the readers sleep on the pipe we
should:

* Use checkpoints to make sure both of the children have managed
  to get before the SAFE_READ().

* The the parent should use the TST_PROCESS_STATE_WAIT() to make sure
  both of the chidlren are sleeping

> +	SAFE_CLOSE(fds[1]);
> +
> +	SAFE_WAITPID(p1, &status1, 0);
> +	ret = waitpid(p2, &status2, WNOHANG);

We should just use waitpid with -1 as a pid here and WNOHANG twice,
because if one of the children hangs it's not guaranteed in any way
which one would that be.

> +	if (ret == p2) {
> +		tst_res(TPASS, "pipe wakes up everybody when last write closes");
> +	} else {
> +		tst_res(TFAIL, "pipe doesn't wake up every body when last write closes");
> +		SAFE_KILL(p2, SIGKILL);
> +		SAFE_WAIT(&status2);
> +	}
> +}
> +
> +static struct tst_test test = {
> +	.test_all = verify_pipe,
> +	.forks_child = 1,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "6551d5c56eb"},
> +		{}
> +	}
> +};
> -- 
> 2.18.0
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
