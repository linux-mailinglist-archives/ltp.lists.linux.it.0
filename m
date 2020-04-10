Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D631A3E8D
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Apr 2020 05:02:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 590143C2D07
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Apr 2020 05:02:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 415353C0639
 for <ltp@lists.linux.it>; Fri, 10 Apr 2020 05:02:34 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 6D51E1A01740
 for <ltp@lists.linux.it>; Fri, 10 Apr 2020 05:02:32 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,364,1580745600"; d="scan'208";a="88785524"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Apr 2020 11:02:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8C30B49DF12B;
 Fri, 10 Apr 2020 10:52:01 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 10 Apr 2020 11:02:26 +0800
To: <laniel_francis@privacyrequired.com>
References: <67fdc846a8cd8616c9eb13cf89463b9d637e6849>
 <20200409211255.1357-1-laniel_francis@privacyrequired.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <7c9e27de-aaff-98ea-4e00-2c242f7a0cc3@cn.fujitsu.com>
Date: Fri, 10 Apr 2020 11:02:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200409211255.1357-1-laniel_francis@privacyrequired.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8C30B49DF12B.AD3FF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Add new test for pipe2 with/without O_NONBLOCK mode
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

Hi Laniel


> Hi.
> 
> 
> I added a new test file (pipe2_03.c) to test pipe2 system call with and without
> O_NONBLOCK enabled.
> This test uses the macro SAFE_PIPE2 that I added, this macro is just the
> equivalent of SAFE_PIPE for pipe2.
> 
> I do not know if it is correct to do that but at the end of the test function we
> need to set the pipe in the same state as it was at the end of setup function:
> 1. Set the O_NONBLOCK flag to the pipe.
> 2. Read the pipe to empty it.
As my previous mail said, fill up the pipe in setup, so we don't need to 
read the pipe. we only need to set the non_block flag when using -i 
parameter.

I modify your patch and merged into my ltp own fork.
see 
https://github.com/xuyang0410/ltp/commits/Laniel_francis_pipe2_03_v3.fixes

ps: I will convert pipe2_01/02.c into new libray and use SAFE_PIPE2 macro.

Best Regards
Yang Xu
> 3. We do not set its size to default because we do not care of it.
> If we do not do that, there will be problem when this test is run multiple time
> (this problem was found when running ./pipe2_03 -i 10).
> 
> The diff --stat output is the following:
>   include/old/safe_macros.h                  |   3 +++
>   include/tst_safe_macros.h                  |   6 ++++++
>   lib/safe_macros.c                          |  15 ++++++++++++++
>   runtest/syscalls                           |   1 +
>   testcases/kernel/syscalls/pipe2/.gitignore |   1 +
>   testcases/kernel/syscalls/pipe2/pipe2_03.c | 135 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   6 files changed, 161 insertions(+)
> 
> 
> Best regards.
> 
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
