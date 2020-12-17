Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AC2DD45E
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 16:42:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93FD93C618F
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 16:42:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6C2883C57C1
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 16:42:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3710D600F48
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 16:42:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CBD1AC90
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 15:42:31 +0000 (UTC)
Date: Thu, 17 Dec 2020 16:42:30 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X9t8ZjwhY+Db7nRq@pevik>
References: <20201216101012.14644-1-chrubis@suse.cz>
 <20201216101012.14644-6-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216101012.14644-6-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/5] syscalls/move_pages12: Add one more kernel
 git hash
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

> + Reformat the comment to asciidoc
Thanks!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> -/*
> - * Description:
> +/*\
> + * [DESCRIPTION]
> + *
> + * *Test 1*
>   *
> - * Test #1:
> - *  This is a regression test for the race condition between move_pages()
> - *  and freeing hugepages, where move_pages() calls follow_page(FOLL_GET)
> - *  for hugepages internally and tries to get its refcount without
> - *  preventing concurrent freeing.
> + * This is a regression test for the race condition between move_pages()
> + * and freeing hugepages, where move_pages() calls follow_page(FOLL_GET)
> + * for hugepages internally and tries to get its refcount without
> + * preventing concurrent freeing.
>   *
> - *  This test can crash the buggy kernel, and the bug was fixed in:
> + * This test can crash the buggy kernel, and the bug was fixed in:
>   *
>   *   commit e66f17ff71772b209eed39de35aaa99ba819c93d
>   *   Author: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>

I wonder if we should format "commit XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" as
link to Linus' tree (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX).


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
