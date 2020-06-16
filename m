Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B72521FBE90
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 20:56:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DA903C2D00
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 20:56:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A8B433C2C27
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 20:56:10 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 884FA1A016CD
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 20:56:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 19D65AC4E;
 Tue, 16 Jun 2020 18:56:13 +0000 (UTC)
Date: Tue, 16 Jun 2020 20:56:07 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200616185607.GA9342@dell5510>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <5a10d33509ac73c26b233ab72c579f44386d0a55.1590057824.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a10d33509ac73c26b233ab72c579f44386d0a55.1590057824.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/5] include: Add declaration of struct ipc64_perm
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
Cc: arnd@arndb.de, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> --- /dev/null
> +++ b/include/ipcbuf.h
...
> +#include <linux/posix_types.h>
> +
> +#ifndef HAVE_IPC64_PERM
...

> +struct ipc64_perm {
> +	__kernel_key_t		key;
> +	__kernel_uid32_t	uid;
> +	__kernel_gid32_t	gid;
> +	__kernel_uid32_t	cuid;
> +	__kernel_gid32_t	cgid;
> +	__kernel_mode_t		mode;
> +				/* pad if mode_t is u16: */
> +	unsigned char		__pad1[4 - sizeof(__kernel_mode_t)];
> +	unsigned short		seq;
> +	unsigned short		__pad2;
> +	__kernel_ulong_t	__unused1;
> +	__kernel_ulong_t	__unused2;

Since this commit we depend on kernel headers from v3.4-rc1
- __kernel_ulong_t was defined in afead38d011a ("posix_types: Introduce
__kernel_[u]long_t").

I'll send a RFC patch, because not sure, whether we should still support these
old versions, or just drop the oldest distro from Travis and declare kernel v3.4
dependency. BTW current glibc requires v3.2.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
