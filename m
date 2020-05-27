Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F12DF1E39E1
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 09:09:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86D9A3C3239
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 09:09:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B5F163C2123
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:09:11 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id EB16720121F
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:09:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,440,1583164800"; d="scan'208";a="93193494"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 27 May 2020 15:09:02 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id CA98A4BCC8A2;
 Wed, 27 May 2020 15:08:59 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 27 May 2020 15:08:58 +0800
Message-ID: <5ECE120A.8060209@cn.fujitsu.com>
Date: Wed, 27 May 2020 15:08:58 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <5EC48FCD.9050600@cn.fujitsu.com>
 <20200522014007.3108-1-yangx.jy@cn.fujitsu.com>
 <5ECD1CF8.5010607@cn.fujitsu.com>
In-Reply-To: <5ECD1CF8.5010607@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CA98A4BCC8A2.AAE2D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib/tst_test.c: Take account of
 tst_brk(TCONF/TFAIL) in summary output
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Pushed.

Best Regards,
Xiao Yang
On 2020/5/26 21:43, Xiao Yang wrote:
> Hi,
> 
> I want to push it tomorrow if nobody has any objection.
> 
> Thanks,
> Xiao Yang
> On 2020/5/22 9:40, Xiao Yang wrote:
>> Current summary output doesn't take account of tst_brk(TCONF/TFAIL),
>> for example:
>> -----------------------------------------------------
>> [root@Fedora-30  pidfd_send_signal]# ./pidfd_send_signal01
>> tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
>> ../../../../include/lapi/pidfd_send_signal.h:16: CONF: syscall(424) __NR_pidfd_send_signal not supported
>>
>> Summary:
>> passed   0
>> failed   0
>> skipped  0
>> warnings 0
>> ----------------------------------------------------
>>
>> 1) Add update_result() in tst_vbrk_() to fix the issue.
>> 2) Remove redundant update_result() in run_tcases_per_fs() after the fix.
>>
>> Signed-off-by: Xiao Yang<yangx.jy@cn.fujitsu.com>
>> ---
>>    lib/tst_test.c | 5 ++---
>>    1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/tst_test.c b/lib/tst_test.c
>> index 0e58060e0..e93c88ba5 100644
>> --- a/lib/tst_test.c
>> +++ b/lib/tst_test.c
>> @@ -316,6 +316,7 @@ void tst_vbrk_(const char *file, const int lineno, int ttype,
>>                   const char *fmt, va_list va)
>>    {
>>    	print_result(file, lineno, ttype, fmt, va);
>> +	update_results(TTYPE_RESULT(ttype));
>>
>>    	/*
>>    	 * The getpid implementation in some C library versions may cause cloned
>> @@ -1316,10 +1317,8 @@ static int run_tcases_per_fs(void)
>>    			mntpoint_mounted = 0;
>>    		}
>>
>> -		if (ret == TCONF) {
>> -			update_results(ret);
>> +		if (ret == TCONF)
>>    			continue;
>> -		}
>>
>>    		if (ret == 0)
>>    			continue;
> 
> .
> 




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
