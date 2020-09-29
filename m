Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C70F027C1C3
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 11:57:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55DC13C2AAE
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 11:57:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 58DB93C0596
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 11:57:14 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 41896200BB3
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 11:57:12 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,318,1596470400"; d="scan'208";a="99711652"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 17:57:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B678248990FF;
 Tue, 29 Sep 2020 17:57:10 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 17:57:09 +0800
Message-ID: <5F730501.7050505@cn.fujitsu.com>
Date: Tue, 29 Sep 2020 17:57:21 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200929073501.4598-1-pvorel@suse.cz>
 <5F72E52E.40609@cn.fujitsu.com> <20200929084114.GA7482@dell5510>
In-Reply-To: <20200929084114.GA7482@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B678248990FF.ABAD4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] io_destroy01: TCONF when unsupported
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

Hi Petr

> Hi Yang,
>
>> Hi Petr
>> Why not using kconfig in tst_test struct.
>
> We should probably use tst_syscall().
> But using kconfig is not 1) needed (tst_syscall() most reliable way) 2) kconfig
> requires having kernel config available, which is not on some platforms.
I see. At the first, I prefer to like to use kconfig because it only 
tests io_destory one time on kernel without CONFIG_AIO  when we use -i 
parameters,  but using libaio wrapper is stable. So it is ok.
>
> (I plan to introduce TWARN_IF_NO_CONFIG to print only warning for platforms
> which don't have kconfig available, see
> https://github.com/linux-test-project/ltp/issues/700).

I have seen this ticket, if I understand it corretly,

if platform has kernel config without needed kconfig, test cases still 
will report TCONF

if platform doesn't have  kernel config, test cases only reports 
warning(system doesn't have kernel config file) and continue to run test 
and it maybe lead to a unexpected stat/failure. And we don't add extra 
check in tests case such as ENOSYS/EINVAL check because it is redundant 
against kconfig check.

Best Regards
Yang Xu

>
> Kind regards,
> Petr
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
