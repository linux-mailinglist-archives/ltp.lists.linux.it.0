Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8D1CFB9D
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 19:07:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B8953C2594
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 19:07:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D520C3C2410
 for <ltp@lists.linux.it>; Tue, 12 May 2020 19:07:18 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E655510009AC
 for <ltp@lists.linux.it>; Tue, 12 May 2020 19:07:17 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04CH73PD155185;
 Tue, 12 May 2020 17:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=7yFCPPKrjhSImJ7CCUcNcDVbrv6y+RiJ5h8Cvu5t9t8=;
 b=H1Gmolue9LT8cqwrEHrj7TpzDiqG0/hO0oOOxfncKXzP2ejdDH+h6Tck71MfNutbz9O5
 AE9TlZR5LQvkn/A+xIMOlELlzUxWEwPBU8dT2tAi57V7zS+qfYZofwVYTbDTy27czoaS
 GrkAH3JepzRVZWHItVYZxIbzG8xax0JNJqhSR0oMcWqETKrwAK56ECdoCjNMwmsxZJMC
 TPqAJlsD8KcdhvyEs1pj3yEbbFl4I32SqMdUCoD80ZUFHwpgHYSvFfimcuUsLeQX+VS0
 qEHXHAptio8qklX3H68uisPBX9u8gxH+ieBj3YeM6ceE3EoC61CVGayvMoIBoXAcbD3/ Dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 30x3gsm8ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 May 2020 17:07:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04CGvkvH149797;
 Tue, 12 May 2020 17:07:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 30x63q71r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 May 2020 17:07:13 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04CH79N3025365;
 Tue, 12 May 2020 17:07:12 GMT
Received: from [192.168.1.39] (/91.247.148.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 May 2020 10:07:09 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200512152701.23625-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <d011a55b-a5b5-049f-9037-235d1f18cf1b@oracle.com>
Date: Tue, 12 May 2020 20:07:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512152701.23625-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005120130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005120131
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] rpc: Warn when tests aren't compiled
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

On 12.05.2020 18:27, Petr Vorel wrote:
> Without this test failure was wrongly reported:
> rpc_test 1 TFAIL: tirpc_rpcb_getaddr 10.0.0.2 536875000 failed unexpectedly
> 

Hi Petr,

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/network/rpc/rpc-tirpc/rpc_test.sh | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/network/rpc/rpc-tirpc/rpc_test.sh b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
> index 30cfd2564..fd72e6be4 100755
> --- a/testcases/network/rpc/rpc-tirpc/rpc_test.sh
> +++ b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
> @@ -35,10 +35,12 @@ EOF
>  
>  rpc_parse_args()
>  {
> +	local err="LTP compiled without TI-RPC support"
> +
>  	case "$1" in
> -		c) CLIENT="$OPTARG" ;;
> -		e) CLIENT_EXTRA_OPTS="$OPTARG" ;;
> -		s) SERVER="$OPTARG" ;;
> +	c) CLIENT="$OPTARG"; tst_cmd_available $OPTARG || tst_brk TCONF $err;;
> +	e) CLIENT_EXTRA_OPTS="$OPTARG";;
> +	s) SERVER="$OPTARG"; tst_cmd_available $OPTARG || tst_brk TCONF $err;;
>  	esac

Perhaps this one, to write about the missing command:
tst_require_cmds $CLIENT $SERVER

or just $CLIENT because it's always used, and if the hint is needed:
tst_check_cmds $CLIENT $SERVER || tst_brk TCONF "LTP compiled without TI-RPC support?"

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
