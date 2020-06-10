Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1991F502D
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 10:21:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 115DD3C2E31
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 10:21:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3CF0B3C019A
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 10:21:30 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id CB0981A014A5
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 10:21:27 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,495,1583164800"; d="scan'208";a="94233933"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jun 2020 16:21:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3B07B4CE26E0;
 Wed, 10 Jun 2020 16:21:24 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Jun 2020 16:21:23 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <57a1c19e-d8e5-4389-8565-20e49f144657@G08CNEXMBPEKD05.g08.fujitsu.local>
 <78176e41-03c4-e75b-594b-20731b2d4dfd@cn.fujitsu.com>
 <20200610080529.GA19781@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <2845dc64-cce0-47df-1005-4cc508bd9388@cn.fujitsu.com>
Date: Wed, 10 Jun 2020 16:21:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200610080529.GA19781@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3B07B4CE26E0.AD790
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] LIB: Use INTERNAL_LIB for ltp lib
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
>> Hi Petr
> 
>> Nothing blocks this simple patch, I guess we can directly push this
>> patch(don't forget jan's acked-by).
> 
> I guess you missed librealtime.a in (testcases/realtime/lib/Makefile).
Yes.
> 
> Maybe removing libdir could be in separate commit, it looks to me as unrelated
> change.
> 
Agree.
> And you haven't replied to my question:
> https://lists.linux.it/pipermail/ltp/2020-June/017495.html
> 
> But newer mind :). Maybe it's just me, but "Also include Android_libpthread and
> android_librt." is not clear to me. I'd phrase it: "Also change Android_libpthread and
> android_librt" (because include is ambiguous, when we're trying not to
> install/include these statically linked libraries.
Yes, My meaning is that v1 does not modify 
Android_libpthread/android_librt, and v2 does this. Using modify is better.

> 
> BTW if you ack it, I can do this changes before merge.
acked.

Best Regards
Yang Xu
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
