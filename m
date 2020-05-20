Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFE41DB558
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 15:42:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 094F03C4DF9
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 15:42:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0F8623C24D3
 for <ltp@lists.linux.it>; Wed, 20 May 2020 15:42:04 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 36695601AEA
 for <ltp@lists.linux.it>; Wed, 20 May 2020 15:42:03 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KDRF6K091326;
 Wed, 20 May 2020 13:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=mCV5W3thnWKpZbl+juKw8PdZHR7vTSRR/bpQCCWbsMw=;
 b=MwW6/eIGTTPibPJhgc037qncEhLTgIl9rBCNrwOp6KISP6mOXhasylN+9wSMvcR7MEMC
 3SCf42UGUgDUVvtf1EVq9cPnNaeUk/KJ6s9KvJLQ4jYNzv0UmsZm9bY5Z8jIuTgPoKqm
 ru0kLYISkCzPtLEVIHth+mj2nKLyNAWZuZNVIQBy2a+4+JYW31+W1869sintJYSuD706
 JdXzRNyQbzkB7YUSwfk8ap9CBiGy1rsBLDpXAAd45XTLAO//kvcsw33RX9V/zAc5TOmu
 vlA1pfDw1eo1M9o9vRXmB4uqm16dcdKqLoVKjYpXqbbvT639IPUGTH8cZFivAlSlcnLe aQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3127krb6cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 May 2020 13:42:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KDTD2i013753;
 Wed, 20 May 2020 13:40:00 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 312t37p5ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 13:40:00 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04KDe0Mh030016;
 Wed, 20 May 2020 13:40:00 GMT
Received: from [192.168.1.39] (/91.247.148.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 20 May 2020 06:40:00 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200518211514.20445-1-pvorel@suse.cz>
 <20200518211514.20445-2-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <c46d8783-9c13-faac-a845-22199a6e2523@oracle.com>
Date: Wed, 20 May 2020 16:39:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518211514.20445-2-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0
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
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] rpc_test.sh: Print used TI-RPC implementation
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
> This helps to debug glibc tests. Some of them are failing:
> Cannot register service: RPC: Unable to receive; errno = Connection refused
> 
> + unify case on message in check_portmap_rpcbind.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/network/rpc/basic_tests/rpc_lib.sh | 2 +-
>  testcases/network/rpc/rpc-tirpc/rpc_test.sh  | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/network/rpc/basic_tests/rpc_lib.sh b/testcases/network/rpc/basic_tests/rpc_lib.sh
> index 96dae8dd3..c7c868709 100644
> --- a/testcases/network/rpc/basic_tests/rpc_lib.sh
> +++ b/testcases/network/rpc/basic_tests/rpc_lib.sh
> @@ -11,5 +11,5 @@ check_portmap_rpcbind()
>  		pgrep rpcbind > /dev/null && PORTMAPPER="rpcbind" || \
>  			tst_brk TCONF "portmap or rpcbind is not running"
>  	fi
> -	tst_res TINFO "Using $PORTMAPPER"
> +	tst_res TINFO "using $PORTMAPPER"
>  }
> diff --git a/testcases/network/rpc/rpc-tirpc/rpc_test.sh b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
> index dc97213d0..410482c14 100755
> --- a/testcases/network/rpc/rpc-tirpc/rpc_test.sh
> +++ b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
> @@ -55,6 +55,13 @@ setup()
>  
>  	[ -n "$CLIENT" ] || tst_brk TBROK "client program not set"
>  	tst_check_cmds $CLIENT $SERVER || tst_brk TCONF "LTP compiled without TI-RPC support?"
> +
> +	tst_cmd_available ldd which || return
> +	if ldd $(which $CLIENT) |grep -q /libtirpc\.so; then
> +		tst_res TINFO "using libtirpc: yes"
> +	else
> +		tst_res TINFO "using libtirpc: no (probably using glibc)"
> +	fi
>  }
>  
>  cleanup()
> 

Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
