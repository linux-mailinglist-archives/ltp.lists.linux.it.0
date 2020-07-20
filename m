Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD5D225B55
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 11:23:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FA4C3C2932
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 11:23:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 298413C2123
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 11:23:08 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9D12F1001DA6
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 11:23:06 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="96614049"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 17:23:04 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 8BF704CE5059;
 Mon, 20 Jul 2020 17:23:03 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 17:23:05 +0800
Message-ID: <5F156275.6050602@cn.fujitsu.com>
Date: Mon, 20 Jul 2020 17:23:01 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-8-pvorel@suse.cz>
In-Reply-To: <20200710172044.21592-8-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 8BF704CE5059.AAD02
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 7/7] tst_net.sh/tst_rhost_run: Add debugging
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
> via TST_NET_RHOST_RUN_DEBUG=1 and use it in tst_rhost_run.sh.
Hi Petr,

Acked-by: Xiao Yang <yangx.jy@cn.fujitsu.com>

Thanks,
Xiao Yang

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> changes v1->v2:
> * Use TST_NET_RHOST_RUN_DEBUG=1 instead of -d in tst_rhost_run
> This requires to whitelist it in tst_test.sh.
> * use tst_res_ TINFO instead of tst_net_debug
>
>
> Kind regards,
> Petr
>
>  lib/newlib_tests/shell/net/tst_rhost_run.sh |  2 ++
>  testcases/lib/tst_net.sh                    | 23 +++++++++++++++------
>  testcases/lib/tst_test.sh                   |  2 +-
>  testcases/network/README.md                 |  3 +++
>  4 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/lib/newlib_tests/shell/net/tst_rhost_run.sh b/lib/newlib_tests/shell/net/tst_rhost_run.sh
> index 4c034a4ac..9b058a57a 100755
> --- a/lib/newlib_tests/shell/net/tst_rhost_run.sh
> +++ b/lib/newlib_tests/shell/net/tst_rhost_run.sh
> @@ -6,6 +6,8 @@ TST_TESTFUNC=do_test
>  PATH="$(dirname $0)/../../../../testcases/lib/:$PATH"
>  . tst_net.sh
>  
> +export TST_NET_RHOST_RUN_DEBUG=1
> +
>  do_test()
>  {
>  	local file="/etc/fstab"
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index f6ac4c087..d939a5780 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -138,15 +138,16 @@ init_ltp_netspace()
>  # -s safe option, if something goes wrong, will exit with TBROK
>  # -u USER for ssh (default root)
>  # RETURN: 0 on success, 1 on failure
> +# TST_NET_RHOST_RUN_DEBUG=1 enables debugging
>  tst_rhost_run()
>  {
>  	local post_cmd=' || echo RTERR'
>  	local user="root"
>  	local ret=0
> -	local cmd out output pre_cmd safe
> +	local cmd out output pre_cmd rcmd sh_cmd safe use
>  
>  	local OPTIND
> -	while getopts :bsc:u: opt; do
> +	while getopts :bc:su: opt; do
>  		case "$opt" in
>  		b) [ "${TST_USE_NETNS:-}" ] && pre_cmd= || pre_cmd="nohup"
>  		   post_cmd=" > /dev/null 2>&1 &"
> @@ -166,14 +167,24 @@ tst_rhost_run()
>  		return 1
>  	fi
>  
> +	sh_cmd="$pre_cmd $cmd $post_cmd"
> +
>  	if [ -n "${TST_USE_NETNS:-}" ]; then
> -		output=$($LTP_NETNS sh -c \
> -			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
> +		use="NETNS"
> +		rcmd="$LTP_NETNS sh -c"
>  	else
>  		tst_require_cmds ssh
> -		output=$(ssh -nq $user@$RHOST \
> -			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
> +		use="SSH"
> +		rcmd="ssh -nq $user@$RHOST"
> +	fi
> +
> +	if [ "$TST_NET_RHOST_RUN_DEBUG" = 1 ]; then
> +		tst_res_ TINFO "tst_rhost_run: cmd: $cmd"
> +		tst_res_ TINFO "$use: $rcmd \"$sh_cmd\" $out 2>&1"
>  	fi
> +
> +	output=$($rcmd "$sh_cmd" $out 2>&1 || echo 'RTERR')
> +
>  	echo "$output" | grep -q 'RTERR$' && ret=1
>  	if [ $ret -eq 1 ]; then
>  		output=$(echo "$output" | sed 's/RTERR//')
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 2e637b25b..fa97acbac 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -506,7 +506,7 @@ tst_run()
>  			NEEDS_DRIVERS|FS_TYPE|MNTPOINT|MNT_PARAMS);;
>  			IPV6|IPVER|TEST_DATA|TEST_DATA_IFS);;
>  			RETRY_FUNC|RETRY_FN_EXP_BACKOFF|TIMEOUT);;
> -			NET_DATAROOT|NET_MAX_PKT);;
> +			NET_DATAROOT|NET_MAX_PKT|NET_RHOST_RUN_DEBUG);;
>  			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
>  			esac
>  		done
> diff --git a/testcases/network/README.md b/testcases/network/README.md
> index 1c19a2c15..081ce834a 100644
> --- a/testcases/network/README.md
> +++ b/testcases/network/README.md
> @@ -1,5 +1,8 @@
>  # LTP Network Tests
>  
> +Both single and two host configurations support debugging via
> +`TST_NET_RHOST_RUN_DEBUG=1` environment variable.
> +
>  ## Single Host Configuration
>  
>  It is the default configuration (if the `RHOST` environment variable is not




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
