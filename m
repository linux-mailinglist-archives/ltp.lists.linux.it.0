Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ABE204953
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 07:52:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F19263C2BB5
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 07:52:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 5D5D93C2209
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 07:52:26 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 73E951A01078
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 07:52:23 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,270,1589212800"; d="scan'208";a="95131238"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jun 2020 13:52:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id A58284CE3F0A;
 Tue, 23 Jun 2020 13:41:54 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 23 Jun 2020 13:52:14 +0800
Message-ID: <5EF1988C.3090008@cn.fujitsu.com>
Date: Tue, 23 Jun 2020 13:52:12 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <petr.vorel@suse.com>
References: <20200622070911.16123-1-petr.vorel@suse.com>
 <20200622070911.16123-6-petr.vorel@suse.com>
In-Reply-To: <20200622070911.16123-6-petr.vorel@suse.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A58284CE3F0A.ADB35
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RESENT RFC PATCH 5/5] st_net.sh: tst_rhost_run: Add -d
 option (debug)
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

On 2020/6/22 15:09, Petr Vorel wrote:
> From: Petr Vorel <pvorel@suse.cz>
>
> -d debug mode (print command and netns/ssh handling into stderr)
>
> Add tst_net_debug() simple helper for printing into stderr.
>
> Also use new parameter in tst_rhost_run.sh.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> RFC: I use it quite a lot, but not sure if needed.
>
> Probably using $TST_NET_DEBUG instead of -d would be better.
Hi Petr,

Agreed. $TST_NET_DEBUG is better for user to print debug info because we
don't need to change code(i.e. pass -d to tst_rhost_run()).
Debug info is only related to tst_rhost_run() so is $TST_RHOST_RUN_DEBUG
meaningful?
> If we merge "tst_test.sh: Print tst_{res, brk} into stdout" [1],
> simple tst_res_ could be used. I was also thinking about adding new flag
> "DEBUG", but that's probably not needed.
I think tst_res TINFO is enough. :-)

Thanks,
Xiao Yang
> Kind regards,
> Petr
>
> [1] https://patchwork.ozlabs.org/project/ltp/patch/20200619192542.20113-1-pvorel@suse.cz/
>
>  lib/newlib_tests/shell/net/tst_rhost_run.sh |  8 +++---
>  testcases/lib/tst_net.sh                    | 29 ++++++++++++++++-----
>  2 files changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/lib/newlib_tests/shell/net/tst_rhost_run.sh b/lib/newlib_tests/shell/net/tst_rhost_run.sh
> index 4c034a4ac..ebcd4ca03 100755
> --- a/lib/newlib_tests/shell/net/tst_rhost_run.sh
> +++ b/lib/newlib_tests/shell/net/tst_rhost_run.sh
> @@ -10,14 +10,14 @@ do_test()
>  {
>  	local file="/etc/fstab"
>  
> -	tst_rhost_run -c 'which grep > /dev/null' || \
> +	tst_rhost_run -d -c 'which grep > /dev/null' || \
>  		tst_res TCONF "grep not found on rhost"
>  
> -	tst_rhost_run -c "[ -f $file ]" || \
> +	tst_rhost_run -d -c "[ -f $file ]" || \
>  		tst_res TCONF "$file not found on rhost"
>  
> -	tst_rhost_run -s -c "grep -q \"[^ ]\" $file"
> -	tst_rhost_run -s -c "grep -q '[^ ]' $file"
> +	tst_rhost_run -ds -c "grep -q \"[^ ]\" $file"
> +	tst_rhost_run -ds -c "grep -q '[^ ]' $file"
>  
>  	tst_res TPASS "tst_rhost_run is working"
>  }
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 2ed570a6b..d6845618d 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -130,11 +130,17 @@ init_ltp_netspace()
>  	tst_restore_ipaddr rhost
>  }
>  
> +tst_net_debug()
> +{
> +	echo "DEBUG: $@" >&2
> +}
> +
>  # Run command on remote host.
>  # tst_rhost_run -c CMD [-b] [-s] [-u USER]
>  # Options:
>  # -b run in background
>  # -c CMD specify command to run (this must be binary, not shell builtin/function)
> +# -d debug mode (print command and netns/ssh handling into stderr)
>  # -s safe option, if something goes wrong, will exit with TBROK
>  # -u USER for ssh (default root)
>  # RETURN: 0 on success, 1 on failure
> @@ -143,16 +149,17 @@ tst_rhost_run()
>  	local post_cmd=' || echo RTERR'
>  	local user="root"
>  	local ret=0
> -	local cmd out output pre_cmd safe
> +	local cmd debug out output pre_cmd rcmd sh_cmd safe use
>  
>  	local OPTIND
> -	while getopts :bsc:u: opt; do
> +	while getopts :bc:dsu: opt; do
>  		case "$opt" in
>  		b) [ "${TST_USE_NETNS:-}" ] && pre_cmd= || pre_cmd="nohup"
>  		   post_cmd=" > /dev/null 2>&1 &"
>  		   out="1> /dev/null"
>  		;;
>  		c) cmd="$OPTARG" ;;
> +		d) debug=1 ;;
>  		s) safe=1 ;;
>  		u) user="$OPTARG" ;;
>  		*) tst_brk_ TBROK "tst_rhost_run: unknown option: $OPTARG" ;;
> @@ -166,14 +173,24 @@ tst_rhost_run()
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
> -		output=$(ssh -n -q $user@$RHOST \
> -			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
> +		use="SSH"
> +		rcmd="ssh -n -q $user@$RHOST"
>  	fi
> +
> +	if [ "$debug" ]; then
> +		tst_net_debug "tst_rhost_run: cmd: $cmd"
> +		tst_net_debug "$use: $rcmd \"$sh_cmd\" $out 2>&1"
> +	fi
> +
> +	output=$($rcmd "$sh_cmd" $out 2>&1 || echo 'RTERR')
> +
>  	echo "$output" | grep -q 'RTERR$' && ret=1
>  	if [ $ret -eq 1 ]; then
>  		output=$(echo "$output" | sed 's/RTERR//')




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
