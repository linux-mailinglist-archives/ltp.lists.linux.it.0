Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4451D12BC
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 14:33:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E06C53C54F8
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 14:33:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 723F53C2555
 for <ltp@lists.linux.it>; Wed, 13 May 2020 14:33:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5C941140125C
 for <ltp@lists.linux.it>; Wed, 13 May 2020 14:33:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1E23EADE4;
 Wed, 13 May 2020 12:33:44 +0000 (UTC)
Date: Wed, 13 May 2020 14:34:09 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200513123409.GA10803@yuki.lan>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> pidfd_open(2) will set close-on-exec flag on the file descriptor as it
> manpage states, so check close-on-exec flag by fcntl(2).
> 
> BTW:
> I tried to pass (long) TST_RET to fcntl() but triggered the following
> compiler warning, so pass (int) pidfd instead.
> ------------------------------------------------------
> In file included from pidfd_open01.c:9:
> pidfd_open01.c: In function ???run???:
> ../../../../include/tst_test.h:76:41: warning: format ???%i??? expects argument of type ???int???, but argument 5 has type ???long int??? [-Wformat=]
>    76 |   tst_brk_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
>       |                                         ^~~~~~~~~
> ../../../../include/tst_safe_macros.h:224:5: note: in expansion of macro ???tst_brk???
>   224 |     tst_brk(TBROK | TERRNO,                          \
>       |     ^~~~~~~
> pidfd_open01.c:20:9: note: in expansion of macro ???SAFE_FCNTL???
>    20 |  flag = SAFE_FCNTL(TST_RET, F_GETFD);

You can either cast the TST_RET to int as SAFE_FCNTL((int)TST_RET, ...)
or if you decide to store the pidfd into an int variable there is no
added value in using the TEST() macro here so the code should just do
pidfd = pidfd_open(...) and use the pidfd instead of TST_RET.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
