Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DCA2AB63B
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 12:11:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 946CA3C5DC2
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 12:11:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 107053C287E
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 12:11:39 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 464021A00F47
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 12:11:39 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A9BAMcp107291;
 Mon, 9 Nov 2020 11:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=IUemsdi0/wRGIrQwNUNA9XX1GpJePLD2t6K5sbn9z94=;
 b=nU+ZycN4zgTUUpIKEEPNCwcQO9xykzU41BlaJ2tCwNrvmvk+D28a1hI3r033uLT8fb1v
 ZmfsbnaDaoWpSoESmSXFoEdCTYXwiCbqLm8GVslV09twO9kUdbS7h+aEAQ034cHsL2bi
 rEr3jqn7keCX7t3cWJRon2MRsbMwraqpplVNd2zMlU/q3q4ywbue74IgcmtzmQAFOeai
 GQe3Wp0AAMm4yB2kwSk4qfoshxcAXSoV4Q5qO3uclJfwJf9U5TxJsC7BDD2L0oZzd4Gz
 y/UD6ZaBl6Qvrtzqt1pNK2m/yMXYct85+8Kto6x6lwyBDq7Jdfa6e3i9eq9xJVtDRqsj Vg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 34nh3anjet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 09 Nov 2020 11:11:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A9B57ia131079;
 Mon, 9 Nov 2020 11:09:33 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 34p55ktkkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Nov 2020 11:09:33 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A9B9QXU015944;
 Mon, 9 Nov 2020 11:09:27 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Nov 2020 03:09:26 -0800
To: Kory Maincent <kory.maincent@bootlin.com>, ltp@lists.linux.it
References: <20201106143605.27230-1-kory.maincent@bootlin.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <5de346c3-ccd6-743e-c83c-e16c592c7ac5@oracle.com>
Date: Mon, 9 Nov 2020 14:09:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106143605.27230-1-kory.maincent@bootlin.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9799
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011090073
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9799
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011090073
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tcp_cmds/ping/ping02: Make it compatible with
 Busybox
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

On 06.11.2020 17:36, Kory Maincent wrote:
> The ping from busybox does not have -f parameter, use -i parameter instead.
> BusyBox does not accept pattern longer than 2 bytes.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  testcases/network/tcp_cmds/ping/ping02.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/network/tcp_cmds/ping/ping02.sh b/testcases/network/tcp_cmds/ping/ping02.sh
> index e0a63c5f6..2784c8160 100755
> --- a/testcases/network/tcp_cmds/ping/ping02.sh
> +++ b/testcases/network/tcp_cmds/ping/ping02.sh
> @@ -20,7 +20,7 @@ do_setup()
>  
>  do_test()
>  {
> -	local pat="000102030405060708090a0b0c0d0e0f"
> +	local pat="aa"
>  

Hi Kory,

I think we should replace the options only if ping doesn't support
'-f', i.e. something like in the first version and this patch:

local ping_opts="-f -p 000102030405060708090a0b0c0d0e0f"
local ipaddr=$(tst_ipaddr rhost)
local s

$PING -h 2>&1 | grep -q '[-]f' || ping_opts="-i 0.01 -p aa"

for s in $PACKETSIZES; do
	EXPECT_PASS $PING -c $COUNT -s $s $ipaddr $ping_opts \>/dev/null
done


>  	tst_res TINFO "flood $PING: ICMP packets filled with pattern '$pat'"
>  
> @@ -28,7 +28,7 @@ do_test()
>  	local s
>  
>  	for s in $PACKETSIZES; do
> -		EXPECT_PASS $PING -c $COUNT -f -s $s $ipaddr -p "$pat" \>/dev/null
> +		EXPECT_PASS $PING -c $COUNT -i 0.001 -s $s $ipaddr -p "$pat" \>/dev/null
>  	done
>  }
>  
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
