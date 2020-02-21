Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0A4166CAD
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 03:09:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AD953C25C9
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 03:09:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 378EC3C223E
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 03:08:59 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 698761A0088B
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 03:08:57 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,466,1574092800"; d="scan'208";a="83664857"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 10:08:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id F051B50A996F;
 Fri, 21 Feb 2020 09:59:14 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 10:08:54 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1575526664-25738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200220124821.GB11142@rei>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <eb73f177-9e2b-7a35-cf1a-e36c1a5ce19e@cn.fujitsu.com>
Date: Fri, 21 Feb 2020 10:08:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200220124821.GB11142@rei>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F051B50A996F.AD372
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/quotactl07: add regresstion test for
 Q_XQTUOTARM
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


Hi> Hi!
>> This is a regresstion test to check Q_XQUOTARM  whether has
>> quota flags check.
>>
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>>
>> ---------------------
>> 1.Simplify test code
>> 2.add comment for invalid_type,
>> ---------------------
>    ^
>    Btw this belongs under the three dashes below, otherwise it ends up in
>    the commit message when applied.
> 
OK. I will notice this next time.
> ...
> 
>> +static void setup(void)
>> +{
>> +	TEST(quotactl(QCMD(Q_XQUOTAOFF, USRQUOTA), tst_device->dev, 0, (void *)&qflag_acct));
>> +	if (TST_RET == -1)
>> +		tst_brk(TBROK | TTERRNO, "quotactl with Q_XQUOTAOFF failed");
>> +
>> +	TEST(quotactl(QCMD(Q_XQUOTARM, USRQUOTA), tst_device->dev, 0, (void *)&valid_type));
>> +	if (TST_ERR == EINVAL) {
>> +		tst_res(TCONF, "current system doesn't support Q_XQUOTARM, skip it");
>> +		return;
> 
> I've changed this to tst_brk() because doing return from setup has no
> efect here, and pushed, thanks.
Thanks for pushing.
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
