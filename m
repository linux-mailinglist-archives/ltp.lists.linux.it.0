Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D3E37543F
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 14:57:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0107C3C56F9
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 14:57:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 466A53C1B4D
 for <ltp@lists.linux.it>; Thu,  6 May 2021 14:57:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B8B31601CB9
 for <ltp@lists.linux.it>; Thu,  6 May 2021 14:57:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D85B2AF11;
 Thu,  6 May 2021 12:57:10 +0000 (UTC)
Date: Thu, 6 May 2021 14:57:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YJPnpfByh/C5kXbr@pevik>
References: <20210429115021.24128-1-xieziyao@huawei.com>
 <20210429115021.24128-4-xieziyao@huawei.com>
 <YJE5bkB8+PFBMWwD@yuki>
 <f47c4ec5-2d4a-76c8-5ef4-f8cfb12961e9@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f47c4ec5-2d4a-76c8-5ef4-f8cfb12961e9@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/io_submit: Convert libaio wrapper
 function to kernel syscall
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>, rpalethorpe@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ziyao,

> Hi, Cyril,

> If we should test _both_ syscall() and the library, I would prefer to split
> libaio and native aio into two testcases in this testsuite, since <libaio.h>
> conflicts with <linux/aio_abi.h> during actual modification.

> Excuse me, is there any other good way to solve this problem?
NOTE: if most of the test the same, with little help of #ifdef and maybe 1-2
macros we can have single source for both variants (compiling 2 binaries).
See setdomainname and sethostname tests (setdomainname.h).

Kind regards,
Petr

> Thanks very much!

> Kind Regards,
> Ziyao

> On 2021/5/4 20:09, Cyril Hrubis wrote:
> > Hi!
> > > Instead of using the libaio wrapper function, the system call is
> > > changed to be invoked via syscall(2).

> > Ideally we should test _both_ syscall() and the library to maximize the
> > coverage. We can easily do that with .test_variants, have a look at
> > stime tests and testcases/kernel/syscalls/stime/stime_var.h how this is
> > done.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
