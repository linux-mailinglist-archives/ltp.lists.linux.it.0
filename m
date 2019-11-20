Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79C103E17
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 16:16:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F9433C237D
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 16:16:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0CEFD3C14F0
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 16:16:13 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 66D141004559
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 16:16:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A8EB0B32A;
 Wed, 20 Nov 2019 15:16:11 +0000 (UTC)
Date: Wed, 20 Nov 2019 16:16:10 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191120151610.GB28197@dell5510>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120151244.GA28197@dell5510>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/quotactl01: Add Q_GETNEXTQUOTA
 test
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

Hi Jan, Cyril, Xu,

> > +#ifdef HAVE_STRUCT_IF_NEXTDQBLK
> > +# include <linux/quota.h>
> > +#else
> > +# ifdef HAVE_LINUX_TYPES_H
> > +# include <linux/types.h>
> @Jan, @Cyril: Do we want to generally avoid loading <linux/types.h> if not really needed?
> __u64 can be uint64_t etc (as it's also visible in struct dqblk in <sys/quota.h>
> in various libc headers).
> We used this approach for /usr/include/linux/bpf.h and for fanotify fixes for
> musl (testcases/kernel/syscalls/fanotify/fanotify.h).

> So unless you're against this approach here I'll change it before merge
> (and add this info to next version of library API writing guidelines patch
> https://patchwork.ozlabs.org/patch/1166786/).
+ general question: do we want always test against kernel headers or libc
headers? Libc is often outdated, so mostly it'd be our fallback to be tested.
Ideally both kernel and libc header should be tested, but that's not easily
achievable.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
