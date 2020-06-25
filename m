Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8C20A33A
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 18:42:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05C583C58BD
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 18:42:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 75B5E3C05A0
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 18:42:49 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7637A60091E
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 18:42:48 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05PGfrM0041489;
 Thu, 25 Jun 2020 16:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=KzQzcEmbBCHZ4RhKShzozqs8SX72EPa72vjQRX3xlzU=;
 b=nBFWWqWki47drvVQBXtVAD9BDjCAghnxnIpN5Pd2qtkKAjRa7Xtp7YDk1dGN6kYfptIp
 iJs7bq5FO2ZY6+YT/8CX+0iTZcS1+mZzliZAs5/RQ07tGqBxcCD5Wk2aMDGKNevsZpWw
 ARU0vuBk7cfiXqHS0tATp2m+S1V5gz5Ifj7lXo55/JEPvVYoZ+9Eg3u+yDZdM60NxDMz
 SdAnuqM6gLCN2BkonXKrfKXy++mhV+KnyGXozgjLzL1KKv4ShgaOJYQDcH+k0I+/OABT
 I4W/X4mcPAPx2pMlT6Xe7AUyraUXnnFnuowW3zuwIruJa2mEM0TEC8nzsUeEKVpLjsSz Kg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 31uustskkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jun 2020 16:42:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05PGcGtf061809;
 Thu, 25 Jun 2020 16:42:37 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 31uur9a33p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jun 2020 16:42:36 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05PGgW9o017915;
 Thu, 25 Jun 2020 16:42:32 GMT
Received: from [192.168.1.39] (/91.247.148.3)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 25 Jun 2020 16:42:32 +0000
To: Petr Vorel <petr.vorel@suse.com>, ltp@lists.linux.it
References: <20200622070911.16123-1-petr.vorel@suse.com>
 <20200622070911.16123-2-petr.vorel@suse.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <3c3327ea-3132-255c-f853-c5c2d3f3c338@oracle.com>
Date: Thu, 25 Jun 2020 19:42:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622070911.16123-2-petr.vorel@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006250104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 cotscore=-2147483648 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006250104
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RESENT PATCH 1/5] tst_net.sh: Remove rsh support
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

On 22.06.2020 10:09, Petr Vorel wrote:
> From: Petr Vorel <pvorel@suse.cz>
> 
Hi Petr,

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

But tst_net.sh not used in such tests, so why keeping LTP_RSH there?

> 
> Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/lib/tst_net.sh | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 806b540cd..1b96b3bf4 100644
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
> +		output=`ssh -n -q $user@$RHOST "sh -c \
>  			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
>  	fi
>  	echo "$output" | grep -q 'RTERR$' && ret=1
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
