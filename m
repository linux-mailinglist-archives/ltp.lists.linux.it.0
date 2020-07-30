Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF57D232C8C
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 09:29:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD9D63C2615
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 09:29:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E52443C059F
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 09:29:03 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E480C140007E
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 09:29:01 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,413,1589212800"; d="scan'208";a="97098543"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2020 15:28:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3D42E4CE544C;
 Thu, 30 Jul 2020 15:28:59 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Jul 2020 15:28:59 +0800
To: <chrubis@suse.cz>, Martijn Coenen <maco@android.com>, linux-block
 <linux-block@vger.kernel.org>
References: <20200708140034.GD7276@yuki.lan>
 <1594363189-20972-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1594363189-20972-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <578a5ea3-21d4-af3a-dabe-7e50fbd3dd21@cn.fujitsu.com>
Date: Thu, 30 Jul 2020 15:28:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594363189-20972-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3D42E4CE544C.AE490
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.6 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/ioctl_loop05: Using
 LOOP_CONFIGURE to set direct io
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martijn
CC block kernel guys

I have a question when using loop_configure ioctl to set direct io flag.
In ltp testcase ioctl_loop05, I modify this case as the follow (Using 
loop_configure ioctl to set direct io mode with different 
logical_block_size).  But sometimes I met a problem that loop_configure 
ioctl succeed but the flag doesn't take effect.

the test (need to merge this patch[1] and remove sleep)
ioctl_loop05.c:132: INFO: Using LOOP_SET_DIRECT_IO with offset less than 
logical_block_size
ioctl_loop05.c:84: PASS: In non dio mode, lo_flags doesn't have 
LO_FLAGS_DIRECT_IO flag
ioctl_loop05.c:86: PASS: /sys/block/loop0/loop/dio = 0
ioctl_loop05.c:106: PASS: set direct io failed as expected: EINVAL (22)
ioctl_loop05.c:132: INFO: Using LOOP_CONFIGURE without setting lo_offset 
or sizelimit
ioctl_loop05.c:80: PASS: In dio mode, lo_flags has LO_FLAGS_DIRECT_IO flag
ioctl_loop05.c:86: PASS: /sys/block/loop0/loop/dio = 1
ioctl_loop05.c:132: INFO: Using LOOP_CONFIGURE With offset equal to 
logical_block_size
ioctl_loop05.c:80: PASS: In dio mode, lo_flags has LO_FLAGS_DIRECT_IO flag
ioctl_loop05.c:86: PASS: /sys/block/loop0/loop/dio = 1
ioctl_loop05.c:132: INFO: Using LOOP_CONFIGURE witg offset less than 
logical_block_size
ioctl_loop05.c:80: FAIL: In non dio mode, lo_flags has 
LO_FLAGS_DIRECT_IO flag
ioctl_loop05.c:86: FAIL: /sys/block/loop0/loop/dio != 0 got 1

Summary:
passed   17
failed   2
skipped  0
warnings 0

dmesg

[75103.201861] loop_set_status: loop0 () has still dirty pages (nrpages=3)
[75103.321850] blk_update_request: I/O error, dev loop0, sector 2047 op 
0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
[75103.337105] blk_update_request: I/O error, dev loop0, sector 2047 op 
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[75103.337816] Buffer I/O error on dev loop0, logical block 255, async 
page read

It seems that the last blk_update_request has not completed but the 
subquent blk request (loop_configure ioctl with non zero size or logic 
block size triggers) has started.So kernel has this warning.Is it right? 
Is it a expected behaviour?

[1]https://patchwork.ozlabs.org/project/ltp/patch/1595556357-29932-2-git-send-email-xuyang2018.jy@cn.fujitsu.com/

Best Regards
Yang Xu

