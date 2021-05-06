Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2212375A21
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 20:23:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64E293C73F0
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 20:23:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 292E13C56D8
 for <ltp@lists.linux.it>; Thu,  6 May 2021 20:22:51 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 637DB601029
 for <ltp@lists.linux.it>; Thu,  6 May 2021 20:22:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89D2FB008;
 Thu,  6 May 2021 18:22:50 +0000 (UTC)
Date: Thu, 6 May 2021 20:22:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJQz+MgeKcflG+Zn@pevik>
References: <20210429115021.24128-1-xieziyao@huawei.com>
 <20210429115021.24128-4-xieziyao@huawei.com>
 <YJE5bkB8+PFBMWwD@yuki>
 <f47c4ec5-2d4a-76c8-5ef4-f8cfb12961e9@huawei.com>
 <YJPnpfByh/C5kXbr@pevik> <YJP2IDZIEOltnTiq@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJP2IDZIEOltnTiq@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: rpalethorpe@suse.com, "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > > If we should test _both_ syscall() and the library, I would prefer to split
> > > libaio and native aio into two testcases in this testsuite, since <libaio.h>
> > > conflicts with <linux/aio_abi.h> during actual modification.

> > > Excuse me, is there any other good way to solve this problem?
> > NOTE: if most of the test the same, with little help of #ifdef and maybe 1-2
> > macros we can have single source for both variants (compiling 2 binaries).
> > See setdomainname and sethostname tests (setdomainname.h).

> Not sure that it's that easy here, since we cannot include libaio.h and
> aio_abi.h in a single file without getting conflicts, they define
> structures with the same name with possibly different layout, which
> makes this very tricky.

> I guess that having separate tests for different interface would
> probably be easiest solution in this case.

Sounds reasonable, thanks for info.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
