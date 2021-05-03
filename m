Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB5E37201C
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 21:03:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 877BE3C8DFC
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 21:03:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 03CC93C1A34
 for <ltp@lists.linux.it>; Mon,  3 May 2021 21:03:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 616E91A0098C
 for <ltp@lists.linux.it>; Mon,  3 May 2021 21:03:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 44624B00D;
 Mon,  3 May 2021 19:03:37 +0000 (UTC)
Date: Mon, 3 May 2021 21:03:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YJBJB/S1ThSsNvCk@pevik>
References: <20210429115021.24128-1-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429115021.24128-1-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] syscalls/aio: Convert libaio wrapper function
 to kernel syscall
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ziyao,

> Instead of using the libaio wrapper function, the system call is changed to be invoked via syscall(2).
Generally LGTM. Major thing for me is to replace <libaio.h> with <linux/aio_abi.h>.
Do you plan to transform other tests which now still use <libaio.h>
(testcases/kernel/io/aio/ and testcases/kernel/io/ltp-aiodio/, which are BTW
problematic on mainline kernel)? I guess it'd be good to keep some test using <libaio.h>.

FYI if you don't prefer put your copyright, I'll update it with LTP copyright.

You also mix more things in single commit: using kernel API instead of libaio
API (that you mentioned) with both code and comments cleanup. But commits are
quite compact thus LGTM.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
For whole patchset.

Kind regards,
Petr

> Xie Ziyao (3):
>   syscalls/io_destroy: Convert libaio wrapper function to kernel syscall
>   syscalls/io_setup: Convert libaio wrapper function to kernel syscall
>   syscalls/io_submit: Convert libaio wrapper function to kernel syscall

>  .../kernel/syscalls/io_destroy/io_destroy01.c |  49 ++------
>  .../kernel/syscalls/io_setup/io_setup01.c     |  94 +++++----------
>  .../kernel/syscalls/io_submit/io_submit01.c   | 110 ++++++++----------
>  3 files changed, 86 insertions(+), 167 deletions(-)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
