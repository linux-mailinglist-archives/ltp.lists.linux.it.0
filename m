Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1611AD66E
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 08:44:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9402E3C2AEC
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 08:44:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E57233C2ABC
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 08:44:27 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 3127B1A0037B
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 08:44:23 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,393,1580745600"; d="scan'208";a="89190588"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Apr 2020 14:44:18 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id E9F8549DF129
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 14:33:45 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 17 Apr 2020 14:44:17 +0800
Message-ID: <5E99503E.5000501@cn.fujitsu.com>
Date: Fri, 17 Apr 2020 14:44:14 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <20200415080854.65971-1-yangx.jy@cn.fujitsu.com>
 <46688436-6cd6-d5c5-4444-2e260686cc7e@cn.fujitsu.com>
In-Reply-To: <46688436-6cd6-d5c5-4444-2e260686cc7e@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E9F8549DF129.AB5ED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/{quotactl04,
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1106546792=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1106546792==
Content-Type: text/plain; charset="x-gbk"; format=flowed
Content-Transfer-Encoding: 7bit

On 2020/4/17 12:43, Yang Xu wrote:
> Hi Xiao
>
>
>> extra_opts[] is to store the options which are passed after device name
>> (e.g. fs-size: mkfs -t ext4 /dev/sda1 <fs-size>) so perfer to use
>> fs_opts[] for quotactl04.c and statx05.c.
> Looks good to me, I guess we can add comment in
> test-writing-guidelines.txt ie:
> "If options can be passed before or after device name, 'fs_opts' is
> preferred."
Hi Xu,

Thanks for your comment.
I will add a hint to doc/test-writing-guidelines.txt.

Thanks,
Xiao Yang
>
> Best Regards
> Yang Xu
>>
>> References:
>> https://github.com/linux-test-project/ltp/blob/master/doc/test-writing-guidelines.txt
>>
>> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/mmap/mmap16.c
>>
>>
>> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
>> ---
>> testcases/kernel/syscalls/quotactl/quotactl04.c | 4 ++--
>> testcases/kernel/syscalls/statx/statx05.c | 4 ++--
>> 2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c
>> b/testcases/kernel/syscalls/quotactl/quotactl04.c
>> index 8dab83da0..b0db8fe5d 100644
>> --- a/testcases/kernel/syscalls/quotactl/quotactl04.c
>> +++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
>> @@ -102,10 +102,10 @@ static struct tcase {
>> static void setup(void)
>> {
>> - const char *const extra_opts[] = {"-O quota,project", NULL};
>> + const char *const fs_opts[] = {"-O quota,project", NULL};
>> test_id = geteuid();
>> - SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, extra_opts);
>> + SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
>> SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
>> mount_flag = 1;
>> }
>> diff --git a/testcases/kernel/syscalls/statx/statx05.c
>> b/testcases/kernel/syscalls/statx/statx05.c
>> index 42911fc17..77684e1ed 100644
>> --- a/testcases/kernel/syscalls/statx/statx05.c
>> +++ b/testcases/kernel/syscalls/statx/statx05.c
>> @@ -87,12 +87,12 @@ static void run(unsigned int i)
>> static void setup(void)
>> {
>> char opt_bsize[32];
>> - const char *const extra_opts[] = {"-O encrypt", opt_bsize, NULL};
>> + const char *const fs_opts[] = {"-O encrypt", opt_bsize, NULL};
>> int ret;
>> snprintf(opt_bsize, sizeof(opt_bsize), "-b %i", getpagesize());
>> - SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, extra_opts);
>> + SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
>> SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, 0);
>> mount_flag = 1;
>>
> .
>




--===============1106546792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1106546792==--
