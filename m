Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FA62EAD70
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 15:39:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BB9C3C54A9
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 15:39:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8088B3C071E
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 15:39:09 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C23B020007A
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 15:39:08 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,477,1599494400"; d="scan'208";a="103205028"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Jan 2021 22:39:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 2A20048990D2;
 Tue,  5 Jan 2021 22:39:02 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 5 Jan 2021 22:39:03 +0800
Message-ID: <5FF47A04.4030908@cn.fujitsu.com>
Date: Tue, 5 Jan 2021 22:39:00 +0800
From: yangx.jy <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210104125423.19183-1-yangx.jy@cn.fujitsu.com>
 <20210104125423.19183-2-yangx.jy@cn.fujitsu.com> <X/Rre6xb0cAg1Emw@yuki.lan>
In-Reply-To: <X/Rre6xb0cAg1Emw@yuki.lan>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2A20048990D2.A71A2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

On 2021/1/5 21:36, Cyril Hrubis wrote:
> Hi!
>> In Summary output, avoid counting the double passed for one test:
>> -------------------------------------
>> ./open01
>> tst_test.c:1261: TINFO: Timeout per run is 0h 05m 00s
>> open01.c:48: TPASS: open() with sticky bit returned fd 3
>> open01.c:59: TPASS: sticky bit is set as expected
>> open01.c:48: TPASS: open() with sirectory bit returned fd 3
>> open01.c:59: TPASS: sirectory bit is set as expected
>>
>> Summary:
>> passed   4
>> failed   0
>> broken   0
>> skipped  0
>> warnings 0
>> -------------------------------------
> What exactly is the problem of having TPASS generated for each open()
> that produces a valid file descriptor in the open testcases?
>
> These macros are especially tailored to generate TPASS/TFAIL messages so
> that the caller does not have to. So even if having two TPASS per run()
> function in open01 was a problem, which I do not think is the case, we
> should just use SAFE_OPEN() there instead.
Hi Cyril,

I perfer to report one TPASS message when finishing one subtest instead 
of one step.
     because of two reasons:
    a) It seems clearer for user to know how many subtests were run 
sucessfully.
    b) There are too many TPASS/TFAIL messages when a testcase(e.g. 
open11) contains many subtests or multiple TST_EXP_* macros.
Could we make TST_EXP_* macros do common check and generate only TFAIL 
messages? (Make testcases report TPASS message by themself)

Best Regards,
Xiao Yang




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
