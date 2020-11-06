Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA0F2A958A
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 12:38:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C59C3C6663
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 12:38:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id AE1DD3C1876
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 12:38:47 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 114B51000A3C
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 12:38:46 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A6BXewS085207;
 Fri, 6 Nov 2020 11:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=corp-2020-01-29;
 bh=bQ7o/oJONw/tg7GTCFXsDm3NxexcO2MUlHCU1BV3UFM=;
 b=tnu4AJiyLGEjzx8EcMRs4U4E7hvxXbi68aRBVaoPSrjG+x1hrYEATXLIEzMNYbTw2HTj
 +Ofe612DGDuBnbZUi7AyTTZq0vDolThjib7cCmscELsaMf6WAso0O8AA3lJ1GE2P2vq7
 3JOV7oOv/QhM05VM29gNOJUsyMe1EZEspC9BCDicxWz9M7Ht2a4r9/SHWnk7E3YLAZQr
 usu367Qkm2gkctHf3U951mZHnvCHUGJnT/iEiBrK9Eq26Cg1i5VkROO4vYP9AtQhqXm5
 XVwi2R9hktKoBuUbCZBGjGMTDTBm+rfO1zXqA7wiV3Cj8JPhChRqfrSlU2zvppnY4A+D VQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 34hhb2ghr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 06 Nov 2020 11:38:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A6BYcph172051;
 Fri, 6 Nov 2020 11:38:39 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 34hw0pcgmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Nov 2020 11:38:39 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A6BcaRB026383;
 Fri, 6 Nov 2020 11:38:38 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 06 Nov 2020 03:38:36 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Kory Maincent <kory.maincent@bootlin.com>, ltp@lists.linux.it
References: <20201106103748.20241-1-kory.maincent@bootlin.com>
Message-ID: <87d525b8-b48b-980e-f606-9ea16ef6f246@oracle.com>
Date: Fri, 6 Nov 2020 14:38:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106103748.20241-1-kory.maincent@bootlin.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9796
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011060085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9796
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011060085
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tcp_cmds/ping: TCONF on unknown -f parameter
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

On 06.11.2020 13:37, Kory Maincent wrote:
> The ping from busybox does not have -f parameter.
> Return TCONF in that case.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  testcases/network/tcp_cmds/ping/ping02.sh | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/testcases/network/tcp_cmds/ping/ping02.sh b/testcases/network/tcp_cmds/ping/ping02.sh
> index e0a63c5f6..6daf22635 100755
> --- a/testcases/network/tcp_cmds/ping/ping02.sh
> +++ b/testcases/network/tcp_cmds/ping/ping02.sh
> @@ -27,6 +27,10 @@ do_test()
>  	local ipaddr=$(tst_ipaddr rhost)
>  	local s
>  
> +	if ! $PING -c 1 -f $ipaddr >/dev/null; then
> +		tst_brk TCONF "$PING: invalid option -- 'f'"

Hi Kory,

If it's not supported, what about replacing it with '-i 0'?


> +	fi
> +
>  	for s in $PACKETSIZES; do
>  		EXPECT_PASS $PING -c $COUNT -f -s $s $ipaddr -p "$pat" \>/dev/null
>  	done
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
