Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C03B8D28A
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Aug 2019 13:54:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1679E3C1D2F
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Aug 2019 13:54:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0EA693C1448
 for <ltp@lists.linux.it>; Wed, 14 Aug 2019 13:54:33 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0E9BA20074F
 for <ltp@lists.linux.it>; Wed, 14 Aug 2019 13:54:32 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7EBsUmv186583;
 Wed, 14 Aug 2019 11:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=a0IQOXawAsDrEV5ktv6Gq9A3TxXKLqeY/hSckMc3MUs=;
 b=Ucw5F8qjsAabn7eJadsfd3ngmXtrRY3EbL5Ye/9iIzWyjOxw70eAhEs9GykqIoZUef1z
 DctJd5zV4RZ1bZLbmZxgf4QHX6bF/p4ySA7MtL+H3ZK1Roy9wYrcy75HSMDTw5Xnvd/O
 +UP1YrHFdYkJrNLo38btzL4/3l2ghwCNsyuszYHpL0WmT8MOLXcJAj2AEcFC1/zOR30K
 0XNpZPGpZZ7+DCIy97pwH7tcSwmvcq86Tcx1Pwy97J4A6JazL0FyGEEmDytgawwwcAWc
 Jbl9Jxt6DFcxQsCrRJjcIVMMfT0z+FLOcOV1DUVOzRWgdkpiGGNye0udvrEH9V+dnqca /g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2u9nvpccqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 11:54:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7EBrL4f099852;
 Wed, 14 Aug 2019 11:54:29 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2ubwrh5xfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 11:54:29 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7EBsOkd028094;
 Wed, 14 Aug 2019 11:54:27 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 14 Aug 2019 04:54:24 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190812073837.18016-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <9f601d2c-e0cd-8d9d-d47d-123bc42fbe67@oracle.com>
Date: Wed, 14 Aug 2019 14:54:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812073837.18016-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908140125
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908140125
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] zram01: Improve error detection
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
On 12.08.2019 10:38, Petr Vorel wrote:
> * print dd stderr, if any
> * TBROK when detected size is 0
> * TBROK if actually used memory is 0, this fixes division by 0:
> 
> Sometimes free reports no memory use by zram, which leads to division by 0:
> zram01 8 TINFO: zram used 0M, zram disk sizes 104857600M
> /opt/ltp/testcases/bin/zram01.sh: line 87: 100 * 104857600 / 0: division by 0 (error token is "0")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Not sure what is a small memory which should be detected. 100 KB?
> Maybe we could TBROK on 0 and TWARN on some small value.
> 
> I found this problem on ppc64le, but I can reproduce it on intel VM.
> zram driver gets into some broken state, so next run of this test it
> does not work at all:
> can't set 'lzo' to /sys/block/zram0/comp_algorithm
> 
> after reboot it's shows it's no space error, but test works (huh):
> zram01 7 TINFO: fill zram0...
> zram01 7 TWARN: dd error: dd: error writing 'zram0/file': No space left on device
> zram01 7 TINFO: zram0 can be filled with '20628' KB
> zram01 7 TINFO: fill zram1...
> zram01 7 TWARN: dd error: dd: error writing 'zram1/file': No space left on device
> zram01 7 TINFO: zram1 can be filled with '20140' KB
> zram01 7 TINFO: fill zram2...
> zram01 7 TWARN: dd error: dd: error writing 'zram2/file': No space left on device
> zram01 7 TINFO: zram2 can be filled with '24724' KB
> zram01 7 TINFO: fill zram3...
> zram01 7 TWARN: dd error: dd: error writing 'zram3/file': No space left on device
> zram01 7 TINFO: zram3 can be filled with '24724' KB
> zram01 7 TINFO: zram used 92M, zram disk sizes 104857600M
> zram01 7 TPASS: compression ratio: 1139756.52:1
> zram01 8 TINFO: zram cleanup
> 
> Thus there are error messages from zram_cleanup. Do we want to suppress
> them? (I'd keep it).
> sh: echo: I/O error

Such TWARNs can be misleading, the test is writing until this error,
so this is part of the normal test run...

> 
> Kind regards,
> Petr
> ---
>  testcases/kernel/device-drivers/zram/zram01.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
> index b3ed5170d..a06c0dc17 100755
> --- a/testcases/kernel/device-drivers/zram/zram01.sh
> +++ b/testcases/kernel/device-drivers/zram/zram01.sh
> @@ -67,9 +67,11 @@ zram_fill_fs()
>  		while true; do
>  			dd conv=notrunc if=/dev/zero of=zram${i}/file \
>  				oflag=append count=1 bs=1024 status=none \
> -				> /dev/null 2>&1 || break
> +				2>err.txt || break
>  			b=$(($b + 1))
>  		done
> +		[ -s err.txt ] && tst_resm TWARN "dd error: $(cat err.txt)"
> +		[ $b -eq 0 ] && tst_brkm TBROK "cannot fill zram"
>  		tst_resm TINFO "zram$i can be filled with '$b' KB"
>  	done
>  
> @@ -82,6 +84,8 @@ zram_fill_fs()
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
