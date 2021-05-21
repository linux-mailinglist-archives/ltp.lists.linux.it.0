Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D438C2EB
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 11:21:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87A843C5E3B
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 11:21:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 527733C1B5C
 for <ltp@lists.linux.it>; Fri, 21 May 2021 11:21:01 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B620610009E6
 for <ltp@lists.linux.it>; Fri, 21 May 2021 11:20:59 +0200 (CEST)
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fmgwy4CtGzqVRg
 for <ltp@lists.linux.it>; Fri, 21 May 2021 17:17:22 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 17:20:54 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 17:20:54 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
References: <20210519084655.52780-1-xieziyao@huawei.com>
 <20210519084655.52780-3-xieziyao@huawei.com> <YKbbCLUlaICqSIK5@pevik>
Message-ID: <88d2297a-58f1-2ee3-0db4-6686ffbf4de2@huawei.com>
Date: Fri, 21 May 2021 17:20:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YKbbCLUlaICqSIK5@pevik>
Content-Language: en-US
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme717-chm.china.huawei.com (10.1.199.113) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/sendfile: Convert sendfile09 to the
 new API
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

>> +++ b/testcases/kernel/syscalls/sendfile/sendfile09.c
> ...
>> + * Copyright (c) International Business Machines  Corp., 2014
> Again, missing copyright.
I wonder if I should add copyright without changing the code logic.

> 
>> +/*\
>> + * [Description]
>>    *
>> - * DESCRIPTION
>> - *        Testcase copied from sendfile02.c to test the basic functionality of
>> - *        the sendfile(2) system call on large file. There is a kernel bug which
>> - *        introduced by commit 8f9c0119d7ba and fixed by commit 5d73320a96fcc.
>> + * Testcase copied from sendfile02.c to test the basic functionality of
>> + * the sendfile(2) system call on large file. There is a kernel bug which
>> + * introduced by commit 8f9c0119d7ba and fixed by commit 5d73320a96fcc.
> If 8f9c0119d7ba caused a regression it shouldn't be in .tags (it contains
> commits which are fixes and should be backported). Also it's a question if it's
> useful info, because this commit is mentioned in 5d73320a96fcc (fixing commit).
Agree with you.

> 
>>    *
>> - * ALGORITHM
>> - *        1. call sendfile(2) with offset at 0
>> - *        2. call sendfile(2) with offset at 3GB
>> + * [Algorithm]
>>    *
>> - * USAGE:  <for command-line>
>> - *  sendfile09 [-c n] [-i n] [-I x] [-P x] [-t]
>> - *     where,
>> - *             -i n : Execute test n times.
>> - *             -I x : Execute test for x seconds.
>> - *             -P x : Pause for x seconds between iterations.
>> - *             -t   : Turn on syscall timing.
>> + * 1. Call sendfile(2) with offset at 0;
>> + * 2. Call sendfile(2) with offset at 3GB.
>>    *
>> + * [Restrictions]
>>    *
>> - * RESTRICTIONS
>> - *        Only supports 64bit systems and kernel 2.6.33 or above
>> + * Only supports 64bit systems and kernel 2.6.33 or above.
> nit: Maybe: Only 64bit systems are supported.
> 
> I'm not a native speaker, but "Only supports" sounds wrong to me.
> Also although I'd keep .min_kver, mentioning it is IMHO necessary -
> why to repeat info we have in .tags? We still do that, but IMHO we should
> stop doing it. And this ancient version is certainly not worth duplicity
> (latest tested kernel is 3.10 [1]).
+1

> 
> sendfile09.c:58: WARNING: Missing a blank line after declarations
> sendfile09.c:75: WARNING: Missing a blank line after declarations
> sendfile09.c:80: WARNING: Comparisons should place the constant on the right side of the test
> sendfile09.c:82: WARNING: quoted string split across lines
> sendfile09.c:86: WARNING: quoted string split across lines
> sendfile09.c:90: WARNING: quoted string split across lines
> 
>>    */
>> -#include <stdio.h>
>> -#include <errno.h>
>> +
>>   #include <fcntl.h>
>>   #include <sys/stat.h>
>>   #include <sys/sendfile.h>
>>   #include <sys/types.h>
>>   #include <unistd.h>
>>   #include <inttypes.h>
> Again, only these are needed:
> 
> #include <inttypes.h>
> #include <sys/sendfile.h>
> 
> #include "tst_test.h"
> #include "lapi/abisize.h"
+1

