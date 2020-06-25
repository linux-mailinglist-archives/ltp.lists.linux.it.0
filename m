Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363D20A3C0
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 19:11:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D0C43C2B82
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 19:11:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 444303C1419
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 19:11:21 +0200 (CEST)
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 97EE41000AC4
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 19:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=fMDod
 vjTWnpolAMVr8JYuh1HL1qlGSf5vstnuEqv14U=; b=R/0pLsNDWDucl029UloGr
 o1Xcx4yWthLW4itp+vJNbQ5acsKAZjRrpRW2EYkv/XmOgodDz84Y2iIBluMfqoUN
 RaFZLk5sDD1aHdWXjdKylGkjtmDF6qfN2yJEc2wDKfgbS5xUtArdA3PQLrjnVUVl
 36BSXLdA4EeRt1wah7vo80=
Received: from [192.168.0.109] (unknown [112.22.70.200])
 by smtp11 (Coremail) with SMTP id D8CowAAXHYmt2vReUKwmIQ--.43664S2;
 Fri, 26 Jun 2020 01:11:10 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <660069492.15476972.1591794243308.JavaMail.zimbra@redhat.com>
 <1591853524-17011-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200624113217.GC30917@yuki.lan>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <271ba319-a475-fefa-d6d5-a70d52747863@163.com>
Date: Fri, 26 Jun 2020 01:10:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200624113217.GC30917@yuki.lan>
X-CM-TRANSID: D8CowAAXHYmt2vReUKwmIQ--.43664S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKrW8Jr1fuw48XF1DCFyUZFb_yoWxGFW8pF
 98uF1UGrsxKa4Ivas2qFWfGF1kuw1DW3yjy3yjgw48AF9Fy34xuan7JFW5u3sIqrZIvF95
 Z3Z8GryxKr1UJFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jdR67UUUUU=
X-Originating-IP: [112.22.70.200]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/xtbBdg9OhFUMNkj5DwAAsi
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril

Sorry for late reply.
> Hi!
>> +static void find_backing_bdpath(char *buf)
>> +{
>> +	const char *const df_cmd[] = {"df", "-T", ".", NULL};
>> +	char line[PATH_MAX];
>> +	FILE *file;
>> +
>> +	SAFE_CMD(df_cmd, "1.txt", NULL);
>> +	file = SAFE_FOPEN("1.txt", "r");
>> +
>> +	while (fgets(line, sizeof(line), file) != NULL) {
>> +		sscanf(line, "%s", buf);
>> +		if (strstr(buf, "/dev/") != NULL)
>> +			break;
>> +	}
>> +	SAFE_FCLOSE(file);
>> +}
> 
> I do not like that we are calling df for something like this.
> 
> Looking at what that command does it's not that complex. It does
> statfs() to get minor and major number, then scans /proc/self/mountinfo
> for these, since these are on third column and then just prints whatever
> it's in the 10th column. This isn't more complex that what we have here
> and avoids needs to execute binaries and parse the output.
> 
I look statfs manpage, its buf doesn't have  dev_t type member, I think 
it maybe stat function. But stat function has problem when filsystem 
uses virtual block(such as btrfs,fuse, then major numer is 0).
I try to parse /proc/self/mountinfo(this format is not changed over 
10years), as below:

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c 
b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
index a96997823..d6db9cc83 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
@@ -28,12 +28,13 @@
  #include <sys/mount.h>
  #include "lapi/loop.h"
  #include "tst_test.h"
+#include "tst_safe_stdio.h"

  #define DIO_MESSAGE "In dio mode"
  #define NON_DIO_MESSAGE "In non dio mode"

  static char dev_path[1024], sys_loop_diopath[1024];
-static int dev_num, dev_fd, attach_flag, logical_block_size;
+static int dev_num, dev_fd, block_devfd, attach_flag, logical_block_size;

  static void check_dio_value(int flag)
  {
@@ -94,11 +95,34 @@ static void verify_ioctl_loop(void)
                 tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed 
expected EINVAL got");
  }

