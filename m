Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E0025D00B
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Sep 2020 05:54:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02EDA3C54F6
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Sep 2020 05:54:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 00A0C3C2D1B
 for <ltp@lists.linux.it>; Fri,  4 Sep 2020 05:54:03 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 04EA71A011F5
 for <ltp@lists.linux.it>; Fri,  4 Sep 2020 05:54:02 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,387,1592841600"; d="scan'208";a="98897556"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Sep 2020 11:54:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 63E2C48990DB
 for <ltp@lists.linux.it>; Fri,  4 Sep 2020 11:54:00 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Sep 2020 11:54:00 +0800
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
References: <1598608979-20788-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <406f338b-39a3-0c2c-e3f5-fc598373ecbc@cn.fujitsu.com>
Date: Fri, 4 Sep 2020 11:53:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598608979-20788-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 63E2C48990DB.AF1F9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-2.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl_loop07: Using LOOP_CONFIGURE to
 test lo_sizelimit field
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi
The correspoding kernel patch has been merged into linux branch.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=79e5dc59e2974a48

Best Regards
Yang Xu
> Since kernel commit 3448914e8cc5("loop: Add LOOP_CONFIGURE ioctl"),
> it can set the lo_sizelimit by specifying loop_config.info.lo_sizelimit
> value. It is also regression test for
> commit 79e5dc59e297 ("loop: Set correct device size when using LOOP_CONFIGURE").
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
> v1->v2:
> add linux tag even this commit is not merged into linux or linux-net(it
> has been merged into block maintainer linux branch)
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=block-5.9&id=79e5dc59e2974a48764269fa9ff544ae8ffe3338
>   .../kernel/syscalls/ioctl/ioctl_loop07.c      | 90 ++++++++++++++++---
>   1 file changed, 80 insertions(+), 10 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop07.c b/testcases/kernel/syscalls/ioctl/ioctl_loop07.c
> index ce4b47690..9d880ffd1 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop07.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop07.c
> @@ -8,6 +8,10 @@
>    * Test its lo_sizelimit field. If lo_sizelimit is 0,it means max
>    * available. If sizelimit is less than loop_size, loopsize will
>    * be truncated.
> + *
> + * We also use LOOP_CONFIGURE ioctl to test lo_sizelimit field. It is
> + * also a regression test for
> + * commit 79e5dc59e297 ("loop: Set correct device size when using LOOP_CONFIGURE").
>    */
>   
>   #include <stdio.h>
> @@ -18,15 +22,26 @@
>   #include "tst_test.h"
>   
>   static char dev_path[1024], sys_loop_sizepath[1024], sys_loop_sizelimitpath[1024];
> -static int dev_num, dev_fd, file_fd, attach_flag;
> +static int dev_num, dev_fd, file_fd, attach_flag, loop_configure_sup = 1;
> +static struct loop_config loopconfig;
>   
>   static struct tcase {
>   	unsigned int set_sizelimit;
>   	unsigned int exp_loopsize;
> +	int ioctl_flag;
>   	char *message;
>   } tcases[] = {
> -	{1024 * 4096, 2048, "When sizelimit is greater than loopsize "},
> -	{1024 * 512, 1024, "When sizelimit is less than loopsize"},
> +	{1024 * 4096, 2048, LOOP_SET_STATUS64,
> +	"When sizelimit is greater than loopsize by using LOOP_SET_STATUS64"},
> +
> +	{1024 * 512, 1024, LOOP_SET_STATUS64,
> +	"When sizelimit is less than loopsize by using LOOP_SET_STATUS64"},
> +
> +	{1024 * 4096, 2048, LOOP_CONFIGURE,
> +	"When sizelimit is greater than loopsize by using LOOP_CONFIGURE"},
> +
> +	{1024 * 512, 1024, LOOP_CONFIGURE,
> +	"When sizelimit is less than loopsize by using LOOP_CONFIGURE"},
>   };
>   
>   static void verify_ioctl_loop(unsigned int n)
> @@ -34,12 +49,15 @@ static void verify_ioctl_loop(unsigned int n)
>   	struct tcase *tc = &tcases[n];
>   	struct loop_info64 loopinfo, loopinfoget;
>   
> -	tst_res(TINFO, "%s", tc->message);
>   	memset(&loopinfo, 0, sizeof(loopinfo));
>   	memset(&loopinfoget, 0, sizeof(loopinfoget));
>   
> -	loopinfo.lo_sizelimit = tc->set_sizelimit;
> -	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS64, &loopinfo), TST_RETVAL_EQ0);
> +	if (tc->ioctl_flag == LOOP_CONFIGURE) {
> +		SAFE_IOCTL(dev_fd, LOOP_CONFIGURE, &loopconfig);
> +	} else {
> +		loopinfo.lo_sizelimit = tc->set_sizelimit;
> +		TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS64, &loopinfo), TST_RETVAL_EQ0);
> +	}
>   
>   	TST_ASSERT_INT(sys_loop_sizepath, tc->exp_loopsize);
>   	TST_ASSERT_INT(sys_loop_sizelimitpath, tc->set_sizelimit);
> @@ -50,12 +68,46 @@ static void verify_ioctl_loop(unsigned int n)
>   		tst_res(TFAIL, "LOOP_GET_STATUS64 gets wrong lo_sizelimit(%llu), expect %d",
>   				loopinfoget.lo_sizelimit, tc->set_sizelimit);
>   	/*Reset*/
> -	loopinfo.lo_sizelimit = 0;
> -	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
> +	if (tc->ioctl_flag == LOOP_CONFIGURE) {
> +			tst_detach_device_by_fd(dev_path, dev_fd);
> +	} else {
> +		loopinfo.lo_sizelimit = 0;
> +		TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
> +	}
> +}
> +
> +static void run(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +
> +	tst_res(TINFO, "%s", tc->message);
> +
> +	if (tc->ioctl_flag == LOOP_SET_STATUS64) {
> +		if (!attach_flag) {
> +			tst_attach_device(dev_path, "test.img");
> +			attach_flag = 1;
> +		}
> +
> +		verify_ioctl_loop(n);
> +		return;
> +	}
> +
> +	if (tc->ioctl_flag == LOOP_CONFIGURE && !loop_configure_sup) {
> +		tst_res(TCONF, "LOOP_CONFIGURE ioctl not supported");
> +		return;
> +	}
> +	if (attach_flag) {
> +		tst_detach_device_by_fd(dev_path, dev_fd);
> +		attach_flag = 0;
> +	}
> +	loopconfig.info.lo_sizelimit = tc->set_sizelimit;
> +	verify_ioctl_loop(n);
>   }
>   
>   static void setup(void)
>   {
> +	int ret;
> +
>   	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
>   	if (dev_num < 0)
>   		tst_brk(TBROK, "Failed to find free loop device");
> @@ -67,8 +119,22 @@ static void setup(void)
>   	sprintf(sys_loop_sizepath, "/sys/block/loop%d/size", dev_num);
>   	sprintf(sys_loop_sizelimitpath, "/sys/block/loop%d/loop/sizelimit", dev_num);
>   
> -	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
> +	tst_detach_device(dev_path);
> +	attach_flag = 0;
> +
>   	tst_res(TINFO, "original loop size 2048 sectors");
> +	file_fd = SAFE_OPEN("test.img", O_RDWR);
> +	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
> +
> +	loopconfig.fd = -1;
> +	ret = ioctl(dev_fd, LOOP_CONFIGURE, &loopconfig);
> +	if (ret && errno != EBADF) {
> +		tst_res(TINFO | TERRNO, "LOOP_CONFIGURE is not supported");
> +		loop_configure_sup = 0;
> +		return;
> +	}
> +
> +	loopconfig.fd = file_fd;
>   }
>   
>   static void cleanup(void)
> @@ -84,10 +150,14 @@ static void cleanup(void)
>   static struct tst_test test = {
>   	.setup = setup,
>   	.cleanup = cleanup,
> -	.test = verify_ioctl_loop,
> +	.test = run,
>   	.tcnt = ARRAY_SIZE(tcases),
>   	.needs_root = 1,
>   	.needs_tmpdir = 1,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "79e5dc59e297"},
> +		{}
> +	},
>   	.needs_drivers = (const char *const []) {
>   		"loop",
>   		NULL
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
