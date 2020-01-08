Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDA4133925
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 03:35:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95D493C258E
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 03:35:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 83DDE3C246E
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 03:35:07 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 4ADEA1A00A39
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 03:35:05 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,408,1571673600"; d="scan'208";a="81466428"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Jan 2020 10:35:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0112349E932C;
 Wed,  8 Jan 2020 10:26:01 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 8 Jan 2020 10:34:59 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1576049159-14014-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200107120224.GA26408@rei.lan> <20200107122604.GC26408@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <d10b9b79-1ab2-ba62-e67b-2262b5a8f2b1@cn.fujitsu.com>
Date: Wed, 8 Jan 2020 10:34:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200107122604.GC26408@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0112349E932C.A0954
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/capget01: Cleanup & convert to new
 library
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

Hi Cyril
> Hi!
> Also btw, we do not cover the case with pid == 0 now, which should
> return the capabilities for the calling thread. I guess that we can run
> the capget01 verify function twice, once for pid == getpid() and once
> for pid == 0.
>Sorry, I didn't notice this before.
I double read capget/capset man-pages and refer to kernel code.
pid = 0 that it indeed returns the the capabilities for the calling 
thread. I will add it.
Also, for capget syscall, it can get the  capabilities for any existed 
process. I think we should also test this by using child process in a 
new case like capset04.c.

Best Regards
Yang Xu



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
