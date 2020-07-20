Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A32782258B9
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 09:37:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 538B03C2834
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 09:37:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 36FDE3C12A0
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 09:37:49 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id BEC78201445
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 09:37:47 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="96607394"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 15:37:45 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 1183F4CE1505;
 Mon, 20 Jul 2020 15:37:42 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 15:37:44 +0800
Message-ID: <5F1549C4.9030609@cn.fujitsu.com>
Date: Mon, 20 Jul 2020 15:37:40 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-2-pvorel@suse.cz>
In-Reply-To: <20200710172044.21592-2-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 1183F4CE1505.AA3D8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/7] tst_net.sh: Remove rsh support
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
> rsh is not used nowadays. When was the first network library version
> added in 18739ff06 (2014), it was a default + and ssh replacement was
> optional. Netns based single machine testing was added in 5f8ca6cf0
> (2016). After 6 years it's time to drop legacy rsh.
>
> ssh based testing setup requires only RHOST variable, TST_USE_SSH has
> been removed as unneeded. Also check for ssh in tst_rhost_run().
>
> We still keep $LTP_RSH for some of the network stress tests, which has
> not been ported to tst_net.sh yet.
Hi Petr,

Acked-by: Xiao Yang <yangx.jy@cn.fujitsu.com>

Thanks,
Xiao Yang
> Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/lib/tst_net.sh | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 806b540cd..7ba267eda 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -136,7 +136,7 @@ init_ltp_netspace()
>  # -b run in background
>  # -c CMD specify command to run (this must be binary, not shell builtin/function)
>  # -s safe option, if something goes wrong, will exit with TBROK
> -# -u USER for ssh/rsh (default root)
> +# -u USER for ssh (default root)
>  # RETURN: 0 on success, 1 on failure
>  tst_rhost_run()
>  {
> @@ -166,14 +166,12 @@ tst_rhost_run()
>  		return 1
>  	fi
>  
> -	if [ -n "${TST_USE_SSH:-}" ]; then
> -		output=`ssh -n -q $user@$RHOST "sh -c \
> -			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
> -	elif [ -n "${TST_USE_NETNS:-}" ]; then
> +	if [ -n "${TST_USE_NETNS:-}" ]; then
>  		output=`$LTP_NETNS sh -c \
>  			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR'`
>  	else
> -		output=`rsh -n -l $user $RHOST "sh -c \
> +		tst_require_cmds ssh
> +		output=`ssh -nq $user@$RHOST "sh -c \
>  			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
>  	fi
>  	echo "$output" | grep -q 'RTERR$' && ret=1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
