Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C35DC225A58
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 10:49:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9300A3C2932
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 10:49:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DBCAD3C223B
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 10:49:38 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id DDEEE600705
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 10:49:37 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="96611907"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 16:49:35 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id F00954CE5059;
 Mon, 20 Jul 2020 16:49:33 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 16:49:31 +0800
Message-ID: <5F155A8E.2000807@cn.fujitsu.com>
Date: Mon, 20 Jul 2020 16:49:18 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-6-pvorel@suse.cz>
In-Reply-To: <20200710172044.21592-6-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: F00954CE5059.AABBB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/7] tst_net.sh: Drop 'sh -c' use from ssh in
 tst_rhost_run
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/7/11 1:20, Petr Vorel wrote:
> This simplifies the command and allows to use double quotes in command
> parameter for ssh, as it removes single nested quotes of command
> parameter (thus fixes like c1a2d53f6 "network/nfs_lib.sh: Use double
> quotes for grep pattern" are not needed any more).
>
> NOTE: 'sh -c' is still required for netns based testing, but does not
> use nested quotes. Now both variants use only double quotes.
Hi Petr,

Acked-by: Xiao Yang <yangx.jy@cn.fujitsu.com>

Thanks,
Xiao Yang

> Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/lib/tst_net.sh | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 0a8b2a8ca..f6ac4c087 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -167,12 +167,12 @@ tst_rhost_run()
>  	fi
>  
>  	if [ -n "${TST_USE_NETNS:-}" ]; then
> -		output=`$LTP_NETNS sh -c \
> -			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR'`
> +		output=$($LTP_NETNS sh -c \
> +			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
>  	else
>  		tst_require_cmds ssh
> -		output=`ssh -nq $user@$RHOST "sh -c \
> -			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
> +		output=$(ssh -nq $user@$RHOST \
> +			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
>  	fi
>  	echo "$output" | grep -q 'RTERR$' && ret=1
>  	if [ $ret -eq 1 ]; then




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
