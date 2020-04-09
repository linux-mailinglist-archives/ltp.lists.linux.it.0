Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A81A3627
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 16:44:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9985B3C2CED
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 16:44:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3B3673C1115
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 16:44:40 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 29175200BD6
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 16:44:38 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 039EdCba058063;
 Thu, 9 Apr 2020 14:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=c7NWqJoshM2wzpfBnfdCAVo16vpXtoFAYyS47pg7hQc=;
 b=W4wKZGC8xYz6mDwo2xHbGI6F5N0EiOpOGxmly1gi2P3WqhPA9L6aF9YdTxi9M4mNBPS0
 iNAMZZcf5HlTe0r59z31U8EANP3jGU0BeU2Mq+sMO5g5FwS4ZbqZm6AZNqCEO9k5NmzZ
 u1Vjm5Ulgys56qWk6JEEt6+PuJymBtHLAoM3y2m1g3E3bXwtGOYbKXhXIiqlJozCCmmA
 ujJF3Xwvsc+DIJkuQy5u/YMXKdbqmPb+r/7LF4izkxLyLRqmtUJZXlf3gXkNGFG6Ce6P
 XXEYz/8CIB5/FYZc1V8BDK0tnR+7QpGYFSd+NFP6D8hDsdfXA36+aHI2Pr0NuvsFw70f 5g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 309gw4dt6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Apr 2020 14:44:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 039EbZBT007796;
 Thu, 9 Apr 2020 14:44:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 3091m49295-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Apr 2020 14:44:35 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 039EiWx8004335;
 Thu, 9 Apr 2020 14:44:34 GMT
Received: from [192.168.1.34] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 09 Apr 2020 07:44:32 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200403165432.19358-1-pvorel@suse.cz>
 <20200403165432.19358-2-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <608a0875-7bbb-405e-c535-5af4c1fd6fb0@oracle.com>
