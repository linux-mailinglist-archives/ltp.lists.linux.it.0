Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BC987164233
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 11:33:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1915A3C2467
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 11:33:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 6D55D3C1840
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 11:33:04 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A43FE1401A95
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 11:33:01 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,459,1574092800"; d="scan'208";a="83560368"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Feb 2020 18:32:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8DDB1406AB15;
 Wed, 19 Feb 2020 18:23:16 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 19 Feb 2020 18:32:53 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <MAXPR0101MB1468A284450566343010E440EE110@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <fa9fae7c-2110-d710-7df8-c3885e54d706@cn.fujitsu.com>
 <20200219102329.GA28580@rei>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <cd8d9a9f-9513-35c5-0b59-6ab4dd60c5fd@cn.fujitsu.com>
Date: Wed, 19 Feb 2020 18:32:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200219102329.GA28580@rei>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8DDB1406AB15.ACB20
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] cpuset_regression_test failure
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
Cc: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Hi Cyril
> Hi!
>>> I am trying to run *cpuset_regression_test* on my linux 5.4.3 with our
>>> Yocto distro,i got *FAIL* result for this test when i ran complete ltp
>>> test but i did not got reason for test failure but when i tried to run
>>> this test seperately it showing is it correct way to run this test,how
>>> this test needs to be ran independently?
>> sh can not be ran independently unless using runltp sh.
> 
> They could, but you have to setup $PATH correctly first, we are sourcing
> shell scripts and executing binaries from /opt/ltp/testcases/bin, so in
> most cases this should work:
> 
> PATH="$PATH:/opt/ltp/testcases/bin" ./foo.sh

Yes, you are right. Sorry for the wrong info.

Best Regards
Yang Xu
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
