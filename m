Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B63A92A6C85
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 19:12:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 403933C5442
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 19:12:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id DB4723C20D7
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 19:12:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6A00C201037
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 19:12:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CD0CAC92;
 Wed,  4 Nov 2020 18:12:53 +0000 (UTC)
Date: Wed, 4 Nov 2020 19:12:52 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>
Message-ID: <20201104181252.GA10153@pevik>
References: <20201104132116.20712-1-radoslav.kolev@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104132116.20712-1-radoslav.kolev@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Convert dup02 to new API and clean up
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

Hi Radoslav,

>  testcases/kernel/syscalls/dup/dup02.c | 212 ++++++--------------------
...

> +	struct tcase *testcase = &testcases[n];
Maybe shorter names (tc)?

> +
> +	TEST(dup(testcase->fd));
> +
> +	if (TST_RET < -1) {
> +		tst_res(TFAIL, "Invalid dup() return value %ld", TST_RET);
I'd use here also TERRNO (on this unexpected error.

> +	} else if (TST_RET == -1) {
> +		if (TST_ERR == testcase->expected_errno) {
		if (testcase->expected_errno ==  TST_ERR) {
(checkpatch.pl script from kernel warning; checkpatch.pl warnings aren't hard
requirements but it's good try to remove them if possible).

> +			tst_res(TPASS | TERRNO, "dup(%d) failed as expected",
> +				testcase->fd);
> +		} else {
> +			tst_res(TFAIL | TERRNO, "dup(%d) Failed unexpectedly",
> +				testcase->fd);
>  		}
> +	} else {
> +		tst_res(TFAIL, "dup(%d) Succeeded unexpectedly", testcase->fd);
> +		SAFE_CLOSE(TST_RET);
>  	}

Nested if/else blocks are hard to read. We're trying to reduce them with return:
(not hard requirement, but really more readable)

	if (TST_RET < -1) {
		tst_res(TFAIL | TTERRNO, "Invalid dup() return value %ld", TST_RET);
		return;
	}

	if (TST_RET == -1) {
		if (testcase->expected_errno ==  TST_ERR) {
			tst_res(TPASS | TERRNO, "dup(%d) failed as expected",
				testcase->fd);
		} else {
			tst_res(TFAIL | TERRNO, "dup(%d) Failed unexpectedly",
				testcase->fd);
		}

		return;
	}

	tst_res(TFAIL, "dup(%d) Succeeded unexpectedly", testcase->fd);
	SAFE_CLOSE(TST_RET);

Otherwise LGTM :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
