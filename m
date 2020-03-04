Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 593B5178A4E
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 06:43:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2869F3C65D7
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 06:43:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D5A883C65CD
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 06:43:18 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 1D913600847
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 06:43:16 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,513,1574092800"; d="scan'208";a="85615785"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Mar 2020 13:43:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 9FC9450A997D;
 Wed,  4 Mar 2020 13:33:16 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 4 Mar 2020 13:43:06 +0800
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
References: <MAXPR0101MB14687839FE18D4BC633BF475EEE50@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <31b51443-dbf1-76a8-a8e4-672ecbad0f87@cn.fujitsu.com>
Date: Wed, 4 Mar 2020 13:43:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <MAXPR0101MB14687839FE18D4BC633BF475EEE50@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9FC9450A997D.AF8CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP autoconfig
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

Hi!


> Hi,
> i have cloned git from github and going ahead with procedure i facing 
> following problem
> 
> root@exaleapsemi:~/pankaj_ltp/ltp# make autotools
> aclocal -I m4
> Can't locate Exporter.pm in @INC (you may need to install the Exporter 
> module) (@INC contains: /usr/share/automake-1.16 
Here has said the reason, you should install perl-Exporter
module/package.

Best Regards
Yang Xu
> /usr/lib/perl5/site_perl/5.30.0/riscv64-linux 
> /usr/lib/perl5/site_perl/5.30.0 
> /usr/lib/perl5/vendor_perl/5.30.0/riscv64-linux 
> /usr/lib/perl5/vendor_perl/5.30.0 /usr/lib/perl5/5.30.0/riscv64-linux 
> /usr/lib/perl5/5.30.0 .) at /usr/share/automake-1.16/Automake/Config.pm 
> line 22.
> Compilation failed in require at /usr/bin/aclocal line 37.
> BEGIN failed--compilation aborted at /usr/bin/aclocal line 37.
> make: *** [/home/root/pankaj_ltp/ltp/include/mk/automake.mk:45: 
> aclocal.m4] Error 2
> 
> 
> Thanks
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
