Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78805323A7C
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 11:27:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C5883C5991
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 11:27:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A91BE3C4E27
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 11:27:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 485D21A001C7
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 11:27:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D250AF19;
 Wed, 24 Feb 2021 10:27:28 +0000 (UTC)
Date: Wed, 24 Feb 2021 11:28:52 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
Message-ID: <YDYqZMYBVfh8oiYH@yuki.lan>
References: <20210224031227.151844-1-ruansy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224031227.151844-1-ruansy.fnst@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/getpid01: Convert to new API
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
> +static void verify_getpid(void)
>  {
> +	TEST(getpid());
>  
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "getpid()");
> +	else
> +		tst_res(TPASS, "getpid() returns %ld", TST_RET);

The POSIX actually mandates that getpid() cannot fail and is always
successful. Given that this test seems to be useless and could be
removed or replaced with something more sane.

I guess that what we can do is to check if the return value from
getpid() is greater than 1, since pid 1 is special no other process than
init can have pid == 1. And the value has to be smaller or equal to
/proc/sys/kernel/pid_max as well.

So what would I do here would be:

* read /proc/sys/kernel/pid_max value
* loop 100 times or so
  - fork a child
  - check that the pid in child is > 1 and <= pid_max

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
