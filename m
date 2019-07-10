Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1016164A30
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 17:56:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A8CD03C1C7C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 17:56:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5C8CB3C02C3
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 17:56:43 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 840CE1A016DC
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 17:56:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=G+xCW
 5fHPr8PHHqSA9gPai/QgvUEFz7JlysGlaMw3lE=; b=ZLgFDjsoh8njDiDchO/IQ
 GDrocQqY5FwvgTIuiG+S/pqu4pjqgZPfxI+3FT4PNMzBSd/SPW63IGyL+hkoG+mj
 JUWQmCI9R9znhi8AfoVbgO73kXVlcQVhw3nfcqQzmxYMEn3TNv7cSrlfOb3YwhGl
 OQYJYMfio+M6LoSW8bg9JQ=
Received: from [192.168.41.2] (unknown [121.237.61.237])
 by smtp8 (Coremail) with SMTP id DMCowAA3mgy1CiZdiQxuBw--.58410S2;
 Wed, 10 Jul 2019 23:56:38 +0800 (CST)
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, amir73il@gmail.com
References: <5D25B05A.8000600@cn.fujitsu.com>
 <1562755997-5626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1562755997-5626-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <139fc7e8-0116-acd2-6041-8e82a6e4f18d@163.com>
Date: Wed, 10 Jul 2019 23:56:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1562755997-5626-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Content-Language: en-US
X-CM-TRANSID: DMCowAA3mgy1CiZdiQxuBw--.58410S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXrWfZr4DKF4DZw1fAr4ruFg_yoWrCF48pw
 s8Wa1rtFs8XFyxJFyfXFs8ZFW5ZrnFgrW8Z34UZFWkJFs5ZF98JFZ8Ga4j9r4UWr97AFW8
 ua1qgryfC3Z2y3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bcKsUUUUUU=
X-Originating-IP: [121.237.61.237]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEg3tXlZYDWRNBgAAsA
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

On 07/10/2019 06:53 PM, Yang Xu wrote:
> Amir has relaxed cross-device constraint since commit(vfs: allow
> copy_file_range to copy across devices), I think we can remove it
> in copy_file_range02 and test it in copy_file_range01.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
>   .../copy_file_range/copy_file_range01.c       | 53 +++++++++++++++----
>   1 file changed, 42 insertions(+), 11 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> index a5bd5e7f7..e1aa06c3e 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> @@ -24,7 +24,17 @@
>   
>   static int page_size;
>   static int errcount, numcopies;
> -static int fd_in, fd_out;
> +static int fd_in, fd_out, cross_sup;
> +char FILE_TARGET_PATH[40];
> +
> +static struct tcase {
> +	char    *path;
> +	int     flags;
> +	char    *message;
> +} tcases[] = {
> +	{FILE_DEST_PATH,  0, "non cross-device"},
> +	{FILE_MNTED_PATH, 1, "cross-device"},
> +};
>   
>   static int check_file_content(const char *fname1, const char *fname2,
>   	loff_t *off1, loff_t *off2, size_t len)
> @@ -131,7 +141,7 @@ static void test_one(size_t len, loff_t *off_in, loff_t *off_out)
>   		to_copy -= TST_RET;
>   	} while (to_copy > 0);
>   
> -	ret = check_file_content(FILE_SRC_PATH, FILE_DEST_PATH,
> +	ret = check_file_content(FILE_SRC_PATH, FILE_TARGET_PATH,
>   		off_in, off_out, len);
>   	if (ret) {
>   		tst_res(TFAIL, "file contents do not match");
> @@ -152,7 +162,7 @@ static void test_one(size_t len, loff_t *off_in, loff_t *off_out)
>   static void open_files(void)
>   {
>   	fd_in  = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY);
> -	fd_out = SAFE_OPEN(FILE_DEST_PATH, O_CREAT | O_WRONLY | O_TRUNC, 0644);
> +	fd_out = SAFE_OPEN(FILE_TARGET_PATH, O_CREAT | O_WRONLY | O_TRUNC, 0644);
Hi,

Why don't we remove the global FILE_TARGET_PATH by passing tc->path to 
open_files()?

>   }
>   
>   static void close_files(void)
> @@ -163,9 +173,18 @@ static void close_files(void)
>   		SAFE_CLOSE(fd_in);
>   }
>   
> -static void copy_file_range_verify(void)
> +static void copy_file_range_verify(unsigned int n)
>   {
>   	int i, j, k;
> +	struct tcase *tc = &tcases[n];
> +
> +	if (tc->flags && !cross_sup) {
> +		tst_res(TCONF,
> +			"copy_file_range doesn't support cross-device, skip it");
> +		return;
> +	}

Perhaps, we can remove the global cross_sup and check of EXDEV in 
setup() by passing tc->flag to one_test().

> +
> +	strcpy(FILE_TARGET_PATH, tc->path);
>   
>   	errcount = numcopies = 0;
>   	size_t len_arr[]	= {11, page_size-1, page_size, page_size+1};
> @@ -190,25 +209,33 @@ static void copy_file_range_verify(void)
>   
>   	if (errcount == 0)
>   		tst_res(TPASS,
> -			"copy_file_range completed all %d copy jobs successfully!",
> -			numcopies);
> +			"%s copy_file_range completed all %d copy jobs successfully!",
> +			tc->message, numcopies);
>   	else
> -		tst_res(TFAIL, "copy_file_range failed %d of %d copy jobs.",
> -				errcount, numcopies);
> +		tst_res(TFAIL, "%s copy_file_range failed %d of %d copy jobs.",
> +			tc->message, errcount, numcopies);
>   }
>   
>   static void setup(void)
>   {
> -	int i, fd;
> +	int i, fd, fd_test;
>   
>   	syscall_info();
>   
>   	page_size = getpagesize();
> -
> +	cross_sup = 1;
>   	fd = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
>   	/* Writing page_size * 4 of data into test file */
>   	for (i = 0; i < (int)(page_size * 4); i++)
>   		SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
> +
> +	fd_test = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
> +	TEST(sys_copy_file_range(fd, 0, fd_test, 0, CONTSIZE, 0));
> +	if (TST_ERR == EXDEV)
> +		cross_sup = 0;
> +
> +	SAFE_CLOSE(fd_test);
> +	remove(FILE_MNTED_PATH);
Is it necessary to remove it?

Best Regards,
Xiao Yang
>   	SAFE_CLOSE(fd);
>   }
>   
> @@ -220,7 +247,11 @@ static void cleanup(void)
>   static struct tst_test test = {
>   	.setup = setup,
>   	.cleanup = cleanup,
> +	.tcnt = ARRAY_SIZE(tcases),
>   	.needs_tmpdir = 1,
> -	.test_all = copy_file_range_verify,
> +	.mount_device = 1,
> +	.mntpoint = MNTPOINT,
> +	.all_filesystems = 1,
> +	.test = copy_file_range_verify,
>   	.test_variants = TEST_VARIANTS,
>   };



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
