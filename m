Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEF220A340
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 18:45:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 529523C58CF
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 18:45:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 942943C2B7C
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 18:44:57 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EBCD01A00CA2
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 18:44:56 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05PGfvad041548;
 Thu, 25 Jun 2020 16:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=eWxszXbQccy1w7fO3FnI2Qmz2TAllQub3RP/PtfH7zQ=;
 b=PsIiNCGKZ+h0rFIDr512Vq9yf0zX9pJg3dNIqznYi5kYCDuEF13/L5XdBxGGn1ZX7c2A
 Gz8hcnIW8whOjemAbTwK+Bi8elH71EoLJ60zcQ08oc6wA5RCPNTYWpACy6erGJd8NDTx
 wZzH4yykjFxs/NJnb9qUm7rzo9aLmcc6dqCn2CxIPxhi7QgYOZTaXR3z+erRFM25OHbv
 Y3khURuB5ZHqIfeMdujpLqankQS87MsuGjx4E2PPEpuvWYu6mWtWLl0+aO52lNxYa7jz
 uMgjtecDxXD5npNgk6gFXEcWyTKyPphcK890YC1v7w3sW5edGOE7lrPWUGIfeo9KbhOK Gw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 31uustskwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jun 2020 16:44:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05PGdRVr047992;
 Thu, 25 Jun 2020 16:44:40 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 31uurstmaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jun 2020 16:44:40 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05PGidZ7006151;
 Thu, 25 Jun 2020 16:44:39 GMT
Received: from [192.168.1.39] (/91.247.148.3)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 25 Jun 2020 16:44:38 +0000
To: Petr Vorel <petr.vorel@suse.com>, ltp@lists.linux.it
References: <20200622070911.16123-1-petr.vorel@suse.com>
 <20200622070911.16123-4-petr.vorel@suse.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <af9a56a2-3919-5b00-bdb4-af574e99f3c6@oracle.com>
Date: Thu, 25 Jun 2020 19:44:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622070911.16123-4-petr.vorel@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006250104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 cotscore=-2147483648 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006250104
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RESENT PATCH 3/5] tst_net.sh: Drop 'sh -c' use from ssh
 in tst_rhost_run
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
> This simplifies the command and allows to use double quotes in command
> parameter for ssh, as it removes single nested quotes of command
> parameter (thus fixes like c1a2d53f6 "network/nfs_lib.sh: Use double
> quotes for grep pattern" are not needed any more).
> 
> NOTE: 'sh -c' is still required for netns based testing, but does not
> use nested quotes. Now both variants use only double quotes.
> 
> Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>> ---
>  testcases/lib/tst_net.sh | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 1b96b3bf4..2ed570a6b 100644
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
> -		output=`ssh -n -q $user@$RHOST "sh -c \
> -			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
> +		output=$(ssh -n -q $user@$RHOST \
> +			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
>  	fi
>  	echo "$output" | grep -q 'RTERR$' && ret=1
>  	if [ $ret -eq 1 ]; then
> 

Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
