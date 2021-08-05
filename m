Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF53E11F2
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 12:06:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 262353C7DA7
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 12:06:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 652A83C5F7B
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 12:06:14 +0200 (CEST)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DC09A1A0121C
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 12:06:11 +0200 (CEST)
X-QQ-mid: bizesmtp40t1628157964tgnnmbjs
Received: from [192.168.31.178] (unknown [180.110.162.144])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 05 Aug 2021 18:06:04 +0800 (CST)
X-QQ-SSF: 0140000000200030B000000A0000000
X-QQ-FEAT: ttxN9vkG2OSsIUyTDqCQUtrmDP0GPhPDvMpORC06sW6HJZBaA7AZFfouYuroD
 3kth1IFHF+Rz908fu7hdpv9QwMiTzvyjEGxUsUAp0k2DGoEV+eOxKkCvPg7T3Egw0xSl2Ld
 6hamaimmA3XbD6JCVtLEd0hAKB6olAzvsRlz4dHByWrggzWqn964fPIDNLHETsKlBzjFUX4
 075M+xCxq0E+P1ZMSSFQwU4dtoH3IJXrCCBz36D5pa7bG/qid1gAw+A5kZz3xHGmAGTcePi
 /2nqg/DV+hoH/sRNovTyolGbKrOFiwklcM+NcYgGV6GoNVsYPOG7IneYpkxpTo+oyzc/gQe
 jtd9mWlyemQxyOMNsi3hrEHF9e69A==
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210805073339.15027-1-zhanglianjie@uniontech.com>
 <YQuzZYA3B3zBuVKh@yuki>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <73bcb0d8-11ef-63e1-f73a-e452d72f7b3c@uniontech.com>+DE18549BB37B8268
Date: Thu, 5 Aug 2021 18:06:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQuzZYA3B3zBuVKh@yuki>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [1/4] syscalls/chroot01: Convert to new API
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

Hi:
I will resubmit, thank you for your guidance.

> Hi!
>> +static void verify_chroot(void)
>>   {
>> -	int lc;
>> +	TEST(chroot(path));
>>
>> -	tst_parse_opts(ac, av, NULL, NULL);
>> -
>> -	setup();
>> -
>> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
>> -
>> -		tst_count = 0;
>> -
>> -		TEST(chroot(path));
>> -
>> -		if (TEST_RETURN != -1)
>> -			tst_resm(TFAIL, "call succeeded unexpectedly");
>> -		else if (errno != EPERM)
>> -			tst_resm(TFAIL | TTERRNO, "chroot failed unexpectedly");
>> -		else
>> -			tst_resm(TPASS, "chroot set errno to EPERM.");
>> -	}
>> -	cleanup();
>> -
>> -	tst_exit();
>> +	if (TST_RET != -1)
>> +		tst_res(TFAIL, "call succeeded unexpectedly");
>> +	else if (errno != EPERM)
>> +		tst_res(TFAIL | TTERRNO, "chroot failed unexpectedly");
>> +	else
>> +		tst_res(TPASS, "chroot set errno to EPERM.");
> 
> Just use the TST_EXP_FAIL() here instead.
> 
>>   }
>>
>> -void setup(void)
>> +static void setup(void)
>>   {
>> -	tst_require_root();
>> -
>> -	tst_tmpdir();
>>   	path = tst_get_tmpdir();
>> +	if (path == NULL)
>> +		tst_brk(TBROK | TERRNO, "tst_get_tmpdir failed");
> 
> Hmm I guess that we should add tst_brkm() to the lib/tst_tmpdir.c
> instead to check if the strdup has failed, which would be far easier
> than adding error handling to all tests.
> 
> Something as:
> 
> diff --git a/lib/tst_tmpdir.c b/lib/tst_tmpdir.c
> index 0c39eb89f..35b376478 100644
> --- a/lib/tst_tmpdir.c
> +++ b/lib/tst_tmpdir.c
> @@ -108,12 +108,18 @@ int tst_tmpdir_created(void)
> 
>   char *tst_get_tmpdir(void)
>   {
> +       char *ret;
> +
>          if (TESTDIR == NULL) {
>                  tst_brkm(TBROK, NULL, "you must call tst_tmpdir() first");
>                  return NULL;
>          }
> 
> -       return strdup(TESTDIR);
> +       ret = strdup(TESTDIR);
> +       if (!ret)
> +               tst_brkm(TBROK, NULL, "strdup() failed");
> +
> +       return ret;
>   }
> 
> 
>> -	if ((ltpuser = getpwnam(nobody_uid)) == NULL)
>> -		tst_brkm(TBROK | TERRNO, cleanup,
>> -			 "getpwnam(\"nobody\") failed");
>> -
>> -	SAFE_SETEUID(cleanup, ltpuser->pw_uid);
>> +	if ((ltpuser = SAFE_GETPWNAM(nobody_uid)) == NULL)
>> +		tst_brk(TBROK | TERRNO, "getpwnam(\"nobody\") failed");
> 
> SAFE_SETEUID() cannot fail, there is no need to check the return value.
> 
> 
>> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
>> -
>> -	TEST_PAUSE;
>> +	SAFE_SETEUID(ltpuser->pw_uid);
>>   }
>>
>> -void cleanup(void)
>> +static void cleanup(void)
>>   {
>> -	SAFE_SETEUID(NULL, 0);
>> +	SAFE_SETEUID(0);
> 
> There is actually no need to reset the UID in new library tests, since
> the cleanup for temporary directory is carried on with the test library
> process.
> 
>> -	free(path);
>> -	tst_rmdir();
>> +	if (path) {
>> +		free(path);
>> +		path = NULL;
>> +	}
> 
> free(NULL) is no-op, no need for the if () here.
> 
> All that has to be done in the cleanup is actually:
> 
> static void cleanup(void)
> {
> 	free(path);
> }
> 
>>   }
>> +
>> +static struct tst_test test = {
>> +	.cleanup = cleanup,
>> +	.setup = setup,
>> +	.test_all = verify_chroot,
>> +	.needs_root = 1,
>> +	.needs_tmpdir = 1,
>> +};
>> --
>> 2.20.1
>>
>>
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
