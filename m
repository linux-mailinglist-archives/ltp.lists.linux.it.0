Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCE859BF7
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jun 2019 14:52:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 295B03C1C71
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jun 2019 14:52:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 22F2A3C020B
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 14:52:14 +0200 (CEST)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5FF071A0173F
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 14:52:10 +0200 (CEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R421e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04391; MF=caspar@linux.alibaba.com; NM=1;
 PH=DS; RN=2; SR=0; TI=SMTPD_---0TVQgEpB_1561726326; 
Received: from linux.alibaba.com(mailfrom:caspar@linux.alibaba.com
 fp:SMTPD_---0TVQgEpB_1561726326) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 28 Jun 2019 20:52:06 +0800
Date: Fri, 28 Jun 2019 20:52:05 +0800
From: Caspar Zhang <caspar@linux.alibaba.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190628125205.GA48441@linux.alibaba.com>
References: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
 <5e8374fa7f4ea9d64cdfc39a2ca449761327c257.1559207183.git.caspar@casparzhang.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e8374fa7f4ea9d64cdfc39a2ca449761327c257.1559207183.git.caspar@casparzhang.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.5 required=7.0 tests=ENV_AND_HDR_SPF_MATCH,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] lib/test.sh: TCONF needs to be counted
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, is it ok to push 2/3 and 3/3 as they've got Li Wang's
Reviewed-by, or do you have different opinion?

Thanks,
Caspar

On Thu, May 30, 2019 at 05:09:57PM +0800, Caspar Zhang wrote:
> TCONF should also be one of exit statuses in a single test, else the
> output of TST_COUNT in shell tests could be wrong.
>
> Wrong:
> <<<test_output>>>
> memcg_use_hierarchy_test 1 TINFO: Starting test 1
> memcg_use_hierarchy_test 1 TINFO: set /dev/memcg/memory.use_hierarchy to 0 failed
> memcg_use_hierarchy_test 1 TPASS: process 28658 is killed
> memcg_use_hierarchy_test 2 TINFO: Starting test 2
> memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/memory.use_hierarchy to 0 failed
> memcg_use_hierarchy_test 2 TCONF: memory.use_hierarchy already been 1, blame systemd, skip
> memcg_use_hierarchy_test 2 TINFO: Starting test 3
> memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/memory.use_hierarchy to 0 failed
> memcg_use_hierarchy_test 2 TPASS: echo 0 > subgroup/memory.use_hierarchy failed as expected
> <<<execution_status>>>
>
> Right:
> <<<test_output>>>
> memcg_use_hierarchy_test 1 TINFO: Starting test 1
> memcg_use_hierarchy_test 1 TINFO: set /dev/memcg/memory.use_hierarchy to 0 failed
> memcg_use_hierarchy_test 1 TPASS: process 26825 is killed
> memcg_use_hierarchy_test 2 TINFO: Starting test 2
> memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/memory.use_hierarchy to 0 failed
> memcg_use_hierarchy_test 2 TCONF: memory.use_hierarchy already been 1, blame systemd, skip
> memcg_use_hierarchy_test 3 TINFO: Starting test 3
> memcg_use_hierarchy_test 3 TINFO: set /dev/memcg/memory.use_hierarchy to 0 failed
> memcg_use_hierarchy_test 3 TPASS: echo 0 > subgroup/memory.use_hierarchy failed as expected
> <<<execution_status>>>
>
> Signed-off-by: Caspar Zhang <caspar@linux.alibaba.com>
> ---
>  testcases/lib/test.sh | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/testcases/lib/test.sh b/testcases/lib/test.sh
> index 670248ee5..ade8fcdff 100644
> --- a/testcases/lib/test.sh
> +++ b/testcases/lib/test.sh
> @@ -58,8 +58,7 @@ tst_resm()
>  	echo " $@"
>
>  	case "$ret" in
> -	TPASS|TFAIL)
> -	TST_COUNT=$((TST_COUNT+1));;
> +	TPASS|TFAIL|TCONF) TST_COUNT=$((TST_COUNT+1));;
>  	esac
>  }
>
> --
> 2.21.0
>

--
        Thanks,
        Caspar

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
