Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E18516F7BB
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 06:58:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCB4E3C251E
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 06:58:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1A8E03C074B
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 06:58:38 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 66E52100044B
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 06:58:35 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,486,1574092800"; d="scan'208";a="84221617"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Feb 2020 13:58:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0F6FF50A9960;
 Wed, 26 Feb 2020 13:48:43 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 26 Feb 2020 13:58:26 +0800
To: Zorro Lang <zlang@redhat.com>
References: <7c0899c42b8d8434c1cf9ca6b261993a1c09031f.1582612624.git.viresh.kumar@linaro.org>
 <305330ad290ce4802d832e02765b8723a976d4a7.1582627066.git.viresh.kumar@linaro.org>
 <20200226051407.GP14282@dhcp-12-102.nay.redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <652d6eed-d320-fde4-66a9-eefea1996ae3@cn.fujitsu.com>
Date: Wed, 26 Feb 2020 13:58:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200226051407.GP14282@dhcp-12-102.nay.redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0F6FF50A9960.A1772
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 1/10] tst_device: Add tst_is_mounted() helper
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi


> On Tue, Feb 25, 2020 at 04:09:31PM +0530, Viresh Kumar wrote:
>> This patch moves the ismount() helper added to the fsmount syscall tests
>> to the standard library and renames it to tst_is_mounted(). The helper
>> can be used across different files now.
>>
>> Minor modifications are also done to the helper.
>>
>> Acked-by: Li Wang <liwang@redhat.com>
>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>> V3->V4:
>> - s/TWARN/TINFO
>> - Fix commit log.
>>
>>   include/tst_device.h                          |  6 +++++
>>   lib/tst_device.c                              | 23 +++++++++++++++++
>>   testcases/kernel/syscalls/fsmount/fsmount01.c | 25 +------------------
>>   3 files changed, 30 insertions(+), 24 deletions(-)
>>
>> diff --git a/include/tst_device.h b/include/tst_device.h
>> index f5609f5986bb..bd6910672d2f 100644
>> --- a/include/tst_device.h
>> +++ b/include/tst_device.h
>> @@ -36,6 +36,12 @@ extern struct tst_device *tst_device;
>>    */
>>   int tst_umount(const char *path);
>>   
>> +/*
>> + * Verifies if an earlier mount is successful or not.
>> + * @path: Mount path to verify
>> + */
>> +int tst_is_mounted(const char *path);
>> +
>>   /*
>>    * Clears a first few blocks of the device. This is needed when device has
>>    * already been formatted with a filesystems, subset of mkfs.foo utils aborts
>> diff --git a/lib/tst_device.c b/lib/tst_device.c
>> index 8b5459def1cb..d99fb8bc554a 100644
>> --- a/lib/tst_device.c
>> +++ b/lib/tst_device.c
>> @@ -386,6 +386,29 @@ int tst_umount(const char *path)
>>   	return -1;
>>   }
>>   
>> +int tst_is_mounted(const char *path)
>> +{
>> +	char line[256];
>> +	FILE *file;
>> +	int ret = 0;
>> +
>> +	file = SAFE_FOPEN(NULL, "/proc/mounts", "r");
>> +
>> +	while (fgets(line, sizeof(line), file)) {
>> +		if (strstr(line, path) != NULL) {
> 
> This code moving is fine. But if we'd like to make this function to be common
> function, we'd better think more about that. I think the current code logic
> isn't so well.
> 
> For example, if path is "/mnt/test", and we get a line as "/mnt/test/mnt1 ..."
> or "/mnt/mnt/test", Then this function thinks "/mnt/test" is a mountpoint.
> 
> We can refer to util-linux/sys-utils/mountpoint.c a little, but it's complicated,
> or we can call mountpoint command directly?
> 
I think we can use a fixed format to extract it like kernel code
tools/lib/api/fs/fs.c
static bool fs__read_mounts(struct fs *fs)
{
         bool found = false;
         char type[100];
         FILE *fp;

         fp = fopen("/proc/mounts", "r");
         if (fp == NULL)
                 return NULL;

         while (!found &&
                fscanf(fp, "%*s %" STR(PATH_MAX) "s %99s %*s %*d %*d\n",
                       fs->path, type) == 2) {

                 if (strcmp(type, fs->name) == 0)
                         found = true;
         }

         fclose(fp);
         return fs->found = found;
}

But this way maybe wrong if kernel updates mount info format in future.

Best Regards
Yang Xu
>> +			ret = 1;
>> +			break;
>> +		}
>> +	}
>> +
>> +	SAFE_FCLOSE(NULL, file);
>> +
>> +	if (!ret)
>> +		tst_resm(TINFO, "No device is mounted at %s", path);
>> +
>> +	return ret;
>> +}
>> +
>>   int find_stat_file(const char *dev, char *path, size_t path_len)
>>   {
>>   	const char *devname = strrchr(dev, '/') + 1;
>> diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
>> index 83185b48aedd..8e29a1537334 100644
>> --- a/testcases/kernel/syscalls/fsmount/fsmount01.c
>> +++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
>> @@ -12,30 +12,10 @@
>>   #include "tst_test.h"
>>   #include "lapi/fcntl.h"
>>   #include "lapi/fsmount.h"
>> -#include "tst_safe_stdio.h"
>>   
>> -#define LINELENGTH 256
>>   #define MNTPOINT "newmount_point"
>>   static int sfd, mfd, is_mounted;
>>   
>> -static int ismount(char *mntpoint)
>> -{
>> -	int ret = 0;
>> -	FILE *file;
>> -	char line[LINELENGTH];
>> -
>> -	file = SAFE_FOPEN("/proc/mounts", "r");
>> -
>> -	while (fgets(line, sizeof(line), file)) {
>> -		if (strstr(line, mntpoint) != NULL) {
>> -			ret = 1;
>> -			break;
>> -		}
>> -	}
>> -	SAFE_FCLOSE(file);
>> -	return ret;
>> -}
>> -
>>   static void cleanup(void)
>>   {
>>   	if (is_mounted)
>> @@ -76,12 +56,9 @@ static void test_fsmount(void)
>>   	tst_res(TPASS, "move_mount() attached to the mount point");
>>   	SAFE_CLOSE(mfd);
>>   
>> -	if (ismount(MNTPOINT)) {
>> -		tst_res(TPASS, "device mounted");
>> +	if (tst_is_mounted(MNTPOINT)) {
>>   		SAFE_UMOUNT(MNTPOINT);
>>   		is_mounted = 0;
>> -	} else {
>> -		tst_res(TFAIL, "device not mounted");
>>   	}
>>   }
>>   
>> -- 
>> 2.21.0.rc0.269.g1a574e7a288b
>>
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
