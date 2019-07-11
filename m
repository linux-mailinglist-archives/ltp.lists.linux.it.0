Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 193E0651C6
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 08:19:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9621F3C1D0A
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 08:19:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2A2AE3C03AD
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 08:19:07 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id AFEF12002B3
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 08:19:03 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,476,1557158400"; d="scan'208";a="71162157"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jul 2019 14:18:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 274DA4CDDD5C;
 Thu, 11 Jul 2019 14:19:00 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 11 Jul 2019 14:19:00 +0800
Message-ID: <5D26D4D3.9010009@cn.fujitsu.com>
Date: Thu, 11 Jul 2019 14:18:59 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Xiao Yang <ice_yangxiao@163.com>
References: <5D25B05A.8000600@cn.fujitsu.com>
 <1562755997-5626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1562755997-5626-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <139fc7e8-0116-acd2-6041-8e82a6e4f18d@163.com>
In-Reply-To: <139fc7e8-0116-acd2-6041-8e82a6e4f18d@163.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 274DA4CDDD5C.AED0C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/3] syscalls/copy_file_range01: add
 cross-device test
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

on 2019/07/10 23:56, Xiao Yang wrote:

> On 07/10/2019 06:53 PM, Yang Xu wrote:
>> Amir has relaxed cross-device constraint since commit(vfs: allow
>> copy_file_range to copy across devices), I think we can remove it
>> in copy_file_range02 and test it in copy_file_range01.
>>
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
>> ---
>>   .../copy_file_range/copy_file_range01.c       | 53 +++++++++++++++----
>>   1 file changed, 42 insertions(+), 11 deletions(-)
>>
>> diff --git 
>> a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c 
>> b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
>> index a5bd5e7f7..e1aa06c3e 100644
>> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
>> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
>> @@ -24,7 +24,17 @@
>>     static int page_size;
>>   static int errcount, numcopies;
>> -static int fd_in, fd_out;
>> +static int fd_in, fd_out, cross_sup;
>> +char FILE_TARGET_PATH[40];
>> +
>> +static struct tcase {
>> +    char    *path;
>> +    int     flags;
>> +    char    *message;
>> +} tcases[] = {
>> +    {FILE_DEST_PATH,  0, "non cross-device"},
>> +    {FILE_MNTED_PATH, 1, "cross-device"},
>> +};
>>     static int check_file_content(const char *fname1, const char 
>> *fname2,
>>       loff_t *off1, loff_t *off2, size_t len)
>> @@ -131,7 +141,7 @@ static void test_one(size_t len, loff_t *off_in, 
>> loff_t *off_out)
>>           to_copy -= TST_RET;
>>       } while (to_copy > 0);
>>   -    ret = check_file_content(FILE_SRC_PATH, FILE_DEST_PATH,
>> +    ret = check_file_content(FILE_SRC_PATH, FILE_TARGET_PATH,
>>           off_in, off_out, len);
>>       if (ret) {
>>           tst_res(TFAIL, "file contents do not match");
>> @@ -152,7 +162,7 @@ static void test_one(size_t len, loff_t *off_in, 
>> loff_t *off_out)
>>   static void open_files(void)
>>   {
>>       fd_in  = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY);
>> -    fd_out = SAFE_OPEN(FILE_DEST_PATH, O_CREAT | O_WRONLY | O_TRUNC, 
>> 0644);
>> +    fd_out = SAFE_OPEN(FILE_TARGET_PATH, O_CREAT | O_WRONLY | 
>> O_TRUNC, 0644);
> Hi,
>
> Why don't we remove the global FILE_TARGET_PATH by passing tc->path to 
> open_files()?
OK. I will remove it and pass tc->path to open_files() ,test_one();

>
>>   }
>>     static void close_files(void)
>> @@ -163,9 +173,18 @@ static void close_files(void)
>>           SAFE_CLOSE(fd_in);
>>   }
>>   -static void copy_file_range_verify(void)
>> +static void copy_file_range_verify(unsigned int n)
>>   {
>>       int i, j, k;
>> +    struct tcase *tc = &tcases[n];
>> +
>> +    if (tc->flags && !cross_sup) {
>> +        tst_res(TCONF,
>> +            "copy_file_range doesn't support cross-device, skip it");
>> +        return;
>> +    }
>
> Perhaps, we can remove the global cross_sup and check of EXDEV in 
> setup() by passing tc->flag to one_test().
OK. I will use tc->flag in setup,  flag =2 is equal to TCONF(doesn't support cross-dev).

>
>> +
>> +    strcpy(FILE_TARGET_PATH, tc->path);
>>         errcount = numcopies = 0;
>>       size_t len_arr[]    = {11, page_size-1, page_size, page_size+1};
>> @@ -190,25 +209,33 @@ static void copy_file_range_verify(void)
>>         if (errcount == 0)
>>           tst_res(TPASS,
>> -            "copy_file_range completed all %d copy jobs successfully!",
>> -            numcopies);
>> +            "%s copy_file_range completed all %d copy jobs 
>> successfully!",
>> +            tc->message, numcopies);
>>       else
>> -        tst_res(TFAIL, "copy_file_range failed %d of %d copy jobs.",
>> -                errcount, numcopies);
>> +        tst_res(TFAIL, "%s copy_file_range failed %d of %d copy jobs.",
>> +            tc->message, errcount, numcopies);
>>   }
>>     static void setup(void)
>>   {
>> -    int i, fd;
>> +    int i, fd, fd_test;
>>         syscall_info();
>>         page_size = getpagesize();
>> -
>> +    cross_sup = 1;
>>       fd = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
>>       /* Writing page_size * 4 of data into test file */
>>       for (i = 0; i < (int)(page_size * 4); i++)
>>           SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
>> +
>> +    fd_test = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
>> +    TEST(sys_copy_file_range(fd, 0, fd_test, 0, CONTSIZE, 0));
>> +    if (TST_ERR == EXDEV)
>> +        cross_sup = 0;
>> +
>> +    SAFE_CLOSE(fd_test);
>> +    remove(FILE_MNTED_PATH);
> Is it necessary to remove it?
>
I want to test on a clean environment, like FILE_DEST_PATH.
> Best Regards,
> Xiao Yang
>>       SAFE_CLOSE(fd);
>>   }
>>   @@ -220,7 +247,11 @@ static void cleanup(void)
>>   static struct tst_test test = {
>>       .setup = setup,
>>       .cleanup = cleanup,
>> +    .tcnt = ARRAY_SIZE(tcases),
>>       .needs_tmpdir = 1,
>> -    .test_all = copy_file_range_verify,
>> +    .mount_device = 1,
>> +    .mntpoint = MNTPOINT,
>> +    .all_filesystems = 1,
>> +    .test = copy_file_range_verify,
>>       .test_variants = TEST_VARIANTS,
>>   };
>
>
>
>
> .
>



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
