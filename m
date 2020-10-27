Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6082229ACE7
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 14:12:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19AE13C4B5D
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 14:12:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BB7E03C20D7
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 14:12:38 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id ABD0D600EAC
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 14:12:37 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,423,1596470400"; d="scan'208";a="100557803"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 21:12:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2F9B048990D2;
 Tue, 27 Oct 2020 21:12:29 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 21:12:28 +0800
Message-ID: <5F981CBB.4040704@cn.fujitsu.com>
Date: Tue, 27 Oct 2020 21:12:27 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Martin Doucha <mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
 <20201026164756.30556-12-mdoucha@suse.cz>
In-Reply-To: <20201026164756.30556-12-mdoucha@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2F9B048990D2.AB40E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.8 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 11/19] Unify error handling in lib/tst_fs_setup.c
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

HI Martin
> - Properly format caller file:line location
>
> Signed-off-by: Martin Doucha<mdoucha@suse.cz>
> ---
>   lib/tst_fs_setup.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/lib/tst_fs_setup.c b/lib/tst_fs_setup.c
> index 54ea37077..a2dacd2ad 100644
> --- a/lib/tst_fs_setup.c
> +++ b/lib/tst_fs_setup.c
> @@ -36,11 +36,11 @@ int mount_overlay(const char *file, const int lineno, int skip)
>
>   	if (errno == ENODEV) {
>   		if (skip) {
> -			tst_brk(TCONF, "%s:%d: " TST_FS_SETUP_OVERLAYFS_MSG,
> -				file, lineno);
> +			tst_brk_(file, lineno, TCONF,
> +				TST_FS_SETUP_OVERLAYFS_MSG);
>   		} else {
> -			tst_res(TINFO, "%s:%d: " TST_FS_SETUP_OVERLAYFS_MSG,
> -				file, lineno);
> +			tst_res_(file, lineno, TINFO,
> +				TST_FS_SETUP_OVERLAYFS_MSG);
>   		}
>   	} else {
>   		tst_brk(TBROK | TERRNO, "overlayfs mount failed");

We should  also use tst_brk_ to replace this.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
