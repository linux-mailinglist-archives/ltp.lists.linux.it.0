Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DCE2FCB65
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 08:19:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32CBB3C63D0
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 08:19:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8D45B3C3096
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 08:19:30 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 8D9DB1A005FF
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 08:19:29 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,360,1602518400"; d="scan'208";a="103651972"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jan 2021 15:19:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 602974CE6026;
 Wed, 20 Jan 2021 15:19:23 +0800 (CST)
Received: from [10.167.220.48] (10.167.220.48) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 20 Jan 2021 15:19:23 +0800
Message-ID: <6007D97A.9010804@cn.fujitsu.com>
Date: Wed, 20 Jan 2021 15:19:22 +0800
From: Zhu Feiyu <zhufy.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20201221110120.26165-1-radoslav.kolev@suse.com>
 <20201222171033.GB126602@pevik> <X/RJhbNBfja6/Snr@pevik>
In-Reply-To: <X/RJhbNBfja6/Snr@pevik>
X-Originating-IP: [10.167.220.48]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 602974CE6026.A716F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpio_tests.sh: Fix failure with BusyBox cpio
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
> Hi Radoslav,
>
> ...
>>> +
>>> +if cpio 2>&1 | grep -q '\-o\sCreate (requires -H newc)'; then
> Thanks for your fix, merged with these changes:
>
> * grep for BusyBox because some older versions does not contain the
> hint, but actually require it.
>
> * move things to setup function due my following commit, which cannot be
> outside API functions (setup/test function):
> And check for -o (which is on BusyBox optional).
On my test environment, just executing cpio with no arguments will only 
output:
cpio: You must specify one of -oipt options.
Try `cpio --help' or `cpio --usage' for more information.

So the result of cpio01_sh is changed from PASS to CONF after commit 
5910bdb65c.
Is there any difference in the output from executing this command on 
your environment?

Best Regards
Feiyu Zhu
>
> Kind regards,
> Petr
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
