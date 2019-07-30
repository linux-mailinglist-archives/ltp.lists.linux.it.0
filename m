Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D634E7A044
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 07:18:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66D503C1D51
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 07:18:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 479063C194D
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 07:18:54 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9E34A10009EA
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 07:18:45 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,325,1559491200"; d="scan'208";a="72502275"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2019 13:18:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id DD64A4CDD99E;
 Tue, 30 Jul 2019 13:18:51 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 30 Jul 2019 13:18:47 +0800
Message-ID: <5D3FD336.6080409@cn.fujitsu.com>
Date: Tue, 30 Jul 2019 13:18:46 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
References: <1b8b7f73-fd31-58d2-5162-3648fa9729a5@163.com>
 <1563789167-2328-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190729122621.GB5872@dell5510> <20190729131619.GB27006@rei.lan>
 <20190729144227.GA8824@dell5510>
In-Reply-To: <20190729144227.GA8824@dell5510>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: DD64A4CDD99E.AE6E7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] m4: remove some useless m4
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


> Hi,
>
>>>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>>> Acked-by: Petr Vorel<pvorel@suse.cz>
>>> Although I wonder whether mixing 4 changes (even related to autoconf)
>>> in single commit is a good idea (makes it a bit hard to review).
>> Yes please, at least the SPDX conversion has to be in a separate patch.
> +1
>
> BTW m4/ltp-signalfd.m4 would require cleanup as well.
Hi Cyril ,Petr

Sorry. This patch looks a little mess.

I will split it into five patches, as below:

v3-0001-m4-remove-useless-ltp-securebits.m4.patch
v3-0002-m4-remove-useless-ltp-time.m4.patch
v3-0003-m4-remove-useless-ltp-fs_ioc_flags.m4.patch
V3-0004-m4-remove-useless-ltp-cgroupstats.m4.patch
v3-0005-m4-clean-up-ltp-signalfd.m4.patch


Also, SPDX conversion for setxattr03.c, I will cleanup this case after this patchset merged.

Thanks
Yang Xu

> Kind regards,
> Petr
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
