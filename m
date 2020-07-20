Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E16862259D2
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 10:18:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84BBD3C2932
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 10:18:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 400673C223B
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 10:18:08 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 186B86011C7
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 10:16:51 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="96609722"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 16:18:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 23CD54CE4B09;
 Mon, 20 Jul 2020 16:17:59 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 16:18:01 +0800
Message-ID: <5F155335.8080901@cn.fujitsu.com>
Date: Mon, 20 Jul 2020 16:17:57 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-3-pvorel@suse.cz>
In-Reply-To: <20200710172044.21592-3-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 23CD54CE4B09.AA5AE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/7] tst_net.sh: Use ssh in LTP_RSH
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
> for LTP_RSH (rsh fallback) it's better to use ssh instead of rsh by
> default, using current user.
>
> + update docs.
>
> Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/lib/tst_net.sh        | 2 +-
>  testcases/network/stress/README | 9 ++++-----
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 7ba267eda..0a8b2a8ca 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -838,7 +838,7 @@ tst_default_max_pkt()
>  export RHOST="$RHOST"
>  export PASSWD="${PASSWD:-}"
>  # Don't use it in new tests, use tst_rhost_run() from tst_net.sh instead.
> -export LTP_RSH="${LTP_RSH:-rsh -n}"
> +export LTP_RSH="${LTP_RSH:-ssh -nq}"
Hi Petr,

Some very old stress tests use check_envval(instead of tst_net.sh) to
init LTP_RSH,
Do you think if we need to change it as well:
--------------------------------------
# LTP_RSH
LTP_RSH=${LTP_RSH:=}
if [ x"${LTP_RSH}" = x ]; then
LTP_RSH="rsh -n"
elif [ "$LTP_RSH" = "rsh" ]; then
LTP_RSH="rsh -n"
fi
--------------------------------------

Thanks,
Xiao Yang
>  
>  # Test Links
>  # IPV{4,6}_{L,R}HOST can be set with or without prefix (e.g. IP or IP/prefix),
> diff --git a/testcases/network/stress/README b/testcases/network/stress/README
> index bc51a4cc9..b9537b1ce 100644
> --- a/testcases/network/stress/README
> +++ b/testcases/network/stress/README
> @@ -48,10 +48,9 @@ To run the network stress testcases, use network.sh script, located in
>  testscripts directory. For documentation about using network.sh see INSTALL
>  and testcases/network/README.md
>  
> -Unfortunately some stress tests still depend on rsh for accessing remote host, even
> -you decide to use SSH or network namespaces with network.sh.
> -Instead of rsh, you can use ssh to set the environment variable LTP_RSH.
> -Please refer the `Environment Variable' section of this document.
> +Some stress tests originally designed to be tested with rsh for accessing
> +remote host are now using ssh using the current user. Old behavior (using rsh
> +can be achieved with setting LTP_RSH variable).
>  
>  The behaviour of network stress tests is configurable with environment
>  variables (See `Environment Variable' section).
> @@ -146,7 +145,7 @@ Optional environment variables
>  ------------------------------
>  
>   o LTP_RSH
> -   The name of the remote shell command, namely rsh or ssh.
> +   The name of the remote shell command, namely ssh (the default) or rsh.
>     In ether case, the remote host must accept the login from the local host
>     without password.
>  




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
