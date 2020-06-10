Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC71F5082
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 10:47:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4E893C2E2E
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 10:47:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E57653C019A
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 10:47:19 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 62BA31001744
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 10:47:17 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,495,1583164800"; d="scan'208";a="94235654"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jun 2020 16:47:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 943AF4CE26E7;
 Wed, 10 Jun 2020 16:47:14 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Jun 2020 16:47:13 +0800
Message-ID: <5EE09E11.102@cn.fujitsu.com>
Date: Wed, 10 Jun 2020 16:47:13 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <57a1c19e-d8e5-4389-8565-20e49f144657@G08CNEXMBPEKD05.g08.fujitsu.local>
 <78176e41-03c4-e75b-594b-20731b2d4dfd@cn.fujitsu.com>
 <20200610080529.GA19781@dell5510>
In-Reply-To: <20200610080529.GA19781@dell5510>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 943AF4CE26E7.ACDCA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

On 2020/6/10 16:05, Petr Vorel wrote:
> Hi Xu,
>
>> Hi Petr
>
>> Nothing blocks this simple patch, I guess we can directly push this
>> patch(don't forget jan's acked-by).
>
> I guess you missed librealtime.a in (testcases/realtime/lib/Makefile).
>
> Maybe removing libdir could be in separate commit, it looks to me as unrelated
> change.
Hi Petr, Xu

Agreed, This patch should focus on replacing LIB with INTERNAL_LIB.

My question about the issue is not important, we can just keep libdir 
for now as you want because someone may add dynamic library linking in 
future.

Thanks,
Xiao Yang
>
> And you haven't replied to my question:
> https://lists.linux.it/pipermail/ltp/2020-June/017495.html
>
> But newer mind :). Maybe it's just me, but "Also include Android_libpthread and
> android_librt." is not clear to me. I'd phrase it: "Also change Android_libpthread and
> android_librt" (because include is ambiguous, when we're trying not to
> install/include these statically linked libraries.
>
> BTW if you ack it, I can do this changes before merge.
>
> Kind regards,
> Petr
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
