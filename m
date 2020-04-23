Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D2A1B643B
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 21:04:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A73D03C2949
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 21:04:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 502C63C292B
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 21:04:27 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7BFDC600842
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 21:04:23 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03NIwVda051824;
 Thu, 23 Apr 2020 19:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=corp-2020-01-29;
 bh=qUrNFB0wQXBWINW78qlAmR4XTHFxV8Em9wm7zc1nZW4=;
 b=zi/Ww4OM8Hs5PCAI2GjYZU4XpSBlK3WpCMBOEbCCmQJYNqrSfsmjvv2x2vbD5LVvw2Yi
 DhoLGY6LHRxMZEapzXkHYyXe4Iqp5bvgcK9+9TcZtaBhEuHCNMxBif4QR82BbyaTBS67
 QYPE7m6TahJFMIJXjggCPYIcMRR/E6Nz8BWp/qnaavyR8IFJR2xxfzHh0bSoLTMZrYC6
 wrmWYI/kOnx6fLZiJqMHg5oX+zOskZ1Q0fpGbYUJj52iBhHih8pzxIEbu0g1+am6kMxD
 7UWpe6XpjZ77NxbbCWxY5WT7Dinf7P3vuuj3qG9617dnX2265zM+tmHA3We5+VRbijuF Zw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 30jvq4wcr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 19:04:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03NIviHS002178;
 Thu, 23 Apr 2020 19:04:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 30gb3w3anc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 19:04:21 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03NJ4HFh006503;
 Thu, 23 Apr 2020 19:04:19 GMT
Received: from [10.23.23.35] (/91.247.148.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 23 Apr 2020 12:04:17 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200421180002.11351-1-pvorel@suse.cz>
Message-ID: <dab04fc5-5d20-3dbc-c21f-535112ab222f@oracle.com>
Date: Thu, 23 Apr 2020 22:04:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421180002.11351-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9600
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004230145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9600
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004230145
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/sendfile01.sh: Check with timeout
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 21.04.2020 21:00, Petr Vorel wrote:
> Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Alexey,
> 
> I guess nothing controversial here as failure of starting server is
> guarded by -s.
> I was thinking about using TST_RETRY_FUNC, but passing command to it
> leads to: tst_rhost_run: unknown option: l
> 

Hi Petr,

eval might help in this case, take a look at tst_retry() in test.sh
old api, not sure why exactly it was removed in the new one...

index 1d8a71d9f..e34edb26a 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -207,7 +207,7 @@ TST_RETRY_FN_EXP_BACKOFF()
        fi
 
        while true; do
-               $tst_fun
+               eval "$tst_fun"
                if [ "$?" = "$tst_exp" ]; then
                        break
                fi

> What bothers me more, that TST_NEEDS_CMDS does not check command on
> rhost. Do we want to have something like TST_NEEDS_CMDS_RHOST or we just
> don't care?

In general, yes, we need to check if a command exists on the remote host.
Yet another variable, what about checking what in TST_NEEDS_CMDS on the
remote host? Though TST_NEEDS_CMDS_RHOST looks quite well.

> 
> Kind regards,
> Petr
> 
>  testcases/network/tcp_cmds/sendfile/sendfile01.sh | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/network/tcp_cmds/sendfile/sendfile01.sh b/testcases/network/tcp_cmds/sendfile/sendfile01.sh
> index af9cadf57..94fff2c9a 100755
> --- a/testcases/network/tcp_cmds/sendfile/sendfile01.sh
> +++ b/testcases/network/tcp_cmds/sendfile/sendfile01.sh
> @@ -11,7 +11,7 @@ TST_SETUP=do_setup
>  TST_CLEANUP=do_cleanup
>  TST_TESTFUNC=do_test
>  TST_NEEDS_TMPDIR=1
> -TST_NEEDS_CMDS="diff stat"
> +TST_NEEDS_CMDS="diff ss stat"
>  . tst_net.sh
>  
>  do_setup()
> @@ -28,7 +28,10 @@ do_setup()
>  	tst_rhost_run -s -b -c "$server $(tst_ipaddr rhost) $port"
>  	server_started=1
>  	tst_res TINFO "wait for the server to start"
> -	sleep 1
> +	while true; do
> +		tst_rhost_run -c "ss -ltp" | grep -q "$port.*testsf" && break
> +		tst_sleep 10ms
> +	done
>  }
>  
>  do_test()
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