> Since kernel commit 3448914e8cc5("loop: Add LOOP_CONFIGURE ioctl"),
> it can explicitly request direct I/O mode by setting LO_FLAGS_DIRECT_IO
> in loop_config.info.lo_flags.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   .../kernel/syscalls/ioctl/ioctl_loop05.c      | 154 +++++++++++++-----
>   1 file changed, 117 insertions(+), 37 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> index e3c14faab..6abb27998 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> @@ -19,6 +19,9 @@
>    * enabled but falls back to buffered I/O later on. This is the case at least
>    * for Btrfs. Because of that the test passes both with failure as well as
>    * success with non-zero offset.
> + *
> + * Also use LOOP_CONFIGURE to test this by setting LO_FLAGS_DIRECT_IO
> + * in loop_config.info.lo_flags.
>    */
>   
>   #include <stdio.h>
> @@ -32,8 +35,36 @@
>   #define DIO_MESSAGE "In dio mode"
>   #define NON_DIO_MESSAGE "In non dio mode"
>   
> -static char dev_path[1024], sys_loop_diopath[1024], backing_file_path[1024];;
> +static char dev_path[1024], sys_loop_diopath[1024], backing_file_path[1024];
>   static int dev_num, dev_fd, block_devfd, attach_flag, logical_block_size;
> +static int file_fd, loop_configure_sup = 1;
> +static struct loop_config loopconfig;
> +static struct loop_info loopinfo;
> +
> +static struct tcase {
> +	int multi; /*logical_block_size / 2 as unit */
> +	int dio_value;
> +	int ioctl_flag;
> +	char *message;
> +} tcases[] = {
> +	{0, 1, LOOP_SET_DIRECT_IO,
> +	"Using LOOP_SET_DIRET_IO without setting lo_offset or sizelimit"},
> +
> +	{2, 1, LOOP_SET_DIRECT_IO,
> +	"Using LOOP_SET_DIRECT_IO With offset equal to logical_block_size"},
> +
> +	{1, 0, LOOP_SET_DIRECT_IO,
> +	"Using LOOP_SET_DIRECT_IO with offset less than logical_block_size"},
> +
> +	{0, 1, LOOP_CONFIGURE,
> +	"Using LOOP_CONFIGURE without setting lo_offset or sizelimit"},
> +
> +	{2, 1, LOOP_CONFIGURE,
> +	"Using LOOP_CONFIGURE With offset equal to logical_block_size"},
> +
> +	{1, 0, LOOP_CONFIGURE,
> +	"Using LOOP_CONFIGURE witg offset less than logical_block_size"},
> +};
>   
>   static void check_dio_value(int flag)
>   {
> @@ -42,61 +73,94 @@ static void check_dio_value(int flag)
>   	memset(&loopinfoget, 0, sizeof(loopinfoget));
>   
>   	SAFE_IOCTL(dev_fd, LOOP_GET_STATUS, &loopinfoget);
> -	tst_res(TINFO, "%s", flag ? DIO_MESSAGE : NON_DIO_MESSAGE);
>   
>   	if (loopinfoget.lo_flags & LO_FLAGS_DIRECT_IO)
> -		tst_res(flag ? TPASS : TFAIL, "lo_flags has LO_FLAGS_DIRECT_IO flag");
> +		tst_res(flag ? TPASS : TFAIL,
> +			"%s, lo_flags has LO_FLAGS_DIRECT_IO flag",
> +			flag ? DIO_MESSAGE : NON_DIO_MESSAGE);
>   	else
> -		tst_res(flag ? TFAIL : TPASS, "lo_flags doesn't have LO_FLAGS_DIRECT_IO flag");
> +		tst_res(flag ? TFAIL : TPASS,
> +			"%s, lo_flags doesn't have LO_FLAGS_DIRECT_IO flag",
> +			flag ? DIO_MESSAGE : NON_DIO_MESSAGE);
>   
>   	TST_ASSERT_INT(sys_loop_diopath, flag);
>   }
>   
> -static void verify_ioctl_loop(void)
> +static void verify_ioctl_loop(unsigned int n)
>   {
> -	struct loop_info loopinfo;
> -
> -	memset(&loopinfo, 0, sizeof(loopinfo));
> -	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
> +	if (tcases[n].ioctl_flag == LOOP_SET_DIRECT_IO) {
> +		TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
> +
> +		TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
> +		if (TST_RET == 0) {
> +			if (tcases[n].dio_value)
> +				tst_res(TPASS, "set direct io succeeded");
> +			else
> +				tst_res(TPASS, "set direct io succeeded, offset is ignored");
> +			check_dio_value(1);
> +			SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
> +			return;
> +		}
> +		if (TST_ERR == EINVAL && !tcases[n].dio_value)
> +			tst_res(TPASS | TTERRNO,
> +				"set direct io failed as expected");
> +		else
> +			tst_res(TFAIL | TTERRNO, "set direct io failed");
> +		return;
> +	}
> +	/*
> +	 * When we call loop_configure ioctl successfully and detach it,
> +	 * the subquent loop_configure without non-zero lo_offset or
> +	 * sizelimit may trigger the blk_update_request I/O error.
> +	 * To avoid this, sleep 1s to ensure last blk_update_request has
> +	 * completed.
> +	 */
> +	sleep(1);
> +	/*
> +	 * loop_cofigure calls loop_update_dio() function, it will ignore
> +	 * the result of setting dio. It is different from loop_set_dio.
> +	 */
> +	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_CONFIGURE, &loopconfig), TST_RETVAL_EQ0);
> +	check_dio_value(tcases[n].dio_value);
> +	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_CLR_FD, 0), TST_RETVAL_EQ0);
> +}
>   
> -	tst_res(TINFO, "Without setting lo_offset or sizelimit");
> -	SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 1);
> -	check_dio_value(1);
> +static void run(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
>   
> -	SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
> -	check_dio_value(0);
> +	tst_res(TINFO, "%s", tc->message);
>   
> -	tst_res(TINFO, "With offset equal to logical_block_size");
> -	loopinfo.lo_offset = logical_block_size;
> -	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
> -	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
> -	if (TST_RET == 0) {
> -		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded");
> -		check_dio_value(1);
> +	if (tc->ioctl_flag == LOOP_SET_DIRECT_IO) {
> +		if (!attach_flag) {
> +			tst_attach_device(dev_path, "test.img");
> +			attach_flag = 1;
> +		}
>   		SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
> -	} else {
> -		tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed");
> +		check_dio_value(0);
> +		loopinfo.lo_offset = logical_block_size * tc->multi / 2;
> +		verify_ioctl_loop(n);
> +		return;
>   	}
> -
> -	tst_res(TINFO, "With nonzero offset less than logical_block_size");
> -	loopinfo.lo_offset = logical_block_size / 2;
> -	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
> -
> -	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
> -	if (TST_RET == 0) {
> -		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded, offset is ignored");
> -		SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
> +	if (tc->ioctl_flag == LOOP_CONFIGURE && !loop_configure_sup) {
> +		tst_res(TCONF, "LOOP_CONFIGURE ioctl not supported");
>   		return;
>   	}
> -	if (TST_ERR == EINVAL)
> -		tst_res(TPASS | TTERRNO, "LOOP_SET_DIRECT_IO failed as expected");
> -	else
> -		tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed expected EINVAL got");
> +	if (attach_flag) {
> +		SAFE_CLOSE(dev_fd);
> +		tst_detach_device(dev_path);
> +		attach_flag = 0;
> +	}
> +	if (dev_fd < 0)
> +		dev_fd = SAFE_OPEN(dev_path, O_RDWR);
> +	loopconfig.info.lo_offset = logical_block_size * tc->multi / 2;
> +	verify_ioctl_loop(n);
>   }
>   
>   static void setup(void)
>   {
>   	char bd_path[100];
> +	int ret;
>   
>   	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
>   		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");
> @@ -128,8 +192,21 @@ static void setup(void)
>   	SAFE_IOCTL(block_devfd, BLKSSZGET, &logical_block_size);
>   	tst_res(TINFO, "backing dev(%s) logical_block_size is %d", bd_path, logical_block_size);
>   	SAFE_CLOSE(block_devfd);
> +
>   	if (logical_block_size > 512)
>   		TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, logical_block_size), TST_RETVAL_EQ0);
> +
> +	file_fd = SAFE_OPEN("test.img", O_RDWR);
> +	loopconfig.fd = -1;
> +	ret = ioctl(dev_fd, LOOP_CONFIGURE, &loopconfig);
> +	if (ret && errno != EBADF) {
> +		tst_res(TINFO | TERRNO, "LOOP_CONFIGURE is not supported");
> +		loop_configure_sup = 0;
> +		return;
> +	}
> +	loopconfig.block_size = logical_block_size;
> +	loopconfig.fd = file_fd;
> +	loopconfig.info.lo_flags = LO_FLAGS_DIRECT_IO;
>   }
>   
>   static void cleanup(void)
> @@ -138,6 +215,8 @@ static void cleanup(void)
>   		SAFE_CLOSE(dev_fd);
>   	if (block_devfd > 0)
>   		SAFE_CLOSE(block_devfd);
> +	if (file_fd > 0)
> +		SAFE_CLOSE(file_fd);
>   	if (attach_flag)
>   		tst_detach_device(dev_path);
>   }
> @@ -145,7 +224,8 @@ static void cleanup(void)
>   static struct tst_test test = {
>   	.setup = setup,
>   	.cleanup = cleanup,
> -	.test_all = verify_ioctl_loop,
> +	.test = run,
> +	.tcnt = ARRAY_SIZE(tcases),
>   	.needs_root = 1,
>   	.needs_tmpdir = 1,
>   	.needs_drivers = (const char *const []) {
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
