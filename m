Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E17B0EF5
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 14:38:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B6743C20BD
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 14:38:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B25683C1823
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 14:38:35 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C1DE260B6B0
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 14:38:34 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CCYIcj107819;
 Thu, 12 Sep 2019 12:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=2d1n1KLuJEXr79ViRbc+aH/8aeSP4v1tgz5GW0UNIbQ=;
 b=PHAaWmu7L9kh01mKdEO2zQkL7F+njgSMjRx1UJF0S6GC5ZChENc3lu8OrK/+WI5qsm+x
 bGakAJx9FIT1fdkAIl90YUAOBPwkdQKeB7gQiji94NuDwl3M4U6+TXQulEwyPUAue6y7
 E+bdbjXqNw2miRAbDMLXQhYzSHHWsjoCBnAiTQh2H8Tt95Qy2jOIDWq171uZdY4u93pC
 JB+KlXBjO4hyG8HEkVdGoMC1qg3qZdq5JYhSJU/Xq7mjiGvlkElrQ7VwvaXmMYYBEfgB
 wfZc3TGpMlF8O4CtaNz0UBGMZbJFnJIqPSoCrJlL5Cm6QSR3ZFKe0RT22mQuLp8lb1Rm KA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2uw1m986ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 12:38:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CCYEdo058749;
 Thu, 12 Sep 2019 12:38:32 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2uxk0uat88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 12:38:31 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8CCcVNO025274;
 Thu, 12 Sep 2019 12:38:31 GMT
Received: from ak.ru.oracle.com (/10.162.80.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Sep 2019 05:38:31 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190903141610.28887-1-pvorel@suse.cz>
 <20190903141610.28887-4-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Organization: Oracle Corporation
Message-ID: <792ed9e3-beae-af46-d780-7bd7f44cdbed@oracle.com>
Date: Thu, 12 Sep 2019 15:41:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190903141610.28887-4-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909120134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909120134
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/7] tst_net.sh: Add (mostly) HOST_ID related
 options to tst_ipaddr_un
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

Petr,
On 9/3/19 5:16 PM, Petr Vorel wrote:
> These options are important for looping over max HOST_ID (255 resp.
> 0xffff for IPv6), when different than the default range.
> 
> Added -b, -h -l, -m, -n and -p options:
> -b: use also *broadcast* address (HOST_ID: IPv4: 255, IPv6: 0xffff),
> equivalent of -m 255 or -m 65535, cannot be combined with -f, -h, -l, -m, -n
> 
> -c COUNTER: integer value for counting HOST_ID and NET_ID (default: 1)
> 
> -f: use *full* address range (<0,255> resp. <0,65535>), cannot be combined
> with -b, -h, -l, -m, -n
> 
> -h: use only *host* address range (<1,254> resp. <1,65534>), default for
> counter mode, cannot be combined with -b, -f, -l, -m, -n
> 
> -l MIN_HOST_ID: specify minimal allowed HOST_ID allowed minimal HOST_ID,
> cannot be combined with -b, -f, -h, -n
> 
> -m MAX_HOST_ID: specify max allowed HOST_ID (default NET_ID -1), cannot be
> combined with -b, -f, -h, -n
> 
> -n: use also *network* address (HOST_ID: 0), equivalent of -l 0, cannot be
> combined with -b, -f, -h, -l, -m
> 
> -p: print also prefix
> 
> NOTE: The default range for host_id & net_id changed from <0, 254 resp. 65534> to
> <0, 254 resp. 65535>: broadcast bit was added.
> For backwards compatibility -n must be used.
> But non of the code used host_id & net_id in loop => no change needed.
> 

Not sure why extra -b, -f, -n and -h options are needed if there are -l and -m
options can do the same or I missed something?


> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
> 
> changes make API a bit complex, but affect only HOST_ID, but sometimes
> NET_ID changes are needed (route-change-if.sh). Maybe simple
> [ -n MIN_NET_ID,MAX_NET_ID ] [ -h MIN_HOST_ID,MAX_HOST_ID ] would be
> better. Comments are welcome.
> 
> Note: sometimes we call prefix as mask in the code.
> 
> Kind regards,
> Petr
> 
>  testcases/lib/tst_net.sh | 123 +++++++++++++++++++++++++++++++++------
>  1 file changed, 105 insertions(+), 18 deletions(-)
> 
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index a4183e013..baeac6e10 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -355,48 +355,135 @@ tst_ipaddr()
>  	fi
>  }
>  
> -# Get IP address of unused network, specified either by type and counter
> +# Get IP address of unused network, specified either counter and type
>  # or by net and host.
> -# tst_ipaddr_un [-cCOUNTER] [-p] [TYPE]
> -# tst_ipaddr_un [-p] NET_ID [HOST_ID]
> +# counter mode:
> +# tst_ipaddr_un [-b|-f|-n|[-l MIN_HOST_ID][-m MAX_HOST_ID]] [-p] [-c COUNTER] [TYPE]
> +# net & host mode:
> +# tst_ipaddr_un [-b|-f|-n|[-l MIN_HOST_ID][-m MAX_HOST_ID]] [-p] NET_ID [HOST_ID]
>  #
>  # TYPE: { lhost | rhost } (default: 'lhost')
> -# NET_ID: integer or hex value of net (IPv4: 3rd octet, IPv6: 3rd hextet)
> -# HOST_ID: integer or hex value of host (IPv4: 4th octet, IPv6: the last
> -# hextet, default: 0)
> +# NET_ID: integer or hex value of net (IPv4: 3rd octet <0,255>, IPv6: 3rd
> +# hextet <0,65535>)
> +# HOST_ID: integer or hex value of host (IPv4: 4th octet <0,255>, IPv6: the
> +# last hextet <0, 65535>, default: 0)
> +#
> +# RANGES for HOST_ID
> +#       |<-------------- -f -------------->|
> +#       |  |<----------- -b -------------->|
> +#       |<-------------- -n -------->|     |
> +#       |  |<----------- -h -------->|     |
> +#       |  |    |<- -l L -m M ->|    |     |
> +#       |  |    |               |    |     |
> +# IPv4: 0  1    L               M   254   255
> +# IPv6: 0  1    L               M  65534 65535
>  #
>  # OPTIONS
> +# -b: use also *broadcast* address (HOST_ID: IPv4: 255, IPv6: 0xffff),
> +# equivalent of -m 255 or -m 65535, cannot be combined with -f, -h, -l, -m, -n
> +#
>  # -c COUNTER: integer value for counting HOST_ID and NET_ID (default: 1)
> +#
> +# -f: use *full* address range (<0,255> resp. <0,65535>), cannot be combined
> +# with -b, -h, -l, -m, -n
> +#
> +# -h: use only *host* address range (<1,254> resp. <1,65534>), default for
> +# counter mode, cannot be combined with -b, -f, -l, -m, -n
> +#
> +# -l MIN_HOST_ID: specify minimal allowed HOST_ID allowed minimal HOST_ID,
> +# cannot be combined with -b, -f, -h, -n
> +#
> +# -m MAX_HOST_ID: specify max allowed HOST_ID (default NET_ID -1), cannot be
> +# combined with -b, -f, -h, -n
> +#
> +# -n: use also *network* address (HOST_ID: 0), equivalent of -l 0, cannot be
> +# combined with -b, -f, -h, -l, -m
> +#
>  # -p: print also prefix
>  tst_ipaddr_un()
>  {
> -	local counter host_id max_host_id max_net_id net_id prefix tmp type
> -	local OPTIND
> +	local counter host_id is_counter max_host_id min_host_id max_net_id net_id prefix tmp type
> +	local b_arg f_arg h_arg lm_arg n_arg
>  
> -	while getopts "c:p" opt; do
> +	[ "$TST_IPV6" ] && max_net_id=65535 || max_net_id=255
> +
> +	local OPTIND
> +	while getopts "bc:fhl:m:np" opt; do
>  		case $opt in
> +			b)
> +				[ "$f_arg" -o "$h_arg" -o "$lm_arg" -o "$n_arg" ] && \
> +					tst_brk_ TBROK "tst_ipaddr_un: -b cannot be combined with -f, -h, -l, -m, -n"
> +				max_host_id=$max_net_id
> +				b_arg=1
> +				;;
>  			c) counter="$OPTARG";;
> +			h)
> +				[ "$b_arg" -o "$f_arg" -o "$lm_arg" -o "$n_arg" ] && \
> +					tst_brk_ TBROK "tst_ipaddr_un: -h cannot be combined with -b -f, -l, -m, -n"
> +				min_host_id=1
> +				max_host_id=$((max_net_id-1))
> +				h_arg=1
> +				;;
> +			f)
> +				[ "$b_arg" -o "$h_arg" -o "$lm_arg" -o "$n_arg" ] && \
> +					tst_brk_ TBROK "tst_ipaddr_un: -f cannot be combined with -b, -h, -l, -m, -n"
> +				min_host_id=0
> +				max_host_id=$max_net_id
> +				f_arg=1
> +				;;
> +			l)
> +				[ "$b_arg" -o "$f_arg" -o "$h_arg" -o "$n_arg" ] && \
> +					tst_brk_ TBROK "tst_ipaddr_un: -l cannot be combined with -b, -f, -h, -n"
> +				! tst_is_int "$OPTARG" || [ $OPTARG -lt 0 ] && \
> +					tst_brk TBROK "tst_ipaddr_un: -l must be integer <0,$max_net_id> ($OPTARG)"
> +				min_host_id="$OPTARG"
> +				lm_arg=1
> +				;;
> +			m)
> +				[ "$b_arg" -o "$f_arg" -o "$h_arg" -o "$n_arg" ] && \
> +					tst_brk_ TBROK "tst_ipaddr_un: -m cannot be combined with -b, -f, -h, -n"
> +				! tst_is_int "$OPTARG" || [ "$OPTARG" -lt 0 ]|| [ "$OPTARG" -gt $max_net_id ] && \
> +					tst_brk TBROK "tst_ipaddr_un: -m must be integer <0,$max_net_id> ($OPTARG)"
> +				[ "$OPTARG" -gt $max_net_id ] && \
> +					tst_brk_ TBROK "tst_ipaddr_un: -m cannot be higher than $max_net_id ($OPTARG)"
> +				max_host_id="$OPTARG"
> +				lm_arg=1
> +				;;
> +			n)
> +				[ "$b_arg" -o "$f_arg" -o "$h_arg" -o "$lm_arg" ] && \
> +					tst_brk_ TBROK "tst_ipaddr_un: -n cannot be combined with -b, -f, -h, -l, -m"
> +				min_host_id=0
> +				n_arg=1
> +				;;
>  			p) [ "$TST_IPV6" ] && prefix="/64" || prefix="/24";;
>  		esac
>  	done
>  	shift $(($OPTIND - 1))
> +	[ $# -eq 0 -o "$1" = "lhost" -o "$1" = "rhost" ] && is_counter=1
>  
> -	[ "$TST_IPV6" ] && max_net_id=65535 || max_net_id=255
> +	if [ -z "$min_host_id" ]; then
> +		[ "$is_counter" ] && min_host_id=1 || min_host_id=0
> +	fi
> +
> +	if [ -z "$max_host_id" ]; then
> +		[ "$is_counter" ] && max_host_id=$((max_net_id - 1)) || max_host_id=$max_net_id
> +	fi
> +
> +	[ $min_host_id -gt $max_host_id ] && \
> +		tst_brk TBROK "tst_ipaddr_un: max HOST_ID ($max_host_id) must be >= min HOST_ID ($min_host_id)"
>  
>  	# counter
> -	if [ $# -eq 0 -o "$1" = "lhost" -o "$1" = "rhost" ]; then
> +	if [ "$is_counter" ]; then
>  		[ -z "$counter" ] && counter=1
>  		[ $counter -lt 1 ] && counter=1
>  		type="${1:-lhost}"
> -		max_host_id=$((max_net_id - 1))
>  		tmp=$((counter * 2))
>  		[ "$type" = "rhost" ] && tmp=$((tmp - 1))
> -
> -		host_id=$((tmp % max_host_id))
> +		host_id=$((tmp % max_host_id - 1))
>  		net_id=$((tmp / max_host_id))
>  
> -		if [ $host_id -eq 0 ]; then
> -			host_id=$max_host_id
> +		if [ $host_id -lt 0 ]; then
> +			host_id=$((max_host_id-1))
>  			net_id=$((net_id - 1))
>  		fi
>  	else # net_id & host_id
> @@ -410,8 +497,8 @@ tst_ipaddr_un()
>  		[ $host_id -lt 0 ] && host_id=1
>  	fi
>  
> -	net_id=$((net_id % max_net_id))
> -	host_id=$((host_id % max_net_id))
> +	net_id=$((net_id % (max_net_id + 1)))
> +	host_id=$((host_id % (max_host_id - min_host_id + 1) + min_host_id)) # orig, but also bad
>  
>  	if [ -z "$TST_IPV6" ]; then
>  		echo "${IPV4_NET16_UNUSED}.${net_id}.${host_id}${prefix}"
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
