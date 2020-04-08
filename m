Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 797911A1DFD
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 11:19:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 194233C2D1B
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 11:19:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1E97F3C061B
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 11:19:50 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id EBA6B1000C4F
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 11:19:46 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; d="scan'208";a="88684264"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 17:19:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B966B406AB15;
 Wed,  8 Apr 2020 17:09:11 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 17:19:33 +0800
To: Richard Palethorpe <rpalethorpe@suse.com>
References: <20200408090635.4686-1-rpalethorpe@suse.com>
 <20200408090635.4686-2-rpalethorpe@suse.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <8acfd7d7-d511-65e6-b125-d2a1fd4e385e@cn.fujitsu.com>
Date: Wed, 8 Apr 2020 17:19:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200408090635.4686-2-rpalethorpe@suse.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B966B406AB15.ACE87
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] add_key05: Correct formatting
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

Hi Richard

Sorry for this wrong format. Thanks for your fix.
Acked-by.

Best Regards
Yang Xu
> Use checkpatch.pl
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>   testcases/kernel/syscalls/add_key/add_key05.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/add_key/add_key05.c b/testcases/kernel/syscalls/add_key/add_key05.c
> index 5691b8579..d83339048 100644
> --- a/testcases/kernel/syscalls/add_key/add_key05.c
> +++ b/testcases/kernel/syscalls/add_key/add_key05.c
> @@ -118,8 +118,8 @@ static void verify_max_btyes(void)
>   	plen = max_bytes - used_bytes - delta - strlen("test_xxx") - 1;
>   	TEST(add_key("user", "test_max", buf, plen, KEY_SPEC_THREAD_KEYRING));
>   	if (TST_RET == -1) {
> -		 tst_res(TFAIL | TTERRNO, "add_key(test_max) failed unexpectedly");
> -		 return;
> +		tst_res(TFAIL | TTERRNO, "add_key(test_max) failed unexpectedly");
> +		return;
>   	}
>   
>   	tst_res(TPASS, "add_key(test_max) succeeded as expected");
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