-static void setup(void)
+static void find_backing_bdpath(char *buf, char *bd_path)
  {
-       int fd;
-       struct stat buf;
+       char fmt1[1024];
+       char fmt2[1024];
+       char mnt_root[100];
+       char line[PATH_MAX];
+       FILE *file;
+
+       sprintf(fmt1, "%%*i %%*i %%*u:%%*u %%*s %s %%*s %%*s %%*s %%*s 
%%s %%*s", buf);
+       sprintf(fmt2, "%%*i %%*i %%*u:%%*u %%*s %%s %%*s %%*s %%*s %%*s 
%%s %%*s");
+       if (!FILE_LINES_SCANF("/proc/self/mountinfo", fmt1, bd_path)) {
+               tst_res(TINFO, "have %s mntpoint", buf);
+               return;
+       }
+       tst_res(TINFO, "Not have %s mntpoint, try /", buf);
+       file = SAFE_FOPEN("/proc/self/mountinfo", "r");
+       while (fgets(line, sizeof(line), file) != NULL) {
+               sscanf(line, fmt2, mnt_root, bd_path);
+               if(strcmp(mnt_root, "/"))
+                       continue;
+               break;
+       }
+       SAFE_FCLOSE(file);
+}

+static void setup(void)
+{
+       char bd_path[100];
         if (tst_fs_type(".") == TST_TMPFS_MAGIC)
                 tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");

@@ -109,13 +133,6 @@ static void setup(void)
         sprintf(sys_loop_diopath, "/sys/block/loop%d/loop/dio", dev_num);
         tst_fill_file("test.img", 0, 1024, 1024);

-       fd = SAFE_OPEN("test.img", O_RDONLY);
-       SAFE_FSTAT(fd, &buf);
-       SAFE_CLOSE(fd);
-
-       logical_block_size = buf.st_blksize;
-       tst_res(TINFO, "backing dev logical_block_size is %d", 
logical_block_size);
-
         tst_attach_device(dev_path, "test.img");
         attach_flag = 1;
         dev_fd = SAFE_OPEN(dev_path, O_RDWR);
@@ -130,13 +147,21 @@ static void setup(void)
          *   size of loop is bigger than the backing device's and the loop
          *   needn't transform transfer.
          */
-       TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, 
logical_block_size), TST_RETVAL_EQ0);
+       find_backing_bdpath("/tmp", bd_path);
+       block_devfd = SAFE_OPEN(bd_path, O_RDWR);
+       SAFE_IOCTL(block_devfd, BLKSSZGET, &logical_block_size);
+       tst_res(TINFO, "backing dev logical_block_size is %d", 
logical_block_size);
+       SAFE_CLOSE(block_devfd);
+       if (logical_block_size > 512)
+               TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, 
logical_block_size), TST_RETVAL_EQ0);
  }

  static void cleanup(void)
  {
         if (dev_fd > 0)
                 SAFE_CLOSE(dev_fd);
+       if (block_devfd > 0)
+               SAFE_CLOSE(block_devfd);
         if (attach_flag)
                 tst_detach_device(dev_path);
  }
> Also this function could be in a test library probably in tst_device.h.
> 
>>   static void setup(void)
>>   {
>> -	int fd;
>> -	struct stat buf;
>> +	char buf[100];
>>   
>>   	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
>>   		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");
>> @@ -109,13 +126,6 @@ static void setup(void)
>>   	sprintf(sys_loop_diopath, "/sys/block/loop%d/loop/dio", dev_num);
>>   	tst_fill_file("test.img", 0, 1024, 1024);
>>   
>> -	fd = SAFE_OPEN("test.img", O_RDONLY);
>> -	SAFE_FSTAT(fd, &buf);
>> -	SAFE_CLOSE(fd);
>> -
>> -	logical_block_size = buf.st_blksize;
>> -	tst_res(TINFO, "backing dev logical_block_size is %d", logical_block_size);
>> -
>>   	tst_attach_device(dev_path, "test.img");
>>   	attach_flag = 1;
>>   	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
>> @@ -130,13 +140,23 @@ static void setup(void)
>>   	 *   size of loop is bigger than the backing device's and the loop
>>   	 *   needn't transform transfer.
>>   	 */
>> -	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, logical_block_size), TST_RETVAL_EQ0);
>> +	find_backing_bdpath(buf);
>> +	block_devfd = SAFE_OPEN(buf, O_RDWR);
>> +
>> +	SAFE_IOCTL(block_devfd, BLKSSZGET, &logical_block_size);
>> +	tst_res(TINFO, "backing dev logical_block_size is %d", logical_block_size);
>> +	SAFE_CLOSE(block_devfd);
>> +
>> +	if (logical_block_size > 512)
>> +		TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, logical_block_size), TST_RETVAL_EQ0);
>>   }
>>   
>>   static void cleanup(void)
>>   {
>>   	if (dev_fd > 0)
>>   		SAFE_CLOSE(dev_fd);
>> +	if (block_devfd > 0)
>> +		SAFE_CLOSE(block_devfd);
>>   	if (attach_flag)
>>   		tst_detach_device(dev_path);
>>   }
>> @@ -150,5 +170,9 @@ static struct tst_test test = {
>>   	.needs_drivers = (const char *const []) {
>>   		"loop",
>>   		NULL
>> +	},
>> +	.needs_cmds = (const char *const []) {
>> +		"df",
>> +		NULL
>>   	}
>>   };
>> -- 
>> 2.23.0
>>
>>
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
