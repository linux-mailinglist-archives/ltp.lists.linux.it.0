Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF3FFEA5
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 07:42:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A085E3C23E6
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 07:42:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 60A5E3C17C7
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 07:42:27 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 206E010007B9
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 07:42:25 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,319,1569254400"; d="scan'208";a="78654596"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Nov 2019 14:42:22 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 63C154CE14FF;
 Mon, 18 Nov 2019 14:34:03 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 18 Nov 2019 14:42:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::c04f:a92d:e25c:5f44])
 by G08CNEXMBPEKD04.g08.fujitsu.local
 ([fe80::c04f:a92d:e25c:5f44%14]) with
 mapi id 15.00.1395.000; Mon, 18 Nov 2019 14:42:21 +0800
From: "Xu, Yang" <xuyang2018.jy@cn.fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [PATCH v3 1/5] syscalls/quotactl01.c: Add Q_GETNEXQUOTA test
Thread-Index: AQHVkLOpzxsBeFNK7kCf1U9FU6HaBaeL8YuAgAShCCA=
Date: Mon, 18 Nov 2019 06:42:21 +0000
Message-ID: <989b7cbfa4cf4d7bb65c9b7df45b8c37@G08CNEXMBPEKD04.g08.fujitsu.local>
References: <20191031152646.GA7078@dell5510>
 <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1572612959-20577-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191115155123.GA658@x230>
In-Reply-To: <20191115155123.GA658@x230>
Accept-Language: en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.220.84]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 63C154CE14FF.AD2DE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/5] syscalls/quotactl01.c: Add Q_GETNEXQUOTA
 test
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


>> Q_GETNEXTQUOTA was introduced since linux 4.6, this operation is the 
>>same as Q_GETQUOTA, but it returns quota information for the next ID 
>> greater than or equal to id that has a quota set.
>
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>Reviewed-by: Petr Vorel <pvorel@suse.cz> LGTM, minor note below.
Thanks for your review.

>> +#ifdef HAVE_STRUCT_IF_NEXTDQBLK
>> +# include <linux/quota.h>
>You test <linux/quota.h> in LTP_CHECK_SYSCALL_QUOTACTL (indirectly via AC_CHECK_TYPES, but that should be ok)
...
>>  	TEST(quotactl(tc->cmd, tst_device->dev, *tc->id, tc->addr));
>>+	if (TST_ERR == EINVAL) {
>> +		tst_res(TCONF, "Current system doesn't support this cmd");
>nit: cmd? Maybe something like "quotactl() syscall does not support this command"
>or "quotactl() syscall does not support to %s", tc->des to follow other messages. I'd actually prefer to have some macro, which prints QCMD flags, but that's a detail which we can >ignore.
I think we can add some info before each run (such as prctl02.c and copy_file_range02.c, make error cases more clear ), as below:
	tst_res(TINFO, "Test #%d: %s", n, tc->tname);  // this tname is a QCMD_string
>Kind regards,
>Petr





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
