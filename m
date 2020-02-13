Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E62115B783
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 04:04:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE7CC3C25D8
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 04:03:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 941833C0EB6
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 04:03:56 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2E7E260055D
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 04:03:54 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,434,1574092800"; d="scan'208";a="83234779"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Feb 2020 11:03:51 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 59DE7406AB15;
 Thu, 13 Feb 2020 10:54:15 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 13 Feb 2020 11:03:46 +0800
Message-ID: <5E44BC90.1050908@cn.fujitsu.com>
Date: Thu, 13 Feb 2020 11:03:44 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <5E43C9A1.8090807@cn.fujitsu.com>
 <1581502051-17240-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1078491624.7198409.1581514672304.JavaMail.zimbra@redhat.com>
In-Reply-To: <1078491624.7198409.1581514672304.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 59DE7406AB15.AA8C5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] aio02: Drop O_DIRECT flag for tmpfs
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

On 2020/2/12 21:37, Jan Stancek wrote:
>
> ----- Original Message -----
>> tmpfs doesn't support O_DIRECT flag, drop it. So user still can run aio02
>> with different filesystem by mounting specified filesystem on $TMPDIR.
>>
>> Also remove unused static value initialization.
>>
>> Reviewed-by: Xiao Yang<ice_yangxiao@163.com>
>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>> ---
>>   testcases/kernel/io/aio/aio02.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
> Acked-by: Jan Stancek<jstancek@redhat.com>
>
>
Hi all,

Thanks, I will push it with a minor change:
Keep original tc->flags and change cloned new_flags for tmpfs so that 
running aio02
in loops can report the 'Drop ...' hint for each changed subtest.  As below:
Without the change:
-----------------------------------------------------------------------------------
[root@Fedora-30 aio]# ./aio02 -i 2
tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s
aio02.c:210: INFO: Drop O_DIRECT flag for tmpfs
aio02.c:218: PASS: WRITE: O_WRONLY | O_TRUNC | O_DIRECT | O_LARGEFILE | 
O_CREAT
aio02.c:210: INFO: Drop O_DIRECT flag for tmpfs
aio02.c:218: PASS: READ : O_RDONLY | O_DIRECT | O_LARGEFILE
aio02.c:218: PASS: WRITE: O_RDWR | O_TRUNC
aio02.c:218: PASS: READ : O_RDWR
aio02.c:218: PASS: WRITE: O_WRONLY | O_TRUNC
aio02.c:218: PASS: READ : O_RDONLY
aio02.c:218: PASS: WRITE: O_WRONLY | O_TRUNC | O_DIRECT | O_LARGEFILE | 
O_CREAT
aio02.c:218: PASS: READ : O_RDONLY | O_DIRECT | O_LARGEFILE
aio02.c:218: PASS: WRITE: O_RDWR | O_TRUNC
aio02.c:218: PASS: READ : O_RDWR
aio02.c:218: PASS: WRITE: O_WRONLY | O_TRUNC
aio02.c:218: PASS: READ : O_RDONLY
...
-----------------------------------------------------------------------------------
With the change:
-----------------------------------------------------------------------------------
[root@Fedora-30 aio]# ./aio02 -i 2
tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s
aio02.c:212: INFO: Drop O_DIRECT flag for tmpfs
aio02.c:220: PASS: WRITE: O_WRONLY | O_TRUNC | O_DIRECT | O_LARGEFILE | 
O_CREAT
aio02.c:212: INFO: Drop O_DIRECT flag for tmpfs
aio02.c:220: PASS: READ : O_RDONLY | O_DIRECT | O_LARGEFILE
aio02.c:220: PASS: WRITE: O_RDWR | O_TRUNC
aio02.c:220: PASS: READ : O_RDWR
aio02.c:220: PASS: WRITE: O_WRONLY | O_TRUNC
aio02.c:220: PASS: READ : O_RDONLY
aio02.c:212: INFO: Drop O_DIRECT flag for tmpfs
aio02.c:220: PASS: WRITE: O_WRONLY | O_TRUNC | O_DIRECT | O_LARGEFILE | 
O_CREAT
aio02.c:212: INFO: Drop O_DIRECT flag for tmpfs
aio02.c:220: PASS: READ : O_RDONLY | O_DIRECT | O_LARGEFILE
aio02.c:220: PASS: WRITE: O_RDWR | O_TRUNC
aio02.c:220: PASS: READ : O_RDWR
aio02.c:220: PASS: WRITE: O_WRONLY | O_TRUNC
aio02.c:220: PASS: READ : O_RDONLY
...
-----------------------------------------------------------------------------------

Thanks,
Xiao Yang



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
