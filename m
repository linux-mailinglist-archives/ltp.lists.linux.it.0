Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C23210EC
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 07:41:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC1843C58F3
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 07:41:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 59A983C4E9B
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 07:40:58 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id E64B21A008B9
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 07:40:57 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,196,1610380800"; d="scan'208";a="104715990"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Feb 2021 14:40:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A214E4CE730B;
 Mon, 22 Feb 2021 14:40:46 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 14:40:37 +0800
Message-ID: <603351E7.4060008@cn.fujitsu.com>
Date: Mon, 22 Feb 2021 14:40:39 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <YCFZB1/VMSsfxyPA@yuki.lan>
 <1613627572-5213-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1613627572-5213-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2crZjLK1MtzkEYyxCU0-Pbqp8G5MR4CU7UEG4VQr-ksVQ@mail.gmail.com>
In-Reply-To: <CAEemH2crZjLK1MtzkEYyxCU0-Pbqp8G5MR4CU7UEG4VQr-ksVQ@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A214E4CE730B.AE61C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/4] syscalls/mallinfo02: Add a basic test to
 check use mmap or sbrk
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li
> Hi Xu,
>
> For patch 1/4 ~ 3/4, looks good to me.
> Reviewed-by: Li Wang <liwang@redhat.com <mailto:liwang@redhat.com>>
>
> For 4/4, I slightly think it does not make much sense to test, because
> it just verifies the info.hblkhd integer overflow at unsuggested usage.
> Anyway, that's only my thoughts, maybe a one-sided view:).
I guess we can just add a valid test for mallinfo2 to test it still can 
get the correct info when setting 2G size instead of this case.

ps: I need to find a new enough system to have supported mallinfo2.

Best Regards
Yang Xu
>
> --
> Regards,
> Li Wang




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
