Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEF93430E6
	for <lists+linux-ltp@lfdr.de>; Sun, 21 Mar 2021 05:41:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B54C23C95C8
	for <lists+linux-ltp@lfdr.de>; Sun, 21 Mar 2021 05:41:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D81D63C2DBB
 for <ltp@lists.linux.it>; Sun, 21 Mar 2021 05:41:03 +0100 (CET)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0A23210007CD
 for <ltp@lists.linux.it>; Sun, 21 Mar 2021 05:41:03 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id t18so6635135pjs.3
 for <ltp@lists.linux.it>; Sat, 20 Mar 2021 21:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7zNNx2IpoDQl65k45n//jLBSTcAdcS5TicIzW3F43N4=;
 b=YBcqyW3Pqby0mbpAbycM+VfnPWEiC51O5iHcckoZ9o/NRd0Sayht3VCM1JNtUGOpex
 vX/c3GtJuJWx+kYW2Thx8uQ74+/hzVRwiwilnBRpDub+icRhxuNZEMpRHV4zDbqKdBNi
 doX+0IYmqaImSuUCt0h8pzOrdtaZjX62tg5/WBU2TIdLAi9Q+iE3ZZuUGlSb85FcFoWg
 sLPEsn9S730u1Z5UY9SauWs8xinuXwqBgyncKQfobDjpzWI8X9fQqTd5jrGM+ILhUyZJ
 a/qamnmagtJ+Elr/QQYRdrQ9XyuDhs2HEM7GTBQ4/AfPycdQMfVGX+PyvhiGwEVlh2fF
 5Qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7zNNx2IpoDQl65k45n//jLBSTcAdcS5TicIzW3F43N4=;
 b=o3Yd7uzq76AalHNb8FEzduAMT3z83mSmYuCe+wyhOVEBQ6BhPHZULrEvjEgALSqrOu
 peRVl+2gYuDfNGK4bdvdgJqf7jcqWmmXdPLpFzWsPezu9M1gXhPZjVGfyulggzIRrUAe
 tdh+89EDPHM5J6gpK71HaAl86MkKramxInqCaSrylIW5KSSkhJHkVRNkja1SripUCjY2
 0/Momqx8C1xJIld1wdHLtF1f+GkDL5b9CA7OWrVVmgP7eeFY9wUvmdUhtKbyR2827or7
 oyYCSvIs/pHZQ+sVxHZ9WFUoTblz5nWUIeqkn2H7bu3lSN4tP3rj6Sv39AxlEmp/5wqI
 5eIw==
X-Gm-Message-State: AOAM532pjcVkjBNb9rdslwO0WcEUsotJC31wdjhRJObE7E6NaDcD6sEa
 2PYTdJvTzUCY1dLlKrOQ1sQ=
X-Google-Smtp-Source: ABdhPJzMEpHFb0mMgqCM4+RyWfz5DETk4wrXHH5CBIhbullxqtWztxbJrnR5/d8QE8IjsHuuTdQY/g==
X-Received: by 2002:a17:90b:1082:: with SMTP id
 gj2mr6403261pjb.155.1616301661229; 
 Sat, 20 Mar 2021 21:41:01 -0700 (PDT)
Received: from ?IPv6:2400:2411:d20:8500:5d3a:a527:fb16:285b?
 ([2400:2411:d20:8500:5d3a:a527:fb16:285b])
 by smtp.gmail.com with ESMTPSA id 76sm9579205pfw.156.2021.03.20.21.40.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Mar 2021 21:41:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
From: QI Fuli <fukuri.sai@gmail.com>
In-Reply-To: <08251b70-1fdc-02d3-c94c-80330942da52@163.com>
Date: Sun, 21 Mar 2021 13:40:58 +0900
Message-Id: <0F9C5DDE-7954-4428-82B0-83EBEE5E5959@gmail.com>
References: <20210319134511.1844348-1-qi.fuli@fujitsu.com>
 <08251b70-1fdc-02d3-c94c-80330942da52@163.com>
To: Xiao Yang <ice_yangxiao@163.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/swapon/swapon0{1..3}: Remove the
 check for BTRFS
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
Cc: QI Fuli <qi.fuli@fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



> On Mar 20, 2021, at 17:55, Xiao Yang <ice_yangxiao@163.com> wrote:
> 
> Hi Qi,
> 
> Pushed with a minor change:
> 
> s/WEXITSTATUS(status) == 1/WEXITSTATUS(status)/
> 
> Thanks for your patch.
> 
> Best Regards,
> 
> Xiao Yang

Thank you very much.

QI

