Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892220721C
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 13:32:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CACCC3C2BA1
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 13:32:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3649F3C2A1D
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 13:32:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A1F0C600A94
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 13:31:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 413D3AF2A;
 Wed, 24 Jun 2020 11:31:58 +0000 (UTC)
Date: Wed, 24 Jun 2020 13:32:17 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200624113217.GC30917@yuki.lan>
References: <660069492.15476972.1591794243308.JavaMail.zimbra@redhat.com>
 <1591853524-17011-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591853524-17011-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/ioctl_loop05: Use correct blockdev to
 get logical_block_size
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
> +static void find_backing_bdpath(char *buf)
> +{
> +	const char *const df_cmd[] = {"df", "-T", ".", NULL};
> +	char line[PATH_MAX];
> +	FILE *file;
> +
> +	SAFE_CMD(df_cmd, "1.txt", NULL);
> +	file = SAFE_FOPEN("1.txt", "r");
> +
> +	while (fgets(line, sizeof(line), file) != NULL) {
> +		sscanf(line, "%s", buf);
> +		if (strstr(buf, "/dev/") != NULL)
> +			break;
> +	}
> +	SAFE_FCLOSE(file);
> +}

I do not like that we are calling df for something like this.

Looking at what that command does it's not that complex. It does
statfs() to get minor and major number, then scans /proc/self/mountinfo
for these, since these are on third column and then just prints whatever
it's in the 10th column. This isn't more complex that what we have here
and avoids needs to execute binaries and parse the output.

Also this function could be in a test library probably in tst_device.h.

>  static void setup(void)
>  {
> -	int fd;
> -	struct stat buf;
> +	char buf[100];
>  
>  	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
>  		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");
> @@ -109,13 +126,6 @@ static void setup(void)
>  	sprintf(sys_loop_diopath, "/sys/block/loop%d/loop/dio", dev_num);
>  	tst_fill_file("test.img", 0, 1024, 1024);
>  
> -	fd = SAFE_OPEN("test.img", O_RDONLY);
> -	SAFE_FSTAT(fd, &buf);
> -	SAFE_CLOSE(fd);
> -
> -	logical_block_size = buf.st_blksize;
> -	tst_res(TINFO, "backing dev logical_block_size is %d", logical_block_size);
> -
>  	tst_attach_device(dev_path, "test.img");
>  	attach_flag = 1;
>  	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
> @@ -130,13 +140,23 @@ static void setup(void)
>  	 *   size of loop is bigger than the backing device's and the loop
>  	 *   needn't transform transfer.
>  	 */
> -	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, logical_block_size), TST_RETVAL_EQ0);
> +	find_backing_bdpath(buf);
> +	block_devfd = SAFE_OPEN(buf, O_RDWR);
> +
> +	SAFE_IOCTL(block_devfd, BLKSSZGET, &logical_block_size);
> +	tst_res(TINFO, "backing dev logical_block_size is %d", logical_block_size);
> +	SAFE_CLOSE(block_devfd);
> +
> +	if (logical_block_size > 512)
> +		TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, logical_block_size), TST_RETVAL_EQ0);
>  }
>  
>  static void cleanup(void)
>  {
>  	if (dev_fd > 0)
>  		SAFE_CLOSE(dev_fd);
> +	if (block_devfd > 0)
> +		SAFE_CLOSE(block_devfd);
>  	if (attach_flag)
>  		tst_detach_device(dev_path);
>  }
> @@ -150,5 +170,9 @@ static struct tst_test test = {
>  	.needs_drivers = (const char *const []) {
>  		"loop",
>  		NULL
> +	},
> +	.needs_cmds = (const char *const []) {
> +		"df",
> +		NULL
>  	}
>  };
> -- 
> 2.23.0
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
