Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CFF136C20
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 12:42:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 896883C2626
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 12:42:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2B4DD3C2466
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 12:42:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 800341A0069B
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 12:42:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4D064ADE7;
 Fri, 10 Jan 2020 11:42:11 +0000 (UTC)
Date: Fri, 10 Jan 2020 12:42:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200110114208.GA25704@x230>
References: <1578633511-15403-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578633511-15403-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/capget[set]: Make use of guarded buffers
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

Hi Xu,

> Also, using pid=0 instead of getpid() in capget02.c because
> it also returns the capabilities for the calling thread.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks these improvements.

...
> diff --git a/testcases/kernel/syscalls/capget/capget02.c b/testcases/kernel/syscalls/capget/capget02.c
...
> -	tst_res(TINFO, "%s", tc->message);
> -	TEST(tst_syscall(__NR_capget, tc->headerp, tc->datap));
> +	header->version = tc->version;
> +	if (tc->pid == 1)
> +		header->pid = unused_pid;
> +	else
> +		header->pid = tc->pid;
> +
> +	tst_res(TINFO, "%s ", tc->message);
Why this extra space? I suggest to merge with the original:
	tst_res(TINFO, "%s", tc->message);

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
