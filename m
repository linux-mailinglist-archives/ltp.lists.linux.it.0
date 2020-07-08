Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DF0218A4C
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 16:41:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A89D73C1D5B
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 16:41:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2BCA23C00E7
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 16:41:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E06EE6012AC
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 16:40:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 228F2AC40;
 Wed,  8 Jul 2020 14:41:42 +0000 (UTC)
Date: Wed, 8 Jul 2020 16:42:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Shwetha Subramanian <shwetha@zilogic.com>
Message-ID: <20200708144201.GA20047@yuki.lan>
References: <20200706050828.5134-1-shwetha@zilogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706050828.5134-1-shwetha@zilogic.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add mincore() test for anonymous mappings
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
Cc: ltp@lists.linux.it, vijaykumar@zilogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with minor chnages, thanks.

> Changes from v1:
> 	1.Changed testcase description.
> 	2.Checked ptr before executing SAFE_MUNMAP() in cleanup().
> 	3.Added a setup() fuction.
> 	4.Fixed formatting issues.
> 	5.Changed TPASS and TFAIL messages.
> 	6.Changed syntax for conditional statements. 

This part belongs right after the --- below, so that it's not included
in the final commit message.

> References: #461
> 
> Signed-off-by: Shwetha Subramanian. <shwetha@zilogic.com>
> Reviewed-by: Vijay Kumar B. <vijaykumar@zilogic.com>
> ---
>  runtest/syscalls                              |  1 +
>  testcases/kernel/syscalls/mincore/.gitignore  |  1 +
>  testcases/kernel/syscalls/mincore/mincore03.c | 83 +++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/mincore/mincore03.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index b4d523319..e0fe9f87e 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -879,6 +879,7 @@ open_tree02 open_tree02
>  
>  mincore01 mincore01
>  mincore02 mincore02
> +mincore03 mincore03
>  
>  madvise01 madvise01
>  madvise02 madvise02
> diff --git a/testcases/kernel/syscalls/mincore/.gitignore b/testcases/kernel/syscalls/mincore/.gitignore
> index fdb2070e9..fcbe27eac 100644
> --- a/testcases/kernel/syscalls/mincore/.gitignore
> +++ b/testcases/kernel/syscalls/mincore/.gitignore
> @@ -1,2 +1,3 @@
>  /mincore01
>  /mincore02
> +/mincore03
> \ No newline at end of file

And I've added the missing newline here.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
