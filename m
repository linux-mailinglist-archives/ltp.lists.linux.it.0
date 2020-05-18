Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9721D794A
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 15:05:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D21A63C4F51
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 15:05:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4FEB33C0030
 for <ltp@lists.linux.it>; Mon, 18 May 2020 15:04:57 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 81E01200FD9
 for <ltp@lists.linux.it>; Mon, 18 May 2020 15:04:54 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,407,1583164800"; d="scan'208";a="92477958"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 May 2020 21:04:51 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 21A0A4BCC89E;
 Mon, 18 May 2020 21:04:48 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 18 May 2020 21:04:48 +0800
Message-ID: <5EC287EE.9070508@cn.fujitsu.com>
Date: Mon, 18 May 2020 21:04:46 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200512201416.8299-1-pvorel@suse.cz>
In-Reply-To: <20200512201416.8299-1-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 21A0A4BCC89E.AC1A4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] rpc: TCONF when tests aren't compiled +
 remove kill warning
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

On 2020/5/13 4:14, Petr Vorel wrote:
> Without this test failure was wrongly reported:
> rpc_test 1 TFAIL: tirpc_rpcb_getaddr 10.0.0.2 536875000 failed unexpectedly
Hi Petr,

Do you know which caused this failure?

Best Regards,
Xiao Yang
>
> Also make sure with variable that server has started before trying to
> kill it.
>
> Kill server with SIGPIPE, should be enough and SIGKILL
> produced warning, which might be confused:
> /opt/ltp/testcases/bin/rpc_test.sh: line 61: 3827 Killed  $SERVER $PROGNUMNOSVC
>
> Reviewed-by: Alexey Kodanev<alexey.kodanev@oracle.com>
> Signed-off-by: Petr Vorel<pvorel@suse.cz>
> ---
> Hi,
>
> with this implementation (suggested by Alexey), we get TCONF twice. It's
> a bit strange, but I'll keep it, because I like that required binary is
> printed:
> rpc_test 1 TCONF: 'tirpc_rpcb_getaddr' not found
> rpc_test 1 TCONF: LTP compiled without TI-RPC support?
>
> Also added proper detection if kill is needed (related to the change in
> the commit) and kill with SIGPIPE (unrelated change, I can add it as
> separate commit).
>
> Kind regards,
> Petr
>
>   testcases/network/rpc/rpc-tirpc/rpc_test.sh | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/network/rpc/rpc-tirpc/rpc_test.sh b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
> index 30cfd2564..dc97213d0 100755
> --- a/testcases/network/rpc/rpc-tirpc/rpc_test.sh
> +++ b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
> @@ -54,12 +54,13 @@ setup()
>   	fi
>
>   	[ -n "$CLIENT" ] || tst_brk TBROK "client program not set"
> +	tst_check_cmds $CLIENT $SERVER || tst_brk TCONF "LTP compiled without TI-RPC support?"
>   }
>
>   cleanup()
>   {
> -	if [ ! -z "$SERVER" ]; then
> -		pkill -9 $SERVER>  /dev/null 2>&1
> +	if [ "$SERVER_STARTED" ]; then
> +		pkill -13 -x $SERVER
>   		$CLEANER $PROGNUMNOSVC
>   	fi
>   }
> @@ -70,6 +71,7 @@ do_test()
>
>   	if [ -n "$SERVER" ]; then
>   		$SERVER $PROGNUMNOSVC&
> +		SERVER_STARTED=1
>
>   		for i in $(seq 1 10); do
>   			rpcinfo -p localhost | grep -q $PROGNUMNOSVC&&  break




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
