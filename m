Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAF117F474
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 11:10:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00A6A3C604F
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 11:10:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 14D893C5FFE
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 11:10:17 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9785B1401AFF
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 11:10:15 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,536,1574092800"; d="scan'208";a="86105230"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Mar 2020 18:10:14 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id CBA1F50A9961;
 Tue, 10 Mar 2020 18:00:13 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 10 Mar 2020 18:10:09 +0800
References: <1583834577-21695-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <7c240f66-a65b-4444-b4a2-7569f52e5496@cn.fujitsu.com>
Date: Tue, 10 Mar 2020 18:10:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1583834577-21695-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: CBA1F50A9961.AE498
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=1.6 required=7.0 tests=KHOP_HELO_FCRDNS,
 MISSING_HEADERS,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] travis: Temporarily disable fedora:lastest
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

Hi

I also test fedora:32 fedora:33 in my ltp fork[1], they are all pass.
fedora:31 and fedora:latest are failed.

@Petr, You often modify travis code, if you have some advise, please let 
me know.

[1]https://github.com/xuyang0410/ltp/commits/settimeofday_builderror

Best Regards
Yang Xu
> Docker hub image for fedora:lastest has problem, so it will
> install x86_64 and i686 rpm together. It will lead to file
> conflict as below:
>   file /etc/bindresvport.blacklist from install of libtirpc-1.2.5-1.rc2.fc31.i686
> conflicts with file from package libtirpc-1.2.5-0.fc31.x86_64
> 
> I have created a github issue[1] for it on fedora-cloud.
> 
> [1]https://github.com/fedora-cloud/docker-brew-fedora/issues/73
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   .travis.yml | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/.travis.yml b/.travis.yml
> index f7d73f051..68d98406d 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -43,11 +43,6 @@ matrix:
>             compiler: gcc
>             env: DISTRO=debian:testing
>   
> -        # other builds
> -        - os: linux
> -          env: DISTRO=fedora:latest MAKE_INSTALL=1
> -          compiler: clang
> -
>           - os: linux
>             env: DISTRO=centos:6 TREE=out
>             compiler: gcc
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
