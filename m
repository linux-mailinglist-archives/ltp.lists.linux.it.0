Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D21FC243C6A
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 17:22:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93B7C3C30C6
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 17:22:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 23C303C136B
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 17:22:28 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5F52B200AD9
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 17:22:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,308,1592841600"; d="scan'208";a="98068283"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Aug 2020 23:22:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 300534CE34FC;
 Thu, 13 Aug 2020 23:22:22 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 13 Aug 2020 23:22:24 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1595230227-21468-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200813141638.GF13292@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <849218df-2173-ff9a-f0e6-c5926c15a864@cn.fujitsu.com>
Date: Thu, 13 Aug 2020 23:22:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200813141638.GF13292@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 300534CE34FC.AABC7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 0/3] increase msgrcv coverage
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

HI Cyril


> Hi!
>> 1. The first patch add check for msg_lrpid and msg_rtime.
>> 2. The second patch tests different msgtyp.
>> 3. The third patch tests MSG_COPY flag(basic error test),not functional
>> test because kernel selftest[1] has tested this.
>>
>> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/ipc/msgque.c
> 
> Looking at the code there it actually does not seem to be automated
> test, so I think that we should include a test for MSG_COPY in LTP.
> 
> We can put a simple one into msgrcv07 we would call msgrcv() with
> MSG_COPY if we got an EINVAL we will skip the test since MSG_COPY is not
> supported.
> 
> Otherwise msgrcv with id 0 and 1 should retrieve our two messages, so we
> would check that the data are correct, then we would check that there
> are still two messages queue in the queue, we can do that with msgctl()
> and/or read them with regular msgrcv.
I see. I will do it on new msgrcv07.c tomorrow(It is a little late today).
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
