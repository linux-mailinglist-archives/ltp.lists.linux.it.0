Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D7E2F0777
	for <lists+linux-ltp@lfdr.de>; Sun, 10 Jan 2021 14:48:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9840D3C6023
	for <lists+linux-ltp@lfdr.de>; Sun, 10 Jan 2021 14:48:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 719FD3C5467
 for <ltp@lists.linux.it>; Sun, 10 Jan 2021 14:48:47 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id CF6B21400522
 for <ltp@lists.linux.it>; Sun, 10 Jan 2021 14:48:46 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,336,1602518400"; d="scan'208";a="103338901"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jan 2021 21:48:44 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id DE37648990D2;
 Sun, 10 Jan 2021 21:48:41 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 10 Jan 2021 21:48:43 +0800
Message-ID: <5FFB05B7.1080107@cn.fujitsu.com>
Date: Sun, 10 Jan 2021 21:48:39 +0800
From: yangx.jy <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210104125423.19183-1-yangx.jy@cn.fujitsu.com>
 <20210104125423.19183-2-yangx.jy@cn.fujitsu.com> <X/Rre6xb0cAg1Emw@yuki.lan>
 <5FF47A04.4030908@cn.fujitsu.com> <X/R/2VVe1dJxGhHN@yuki.lan>
In-Reply-To: <X/R/2VVe1dJxGhHN@yuki.lan>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: DE37648990D2.A895F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/2] include/tst_test_macros.h: Report TINFO
 when TST_EXP_FD() succeeded
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

Hi Cyril,

Sorry for the late reply because I am busy with other things recently.

On 2021/1/5 23:03, Cyril Hrubis wrote:
> Hi!
>>> What exactly is the problem of having TPASS generated for each open()
>>> that produces a valid file descriptor in the open testcases?
>>>
>>> These macros are especially tailored to generate TPASS/TFAIL messages so
>>> that the caller does not have to. So even if having two TPASS per run()
>>> function in open01 was a problem, which I do not think is the case, we
>>> should just use SAFE_OPEN() there instead.
>> Hi Cyril,
>>
>> I perfer to report one TPASS message when finishing one subtest instead
>> of one step.
>>       because of two reasons:
>>      a) It seems clearer for user to know how many subtests were run
>> sucessfully.
> This depends on a definition of subtest which, as far as I can tell, is
> not that well defined.
>
> If you want to make the output easier to read in the case of a test
> function that is called more than once we should change the test library
> to insert empty lines between the iterations or something along these
> lines, so that the output would look like:
>
> ./open01
> tst_test.c:1261: TINFO: Timeout per run is 0h 05m 00s
>
> open01.c:48: TPASS: open() with sticky bit returned fd 3
> open01.c:56: TPASS: sticky bit is set as expected
>
> open01.c:48: TPASS: open() with sirectory bit returned fd 3
> open01.c:56: TPASS: sirectory bit is set as expected
>
> Summary:
> passed   4
> failed   0
> broken   0
> skipped  0
> warnings 0
>
> Which is way better than imposing any rules on how many TPASS/TFAIL
> messages should be printed per iteration.
>
>>      b) There are too many TPASS/TFAIL messages when a testcase(e.g.
>> open11) contains many subtests or multiple TST_EXP_* macros.
> There are 28 testcases in open11 and we print 28 messages TPASS/TFAIL
> messages, we just use different EXP macro for different testcases. I do
> not think that silencing the output would make things any better.
I gave a wrong example.  access02 may be the correct one:
-----------------------------------------------------------------
# ./access02
tst_test.c:1261: TINFO: Timeout per run is 0h 05m 00s
access02.c:62: TPASS: access(file_f, F_OK) as root passed
access02.c:141: TPASS: access(file_f, F_OK) as root behaviour is correct.
access02.c:62: TPASS: access(file_f, F_OK) as nobody passed
access02.c:141: TPASS: access(file_f, F_OK) as nobody behaviour is correct.
access02.c:62: TPASS: access(file_r, R_OK) as root passed
access02.c:141: TPASS: access(file_r, R_OK) as root behaviour is correct.
access02.c:62: TPASS: access(file_r, R_OK) as nobody passed
access02.c:141: TPASS: access(file_r, R_OK) as nobody behaviour is correct.
...

Summary:
passed   32
failed   0
broken   0
skipped  0
warnings 0
-----------------------------------------------------------------
>> Could we make TST_EXP_* macros do common check and generate only TFAIL
>> messages? (Make testcases report TPASS message by themself)
> The whole idea of having the TST_EXP_* macros is that they replace code
> that looks like:
>
> 	if (condition)
> 		tst_res(TPASS, "...");
> 	else
> 		tst_res(TFAIL, "...");
>
> And that they actually unify how these messages are formatted.
>
> If you think that there are places where we use these macros where
> SAFE_MACRO() would be better we can talk about changing these.
I thought about it again yesterday and wanted to introduce new TST_EXP_ 
SILENT_{FD,PASS} macros.
1) TST_EXP_SILENT_{PASS,FD} do common checks and don't report TPASS when 
SCALL succeeds.
2) TST_EXP_{PASS,FD} take use of TST_EXP_SILENT_{PASS,FD} and report 
TPASS when SCALL succeeds.
BTW: Make testcase use which macros by themselves.

Please see my v2 patch set for detailed implement:
http://lists.linux.it/pipermail/ltp/2021-January/020472.html
http://lists.linux.it/pipermail/ltp/2021-January/020473.html

Best Regards,
Xiao Yang



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
