Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BD11D1432
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 15:12:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C05B43C54FC
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 15:12:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 923B43C210D
 for <ltp@lists.linux.it>; Wed, 13 May 2020 15:12:43 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 3C1D11A00E45
 for <ltp@lists.linux.it>; Wed, 13 May 2020 15:12:34 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,387,1583164800"; d="scan'208";a="92012522"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2020 21:12:17 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 2223850A996E;
 Wed, 13 May 2020 21:12:13 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 May 2020 21:12:12 +0800
Message-ID: <5EBBF22B.80501@cn.fujitsu.com>
Date: Wed, 13 May 2020 21:12:11 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <20200513123409.GA10803@yuki.lan>
In-Reply-To: <20200513123409.GA10803@yuki.lan>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2223850A996E.A89C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/5/13 20:34, Cyril Hrubis wrote:
> Hi!
>> pidfd_open(2) will set close-on-exec flag on the file descriptor as it
>> manpage states, so check close-on-exec flag by fcntl(2).
>>
>> BTW:
>> I tried to pass (long) TST_RET to fcntl() but triggered the following
>> compiler warning, so pass (int) pidfd instead.
>> ------------------------------------------------------
>> In file included from pidfd_open01.c:9:
>> pidfd_open01.c: In function ???run???:
>> ../../../../include/tst_test.h:76:41: warning: format ???%i??? expects argument of type ???int???, but argument 5 has type ???long int??? [-Wformat=]
>>     76 |   tst_brk_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
>>        |                                         ^~~~~~~~~
>> ../../../../include/tst_safe_macros.h:224:5: note: in expansion of macro ???tst_brk???
>>    224 |     tst_brk(TBROK | TERRNO,                          \
>>        |     ^~~~~~~
>> pidfd_open01.c:20:9: note: in expansion of macro ???SAFE_FCNTL???
>>     20 |  flag = SAFE_FCNTL(TST_RET, F_GETFD);
>
> You can either cast the TST_RET to int as SAFE_FCNTL((int)TST_RET, ...)
> or if you decide to store the pidfd into an int variable there is no
> added value in using the TEST() macro here so the code should just do
> pidfd = pidfd_open(...) and use the pidfd instead of TST_RET.
Hi Cyril,

Thanks for your reply.
I also think it is OK to replace TEST() and TST_RET directly.

Thanks,
Xiao Yang
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
