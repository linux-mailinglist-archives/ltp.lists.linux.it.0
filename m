Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9211A9E7C5
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 14:22:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 599803C1C97
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 14:22:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 832B03C136F
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 14:22:14 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8E1D514017CB
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 14:22:13 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RCGJLQ145456;
 Tue, 27 Aug 2019 12:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=corp-2019-08-05;
 bh=nFBmoYNj6sW4rGk0O0bIPwlcEu3d0l4o+pto19loMhw=;
 b=d9SESz8zyZTSXNypgM8Skvm00zctk/0c3EixBtjZ9yV3bKz5YgPaVsxnJKgs4glWc17u
 sqdaCfTsFc6dKr6QiQ+RUs9B6hqk9xjRK0xsyLi0yMyrf3NZ3M0xczzax7p/eu2G6jVv
 8JetardLFOVahfvfTwi1faZBaosdNTBzYtHtuWGVLJnPqycnDGrmMwGdWUU0v8kLX0nP
 Buyci34FT+vCefc1hUfjzhNHq5ryQxvA/gl9NzDmGgaa9uRExMhurCGQA6EvolQZzYlr
 vj5zWPj12jkjPT3AnAIQJ6l1/PI57T+DrVR2RmTrV68HJoalBmgPldD2taj3yLuaOAgY Kg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2un4bv01c2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 12:22:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RC8pY7179419;
 Tue, 27 Aug 2019 12:22:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2umj1unkda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 12:22:10 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7RCM77d030201;
 Tue, 27 Aug 2019 12:22:10 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 27 Aug 2019 05:22:07 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190826141101.10144-1-pvorel@suse.cz>
Message-ID: <888e8f74-278c-ae3f-c8c5-3b8790f634d3@oracle.com>
Date: Tue, 27 Aug 2019 15:22:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826141101.10144-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9361
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908270137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9361
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908270137
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_net.sh: Fix root detection on netns on new
 shell API
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
On 26.08.2019 17:11, Petr Vorel wrote:
> When using LTP with netns ("Single Host Configuration"),
> init_ltp_netspace before running test which performs checking for
> TST_NEEDS_ROOT=1, therefore adding it is not enough.
> It fails on adding netns:
> 
> RTNETLINK answers: Operation not permitted
> sctp01 1 TBROK: ip li add name ltp_ns_veth1 type veth peer name ltp_ns_veth2 failed
> 
> NOTE: tst_restore_ipaddr is called before running tests only on netns,
> in init_ltp_netspace, therefore tst_require_root_ as a check is enough.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Alexey,
> 
> I also wanted to move variable setup (everything after
> tst_default_max_pkt() definition) to separate function and call it
> inside tst_net_setup() for new shell API, but all TST_* setup
> (currently at least TST_TMPDIR_RHOST=1 and TST_NEEDS_ROOT=1)
> would not work (we'd need to use tst_cleanup_rhost and _tst_require_root
> directly, which is IMHO not good).> 
> + We might want to cleanup variables (prefix library internal variables
> with _tst_net, use lower case), at least these two:
> s/ping6_warn_printed/_tst_net_ping6_warn_printed/g
> s/TST_PARSE_VARIABLES/_tst_net_parse_variables/g
> 

Agree

>  testcases/lib/tst_net.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 1678bcfda..5a149530c 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -105,7 +105,7 @@ tst_require_root_()
>  init_ltp_netspace()
>  {
>  	tst_test_cmds ip
> -	tst_require_root_
> +	[ -z "$TST_USE_LEGACY_API" ] && _tst_require_root || tst_require_root

Can we fix tst_require_root_() instead?

>  
>  	local pid=
>  
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
