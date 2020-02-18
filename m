Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0C3162203
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:06:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4804F3C254C
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:06:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C43593C03B1
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:06:53 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 7C165600B9D
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:06:51 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,455,1574092800"; d="scan'208";a="83485429"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Feb 2020 16:06:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0A6E650A997E;
 Tue, 18 Feb 2020 15:57:11 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 18 Feb 2020 16:06:46 +0800
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
References: <MAXPR0101MB1468A284450566343010E440EE110@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <fa9fae7c-2110-d710-7df8-c3885e54d706@cn.fujitsu.com>
Date: Tue, 18 Feb 2020 16:06:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <MAXPR0101MB1468A284450566343010E440EE110@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0A6E650A997E.AE3B7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Hi
> Hi,
> I am trying to run *cpuset_regression_test* on my linux 5.4.3 with our 
> Yocto distro,i got *FAIL* result for this test when i ran complete ltp 
> test but i did not got reason for test failure but when i tried to run 
> this test seperately it showing is it correct way to run this test,how 
> this test needs to be ran independently?
sh can not be ran independently unless using runltp sh.
ltp has many runtest files, you can grep cpuset_regression_test.sh in 
ltp/runtest file.
such as "
# grep -nsr cpuset_regression_test.sh
controllers:353:cpuset_regression_test cpuset_regression_test.sh
(cpuset_regression_test is a tag, and cpuset_regression_test.sh is 
indeed excutable file)

Then you can specify -f to chose runtest file and -s to match string 
pattern by using runltp sh in /opt/ltp directory.(You can ./runltp 
--help see more info)

run this case independently as below:
cd /opt/ltp
./runltp -f controllers -s  cpuset_regression_test

Best Regards
Yang Xu
> 
> root@exaleapsemi:~/pankaj_ltp_new/ltp/testcases/kernel/controllers/cpuset# 
> *./cpuset_regression_test.sh *
> 
> .*/cpuset_regression_test.sh: line 27: .: test.sh: file not found*
> 
> 
> 
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
