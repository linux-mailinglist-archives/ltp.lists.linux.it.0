Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C70B24BD2E
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 15:01:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 394B03C580C
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 15:01:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D61F13C2F91
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 15:00:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 63A9A60095E
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 15:00:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EABC7AC7D
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 13:01:21 +0000 (UTC)
Date: Thu, 20 Aug 2020 15:01:25 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200820130125.GE9000@yuki.lan>
References: <20200820101844.6398-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820101844.6398-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ioctl_sg01: Increase chance of detecting data leak
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
> The test wasn't reliable if most of available memory was full of zeroes.
> Pollute 256MB of memory in setup() to increase the chance of catching a data
> leak without needing pre-pollution from another program. Then loop the test
> 100 times.
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 36 +++++++++++++-------
>  1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
> index daaa96be5..7cd22d103 100644
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
> @@ -30,7 +28,8 @@
>  #include <stdio.h>
>  #include "tst_test.h"
>  
> -#define BUF_SIZE 128 * 4096
> +#define BUF_SIZE (128 * 4096)
> +#define DIRTY_SIZE (256 * 1024 * 1024)

Can we please check this againts system free memory?

While it's not likely there may be system that have less that 256MB of
free RAM.

Also when we do check system memory, we can scale up with available
memory as well and dirty 1GB or more on, which is not that much on
modern systems.

Also perhaps it may be a good idea to put this code into a library
function.

>  #define CMD_SIZE 6
>  
>  static int devfd = -1;
> @@ -74,12 +73,20 @@ static const char *find_generic_scsi_device(int access_flags)
>  
>  static void setup(void)
>  {
> +	void *dirty_mem;
>  	const char *devpath = find_generic_scsi_device(O_RDONLY);
>  
>  	if (!devpath)
>  		tst_brk(TCONF, "Could not find any usable SCSI device");
>  
>  	tst_res(TINFO, "Found SCSI device %s", devpath);
> +
> +	/* Pollute some memory to avoid false negatives */
> +	dirty_mem = SAFE_MMAP(NULL, DIRTY_SIZE, PROT_READ | PROT_WRITE,
> +		MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	memset(dirty_mem, 0xda, DIRTY_SIZE);
> +	SAFE_MUNMAP(dirty_mem, DIRTY_SIZE);
> +
>  	devfd = SAFE_OPEN(devpath, O_RDONLY);
>  	query.interface_id = 'S';
>  	query.dxfer_direction = SG_DXFER_FROM_DEV;
> @@ -97,19 +104,22 @@ static void cleanup(void)
>  
>  static void run(void)
>  {
> -	size_t i;
> +	size_t i, j;
>  
>  	memset(buffer, 0, BUF_SIZE);
> -	TEST(ioctl(devfd, SG_IO, &query));
>  
> -	if (TST_RET != 0 && TST_RET != -1)
> -		tst_brk(TBROK | TTERRNO, "Invalid ioctl() return value");
> +	for (i = 0; i < 100; i++) {
> +		TEST(ioctl(devfd, SG_IO, &query));
> +
> +		if (TST_RET != 0 && TST_RET != -1)
> +			tst_brk(TBROK|TTERRNO, "Invalid ioctl() return value");
>  
> -	/* Check the output buffer even if ioctl() failed, just in case. */
> -	for (i = 0; i < BUF_SIZE; i++) {
> -		if (buffer[i]) {
> -			tst_res(TFAIL, "Kernel memory leaked");
> -			return;
> +		/* Check the buffer even if ioctl() failed, just in case. */
> +		for (j = 0; j < BUF_SIZE; j++) {
> +			if (buffer[j]) {
> +				tst_res(TFAIL, "Kernel memory leaked");
> +				return;
> +			}
>  		}
>  	}

Can we put this part into a seprate patch please?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
