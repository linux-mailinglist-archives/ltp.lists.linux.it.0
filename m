Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7495522A906
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 08:34:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 433803C27D6
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 08:34:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A89173C20B6
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 08:34:10 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id AE37660127B
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 08:34:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,385,1589212800"; d="scan'208";a="96787065"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jul 2020 14:34:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id D7AE54CE4BDF;
 Thu, 23 Jul 2020 14:34:06 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 23 Jul 2020 14:34:07 +0800
To: Cyril Hrubis <chrubis@suse.cz>, Yang Xu <xuyang_jy_0410@163.com>
References: <20200618094139.24579-1-xuyang_jy_0410@163.com>
 <20200618094139.24579-2-xuyang_jy_0410@163.com>
 <20200722154558.GB2714@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <dae922fe-d40a-839a-2056-32127df0c8d3@cn.fujitsu.com>
Date: Thu, 23 Jul 2020 14:34:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200722154558.GB2714@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D7AE54CE4BDF.A1BB4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.7 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/msgstress: scale number of
 processes accodingly to available RAM
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

HI Cyril


> Hi!
> The main problem with this patch is that it's doing too much.
Sorry for this. This patch is really unfriendly to the reviewer because 
it is too much.
> 
> The conversion to the new library should be ideally done in a separate
> patch, then we should start working on getting the limits right.
Yes, I will do this as your advise.
> 
> For the limits I would really like to introduce a library function that
> would return how many processes test can run before the system runs out
> of memory then we can build on the top of that and create a library
> function to return now many message queues we can run. As it is the code
> is still copy&pasted between the testcases.
Will do it.
> 
> So please can we do things in smaller, well defined, steps?
Of course.
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
