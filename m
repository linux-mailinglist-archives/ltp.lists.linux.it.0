Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D42631DB553
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 15:41:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9EFD03C24D3
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 15:41:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DCD203C24D3
 for <ltp@lists.linux.it>; Wed, 20 May 2020 15:41:21 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F17BE2005D7
 for <ltp@lists.linux.it>; Wed, 20 May 2020 15:41:20 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KDRLAb091413;
 Wed, 20 May 2020 13:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=i6Gs02XlBLGKyi8fKK/zTrP/37ZYgBYN+A5/ZNBdi4o=;
 b=k1VxOXJHK0YwR1SNarVVh4yVpUBOVM142DHFyg8BoRPxIGDczIPa5GbdHO7pQg9PRy/z
 GQurdp1rXB5lBeEJZk1vadXFDjGSL1cmLg8YYT4DTKvIwQGAnpJKsfvytnWKpyfV0NyZ
 OyoGrxpoanwpVO3POlpzSl+KbZIGRRRycD1mtyaLvCLzG3VFdLpMQrIeM/UtrHiqmXCn
 HOMtKkMKBIW3dZUaNEM6oSrAJcW6CUHComZaZyM1SP0RcREk6Pswxw1tEXIv9kC7TJYq
 UuYC55rg4KxEbRPHEROWBq/EwjazbuxYjn5l13aP4EtwRmGYwwrPm9KBMKa9njuHpO/H 3w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 3127krb69k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 May 2020 13:41:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KDSc1M047871;
 Wed, 20 May 2020 13:39:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 313gj3j4kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 13:39:15 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04KDdBn6026282;
 Wed, 20 May 2020 13:39:14 GMT
Received: from [192.168.1.39] (/91.247.148.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 20 May 2020 06:39:11 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200518211514.20445-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <41be0459-f7f1-643b-73af-0b29da5e9c8a@oracle.com>
Date: Wed, 20 May 2020 16:39:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518211514.20445-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 malwarescore=0
 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005200116
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 cotscore=-2147483648
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005200116
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19.05.2020 00:15, Petr Vorel wrote:
> This helps debugging.
> 
> Use $TMPDIR and PID to guarantee writable directory and unique file
> without the need to require TST_NEEDS_TMPDIR=1.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/lib/tst_net.sh | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 011b62267..bfed4a44d 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -250,22 +250,32 @@ tst_net_run()
>  
>  EXPECT_RHOST_PASS()
>  {
> -	tst_rhost_run -c "$*" > /dev/null
> +	local log="$TMPDIR/log.$$"
> +
> +	tst_rhost_run -c "$*" > $log
>  	if [ $? -eq 0 ]; then
>  		tst_res_ TPASS "$* passed as expected"
>  	else
>  		tst_res_ TFAIL "$* failed unexpectedly"
> +		cat $log
>  	fi
> +
> +	rm -f $log
>  }
>  
>  EXPECT_RHOST_FAIL()
>  {
> -	tst_rhost_run -c "$* 2> /dev/null"
> +	local log="$TMPDIR/log.$$"
> +
> +	tst_rhost_run -c "$*" > $log
>  	if [ $? -ne 0 ]; then
>  		tst_res_ TPASS "$* failed as expected"
>  	else
>  		tst_res_ TFAIL "$* passed unexpectedly"
> +		cat $log
>  	fi
> +
> +	rm -f $log
>  }
>  
>  # Get test interface names for local/remote host.
> 

Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
