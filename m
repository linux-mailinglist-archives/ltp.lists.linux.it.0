Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D28130E7E
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 09:15:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 821533C24A8
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 09:15:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3E5E43C2446
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 09:15:26 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 3EDA460126B
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 09:15:19 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; d="scan'208";a="81366529"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 16:15:08 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5D68E49E932B;
 Mon,  6 Jan 2020 16:06:07 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 16:15:07 +0800
To: Sumit Garg <sumit.garg@linaro.org>
References: <1578289125-2491-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAFA6WYOPWBeu75DEopZF=+ZWf-QmGZXj0zcL1GTG7S8ZYq5Xbw@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <76ec2bc6-b06b-08df-f3ca-024f84f9f0d2@cn.fujitsu.com>
Date: Mon, 6 Jan 2020 16:15:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAFA6WYOPWBeu75DEopZF=+ZWf-QmGZXj0zcL1GTG7S8ZYq5Xbw@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5D68E49E932B.AF5F7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_dev_bytes_written: parsing /proc/diskstats
 instead of sys file
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



on 2020/01/06 15:57, Sumit Garg wrote:
> On Mon, 6 Jan 2020 at 11:09, Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>>
>> Now, tst_dev_bytes_written api can get the whole disk stat correctly(such as /dev/sda),
>> but can not get partition stat correctly(such as /dev/sda5).
>> fail as below:
>> export LTP_DEV=/dev/sda5
>> tst_device.c:388: CONF: Test device stat file: /sys/block/sda5/stat not found
>>
>> To fix this, use /proc/diskstats to parse instead of /sys/block/<devices>/stat.
>> Data format as same as diskstats_show function in kernel genhd.c[1].
>>
>> Also, add hint when loop driver doesn't support blk-mq[2]. So that, user can export
>> LTP_DEV to test.
>>
>> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/block/genhd.c
>> [2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b5dd2f60
>>
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> ---
>>   lib/tst_device.c | 26 ++++++++++++--------------
>>   1 file changed, 12 insertions(+), 14 deletions(-)
>>
> 
> Overall patch looks good to me but with minor comments below.
Thanks for your review.
> 
>> diff --git a/lib/tst_device.c b/lib/tst_device.c
>> index 10f71901d..58877c810 100644
>> --- a/lib/tst_device.c
>> +++ b/lib/tst_device.c
>> @@ -375,24 +375,22 @@ int tst_umount(const char *path)
>>
>>   unsigned long tst_dev_bytes_written(const char *dev)
>>   {
>> -       struct stat st;
>> -       unsigned long dev_sec_write = 0, dev_bytes_written, io_ticks = 0;
>> -       char dev_stat_path[1024];
>> -
>> -       snprintf(dev_stat_path, sizeof(dev_stat_path), "/sys/block/%s/stat",
>> -                strrchr(dev, '/') + 1);
>> +       unsigned long dev_sec_write = 0, dev_bytes_written;
>> +       unsigned int io_ticks = 0;
>> +       char fmt[1024];
>>
>> -       if (stat(dev_stat_path, &st) != 0)
>> -               tst_brkm(TCONF, NULL, "Test device stat file: %s not found",
>> -                        dev_stat_path);
>> +       sprintf(fmt, "%%*4d %%*7d %s %%*lu %%*lu %%*lu %%*u %%*lu %%*lu %%lu %%*u %%*u %%u",
>> +                       strrchr(dev, '/') + 1);
>>
>> -       SAFE_FILE_SCANF(NULL, dev_stat_path,
>> -                       "%*s %*s %*s %*s %*s %*s %lu %*s %*s %lu",
>> -                       &dev_sec_write, &io_ticks);
>> +       FILE_LINES_SCANF(NULL, "/proc/diskstats", fmt, &dev_sec_write, &io_ticks);
> 
> Shouldn't we use SAFE_FILE_LINES_SCANF() here?
Yes. I will use SAFE_FILE_LINES_SCANF() in v2.
> 
>>
>> +       /* If we create block device by attaching a free loop device, loop driver
>> +        * needs to support blk-mq(commit b5dd2f6047c), so that kernel can get I/O
>> +        * statistics about loop device.
>> +        */
>>          if (!io_ticks)
>> -               tst_brkm(TCONF, NULL, "Test device stat file: %s broken",
>> -                        dev_stat_path);
>> +               tst_brkm(TCONF, NULL, "Test device %s io_ticks is always 0, "
>> +                               "exporting LTP_DEV to test", dev);
> 
> s/exporting/export/
...
> 
> -Sumit
> 
>>
>>          dev_bytes_written = (dev_sec_write - prev_dev_sec_write) * 512;
>>
>> --
>> 2.18.0
>>
>>
>>
>>
>> --
>> Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
