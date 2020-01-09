Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BC825135517
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 10:03:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 748873C24CF
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 10:03:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 93B8C3C24AB
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 10:03:51 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 32D0210014B5
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 10:03:49 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,413,1571673600"; d="scan'208";a="81537026"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Jan 2020 17:03:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2055E4CE1CB0;
 Thu,  9 Jan 2020 16:54:46 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 9 Jan 2020 17:03:45 +0800
To: Cyril Hrubis <chrubis@suse.cz>, <ltp@lists.linux.it>
References: <20200108134807.27001-1-chrubis@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <278a5c21-348e-5fd8-f33f-82e267028710@cn.fujitsu.com>
Date: Thu, 9 Jan 2020 17:03:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200108134807.27001-1-chrubis@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2055E4CE1CB0.AC38B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: Scan /sys/block/* for stat file
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
> The current tst_dev_bytes_written() function works only for simple cases
> where the block device is not divided into partitions. This patch fixes
> that scannning the sysfiles for pattern /sys/block/*/devname/stat.
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> CC: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> CC: Sumit Garg <sumit.garg@linaro.org>
> ---
>   lib/tst_device.c | 33 ++++++++++++++++++++++++++++-----
>   1 file changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index 10f71901d..aca769559 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -373,16 +373,39 @@ int tst_umount(const char *path)
>   	return -1;
>   }
>   
> +int find_stat_file(const char *dev, char *path, size_t path_len)
> +{
> +	const char *devname = strrchr(dev, '/') + 1;
> +
> +	snprintf(path, path_len, "/sys/block/%s/stat", devname);
> +
> +	if (!access(path, F_OK))
> +		return 1;
> +
> +	DIR *dir = SAFE_OPENDIR(NULL, "/sys/block/");
> +	struct dirent *ent;
> +
> +	while ((ent = readdir(dir))) {
> +		snprintf(path, path_len, "/sys/block/%s/%s/stat", ent->d_name, devname);
> +
> +		fprintf(stderr, "%s\n", path);
> +
It will make many noise when using .all_filesystem and we can remove it. 
Other than, it looks good to me.
> +		if (!access(path, F_OK)) {
> +			SAFE_CLOSEDIR(NULL, dir);
> +			return 1;
> +		}
> +	}
> +
> +	SAFE_CLOSEDIR(NULL, dir);
> +	return 0;
> +}
> +
>   unsigned long tst_dev_bytes_written(const char *dev)
>   {
> -	struct stat st;
>   	unsigned long dev_sec_write = 0, dev_bytes_written, io_ticks = 0;
>   	char dev_stat_path[1024];
>   
> -	snprintf(dev_stat_path, sizeof(dev_stat_path), "/sys/block/%s/stat",
> -		 strrchr(dev, '/') + 1);
> -
> -	if (stat(dev_stat_path, &st) != 0)
> +	if (!find_stat_file(dev, dev_stat_path, sizeof(dev_stat_path)))
>   		tst_brkm(TCONF, NULL, "Test device stat file: %s not found",
>   			 dev_stat_path);
>   
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