> 
> On 3/19/21 9:45 PM, QI Fuli wrote:
>> remove redundant tasks as BTRFS is checked in is_swap_supported()
>> Fixes: caf453532("syscalls/swapon/swapon0{1..3}: use helpers to check
>> 	support status")
>> 
>> Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
>> ---
>>  testcases/kernel/syscalls/swapon/swapon01.c |  7 -------
>>  testcases/kernel/syscalls/swapon/swapon02.c | 14 +++-----------
>>  testcases/kernel/syscalls/swapon/swapon03.c | 15 +--------------
>>  3 files changed, 4 insertions(+), 32 deletions(-)
>> 
>> diff --git a/testcases/kernel/syscalls/swapon/swapon01.c b/testcases/kernel/syscalls/swapon/swapon01.c
>> index f95ce0ab2..aff842e4c 100644
>> --- a/testcases/kernel/syscalls/swapon/swapon01.c
>> +++ b/testcases/kernel/syscalls/swapon/swapon01.c
>> @@ -32,18 +32,11 @@ static void cleanup(void);
>>  char *TCID = "swapon01";
>>  int TST_TOTAL = 1;
>> 
>> -static long fs_type;
>> -
>>  static void verify_swapon(void)
>>  {
>>  	TEST(ltp_syscall(__NR_swapon, "./swapfile01", 0));
>> 
>>  	if (TEST_RETURN == -1) {
>> -		if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL) {
>> -			tst_brkm(TCONF, cleanup,
>> -			         "Swapfile on BTRFS not implemeted");
>> -			return;
>> -		}
>>  		tst_resm(TFAIL | TTERRNO, "Failed to turn on swapfile");
>>  	} else {
>>  		tst_resm(TPASS, "Succeeded to turn on swapfile");
>> diff --git a/testcases/kernel/syscalls/swapon/swapon02.c b/testcases/kernel/syscalls/swapon/swapon02.c
>> index 3d49d0c6b..f0f99619d 100644
>> --- a/testcases/kernel/syscalls/swapon/swapon02.c
>> +++ b/testcases/kernel/syscalls/swapon/swapon02.c
>> @@ -47,7 +47,6 @@ int TST_TOTAL = 4;
>> 
>>  static uid_t nobody_uid;
>>  static int do_swapoff;
>> -static long fs_type;
>> 
>>  static struct test_case_t {
>>  	char *err_desc;
>> @@ -81,11 +80,6 @@ static void verify_swapon(struct test_case_t *test)
>>  		return;
>>  	}
>> 
>> -	if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL) {
>> -		tst_resm(TCONF, "Swapfile on BTRFS not implemeted");
>> -			return;
>> -	}
>> -
>>  	tst_resm(TFAIL, "swapon(2) failed to produce expected error:"
>>  	         " %d, errno: %s and got %d.", test->exp_errno,
>>  	         test->exp_errval, TEST_ERRNO);
>> @@ -138,12 +132,10 @@ static void setup(void)
>>  	make_swapfile(cleanup, "swapfile01", 0);
>>  	make_swapfile(cleanup, "alreadyused", 0);
>> 
>> -	if (ltp_syscall(__NR_swapon, "alreadyused", 0)) {
>> -		if (fs_type != TST_BTRFS_MAGIC || errno != EINVAL)
>> -			tst_resm(TWARN | TERRNO, "swapon(alreadyused) failed");
>> -	} else {
>> +	if (ltp_syscall(__NR_swapon, "alreadyused", 0))
>> +		tst_resm(TWARN | TERRNO, "swapon(alreadyused) failed");
>> +	else
>>  		do_swapoff = 1;
>> -	}
>> 
>>  	TEST_PAUSE;
>>  }
>> diff --git a/testcases/kernel/syscalls/swapon/swapon03.c b/testcases/kernel/syscalls/swapon/swapon03.c
>> index cef57150c..19455bfe6 100644
>> --- a/testcases/kernel/syscalls/swapon/swapon03.c
>> +++ b/testcases/kernel/syscalls/swapon/swapon03.c
>> @@ -52,8 +52,6 @@ int TST_TOTAL = 1;
>> 
>>  static int swapfiles;
>> 
>> -static long fs_type;
>> -
>>  int testfiles = 3;
>>  static struct swap_testfile_t {
>>  	char *filename;
>> @@ -215,9 +213,6 @@ static int setup_swap(void)
>>  			/* turn on the swap file */
>>  			res = ltp_syscall(__NR_swapon, filename, 0);
>>  			if (res != 0) {
>> -				if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL)
>> -					exit(2);
>> -
>>  				if (errno == EPERM) {
>>  					printf("Successfully created %d "
>>  					       "swapfiles\n", j);
>> @@ -233,16 +228,8 @@ static int setup_swap(void)
>>  	} else
>>  		waitpid(pid, &status, 0);
>> 
>> -	switch (WEXITSTATUS(status)) {
>> -	case 0:
>> -	break;
>> -	case 2:
>> -		tst_brkm(TCONF, cleanup, "Swapfile on BTRFS not implemeted");
>> -	break;
>> -	default:
>> +	if (WEXITSTATUS(status) == 1)
>>  		tst_brkm(TFAIL, cleanup, "Failed to setup swaps");
>> -	break;
>> -	}
>> 
>>  	/* Create all needed extra swapfiles for testing */
>>  	for (j = 0; j < testfiles; j++)
>> --
>> 2.29.2
>> 
>> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
