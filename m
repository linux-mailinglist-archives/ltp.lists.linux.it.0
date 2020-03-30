Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C45E81975C8
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 09:34:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 850963C314D
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 09:34:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 151653C313A
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 09:34:18 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B99B9600D7C
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 09:34:16 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,323,1580745600"; d="scan'208";a="87895028"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 15:34:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id D4F5F406AB15;
 Mon, 30 Mar 2020 15:23:54 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 15:34:09 +0800
Message-ID: <5E81A0EF.4040508@cn.fujitsu.com>
Date: Mon, 30 Mar 2020 15:34:07 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Zou Wei <zou_wei@huawei.com>
References: <1585553269-119544-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1585553269-119544-1-git-send-email-zou_wei@huawei.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D4F5F406AB15.AA2FF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/3] Fix bug caused by default umask
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

On 2020/3/30 15:27, Zou Wei wrote:
> v3:
> The case is only successful when system default umask is 0022.
> When default umask is 0077 or other values, should clear umask by umask(0) in setup().
Hi Zou,

Thanks for your patch set.
Did you find any other cases related with the same issue?

Thanks,
Xiao Yang
>
> Zou Wei (3):
>    security/dirtyc0w: Fix bug caused by default umask
>    syscalls/fstat: Fix bug caused by default umask
>    syscalls/statx01: Fix bug caused by default umask
>
>   testcases/kernel/security/dirtyc0w/dirtyc0w.c | 2 ++
>   testcases/kernel/syscalls/fstat/fstat02.c     | 2 ++
>   testcases/kernel/syscalls/statx/statx01.c     | 2 ++
>   3 files changed, 6 insertions(+)
>
> --
> 2.6.2
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
