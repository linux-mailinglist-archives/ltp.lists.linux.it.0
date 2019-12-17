Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA0122881
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:16:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 312AA3C2078
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:16:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 430983C0431
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:16:49 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 29C496013DB
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:16:47 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,325,1571673600"; d="scan'208";a="80413340"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Dec 2019 18:16:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2BDB94CE1C93
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 18:08:05 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 17 Dec 2019 18:16:43 +0800
To: <ltp@lists.linux.it>
References: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1576577571-3668-5-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <cfccbfaa-ecf7-3c0b-247a-f8fffafe878c@cn.fujitsu.com>
Date: Tue, 17 Dec 2019 18:16:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1576577571-3668-5-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2BDB94CE1C93.AF434
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/5] syscalls/quotactl05: add project quota
 test for xfs filesystem
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi All
Sorry, please ingore this email. It has been merged.

Kind Regards
Yang Xu

on 2019/12/17 18:12, Yang Xu wrote:
> This is a variant about quotactl02. It is used to test project quota.
> I split it into a new case instead of adding it in quotaclt02 because
> kernel doesn't permit mount both group and project quota before
> commit d892d5864f02 ("xfs: Start using pquotaino from the superblock.").
> 
> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> ---
>   runtest/syscalls                              |  1 +
>   testcases/kernel/syscalls/quotactl/.gitignore |  2 +
>   .../kernel/syscalls/quotactl/quotactl05.c     | 99 +++++++++++++++++++
>   3 files changed, 102 insertions(+)
>   create mode 100644 testcases/kernel/syscalls/quotactl/quotactl05.c



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
