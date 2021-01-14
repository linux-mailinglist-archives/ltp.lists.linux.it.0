Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C35862F63FB
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 16:15:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F116C3C6A77
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 16:15:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 194333C2659
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 16:15:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AC35A1000D5C
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 16:15:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3316AC24;
 Thu, 14 Jan 2021 15:15:26 +0000 (UTC)
Date: Thu, 14 Jan 2021 16:15:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <YABgDXi2WHSWmwHF@pevik>
References: <20210114074603.GB32318@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114074603.GB32318@andestech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] device-drivers/zram: Fix false-judgement on
 zram's presence
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

Hi Leo,

> Date: Thu, 14 Jan 2021 15:27:34 +0800
> From: Leo Yu-Chi Liang <ycliang@andestech.com>
> Subject: [LTP][PATCH 1/1] device-drivers/zram: Fix false-judgement on zram's presence

> zram_lib.sh uses the return value of modinfo to check if zram module exists,
> but the behavior of modinfo implemented by busybox is different.

> The busybox-implemented modinfo would also return true (code: 0)
> even if zram module is not present,
> so grep the info that only shows when the module exists.

> -modinfo zram > /dev/null 2>&1 ||
> +modinfo zram | grep "filename" > /dev/null 2>&1 ||
nit: 
modinfo zram | grep -q "filename" ||

>  	tst_brk TCONF "zram not configured in kernel"

Thank you for a report. Actually, we have a helper for it:
TST_NEEDS_DRIVERS="zram"

But this helper is broken for BusyBox, which means it's broken for many tests.

The helper calls tst_check_driver() C function (lib/tst_kernel.c):

int tst_check_driver(const char *name)
{
#ifndef __ANDROID__
	const char * const argv[] = { "modprobe", "-n", name, NULL };
	int res = tst_cmd_(NULL, argv, "/dev/null", "/dev/null",
			       TST_CMD_PASS_RETVAL);

	/* 255 - it looks like modprobe not available */
	return (res == 255) ? 0 : res;
#else
	/* Android modprobe may not have '-n', or properly installed
	 * module.*.bin files to determine built-in drivers. Assume
	 * all drivers are available.
	 */
	return 0;
#endif
}

and the problem is that modprobe from busybox does not support -n.
It does support -D, which could be used, *but* unless is busybox binary
configured with CONFIG_MODPROBE_SMALL=y (IMHO the default) => not suitable
for us.

IMHO we have only 2 options:
* write something on our own which would look into /lib/modules and
/system/lib/modules (Android). That's what BusyBox implementation does
(also kmod implementation looks into /lib/modules). BusyBox has this path in
defined in build time configuration (CONFIG_DEFAULT_MODULES_DIR), but I'd be
surprised if any system had both directories.
pros: no external dependency
cons: more code

* use modinfo, but grep for output: for 'filename:' (turn Leo's suggestion into
C code in the API):
cons: module not checked, when modprobe missing (we check for 255 exit code).

BTW not sure whether bother about android support anyway. On Android phone I
have available (Android 8), there is empty /system/lib/modules directory and no
/proc/modules:, thus nor BusyBox neither even toybox modprobe/modinfo
implementations work.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
