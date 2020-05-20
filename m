Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B31DB685
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 16:25:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5104B3C4DF3
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 16:25:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3255F3C0300
 for <ltp@lists.linux.it>; Wed, 20 May 2020 16:25:41 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 6F7B5601EDC
 for <ltp@lists.linux.it>; Wed, 20 May 2020 16:25:31 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,414,1583164800"; d="scan'208";a="92641865"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 May 2020 22:25:30 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 295D84BCC88A;
 Wed, 20 May 2020 22:25:27 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 20 May 2020 22:25:27 +0800
Message-ID: <5EC53DD5.9000506@cn.fujitsu.com>
Date: Wed, 20 May 2020 22:25:25 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200518211514.20445-1-pvorel@suse.cz>
In-Reply-To: <20200518211514.20445-1-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 295D84BCC88A.AC5C6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] tst_net.sh: Print output on unexpected
 PASS/FAIL
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

Hi Petr,

I tested the patchset and it also looks good to me.
BTW: These outputs are useful to locate the issue.

Reviewed-by: Xiao Yang <yangx.jy@cn.fujitsu.com>

Best Regards,
Xiao Yang
On 2020/5/19 5:15, Petr Vorel wrote:
> This helps debugging.
>
> Use $TMPDIR and PID to guarantee writable directory and unique file
> without the need to require TST_NEEDS_TMPDIR=1.
>
> Signed-off-by: Petr Vorel<pvorel@suse.cz>
> ---
>   testcases/lib/tst_net.sh | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 011b62267..bfed4a44d 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -250,22 +250,32 @@ tst_net_run()
>
>   EXPECT_RHOST_PASS()
>   {
> -	tst_rhost_run -c "$*">  /dev/null
> +	local log="$TMPDIR/log.$$"
> +
> +	tst_rhost_run -c "$*">  $log
>   	if [ $? -eq 0 ]; then
>   		tst_res_ TPASS "$* passed as expected"
>   	else
>   		tst_res_ TFAIL "$* failed unexpectedly"
> +		cat $log
>   	fi
> +
> +	rm -f $log
>   }
>
>   EXPECT_RHOST_FAIL()
>   {
> -	tst_rhost_run -c "$* 2>  /dev/null"
> +	local log="$TMPDIR/log.$$"
> +
> +	tst_rhost_run -c "$*">  $log
>   	if [ $? -ne 0 ]; then
>   		tst_res_ TPASS "$* failed as expected"
>   	else
>   		tst_res_ TFAIL "$* passed unexpectedly"
> +		cat $log
>   	fi
> +
> +	rm -f $log
>   }
>
>   # Get test interface names for local/remote host.




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
