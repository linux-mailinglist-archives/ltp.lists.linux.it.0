Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441E2F4C35
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 14:27:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19C893C3210
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 14:27:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2208A3C3197
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 14:27:57 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 002366002C9
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 14:27:56 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DDPBoJ183628;
 Wed, 13 Jan 2021 13:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=XSa7roVICrN4Xv1iVyakprbRa5PNPoqB13Omcq6k22w=;
 b=lbYc2nTpbDTJ6UGRgF/XRNdAVnnwNdSBk9c+lCR2uHY+oOvVpAr/6nArdLGesNAjG6d/
 9aeDtIDyC9LdW724MCWOd2az7BXgxaiFJSGA47/n26ts77QGBWDkxjA+dRkVj+FoLMKg
 v1iZ2tTM/4WTg09fi4lQCoMVU24I7Wij4eVTAXAxVdWBhkBsgRRgGVAEj6uqidzoYYMs
 JuF2SPlKib50m3EXCqlIur/tIX6otRNqTd8l7Boya1td41ZxIaBqqxaiCTtpR6myDQI9
 nSPoQUsCf6eOyqdMqmQNtYIB3KuDeMnLnQ4U/u6sk+JjQmgHx+hqFtoGlJddW0n5xEee KA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 360kvk3a97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 13:27:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DDPeXR188294;
 Wed, 13 Jan 2021 13:25:53 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 360ke8c9hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 13:25:52 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10DDPmjE011629;
 Wed, 13 Jan 2021 13:25:50 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 05:25:48 -0800
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210107120247.31465-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <d7eba485-08db-1cc7-abe6-38d23c244bfb@oracle.com>
Date: Wed, 13 Jan 2021 16:25:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107120247.31465-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9862
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9862
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130082
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] if-mtu-change.sh: Lower CHANGE_INTERVAL to 1
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

On 07.01.2021 15:02, Petr Vorel wrote:
> to make testing faster.
> 
> Tested only on netns based testing.
> 

Hi Petr,

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Alexey,
> 
> any reason why CHANGE_INTERVAL was set 5s?

It's more or less safe time for default setup. Not sure why we don't
have tst_sleep in if_updown.sh though. I think this is for preventing
link-flap errors on the switch...

For netns it's can be set far less of cause by overriding CHANGE_INTERVAL.

> It'd be nice to speedup the tests, which were slow even before
> 2d422edbf ("if-mtu-change.sh: Add max packet size detection for IPv4")
> which added 25% slowdown.
> 
> Could you please test this on two host based setup?
> 
> Kind regards,
> Petr
> 
>  testcases/network/stress/interface/if-mtu-change.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/network/stress/interface/if-mtu-change.sh b/testcases/network/stress/interface/if-mtu-change.sh
> index d2816606b..3efe00461 100755
> --- a/testcases/network/stress/interface/if-mtu-change.sh
> +++ b/testcases/network/stress/interface/if-mtu-change.sh
> @@ -11,7 +11,7 @@ TST_CLEANUP="do_cleanup"
>  . if-lib.sh
>  
>  # The interval of the mtu change [second]
> -CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
> +CHANGE_INTERVAL=${CHANGE_INTERVAL:-1}
>  
>  TST_TIMEOUT=$(((CHANGE_INTERVAL + 30) * MTU_CHANGE_TIMES))


It's better to remove TST_TIMEOUT so that CHANGE_INTERVAL can be set,
for example, to "100ms" for netns setup.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
