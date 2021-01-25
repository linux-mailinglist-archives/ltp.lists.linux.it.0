Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB60B3020DF
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 04:45:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3642F3C5F66
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 04:45:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9FFB63C5356
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 04:44:59 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 8C876100093F
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 04:44:58 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,372,1602518400"; d="scan'208";a="103787251"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Jan 2021 11:44:53 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 98C0C4CE6031;
 Mon, 25 Jan 2021 11:44:50 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 25 Jan 2021 11:44:47 +0800
Message-ID: <600E3EAD.3020406@cn.fujitsu.com>
Date: Mon, 25 Jan 2021 11:44:45 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210112020227.11775-1-yangx.jy@cn.fujitsu.com>
 <20210112020227.11775-3-yangx.jy@cn.fujitsu.com> <YAgHUvIge6svN0gu@yuki.lan>
 <6008E512.50704@cn.fujitsu.com> <YArXjchkIvhgjsg3@yuki.lan>
In-Reply-To: <YArXjchkIvhgjsg3@yuki.lan>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 98C0C4CE6031.A90B2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls: Take use of TST_EXP_PASS_SILENT
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

On 2021/1/22 21:47, Cyril Hrubis wrote:
> Hi!
>> BTW, I just want to avoid many TPASS for a subtest.
> Why? The capget01 clearly does two different tests per iteration.
>
> There is absolutely no correlation between the number of TPASS test
> produces and the number of iteration test does.
Hi Cyril,

I pushed the patchset without capget01 for now.  But I think
there is a whole test per iteration, like three steps:
1) Drop CAP_NET_RAW.
2) Get effective by specifying kernel revision.
3) Check that the effective doesn't include CAP_NET_RAW.
Is it necessary for per steps to report TPASS? :-)

Best Regards,
Xiao Yang



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
