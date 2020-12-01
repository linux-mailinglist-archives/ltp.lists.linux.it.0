Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9732CA091
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 11:56:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A6D83C637E
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 11:56:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EBAB33C4CFD
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 11:56:48 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 435751A01008
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 11:56:48 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1AnjOn034540;
 Tue, 1 Dec 2020 10:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=mzZwM9FcSCnptyjo20NKFF7xmfoO9xm3FL3srNrglh4=;
 b=Xa12EMgWb23aUAs1NXnqXg86B8yHAUZEEgF8iHqmiOEwdhCI4CnUqoMqsjgpnkekn/v4
 MCaf3VvGPQESqsOnBvPfSA2GcJq42gllOwg/05KyzHGTDQQPQ1RAFEuhii2u6hXaoc1b
 dPnfN2qSskxGSXShMvQslDbrq0+/8x7jrR7zQYV+yvXW44Ms/ZaXr+zAk1WXnv2HKteL
 rcV52yz6u5Rd5Iv/W7wpYlsrsddPDdE9psHfkDa1mSKZtM2J4jcDtV660O3kAL7ZkerM
 7o6Bym7TyIeiocT3mLp6JDP5cERQWiZR3sceEC4wqYPGuSD4CURy0D2xraNkKhTOLktH GQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 353dyqhwgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 10:56:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1AoOIH107263;
 Tue, 1 Dec 2020 10:54:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 35404mqpkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 10:54:43 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B1AseNe014768;
 Tue, 1 Dec 2020 10:54:42 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Dec 2020 02:54:40 -0800
To: Kory Maincent <kory.maincent@bootlin.com>, ltp@lists.linux.it
References: <20201130160235.25105-1-kory.maincent@bootlin.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <1fac3929-a7ce-e35f-0adb-914a74e38843@oracle.com>
Date: Tue, 1 Dec 2020 13:54:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130160235.25105-1-kory.maincent@bootlin.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010071
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] net/ip_tests: Return TCONF if ip command can not
 create dummy interface
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

On 30.11.2020 19:02, Kory Maincent wrote:
> Test if the dummy interface can be created, return TCONF if not.
> Move ip4_addr before, to have it defined and avoid cleanup error.
> 

There is TST_NEEDS_DRIVERS for checking missing modules, so it
should TCONF if some are not found.

TST_NEEDS_DRIVERS="dummy"


> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  testcases/network/iproute/ip_tests.sh | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/network/iproute/ip_tests.sh b/testcases/network/iproute/ip_tests.sh
> index 41c515696..1f0c4634d 100755
> --- a/testcases/network/iproute/ip_tests.sh
> +++ b/testcases/network/iproute/ip_tests.sh
> @@ -23,11 +23,14 @@ init()
>  	tst_res TINFO "inititalizing tests"
>  
>  	iface=ltp_dummy
> +	ip4_addr=${IPV4_NET16_UNUSED}.6.6
>  	lsmod | grep -q dummy || rm_dummy=1
>  
> -	ROD ip li add $iface type dummy
> +	if ! ip li add $iface type dummy >/dev/null; then
> +		rm_dummy=
> +		tst_brk TCONF "Module 'dummy' not found"
> +	fi
>  
> -	ip4_addr=${IPV4_NET16_UNUSED}.6.6
>  	ROD ip a add ${ip4_addr}/24 dev $iface
>  
>  	cat > tst_ip02.exp <<-EOF
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
