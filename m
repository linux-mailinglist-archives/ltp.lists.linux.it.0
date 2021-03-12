Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870F338A60
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 11:39:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C65363C30B6
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 11:39:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BE39B3C682B
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 11:39:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 790AC100013D
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 11:39:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D06F7AFD2
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 10:39:28 +0000 (UTC)
Date: Fri, 12 Mar 2021 11:39:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YEtE319q3N4z0qQL@pevik>
References: <20210309171104.30821-1-mdoucha@suse.cz>
 <20210309171104.30821-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309171104.30821-2-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/quotactl: Skip tests if FS quota is
 not supported
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

Hi Martin,

> --- a/testcases/kernel/syscalls/quotactl/quotactl04.c
...
> +static void do_mount(const char *source, const char *target,
> +	const char *filesystemtype, unsigned long mountflags,
> +	const void *data)
> +{
> +	TEST(mount(source, target, filesystemtype, mountflags, data));
> +
> +	if (TST_RET == -1 && TST_ERR == ESRCH)
> +		tst_brk(TCONF, "Kernel or device does not support FS quotas");
BTW I was also thinking about moving this also into safe_mount(), but
quotactl04.c is the only test which is using "-O quota" option, thus probably
useless.

Kind regards,
Petr

> +
> +	if (TST_RET == -1) {
> +		tst_brk(TBROK | TTERRNO, "mount(%s, %s, %s, %lu, %p) failed",
> +			source, target, filesystemtype, mountflags, data);
> +	}
> +
> +	if (TST_RET) {
> +		tst_brk(TBROK | TTERRNO, "mount(%s, %s, %s, %lu, %p) failed",
> +			source, target, filesystemtype, mountflags, data);
> +	}
> +
> +	mount_flag = 1;
> +}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
