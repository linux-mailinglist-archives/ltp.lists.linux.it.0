Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 655742F749C
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 09:54:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 306DC3C317E
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 09:54:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8C52B3C3114
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 09:54:33 +0100 (CET)
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 55EDF1000ED9
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 09:54:30 +0100 (CET)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 10F8pKfb035436;
 Fri, 15 Jan 2021 16:51:21 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 Jan 2021
 16:54:09 +0800
Date: Fri, 15 Jan 2021 16:54:07 +0800
From: Leo Liang <ycliang@andestech.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20210115085406.GA23267@andestech.com>
References: <20210114074603.GB32318@andestech.com>
 <YABgDXi2WHSWmwHF@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YABgDXi2WHSWmwHF@pevik>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 10F8pKfb035436
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,
On Thu, Jan 14, 2021 at 11:15:25PM +0800, Petr Vorel wrote:
> Hi Leo,
> 
> > zram_lib.sh uses the return value of modinfo to check if zram module exists,
> > but the behavior of modinfo implemented by busybox is different.
> 
> > The busybox-implemented modinfo would also return true (code: 0)
> > even if zram module is not present,
> > so grep the info that only shows when the module exists.
> 
> > -modinfo zram > /dev/null 2>&1 ||
> > +modinfo zram | grep "filename" > /dev/null 2>&1 ||
> nit: 
> modinfo zram | grep -q "filename" ||
> 
> >  	tst_brk TCONF "zram not configured in kernel"
> 
> Thank you for a report. Actually, we have a helper for it:
> TST_NEEDS_DRIVERS="zram"
> 
> But this helper is broken for BusyBox, which means it's broken for many tests.
> 
> The helper calls tst_check_driver() C function (lib/tst_kernel.c):
> 
> int tst_check_driver(const char *name)
> {
> #ifndef __ANDROID__
> 	const char * const argv[] = { "modprobe", "-n", name, NULL };
> 	int res = tst_cmd_(NULL, argv, "/dev/null", "/dev/null",
> 			       TST_CMD_PASS_RETVAL);
> 
> 	/* 255 - it looks like modprobe not available */
> 	return (res == 255) ? 0 : res;
> #else
> 	/* Android modprobe may not have '-n', or properly installed
> 	 * module.*.bin files to determine built-in drivers. Assume
> 	 * all drivers are available.
> 	 */
> 	return 0;
> #endif
> }
> 
> and the problem is that modprobe from busybox does not support -n.
> It does support -D, which could be used, *but* unless is busybox binary
> configured with CONFIG_MODPROBE_SMALL=y (IMHO the default) => not suitable
> for us.
> 
> IMHO we have only 2 options:
> * write something on our own which would look into /lib/modules and
> /system/lib/modules (Android). That's what BusyBox implementation does
> (also kmod implementation looks into /lib/modules). BusyBox has this path in
> defined in build time configuration (CONFIG_DEFAULT_MODULES_DIR), but I'd be
> surprised if any system had both directories.
> pros: no external dependency
> cons: more code
> 
> * use modinfo, but grep for output: for 'filename:' (turn Leo's suggestion into
> C code in the API):
> cons: module not checked, when modprobe missing (we check for 255 exit code).
> 

Thanks for breaking things down in such detail!

I personally prefer the first option that looking into those directories ourselves.
So let's drop this patch and stay as is for now!

> BTW not sure whether bother about android support anyway. On Android phone I
> have available (Android 8), there is empty /system/lib/modules directory and no
> /proc/modules:, thus nor BusyBox neither even toybox modprobe/modinfo
> implementations work.
 
BTW, I found that there's a ver_linux script that detects the version of util-linux.
But as I searched through commit log of LTP, there are a lot of workarounds
regarding the compatibility issue with Busybox (around 10 commits or so).

Is there a certain version of util-linux is expected to conduct a full run of LTP ?

Thanks again,
Leo

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
