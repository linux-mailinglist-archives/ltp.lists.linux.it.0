Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEFB1DB60B
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 16:17:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 275A53C4DF3
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 16:17:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D4E083C0300
 for <ltp@lists.linux.it>; Wed, 20 May 2020 16:17:14 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 58AE11401A90
 for <ltp@lists.linux.it>; Wed, 20 May 2020 16:17:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,414,1583164800"; d="scan'208";a="92641572"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 May 2020 22:17:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 9E0104BCC88A;
 Wed, 20 May 2020 22:17:02 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 20 May 2020 22:17:03 +0800
Message-ID: <5EC53BDD.9050400@cn.fujitsu.com>
Date: Wed, 20 May 2020 22:17:01 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200520072605.12614-1-yangx.jy@cn.fujitsu.com>
 <20200520132501.GA22418@dell5510>
In-Reply-To: <20200520132501.GA22418@dell5510>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9E0104BCC88A.AB04A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tirpc: Pass all extra client options to client
 program
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

ON 2020/5/20 21:25, Petr Vorel wrote:
> Hi Yang,
>
>> New rpc_test.sh only passes the first extra client option to
>> client program if extra client options are two or more.
>> For example, only "1" is passed into tirpc_rpc_broadcast_exp:
>> -------------------------------------------
>> ./runltp -f net.tirpc_tests -s tirpc_rpc_broadcast_exp
>> ...
>> tag=tirpc_rpc_broadcast_exp stime=1589957933
>> cmdline="rpc_test.sh -s tirpc_svc_1 -c tirpc_rpc_broadcast_exp -e "1 2""
>> ...
>> rpc_test 1 TFAIL: tirpc_rpc_broadcast_exp 10.0.0.2 536875000 1 failed unexpectedly
>> -------------------------------------------
>> For extra client options, use comma as a delimiter in net.tirpc_tests
>> and replace it with white space in rpc_test.sh
>
>> Fixes: 3190368d2df8 ("rpc/rpc_test.sh: Rewrite into new shell API")
>> Signed-off-by: Xiao Yang<yangx.jy@cn.fujitsu.com>
>
> Thanks a lot for a fix!
>
> I replaced bashism in OPTARG handling with sed (otherwise it'd fail on dash) and
> merged.
Hi Petr,

Thanks for your change.
I will avoid bashism next time.

Best Regards,
Xiao Yang
>
> Kind regards,
> Petr
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
