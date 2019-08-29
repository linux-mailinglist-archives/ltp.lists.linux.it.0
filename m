Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 199D3A282C
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 22:38:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE3623C2017
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 22:38:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id CBC173C1CFD
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 22:38:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E90231401744
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 22:38:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 33192AF70;
 Thu, 29 Aug 2019 20:38:28 +0000 (UTC)
Date: Thu, 29 Aug 2019 22:38:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190829203826.GA5711@dell5510>
References: <1566987255-3010-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566987255-3010-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] runtest/syscalls: add set_mempolicy*
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

> Since commit 55ee8a5ad ("syscalls: Add set_mempolicy numa tests"),
> these cases have been added into runtests/numa, but forget to add it
> in runtest/syscalls.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
> ---
>  runtest/syscalls | 5 +++++
>  1 file changed, 5 insertions(+)

> diff --git a/runtest/syscalls b/runtest/syscalls
> index c41ba2a0d..1694ef147 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1177,6 +1177,11 @@ setitimer01 setitimer01
>  setitimer02 setitimer02
>  setitimer03 setitimer03

> +set_mempolicy01 set_mempolicy01
> +set_mempolicy02 set_mempolicy02
> +set_mempolicy03 set_mempolicy03
> +set_mempolicy04 set_mempolicy04
> +
>  setns01 setns01
>  setns02 setns02

Wouldn't be better to move all NUMA tests out of syscalls?
Syscalls are big already.

BTW I'm looking forward to the new testrunner [1][2], which also solve problem
of runtest files :)

Kind regards,
Petr

[1] https://people.kernel.org/metan/towards-parallel-kernel-test-runs
[2] https://github.com/metan-ucw/ltp/tree/master/docparse

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
