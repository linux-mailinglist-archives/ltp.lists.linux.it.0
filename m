Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBE91ADEA2
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 15:44:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EEA23C2AE0
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 15:44:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 971F43C2AD7
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 15:44:56 +0200 (CEST)
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 094D71A00EF3
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 15:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=F97OY
 gvFA8i06zS6cvKWOKiGrti4eC4i19wB7R61ABk=; b=d6XA5dnHO/z5me0Zt90U8
 tPFd1Mi5rreGG5WtLky/4SmUzwN1E1qvFHdozmEC5PBO1aTI29HETJc87gIjwS2C
 VKDfvOkpKKGQLfVgijYz47A121fMN1FEuP/Pv+LdfpcjJ9kZ/WCj6Z1p4paVcKaQ
 wjGdxPFug22sCy60v2Lzjw=
Received: from [192.168.0.10] (unknown [183.211.129.103])
 by smtp9 (Coremail) with SMTP id DcCowADX3yvHspleigDhAQ--.384S2;
 Fri, 17 Apr 2020 21:44:40 +0800 (CST)
To: Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it
References: <20200417063943.309285-1-yangx.jy@cn.fujitsu.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <f5b4139a-11fd-c24a-049a-c6941c87a7e4@163.com>
Date: Fri, 17 Apr 2020 21:44:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200417063943.309285-1-yangx.jy@cn.fujitsu.com>
Content-Language: en-US
X-CM-TRANSID: DcCowADX3yvHspleigDhAQ--.384S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFyxCF1UCr1UJw17WF1kAFb_yoW5Zryrpr
 s7Gayqkwn3Jr18Kr18A3WFyFWUXwn0k3WFkr4qkrsxK348Xr95t39Iqa45Wwn7JFW8uay3
 Crs5WrWFga1UWFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j_NVkUUUUU=
X-Originating-IP: [183.211.129.103]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiqAgJXlc7OkkTwAAAs7
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/{quotactl04,
 statx05}.c: Replace extra_opts[] with fs_opts[]
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
Cc: lkp@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

This is a simple patch set so I pushed it.

Thanks,

Xiao Yang

On 4/17/20 2:39 PM, Xiao Yang wrote:
> extra_opts[] is to store the options which are passed after device name
> (e.g. fs-size: mkfs -t ext4 /dev/sda1 <fs-size>) so perfer to use
> fs_opts[] for quotactl04.c and statx05.c.
>
> Also add a hint to doc/test-writing-guidelines.txt.
>
> References:
> https://github.com/linux-test-project/ltp/blob/master/doc/test-writing-guidelines.txt
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/mmap/mmap16.c
>
> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> Acked-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   doc/test-writing-guidelines.txt                 | 3 +++
>   testcases/kernel/syscalls/quotactl/quotactl04.c | 4 ++--
>   testcases/kernel/syscalls/statx/statx05.c       | 4 ++--
>   3 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
> index 895f6c99d..3e33fd4c1 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1116,6 +1116,9 @@ The extra options 'extra_opts' should either be 'NULL' if there are none, or a
>   will be passed after device name. e.g: +mkfs -t ext4 -b 1024 /dev/sda1 102400+
>   in this case.
>   
> +Note that perfer to store the options which can be passed before or after device
> +name by 'fs_opts' array.
> +
>   2.2.17 Verifying a filesystem's free space
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   
> diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
> index 8dab83da0..b0db8fe5d 100644
> --- a/testcases/kernel/syscalls/quotactl/quotactl04.c
> +++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
> @@ -102,10 +102,10 @@ static struct tcase {
>   
>   static void setup(void)
>   {
> -	const char *const extra_opts[] = {"-O quota,project", NULL};
> +	const char *const fs_opts[] = {"-O quota,project", NULL};
>   
>   	test_id = geteuid();
> -	SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, extra_opts);
> +	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
>   	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
>   	mount_flag = 1;
>   }
> diff --git a/testcases/kernel/syscalls/statx/statx05.c b/testcases/kernel/syscalls/statx/statx05.c
> index 42911fc17..77684e1ed 100644
> --- a/testcases/kernel/syscalls/statx/statx05.c
> +++ b/testcases/kernel/syscalls/statx/statx05.c
> @@ -87,12 +87,12 @@ static void run(unsigned int i)
>   static void setup(void)
>   {
>   	char opt_bsize[32];
> -	const char *const extra_opts[] = {"-O encrypt", opt_bsize, NULL};
> +	const char *const fs_opts[] = {"-O encrypt", opt_bsize, NULL};
>   	int ret;
>   
>   	snprintf(opt_bsize, sizeof(opt_bsize), "-b %i", getpagesize());
>   
> -	SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, extra_opts);
> +	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
>   	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, 0);
>   	mount_flag = 1;
>   


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
