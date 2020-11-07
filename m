Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D07DB2AA1C5
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Nov 2020 01:22:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97D543C6D6A
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Nov 2020 01:22:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 865923C1876
 for <ltp@lists.linux.it>; Sat,  7 Nov 2020 01:22:57 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2D0631400FBB
 for <ltp@lists.linux.it>; Sat,  7 Nov 2020 01:22:55 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,458,1596470400"; d="scan'208";a="101037914"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 07 Nov 2020 08:22:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 036BC4CE34EF;
 Sat,  7 Nov 2020 08:22:48 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 7 Nov 2020 08:22:48 +0800
Message-ID: <5FA5E8D6.4040401@cn.fujitsu.com>
Date: Sat, 7 Nov 2020 08:22:46 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>, Martin Doucha <mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
 <20201026164756.30556-4-mdoucha@suse.cz> <5F97E6A0.8090506@cn.fujitsu.com>
 <20201106173545.GA30641@pevik>
In-Reply-To: <20201106173545.GA30641@pevik>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 036BC4CE34EF.A1750
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 03/19] Unify error handling in
 lib/tst_safe_timerfd.c
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

Hi Petr, Martin
> Hi Martin, Xu,
>
>>> diff --git a/lib/tst_safe_timerfd.c b/lib/tst_safe_timerfd.c
>>> index ffe7b2ef7..4c36a309c 100644
>>> --- a/lib/tst_safe_timerfd.c
>>> +++ b/lib/tst_safe_timerfd.c
>>> @@ -17,9 +17,14 @@ int safe_timerfd_create(const char *file, const int lineno,
>>>    	int fd;
>
>>>    	fd = timerfd_create(clockid, flags);
>>> -	if (fd<   0) {
>>> -		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_create(%s) failed",
>>> -			file, lineno, tst_clock_name(clockid));
>>> +
>>> +	if (fd == -1) {
>>> +		tst_brk_(file, lineno, TTYPE | TERRNO,
>>> +			"timerfd_create(%s) failed", tst_clock_name(clockid));
>>> +	} else if (fd<   0) {
> nit: fd<   0 =>  fd<   0
Sorry, It is my email format problem, on patchwork[1], the format is right.

[1]https://patchwork.ozlabs.org/project/ltp/patch/20201026164756.30556-4-mdoucha@suse.cz/

>>> +		tst_brk_(file, lineno, TBROK | TERRNO,
>>> +			"Invalid timerfd_create(%s) return value %d",
>>> +			tst_clock_name(clockid), fd);
>
>>>    	}
>
>>>    	return fd;
>>> @@ -31,9 +36,14 @@ int safe_timerfd_gettime(const char *file, const int lineno,
>>>    	int rval;
>
>>>    	rval = timerfd_gettime(fd, curr_value);
>>> -	if (rval != 0) {
>>> -		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_gettime() failed",
>>> -			file, lineno);
>>> +
>>> +	if (rval == -1) {
>>> +		tst_brk_(file, lineno, TTYPE | TERRNO,
>>> +			"timerfd_gettime() failed");
>>> +	}
>>> +	if (rval) {
>>> +		tst_brk_(file, lineno, TBROK | TERRNO,
>>> +			"Invalid timerfd_gettime() return value %d", rval);
>> Here also should use else if.
> +1.
> If I'm not wrong we need to count that safe functions does not quit the test in
> cleanup function (tst_brk__() and tst_brk_entered).
Yes,  because we want to do more it in cleanup, so we use 
"tst_brk_handler = tst_cvres" to print something instead of " 
tst_brk_handler = tst_vbrk_;". We also have documented it in 
doc/test-writing-guidelines.txt.

Best Regards
Yang Xu
>
> Kind regards,
> Petr
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
