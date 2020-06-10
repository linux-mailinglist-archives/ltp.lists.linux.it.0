Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F3A1F5292
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 12:43:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F17493C2E1F
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 12:42:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 253E13C1CA9
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 12:42:57 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E8E85600EA2
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 12:42:56 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,495,1583164800"; d="scan'208";a="94240895"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jun 2020 18:42:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8831F4CE26D3;
 Wed, 10 Jun 2020 18:42:48 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Jun 2020 18:42:48 +0800
To: Jan Stancek <jstancek@redhat.com>
References: <828833321.15301509.1591700517554.JavaMail.zimbra@redhat.com>
 <1591767427-29383-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1904123764.15455071.1591784009893.JavaMail.zimbra@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <787d0f86-269b-1e23-2631-2c420d6dd884@cn.fujitsu.com>
Date: Wed, 10 Jun 2020 18:42:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1904123764.15455071.1591784009893.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8831F4CE26D3.AF3AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl_loop05: Use correct blockdev to
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

Hi Jan


> 
> 
> ----- Original Message -----
>>
>> Using df cmd (df -T /tmp/xxxxx/test.img)to get the correct block dev.
> 
> What I had in mind was to take "df -T" as inspiration, not call it directly,
> but that could work too. See notes below.
> 
>> +static void find_backing_bdpath(char *buf)
>> +{
>> +	char line[PATH_MAX];
>> +	FILE *file;
>> +
>> +	file = SAFE_FOPEN("1.txt", "r");
>> +
>> +	while (fgets(line, sizeof(line), file) != NULL)
>> +		sscanf(line, "%s", buf);
> 
> This will take the last line of output, which can be a problem as some
> version align output differently. For example:
> 
> # df -T .
> Filesystem           Type 1K-blocks    Used Available Use% Mounted on
> /dev/mapper/vg_dhcp13579-lv_root
>                       ext4  46967160 3102232  41472456   7% /
> 
> can break output into two lines.
Yes.
> 
>> +	SAFE_FCLOSE(file);
>> +}
>> +
>>   static void setup(void)
>>   {
>> -	int fd;
>> -	struct stat buf;
>> +	char buf[100];
>> +	const char *const df_cmd[] = {"df", "-T", ".", NULL};
>>   
>>   	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
>>   		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");
>> @@ -109,13 +122,6 @@ static void setup(void)
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
>> @@ -130,13 +136,24 @@ static void setup(void)
>>   	 *   size of loop is bigger than the backing device's and the loop
>>   	 *   needn't transform transfer.
>>   	 */
>> -	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, logical_block_size),
>> TST_RETVAL_EQ0);
>> +	SAFE_CMD(df_cmd, "1.txt", NULL);
> 
> This could be part of find_backing_bdpath() function.
Yes.
> 
> What I had in mind when I referred to df was something like:
>    stat("test.img", &statbuf);
>    SAFE_MKNOD("blkdev", S_IFBLK | S_IRWXU, statbuf.st_dev);
>    block_devfd = SAFE_OPEN("blkdev", O_RDWR);
> What do you think?
> 
Oh, yes, it is more easier (I have tried this). I will send a v3 for this.

ps: I think I can use this in my other loop patches for loop_configure 
ioctl.
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
