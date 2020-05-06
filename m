Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C7B1C7571
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 17:55:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC0623C5796
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 17:55:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6CE063C2626
 for <ltp@lists.linux.it>; Wed,  6 May 2020 17:55:04 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6B5D960132C
 for <ltp@lists.linux.it>; Wed,  6 May 2020 17:55:03 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 046FriHm081904;
 Wed, 6 May 2020 15:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=0klWaQa+pGZs7tWvmytecVcUHaW0hGULpi/ZVIE/h8g=;
 b=VN1TBaARPlpPlpnJjPZj+iTse8W+9qLybsvcbPYxmZoSRiQP/RJ8zm7lCM5QN4phKjYx
 KAzbef2uGGmW31YrEFKwjqwFeCkXbwem/IXBHPOvlZWcrrjhPKeZsufHmDG09DgwqVKE
 ne8zAM1+Bu3smcYje2GO2Eufi6RB9+DmhrVLcZPBp6dhmRq7hFsXha0Q33WLPQBEqz8c
 5+DD3ZHJNcsavls6+cLOk+SPzdV+doxeLeE7JHbtu0+p/1c1MFDJ8M0i8tQWMNaLvJEv
 iu66TVs6ossRfJcfg81BKgcJr0IoZcNgRWiw4NATHEMfAni7oaLDRcttAJCGNpE+S9a2 Ag== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 30s1gnb2ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 May 2020 15:54:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 046Fqce7042790;
 Wed, 6 May 2020 15:52:58 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 30us7n1hq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 May 2020 15:52:58 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 046FqvGw011400;
 Wed, 6 May 2020 15:52:57 GMT
Received: from [192.168.1.34] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 May 2020 08:52:57 -0700
To: Petr Vorel <pvorel@suse.cz>
References: <20200429192340.14252-1-pvorel@suse.cz>
 <20200429192340.14252-4-pvorel@suse.cz>
 <c408ffc1-9ba6-ac01-0de9-1726ee72d4a4@oracle.com>
 <20200506150629.GA678@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <43c34d08-439c-a6a0-8e3c-b06ffc61ef40@oracle.com>
Date: Wed, 6 May 2020 18:52:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506150629.GA678@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9613
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005060127
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9613
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005060127
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 3/3] route: Increase default loop values
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 06.05.2020 18:06, Petr Vorel wrote:
> Hi Alexey,
> 
>> The changes are fine.
> Thanks for your ack.
> 
>> Perhaps for further improvements, ROUTE_CHANGE_NETLINK is limited by
>> "NUM_LOOPS_MAX 65535", it looks unnecessary.
> Sure, I'll remove this. It fails if -c is bigger than INT_MAX, thus suggest:
> 
> +++ testcases/network/stress/route/route-change-netlink.c
> @@ -20,8 +20,6 @@
>  #include "tst_safe_net.h"
>  #include "tst_safe_stdio.h"
>  
> -#define NUM_LOOPS_MAX 65535
> -
>  #define IP_ADDR_DELIM ','
>  #define STR(x) #x
>  #define CHR2STR(x) STR(x)
> @@ -117,8 +115,8 @@ static void setup(void)
>  	if (tst_parse_int(p_opt, &port, 1, 65535))
>  		tst_brk(TBROK, "invalid rhost port '%s'", p_opt);
>  
> -	if (tst_parse_int(c_opt, &num_loops, 1, NUM_LOOPS_MAX)) {
> -		num_loops = NUM_LOOPS_MAX;
> +	if (tst_parse_int(c_opt, &num_loops, 1, INT_MAX)) {
> +		num_loops = INT_MAX;
>  		tst_res(TWARN, "invalid number of loops (-c %s), using: %d",
>  			c_opt, num_loops);
>  	}
> ---
> 
> Or I can use long and LONG_MAX, but IMHO int is OK :)
> 
>> Can we limit the setup only and iterate (adding and deleting) from
>> the beginning or use -i option with -c?
> I'm sorry, I don't understand you. Isn't it INT_MAX enough?


Yes, it's fine, I just wasn't sure why it was added in the first place,
65535, because of some limitation of the ip address setup (you have
added the separate ip max var though) or something else...

> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
