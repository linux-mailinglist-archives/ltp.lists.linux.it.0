Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E08E18FD00
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 19:47:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AF053C4E48
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 19:47:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E97833C4E3C
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 19:47:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 597CD1400DD4
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 19:47:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9B4F9AC6E
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 18:47:05 +0000 (UTC)
Date: Mon, 23 Mar 2020 19:47:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200323184703.GA7013@dell5510>
References: <20200318153801.3529-1-chrubis@suse.cz>
 <20200318153801.3529-6-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318153801.3529-6-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/9] syscalls/sysinfo03: Add time namespace test
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

Hi Cyril,

> +++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
...
> +#include <sys/sysinfo.h>
> +#include "lapi/namespaces_constants.h"
> +#include "tst_test.h"
...
> +static void verify_sysinfo(unsigned int n)
> +{
> +	struct sysinfo si;
> +	long uptime;
> +	int off = offsets[n];
> +
> +	SAFE_UNSHARE(CLONE_NEWTIME);
> +
> +        SAFE_FILE_PRINTF("/proc/self/timens_offsets", "%d %d 0",
> +	                 CLOCK_BOOTTIME, off);
One more fix needed for CentOS 6 to get missing definition: CLOCK_BOOTTIME

#include "lapi/posix_clocks.h"

Or do we want to finally drop CentOS 6 ? (see [1]).

Kind regards,
Petr

[1] https://lists.linux.it/pipermail/ltp/2020-March/016164.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
