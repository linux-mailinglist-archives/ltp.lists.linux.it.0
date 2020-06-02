Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F771EB7BC
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 10:57:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A35B53C302E
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 10:57:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0355E3C232C
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 10:57:24 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 61CAC600C31
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 10:56:47 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,463,1583164800"; d="scan'208";a="93650548"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Jun 2020 16:57:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id BBB4A50A996E;
 Tue,  2 Jun 2020 16:57:15 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Jun 2020 16:57:14 +0800
To: Jan Stancek <jstancek@redhat.com>, <ltp@lists.linux.it>
References: <0e99163dd0deef5e3c0e7276533998e80a93d16e.1591016352.git.jstancek@redhat.com>
 <2f353cb69600740308c196dcfa8f570ba6420bfa.1591087232.git.jstancek@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <4e69e550-d11e-2b0a-2e98-36b186b983e7@cn.fujitsu.com>
Date: Tue, 2 Jun 2020 16:57:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <2f353cb69600740308c196dcfa8f570ba6420bfa.1591087232.git.jstancek@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BBB4A50A996E.AF106
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl_loop05: set loop blksize to
 bdev blksize
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

Hi Jan

Looks good to me, acked.
> Test is failing on s390, where default loop blksize is less than
> backing dev's blksize (4096):
>    tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
>    tst_device.c:88: INFO: Found free device 0 '/dev/loop0'
>    ioctl_loop05.c:116: INFO: /dev/loop0 default logical_block_size is 512
>    ioctl_loop05.c:62: INFO: Without setting lo_offset or sizelimit
>    ioctl_loop05.c:63: BROK: ioctl(3,LOOP_SET_DIRECT_IO,...) failed: EINVAL (22)
> 
> Per kernel comment at __loop_update_dio(), direct io is supported
> when ".. logical block size of loop is bigger than the backing device's".
> 
> Set loop blksize to one of backing device. Retry is there to avoid
> EAGAIN warning "loop0 (test.img) has still dirty pages".
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>   .../kernel/syscalls/ioctl/ioctl_loop05.c      | 26 +++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> Changes in v2:
> - check if LOOP_SET_BLOCK_SIZE is supported in setup()
> 
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> index 6c9ea2802981..2a3c127959aa 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> @@ -96,6 +96,9 @@ static void verify_ioctl_loop(void)
>   
>   static void setup(void)
>   {
> +	int fd;
> +	struct stat buf;
> +
>   	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
>   		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");
>   
> @@ -105,6 +108,14 @@ static void setup(void)
>   
>   	sprintf(sys_loop_diopath, "/sys/block/loop%d/loop/dio", dev_num);
>   	tst_fill_file("test.img", 0, 1024, 1024);
> +
> +	fd = SAFE_OPEN("test.img", O_RDONLY);
> +	SAFE_FSTAT(fd, &buf);
> +	SAFE_CLOSE(fd);
> +
> +	logical_block_size = buf.st_blksize;
> +	tst_res(TINFO, "backing dev logical_block_size is %d", logical_block_size);
> +
>   	tst_attach_device(dev_path, "test.img");
>   	attach_flag = 1;
>   	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
> @@ -112,8 +123,19 @@ static void setup(void)
>   	if (ioctl(dev_fd, LOOP_SET_DIRECT_IO, 0) && errno == EINVAL)
>   		tst_brk(TCONF, "LOOP_SET_DIRECT_IO is not supported");
>   
> -	SAFE_IOCTL(dev_fd, BLKSSZGET, &logical_block_size);
> -	tst_res(TINFO, "%s default logical_block_size is %d", dev_path, logical_block_size);
> +	/*
> +	 * from __loop_update_dio():
> +	 *   We support direct I/O only if lo_offset is aligned with the
> +	 *   logical I/O size of backing device, and the logical block
> +	 *   size of loop is bigger than the backing device's and the loop
> +	 *   needn't transform transfer.
> +	 */
> +	if (ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, logical_block_size) != 0) {
> +		if (errno == EINVAL)
> +			tst_brk(TCONF, "LOOP_SET_BLOCK_SIZE is not supported");
> +		TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE,
> +			logical_block_size), TST_RETVAL_EQ0);
> +	}
>   }
>   
>   static void cleanup(void)
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
