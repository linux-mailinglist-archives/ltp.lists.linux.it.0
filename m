Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E82EAD45
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 15:20:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98D563C31F7
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 15:20:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 38EB03C06B6
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 15:20:27 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 504751A00E24
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 15:20:25 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,477,1599494400"; d="scan'208";a="103204648"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Jan 2021 22:20:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 8FF924CE601E;
 Tue,  5 Jan 2021 22:20:20 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 5 Jan 2021 22:20:21 +0800
Message-ID: <5FF475A2.3060209@cn.fujitsu.com>
Date: Tue, 5 Jan 2021 22:20:18 +0800
From: yangx.jy <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210104125423.19183-1-yangx.jy@cn.fujitsu.com>
 <X/RmeykJSClh7a5/@yuki.lan>
In-Reply-To: <X/RmeykJSClh7a5/@yuki.lan>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 8FF924CE601E.ABE5D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/open01.c: Don't continue when open()
 failed
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

On 2021/1/5 21:15, Cyril Hrubis wrote:
> Hi!
>> Avoid calling fstat() with invalid fd:
>> -------------------------------------------
>> ./open01
>> ...
>> open01.c:53: TBROK: fstat(-1,0x7fff731410a0) failed: EBADF (9)
>> -------------------------------------------
>>
>> Signed-off-by: Xiao Yang<yangx.jy@cn.fujitsu.com>
>> ---
>>   testcases/kernel/syscalls/open/open01.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/testcases/kernel/syscalls/open/open01.c b/testcases/kernel/syscalls/open/open01.c
>> index 1172f832b..2f0ad550a 100644
>> --- a/testcases/kernel/syscalls/open/open01.c
>> +++ b/testcases/kernel/syscalls/open/open01.c
>> @@ -47,6 +47,9 @@ static void verify_open(unsigned int n)
>>
>>   	TST_EXP_FD(open(tc->filename, tc->flag, tc->mode),
>>   	           "open() with %s", tc->desc);
>> +	if (!TST_PASS)
>> +		return;
>> +
> Doesn't this only happen if the open() that is supposed to return a
> valid file descriptor fails unexpectedly? In that the test fails, right?
Hi Cyril,

Right.
> But I guess that it does not harm, so:
>
> Acked-by: Cyril Hrubis<chrubis@suse.cz>
I will push it soon.

Best Regards,
Xiao Yang




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
