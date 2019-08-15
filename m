Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C80B8EEB7
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Aug 2019 16:53:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF7753C1CFF
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Aug 2019 16:53:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C4A573C0ECD
 for <ltp@lists.linux.it>; Thu, 15 Aug 2019 16:53:09 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D3C44200FF5
 for <ltp@lists.linux.it>; Thu, 15 Aug 2019 16:53:08 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7FEVX6p117824;
 Thu, 15 Aug 2019 14:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=DYc/Xl7GNe4FAZeADLvmpFKU1t5ohBErfSmIZhFl81A=;
 b=e445gkGLnQeBvQyKWvZTHhfhtdtYAj35ZUGSRXqet3gxZzTEs62B+TJPLjN3uTWWlbtW
 VCyb9NN+4vMyEu0YTw3wPQ4+lQY47bBQzZdXAkZ+Ir0xMOnhQH1ToVOJFHZUByXLEB5e
 FygBrJIpBE2bYzJ03QCYn+StosKxIscn7gm8IIUfaeAs+zDragGUSRN0zrC2f+stCvS/
 /GrNfyunO4VaeRRXjL/Jj67Nu6yPKavreSYm7gyxj1q/X2tP10yh+eRwVGZMHOZmqIGn
 52V4WKU5phP/Kt53b8jOHfQ4ekmCvhqZRrLz5pnf6JlcD1gY0ghXumsISQHLdF7eVnSO 5Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2u9nvpk9a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 14:53:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7FEqi3j045414;
 Thu, 15 Aug 2019 14:53:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2ucpysdprd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 14:53:04 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7FEqpPn009025;
 Thu, 15 Aug 2019 14:52:57 GMT
Received: from ak.ru.oracle.com (/10.162.80.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Aug 2019 07:52:51 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190815055836.13634-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Organization: Oracle Corporation
Message-ID: <a0a2716f-bb12-c602-3dab-03e88898b0ca@oracle.com>
Date: Thu, 15 Aug 2019 17:55:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190815055836.13634-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9350
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908150149
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9350
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908150148
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] zram01: Improve error detection
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

Hi Petr,

On 8/15/19 8:58 AM, Petr Vorel wrote:
> * TBROK when detected size is 0 (+ print dd stderr, if any)
> * TBROK if actually used memory is 0, this fixes division by 0:
> 
> Sometimes free reports no memory use by zram, which leads to division by 0:
> zram01 8 TINFO: zram used 0M, zram disk sizes 104857600M
> /opt/ltp/testcases/bin/zram01.sh: line 87: 100 * 104857600 / 0: division by 0 (error token is "0")
> 
> Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Alexey,
> 
> feel free to send your fix if this is not what you meant.
> 
> Kind regards,
> Petr
> 
> Changes v2->v3:
> * print last dd error (if any) only when $b -eq 0

Yes, that's what I meant :)

> 
> Changes v2->v3:
> * add TBROK when $b -eq 0
> * print last dd error, if any
> ---
> 
>  testcases/kernel/device-drivers/zram/zram01.sh | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
> index b3ed5170d..c0d46ed75 100755
> --- a/testcases/kernel/device-drivers/zram/zram01.sh
> +++ b/testcases/kernel/device-drivers/zram/zram01.sh
> @@ -67,9 +67,13 @@ zram_fill_fs()
>  		while true; do
>  			dd conv=notrunc if=/dev/zero of=zram${i}/file \
>  				oflag=append count=1 bs=1024 status=none \
> -				> /dev/null 2>&1 || break
> +				2>err.txt || break
>  			b=$(($b + 1))
>  		done
> +		if [ $b -eq 0 ]; then
> +			[ -s err.txt ] && tst_resm TWARN "dd error: $(cat err.txt)"
> +			tst_brkm TBROK "cannot fill zram"
> +		fi
>  		tst_resm TINFO "zram$i can be filled with '$b' KB"
>  	done
>  
> @@ -82,6 +86,8 @@ zram_fill_fs()
>  		total_size=$(($total_size + $s))
>  	done
>  
> +	[ $used_mem -eq 0 ] && tst_brkm TBROK "no memory used by zram"
> +
>  	tst_resm TINFO "zram used ${used_mem}M, zram disk sizes ${total_size}M"
>  
>  	local v=$((100 * $total_size / $used_mem))
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
