Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05E25B2C4
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 19:14:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F09983C5A78
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 19:14:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9900B3C2D58
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 19:14:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3580F2005F8
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 19:13:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8831DAC19
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 17:14:00 +0000 (UTC)
Date: Wed, 2 Sep 2020 19:13:58 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200902171358.GB26811@dell5510>
References: <20200825160735.24602-1-mdoucha@suse.cz>
 <20200825160735.24602-4-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825160735.24602-4-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/4] ioctl_sg01: Pollute free memory in setup
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

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> The test wasn't reliable if most of available memory was full of zeroes.
> Pollute free memory to increase the chance of detecting data leak.

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---

> Changes since v1:
> - Split patch
> - Use tst_pollute_memory() instead of allocating and pre-polluting
>   a fixed-size block of memory in setup().

>  testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
> index daaa96be5..8c9fd0dae 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
> @@ -7,9 +7,7 @@
>   * CVE-2018-1000204
>   *
>   * Test ioctl(SG_IO) and check that kernel doesn't leak data. Requires
> - * a read-accessible SCSI-compatible device (e.g. SATA disk). Running oom*
> - * test program before this one may increase the chance of successfully
> - * reproducing the bug.
> + * a read-accessible generic SCSI device (e.g. a DVD drive).
>   *
>   * Leak fixed in:
>   *
> @@ -29,8 +27,9 @@
>  #include <sys/ioctl.h>
>  #include <stdio.h>
>  #include "tst_test.h"
> +#include "tst_memutils.h"

> -#define BUF_SIZE 128 * 4096
> +#define BUF_SIZE (128 * 4096)
>  #define CMD_SIZE 6

>  static int devfd = -1;
> @@ -80,6 +79,10 @@ static void setup(void)
>  		tst_brk(TCONF, "Could not find any usable SCSI device");

>  	tst_res(TINFO, "Found SCSI device %s", devpath);
> +
> +	/* Pollute some memory to avoid false negatives */
> +	tst_pollute_memory(0, 0x42);
> +
>  	devfd = SAFE_OPEN(devpath, O_RDONLY);
>  	query.interface_id = 'S';
>  	query.dxfer_direction = SG_DXFER_FROM_DEV;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
