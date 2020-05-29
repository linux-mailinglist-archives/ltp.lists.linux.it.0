Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA911E7579
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 07:39:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B07F3C3197
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 07:39:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1960E3C233A
 for <ltp@lists.linux.it>; Fri, 29 May 2020 07:39:14 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2C265140145F
 for <ltp@lists.linux.it>; Fri, 29 May 2020 07:39:11 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,447,1583164800"; d="scan'208";a="93337084"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 May 2020 13:39:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B42144BCC89F;
 Fri, 29 May 2020 13:39:06 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 May 2020 13:39:08 +0800
To: Viresh Kumar <viresh.kumar@linaro.org>, Cyril Hrubis <chrubis@suse.cz>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <3b3344651f2ba4bf2446b6730a76ebcd9f894dd0.1590057824.git.viresh.kumar@linaro.org>
 <20200522123903.GB2446@yuki.lan> <20200526030854.xocwohgiyg3p5edh@vireshk-i7>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <b11c6ca2-7b63-0c12-3491-8b76f9940d2e@cn.fujitsu.com>
Date: Fri, 29 May 2020 13:39:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200526030854.xocwohgiyg3p5edh@vireshk-i7>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B42144BCC89F.ADB78
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/5] syscalls:ipc: Move libraries to libs/ director
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

Hi  Cyril

> On 22-05-20, 14:39, Cyril Hrubis wrote:
>> Hi!
>>> Move the ipc libraries to libs/ directory. One of the reasons to do this
>>> was to add the capability of adding tests with both old and new test
>>> frameworks in the same ipc test directory.
>>
>> Pushed with following diff, thanks.
>>
>> 1) You cannot build two different libs in one directory
>> 2) Setting LTPLIBS instead of LDFLAGS generates proper build
>>     dependencies as well
>> 3) Limit the linker flags for the kill and mremap tests
> 
> I don't think you pushed the changes you made. I still see my original
> patch there. :)
It looks like you miss this change. It still uses
LDFLAGS instead of correct LTPLIBS.

Best Regards
Yang Xu
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