Date: Thu, 9 Apr 2020 17:44:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200403165432.19358-2-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9586
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0 suspectscore=2
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004090115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9586
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 suspectscore=2 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004090115
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v3 1/2] net: Move setup_addrinfo() into
 tst_net.h
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
On 03.04.2020 19:54, Petr Vorel wrote:
> as tst_setup_addrinfo().
> 
> This allows reusing it in next commit.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes v1->v2:
> * setup_addrinfo() renamed to tst_setup_addrinfo()
> * rebase
> 
>  include/tst_net.h                       |  9 +++++++--
>  include/tst_private.h                   |  1 +
>  lib/tst_net.c                           | 14 ++++++++++++++
>  testcases/network/netstress/netstress.c | 20 ++++----------------
>  4 files changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/include/tst_net.h b/include/tst_net.h
> index 855f4fc13..34025eb81 100644
> --- a/include/tst_net.h
> +++ b/include/tst_net.h
> @@ -7,9 +7,10 @@
>  #define TST_NET_H_
>  
>  #include <arpa/inet.h>
> -#include <sys/types.h>
> +#include <netdb.h>
>  #include <netinet/in.h>
>  #include <netinet/ip.h>
> +#include <sys/types.h>
>  
>  void tst_get_in_addr(const char *ip_str, struct in_addr *ip);
>  void tst_get_in6_addr(const char *ip_str, struct in6_addr *ip6);
> @@ -27,4 +28,8 @@ void tst_init_sockaddr_inet_bin(struct sockaddr_in *sa, uint32_t ip_val, uint16_
>  void tst_init_sockaddr_inet6(struct sockaddr_in6 *sa, const char *ip_str, uint16_t port);
>  void tst_init_sockaddr_inet6_bin(struct sockaddr_in6 *sa, const struct in6_addr *ip_val, uint16_t port);
>  
> -#endif
> +void tst_setup_addrinfo(const char *src_addr, const char *port,
> +		    const struct addrinfo *hints,
> +		    struct addrinfo **addr_info);
> +
> +#endif /* TST_NET_H_ */
> diff --git a/include/tst_private.h b/include/tst_private.h
> index 00cd17fce..e30d34740 100644
> --- a/include/tst_private.h
> +++ b/include/tst_private.h
> @@ -10,6 +10,7 @@
>  #define TST_PRIVATE_H_
>  
>  #include <stdio.h>
> +#include <netdb.h>
>  
>  #define MAX_IPV4_PREFIX 32
>  #define MAX_IPV6_PREFIX 128
> diff --git a/lib/tst_net.c b/lib/tst_net.c
> index 22c990e62..7c5fa77cd 100644
> --- a/lib/tst_net.c
> +++ b/lib/tst_net.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <errno.h>
> +#include <netdb.h>
>  #include <string.h>
>  #include <stdlib.h>
>  
> @@ -204,3 +205,16 @@ void tst_init_sockaddr_inet6_bin(struct sockaddr_in6 *sa, const struct in6_addr
>  	sa->sin6_port = htons(port);
>  	memcpy(&sa->sin6_addr, ip_val, sizeof(struct in6_addr));
>  }
> +
> +void tst_setup_addrinfo(const char *src_addr, const char *port,
> +		    const struct addrinfo *hints,
> +		    struct addrinfo **addr_info)
> +{
> +	int err = getaddrinfo(src_addr, port, hints, addr_info);
> +
> +	if (err)
> +		tst_brk(TBROK, "getaddrinfo failed, %s", gai_strerror(err));
> +
> +	if (!*addr_info)
> +		tst_brk(TBROK, "failed to get the address");
> +}
> diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
> index 6797be018..b66eed56e 100644
> --- a/testcases/network/netstress/netstress.c
> +++ b/testcases/network/netstress/netstress.c
> @@ -29,6 +29,7 @@
>  #include "tst_safe_stdio.h"
>  #include "tst_safe_pthread.h"
>  #include "tst_test.h"
> +#include "tst_net.h"
>  
>  static const int max_msg_len = (1 << 16) - 1;
>  static const int min_msg_len = 5;
> @@ -441,19 +442,6 @@ static int parse_client_request(const char *msg)
>  static struct timespec tv_client_start;
>  static struct timespec tv_client_end;
>  
> -static void setup_addrinfo(const char *src_addr, const char *port,
> -			   const struct addrinfo *hints,
> -			   struct addrinfo **addr_info)
> -{
> -	int err = getaddrinfo(src_addr, port, hints, addr_info);
> -
> -	if (err)
> -		tst_brk(TBROK, "getaddrinfo failed, %s", gai_strerror(err));
> -
> -	if (!*addr_info)
> -		tst_brk(TBROK, "failed to get the address");
> -}
> -
>  static void client_init(void)
>  {
>  	if (clients_num >= MAX_THREADS) {
> @@ -471,8 +459,8 @@ static void client_init(void)
>  	hints.ai_protocol = 0;
>  
>  	if (source_addr)
> -		setup_addrinfo(source_addr, NULL, &hints, &local_addrinfo);
> -	setup_addrinfo(server_addr, tcp_port, &hints, &remote_addrinfo);
> +		tst_setup_addrinfo(source_addr, NULL, &hints, &local_addrinfo);
> +	tst_setup_addrinfo(server_addr, tcp_port, &hints, &remote_addrinfo);
>  
>  	tst_res(TINFO, "Running the test over IPv%s",
>  		(remote_addrinfo->ai_family == AF_INET6) ? "6" : "4");
> @@ -667,7 +655,7 @@ static void server_init(void)
>  
>  	if (source_addr && !strchr(source_addr, ':'))
>  		SAFE_ASPRINTF(&src_addr, "::ffff:%s", source_addr);
> -	setup_addrinfo(src_addr ? src_addr : source_addr, tcp_port,
> +	tst_setup_addrinfo(src_addr ? src_addr : source_addr, tcp_port,
>  		       &hints, &local_addrinfo);
>  	free(src_addr);
>  

Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
