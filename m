Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8D1F79D0
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 16:29:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04B303C6110
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 16:29:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9EB8F3C60FF
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 16:29:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DFC431401AA6
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 16:29:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E33F6B211;
 Fri, 12 Jun 2020 14:29:50 +0000 (UTC)
Date: Fri, 12 Jun 2020 16:30:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200612143004.GB2310@yuki.lan>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200430085742.1663-2-yangx.jy@cn.fujitsu.com>
 <20200504051107.edvfiqloegt3ak5o@vireshk-i7>
 <b74eac89-11fc-9a7c-c337-ffe6f19ec7b8@163.com>
 <20200505033507.oerhoby6aif3leea@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505033507.oerhoby6aif3leea@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/pidfd_open*.c: Drop .min_kver flag
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
> > First, I want to explain my check point:
> > 
> > Passing invalid argument can check the support of pidfd_open(2) by ENOSYS
> > errno and we don't need to close the pidfd.
> > 
> > Second, I don't like the implementation of fsopen_supported_by_kernel() and
> > give some suggestions:
> > 
> > a) syscall()/tst_syscall() is enough to check the support of pidfd_open(2)
> > and 'tst_kvercmp(5, 2, 0)) < 0' will skip the check

Hmm, man pidf_open says that it's implemented starting 5.3 or do I miss
something?

> > ??? if a kernel on distribution is newer than v5.2 but drop the support of
> > pidfd_open(2) on purpose.
> 
> I don't think kernel can drop support of syscalls just like that, we
> can't break user space. And if that is done, we need to fix userspace
> again separately for that.

For most cases we cannot, there are a few that are guarded by CONFIG_
macros though e.g. SysV IPC.

> We came to the implementation of fsopen_supported_by_kernel() after a
> lot of reviews and decided on that and so I asked you for the sake of
> keeping similar code throughout LTP (of course there will be old
> usages which are different) to have a similar implementation.
> 
> Anyway, I will leave it to Cyril to decide on that :)

Agree here, doing the check only if kernel version is not sufficient
seems to be the most reasoanble strategy here.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
