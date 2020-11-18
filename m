Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C21752B7634
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 07:17:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B1783C5A06
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 07:17:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C70D73C280C
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 07:17:54 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D450F6002CE
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 07:17:53 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,486,1596470400"; d="scan'208";a="101501917"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Nov 2020 14:17:51 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 993624CE3B75;
 Wed, 18 Nov 2020 14:17:48 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 18 Nov 2020 14:17:47 +0800
Message-ID: <5FB4BC97.8030300@cn.fujitsu.com>
Date: Wed, 18 Nov 2020 14:17:59 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <1604925271-4811-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <20201109125938.GC9991@yuki.lan> <5FA9ED44.7080909@cn.fujitsu.com>
 <5FAA0151.3030002@cn.fujitsu.com> <20201110102641.GA11262@yuki.lan>
 <5FAB4274.6090505@cn.fujitsu.com>
In-Reply-To: <5FAB4274.6090505@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 993624CE3B75.AB733
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pan/ltp-pan.c: fix file descriptors leaks
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
> Hi Cyril
>> Hi!
>>>> Yes, musl-libc doesn't support "e" mode for fopen[1].
>>> Sorry, I ignore __fmodeflags function, musl libc supports "e" mode since
>>> 0.9.7 after this commit 8582a6e9f ("add 'e' modifier (close-on-exec) to
>>> fopen and fdopen").
>>>
>>> https://git.musl-libc.org/cgit/musl/commit/src?id=8582a6e9f25dd7b87d72961f58008052a4cac473
>>>
>>>
>>> It is about 8 years since musl libc fopen() supports "e". glibc2.7
>>> fopen() supports "e" is about 13 years. Maybe we can use "e" mode now?
>>
>> To be honest I haven't had used ltp-pan for last two years, so if that
>> change works for everyone still using it, then we can go ahead with it.
> OK. I will wait a week. If nobody has objection, I will merge it.
I plan to merge this patch today. Before it, I want to listen some 
advise from you( IMO, you know musl-libc a lot and other libc on 
embedded system).
>
> Best Regards
> Yang Xu
>>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
