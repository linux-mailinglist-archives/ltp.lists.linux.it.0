Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 836692DFCE1
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 15:33:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 427AA3C4F93
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 15:33:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EA7D63C2A75
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 15:33:31 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 538AA600EC6
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 15:33:30 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BLEOCbj098445;
 Mon, 21 Dec 2020 14:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=fMNmHU+FaUVIQ4SA38TXgL1WtnooGSDJFw61CnDJZHA=;
 b=AekwPY+Nk1AO9MlVAhOKI6K3B9GEE2KaK5aUcr/eFYXXF7M7yqzChDLkNSNsgbLgN83y
 DEoxJkEHBbQb9TEo3uAWzNzxPodgYKdfTQFJvZiFhvHHnH72KgviQHnq5U087B6zjaV0
 akm2w4QYjz73vScOwhbAh4ggkQeP7xmkpTGajigSWgJOHrUWCwZy08Ai8usIrT8m0KPC
 cSbzb8zm7D7VWQvPcVaKfYUTSko5Wq83XpTDibPc8ci3irKR5i3AjokNUBS2AsmUDiFN
 okHg50xo6NFMUDI9VpRvQ2OF5fUTbJzrFaj0gkr1HzcdY5pA69lw0UNBfffH2T2RlvAK 8w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35jke0t7f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Dec 2020 14:33:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BLEPWgD030760;
 Mon, 21 Dec 2020 14:33:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 35hu9q50v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 14:33:19 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BLEXEX2020961;
 Mon, 21 Dec 2020 14:33:17 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 21 Dec 2020 06:33:14 -0800
To: Kory Maincent <kory.maincent@bootlin.com>, ltp@lists.linux.it
References: <20201218144156.29866-1-kory.maincent@bootlin.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <e9601747-8f08-d127-6eac-46467c631c43@oracle.com>
Date: Mon, 21 Dec 2020 17:33:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218144156.29866-1-kory.maincent@bootlin.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9841
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012210103
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9841
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012210103
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] ipsec_lib: make tst_net_run "tst_check_driver"
 quiet
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
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 18.12.2020 17:41, Kory Maincent wrote:
> Make tst_net_run quiet when using tst_check_drivers to avoid wrong TWARN message
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change since v1:
>   Considered Alexey's review
>   https://urldefense.com/v3/__http://lists.linux.it/pipermail/ltp/2020-December/020285.html__;!!GqivPVa7Brio!OdHd62f8dF5zyARaPopO0WEuxNw4iqh52VKRlkJFHeFaaBmwFHz9K_6sE7jP0oox9W-4$ 
> 
>  testcases/network/stress/ipsec/ipsec_lib.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied the patch, thanks!

> diff --git a/testcases/network/stress/ipsec/ipsec_lib.sh b/testcases/network/stress/ipsec/ipsec_lib.sh
> index 198c9315d..e395e1ff3 100644
> --- a/testcases/network/stress/ipsec/ipsec_lib.sh
> +++ b/testcases/network/stress/ipsec/ipsec_lib.sh
> @@ -83,7 +83,7 @@ ipsec_lib_setup()
>  	ALGR=
>  
>  	if [ -n "$IPSEC_MODE" ]; then
> -		tst_net_run "tst_check_drivers xfrm_user" || \
> +		tst_net_run -q "tst_check_drivers xfrm_user" || \

Noticed a minor issue in the test output, when tst_check_drivers
prints missing drivers to stderr, I think we should handle it
inside tst_net_run with -q somehow...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
