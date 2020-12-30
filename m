Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 707ED2E7701
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Dec 2020 09:28:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC6B23C55AE
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Dec 2020 09:28:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 683A73C28F9
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 09:28:32 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 88C361400DCB
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 09:28:30 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,460,1599494400"; d="scan'208";a="103077309"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Dec 2020 16:28:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 38C3E4CE5CF8
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 16:28:25 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 30 Dec 2020 16:28:24 +0800
Message-ID: <5FEC3A39.6070607@cn.fujitsu.com>
Date: Wed, 30 Dec 2020 16:28:41 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
References: <1608803896-17634-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1608803896-17634-3-git-send-email-zhufy.jy@cn.fujitsu.com>
In-Reply-To: <1608803896-17634-3-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 38C3E4CE5CF8.AF8C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-3.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] syscalls/ipc: semctl09: add a test for
 SEM_STAT_ANY
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

Hi!
Merged this patchset, thanks!

Best Regards
Yang Xu
> Validate the content of the seminfo structure and the return value.
>
> The return value is highest used index to a kernel table, so we call
> semctl() with SEM_STAT_ANY which shouldn't fail if the value is correct.
>
> We also test SEM_STAT_ANY by calling semctl() directly by syscall(),
> because glibc have a bug that caused fails to pass the buffer specified
> by the caller to the kernel.
>
> We parse /proc/sysvipc/sem and check that the information is
> consistent with the content of seminfo structure.
>
> Signed-off-by: Feiyu Zhu<zhufy.jy@cn.fujitsu.com>
> Reviewed-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> ---




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
