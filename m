Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E74251277
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 08:57:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 499F73C2EC6
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 08:57:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 41BD33C04C3
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 08:57:52 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9B6EF600A36
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 08:57:50 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,351,1592841600"; d="scan'208";a="98510346"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Aug 2020 14:57:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5686A48990C7;
 Tue, 25 Aug 2020 14:57:47 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 25 Aug 2020 14:57:46 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1598250984-5141-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200824151210.GA30969@dell5510>
 <4b7cb95c-fb39-6826-b229-723a1e8bb128@cn.fujitsu.com>
 <20200825064706.GA7135@x230>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <245c88aa-29aa-f9da-c308-24208f529371@cn.fujitsu.com>
Date: Tue, 25 Aug 2020 14:57:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825064706.GA7135@x230>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5686A48990C7.AD698
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-2.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] travis: Add centos7 build
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

Hi Petr


> Hi Xu,
> 
>>>> I have this idea when I meet ALG_SET_AEAD_ASSOCLEN undefined error on centos7.
>>>> Add centos7 travis target, it is more friendly for centos7 user and it is more
>>>> meaningful than centos6.
> 
>>> OK, how about replacing CentOS 6 with CentOS 7?
>> I have no objection about this because my kernel test team only uses
>> centos7/8 to test and doesn't use centos6 for a long time.
> OK. I don't have either, although I hesitated to sent this patch.
> 
>> But I think ltp community should reach a consensus that minimal
>> glibc/kernel/gcc(clang) version , so we can drop the corresponding code in
>> travis or m4.
> 
>> Also, we can raise "Define minimal supported kernel and (g)libc version"
>> topic again.
> Well, last time I remember we decide to drop CentOS 6 after the release. But I
> haven't done it. I also planned to create wiki pagge "Supported kernel and
> libc", but haven't done it. Feel free to send a patch for any of these two.
> But I'd prefer to do the replacement (7 instead of 6) instead of adding it,
> because travis already run for quite long.
OK. I will send a v2 patch to replace centos6 with centos7 in travis.

Best Regards
Yang Xu
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