> 
>> -static void cleanup(void);
>> -static void setup(void);
>> +#ifndef OFF_T
>> +#define OFF_T off_t
>> +#endif
> I wonder where OFF_T comes from and if we can just simply use off_t.
Not sure about this.

> 
>> -#define ONE_GB (INT64_C(1) << 30)
>> +#define ONE_GB		(INT64_C(1) << 30)
>> +#define IN_FILE		"in_file"
>> +#define OUT_FILE	"out_file"
> 
> :...
>> +static void setup(void)
>>   {
>> -	int i;
>> -
>> -	tst_sig(FORK, DEF_HANDLER, cleanup);
>> -	TEST_PAUSE;
>> -
>> -	/* make a temporary directory and cd to it */
>> -	tst_tmpdir();
>> -
>> -	if (!tst_fs_has_free(NULL, ".", 5, TST_GB))
>> -		tst_brkm(TCONF, cleanup, "sendfile(2) on large file"
>> -			" needs 5G free space.");
>> +	if (!tst_fs_has_free(".", 5, TST_GB))
>> +		tst_brk(TCONF, "Test on large file needs 5G free space");
> 
>> -	/* create a 4G file */
>> -	fd = SAFE_CREAT(cleanup, in_file, 00700);
>> -	for (i = 1; i <= (4 * 1024); i++) {
>> -		SAFE_LSEEK(cleanup, fd, 1024 * 1024 - 1, SEEK_CUR);
>> -		SAFE_WRITE(cleanup, 1, fd, "C", 1);
>> +	int fd = SAFE_CREAT(IN_FILE, 00700);
>> +	for (int i = 1; i <= (4 * 1024); ++i) {
> This will lead to error in old compilers:
> error: 'for' loop initial declarations are only allowed in C99 mode
> https://travis-ci.org/github/pevik/ltp/jobs/771837120
> https://travis-ci.org/github/pevik/ltp/jobs/771837126
> 
> It must be:
> 
> int i;
> 
> ...
> for (i = 1; i <= (4 * 1024); ++i) {
> 
> Thus probably better to declare fd before as well.
> 
> int i, fd;
I'll pay attention next time. Thanks.

> 
> ...
>> +static void run(unsigned int i)
>>   {
> ...
>> +	off_t before_pos, after_pos;
>> +	before_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
>> +
>> +	TEST(sendfile(out_fd, in_fd, &offset, tc[i].count));
>> +	after_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
>> +
>> +	if (TST_RET != tc[i].exp_retval)
>> +		tst_res(TFAIL, "sendfile(2) failed to return expected value, "
>> +			       "expected: %" PRId64 ", got: %ld",
>> +			tc[i].exp_retval, TST_RET);
>> +	else if (offset != tc[i].exp_updated_offset)
>> +		tst_res(TFAIL, "sendfile(2) failed to update OFFSET parameter to "
>> +			       "expected value, expected: %" PRId64 ", got: %" PRId64,
>> +			tc[i].exp_updated_offset, (int64_t)(offset));
>> +	else if (before_pos != after_pos)
>> +		tst_res(TFAIL, "sendfile(2) updated the file position of in_fd "
>> +			       "unexpectedly, expected file position: %" PRId64
>> +			       ", actual file position %" PRId64,
>> +			(int64_t)(before_pos), (int64_t)(after_pos));
> Yes, we probably cannot avoid splitting string here, unless TST_EXP_FAIL() can
> be used here.
> 
> I'd avoid 2 in "sendfile(2).
+1

> 
>> +	else
>> +		tst_res(TPASS, "sendfile(2) with %s", tc[i].desc);
> 
> Again, minor things, I can fix them before merge.
> 
> Kind regards,
> Petr
> .
> 

Hi, Petr,

Not sure whether to remove OFF_T, the other modifications worked fine 
for me.

Thanks for your review.

Kind regards,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
