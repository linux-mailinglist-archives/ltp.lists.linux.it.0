Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA161A4699
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Apr 2020 15:01:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19D6A3C2C88
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Apr 2020 15:01:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 5D5513C2C75
 for <ltp@lists.linux.it>; Fri, 10 Apr 2020 15:01:52 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 14EF61A01A31
 for <ltp@lists.linux.it>; Fri, 10 Apr 2020 15:01:51 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03ACs3Yl149421;
 Fri, 10 Apr 2020 13:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=j4jOAidoxWlMeIGZKtOLIQIukNc7JS5r2Ejilh/w0vQ=;
 b=OktOt+gdThWCGIoQc11/Vo0/U+u0rHbhr461dCSYRES49OFUKHNsKodLULdxdTIVSnuD
 a6BEoRsmmM3QoV/be2DmfUqFLlarFKC4+IEciK5Sqv/+LdF8REJGjUbXYzF4L6Kr66Ao
 imBjSldwXiDumk3RtH7lcLf8LKBxpD+SDR5zAw3kbrVY8AI6+I7/niNXnvwNbTvdizUK
 bNJceATGFvFvCr8dEyaIL8VA5fRPlpB2YFCs102IC8Nyckr2KyImU7qcJr4uF57V59h2
 PpvLiRJWpEcUfsA4Fcy50nNZEvhzFlF8YkZ8iZ/wjFCnPKEf7wV6GcYU1BGRoXISABc7 3g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 3091m169r8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Apr 2020 13:01:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03ACqpZL055219;
 Fri, 10 Apr 2020 13:01:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 309ag7mbhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Apr 2020 13:01:46 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03AD1h0K009396;
 Fri, 10 Apr 2020 13:01:45 GMT
Received: from [192.168.1.34] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 10 Apr 2020 06:01:43 -0700
To: Petr Vorel <pvorel@suse.cz>
References: <20200403165432.19358-1-pvorel@suse.cz>
 <20200403165432.19358-3-pvorel@suse.cz>
 <06e299d0-0663-a868-f8cc-1f9002d9d43f@oracle.com>
 <20200409183714.GA915479@x230>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <bd634f12-b4f2-18ad-c2f3-ab5e42a0c973@oracle.com>
Date: Fri, 10 Apr 2020 16:01:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200409183714.GA915479@x230>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9586
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0
 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004100107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9586
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004100107
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v3 2/2] net/route: Add netlink based route
 change gw/dest tests
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

On 09.04.2020 21:37, Petr Vorel wrote:
> Hi Alexey,
> 
> thanks for your review!
> 
>>> diff --git a/testcases/network/stress/route/route-change-gw.sh b/testcases/network/stress/route/route-change-gw.sh
> ...
>>>  setup()
>>>  {
>>>  	tst_res TINFO "change IPv$TST_IPVER route gateway $NS_TIMES times"
>>> -
>>> -	rt="$(tst_ipaddr_un -p 0 0)"
>>> -	lhost="$(tst_ipaddr_un 1 1)"
>>> -	rhost="$(tst_ipaddr_un 0 1)"
>>> -	tst_add_ipaddr -s -q -a $lhost
>>> -	tst_add_ipaddr -s -q -a $rhost rhost
>>> +	setup_gw
>>>  }
> 
>> TST_SETUP=setup_gw
> 
> OK, I hesitated, whether
> tst_res TINFO "change IPv$TST_IPVER route gateway $NS_TIMES times"
> should be part of setup_gw() or not in the end I accidentally left it on both
> places. OK, I'll keep it in setup_gw() and remove from
> route-change-netlink-gw.sh + use TST_SETUP=setup_gw here (in
> route-change-gw.sh).
> 
>>> diff --git a/testcases/network/stress/route/route-lib.sh b/testcases/network/stress/route/route-lib.sh
> ...
>>> +test_netlink()
>>> +{
>>> +	local ip_flag
>>> +	[ "$TST_IPV6" ] && ip_flag="-6"
>>> +
>>> +	local port=$(tst_rhost_run -s -c "tst_get_unused_port ipv${TST_IPVER} dgram")
>>> +
> 
>> What will be listen on this remote port?
> Nothing. We've talked about it in the past. I struggled to setup remote workers
> (problems to detect that the setup is up before testing starts), but I can
> rethink it again. What do you suggest: one daemon which would run several
> threads (each of them bind to specific IP) or several single thread instances?
> IMHO not binding to specific IP does not garant traffic is taking path we want.

Hi Petr,

Then, for now we can pass arbitrary port, no need for tst_get_unused_port(),
e.g. 65535.

> 
>>> +	EXPECT_PASS route-change-netlink -c $NS_TIMES -d $(tst_iface) $ip_flag -p $port $ROUTE_CHANGE_NETLINK_PARAMS
> 
>> EXPECT_PASS doesn't handle TCONF when libmnl-devel is missing.
> 
> Thanks, I'll fix it.
> 
> tst_test.c:865: CONF: libmnl library and headers are required
> route-change-netlink-gw 1 TFAIL: route-change-netlink -c 10 -d ltp_ns_veth2 -p 40645 -g 10.23.1.7^10.23.1.6^10.23.1.5^10.23.1.4^10.23.1.3^ -l 10.23.1.1 -r 10.23.0.1 failed unexpectedly
> 
> I propose to handle this in EXPECT_PASS() (send a separate RFC patch for it).

Not sure if it would work for non-ltp binaries...

> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
