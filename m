Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 559602DBEAD
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:31:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C8D93C57F9
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:31:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 494CB3C2AD9
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:31:52 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1CD771A00FC6
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:31:50 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BGAOFrt074325;
 Wed, 16 Dec 2020 10:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=z5aMwOX3p4x/CNesTYb6G3EEfbHhhsxDFnGICJ7mTCM=;
 b=yd+EX1vrz+J8Pzxdz4QdrJYQuEt/sfUJnF2Eq+6YHx2ypnrgBobbqfALUHqlVAZcwyQj
 4KvMHVHlgkP5S8bZAjrdULTwaFRdYSNEXleJk6PjWuP1bTdW8fSoD8hKtZE7iJPzYXm2
 ubc1a/fFpg/8Hk68d+GCXuBgKBDDf2APtbtkUHe0RBAmjPTwndp8K1PE+CRBUxfC2k57
 wk9UxeiwbhoamSuxwQXtmEVls8apfIwUFNT6qYwVXji+O09yp0TdXpE0fRE0uhY0J/ZV
 Ng8GAyhCjmbDKMexBxIbDmyFjMIxTmsLD9OiNbJK/dZ1AwUKCfT9r6NHRKsWo5BFgDrI RA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35cntm7dn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Dec 2020 10:31:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BGAQBsO101614;
 Wed, 16 Dec 2020 10:31:43 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 35d7sxm0wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 10:31:42 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BGAVdPq028533;
 Wed, 16 Dec 2020 10:31:40 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Dec 2020 02:31:39 -0800
To: Kory Maincent <kory.maincent@bootlin.com>, ltp@lists.linux.it
References: <20201216094037.5886-1-kory.maincent@bootlin.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <6abb1c7a-47d7-97dd-96c2-665c1030a554@oracle.com>
Date: Wed, 16 Dec 2020 13:31:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216094037.5886-1-kory.maincent@bootlin.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160066
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160066
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ipsec_lib.sh: test xfrm_user driver locally
 before rhost
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

On 16.12.2020 12:40, Kory Maincent wrote:
> First, test the presence of the driver locally to avoid a misleading TWARN from
> tst_net_run in case of driver not present.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  testcases/network/stress/ipsec/ipsec_lib.sh | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/network/stress/ipsec/ipsec_lib.sh b/testcases/network/stress/ipsec/ipsec_lib.sh
> index 198c9315d..1db5fc6af 100644
> --- a/testcases/network/stress/ipsec/ipsec_lib.sh
> +++ b/testcases/network/stress/ipsec/ipsec_lib.sh
> @@ -83,8 +83,9 @@ ipsec_lib_setup()
>  	ALGR=
>  
>  	if [ -n "$IPSEC_MODE" ]; then
> -		tst_net_run "tst_check_drivers xfrm_user" || \
> -			tst_brk TCONF "xfrm_user driver not available on lhost or rhost"
> +		tst_check_drivers xfrm_user || tst_brk TCONF "xfrm_user driver not available"
> +		tst_rhost_run -c "tst_check_drivers xfrm_user" || \
> +			tst_brk TCONF "xfrm_user driver not available on rhost"

Hi Kory,

tst_net_run() checks the driver locally first, so I don't
quite understand why do exactly the same what tst_net_run()
supposed to do?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
