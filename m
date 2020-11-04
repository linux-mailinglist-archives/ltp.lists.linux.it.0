Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 991042A5E99
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 08:12:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CF213C5435
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 08:12:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D37033C2624
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 08:12:10 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id B9C311A0106C
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 08:12:09 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,450,1596470400"; d="scan'208";a="100924279"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Nov 2020 15:12:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 40DEF4CE38AC;
 Wed,  4 Nov 2020 15:12:05 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 4 Nov 2020 15:12:04 +0800
Message-ID: <5FA25444.1080008@cn.fujitsu.com>
Date: Wed, 4 Nov 2020 15:12:04 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
References: <20201104070405.24044-1-po-hsu.lin@canonical.com>
In-Reply-To: <20201104070405.24044-1-po-hsu.lin@canonical.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 40DEF4CE38AC.AFF22
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCHv2] syscalls/quotactl04: add mkfs.ext4 package
 version check
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

Hi Po-Hsu
> The project quota feature was added in e2fsprogs 1.43 [1]:
>    E2fsprogs 1.43 (May 17, 2016)
>      Add support for the ext4 metadata checksum, checksum seed, inline
>      data, encryption, project quota, and read-only features.
>
> The test should be skipped when running with older package, otherwise
> it will fail with:
>    Invalid filesystem option set: quota,project
>
> Use popen and fscanf to get mkfs.ext4 -V output for version
> comparison. This version checking by adding digits together does not
> work with alphabets in the number like rc1, but in that case the test
> will still be tested.
>
> It will now be skipped with (Tested with Ubuntu Xenial + 4.15 kernel):
>    quotactl04.c:118: TCONF: Test needs mkfs.ext4>= 1.43 for encrypt
>    option, test skipped
Commit message is also wrong. But I think maintainer will correct this 
and don't need to send a v3.
>
> [1] http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.42.13
>
> Signed-off-by: Po-Hsu Lin<po-hsu.lin@canonical.com>
> Reviewed-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/syscalls/quotactl/quotactl04.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
> index 73980d7e9..3cc2b974f 100644
> --- a/testcases/kernel/syscalls/quotactl/quotactl04.c
> +++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
> @@ -19,6 +19,8 @@
>    * 7) quotactl(2) succeeds to get disk quota limit greater than or equal to
>    *    ID with Q_GETNEXTQUOTA flag for project.
>    * 8) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for project.
> + *
> + * Minimum e2fsprogs version required is 1.43.
>    */
>
>   #include<errno.h>
> @@ -28,6 +30,7 @@
>   #include<sys/stat.h>
>   #include "config.h"
>   #include "lapi/quotactl.h"
> +#include "tst_safe_stdio.h"
>   #include "tst_test.h"
>
>   #ifndef QFMT_VFS_V1
> @@ -102,9 +105,18 @@ static struct tcase {
>
>   static void setup(void)
>   {
> +	FILE *f;
>   	const char *const fs_opts[] = {"-I 256", "-O quota,project", NULL};
> +	int rc, major, minor, patch;
>
>   	test_id = geteuid();
> +	f = SAFE_POPEN("mkfs.ext4 -V 2>&1", "r");
> +	rc = fscanf(f, "mke2fs %d.%d.%d",&major,&minor,&patch);
> +	if (rc != 3)
> +		tst_res(TWARN, "Unable parse version number");
> +	else if (major * 10000 + minor * 100 + patch<  14300)
> +		tst_brk(TCONF, "Test needs mkfs.ext4>= 1.43 for quota,project option, test skipped");
> +	pclose(f);
>   	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
>   	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
>   	mount_flag = 1;




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
