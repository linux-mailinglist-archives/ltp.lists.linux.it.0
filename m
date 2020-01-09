Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7CF135691
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 11:14:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEF793C24FB
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 11:14:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 360A93C2366
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 11:14:31 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 9D17A601204
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 11:14:29 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,413,1571673600"; d="scan'208";a="81541717"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Jan 2020 18:14:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id D21C141B7076;
 Thu,  9 Jan 2020 18:05:24 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 9 Jan 2020 18:14:25 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1578553217-29510-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <6bd663d6-2ef4-cee8-1a5c-163dc2a74d8b@cn.fujitsu.com>
 <20200109095955.GC31981@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <9312b75d-7437-7274-6ec9-a05090cd86da@cn.fujitsu.com>
Date: Thu, 9 Jan 2020 18:14:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200109095955.GC31981@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D21C141B7076.AB39F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/capget02: Use pid=0 instead of getpid()
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

Hi!> Hi!
>>> Since pid=0 returns the capabilities for the calling thread,
>>> we can remove getpid and use pid=0 instead of it. Also we
>>> can cover this test point.
>> Since I defined static struct, I think it doesn't need pid=0 assignment.
>> I will send a v2 and add comment.
> 
> If you are at it, can you also allocate guarded buffers instead?
Sure, I will use guarded buffers instead.
> 
> https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2231-guarded-buffers
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
