Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D230E25009A
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 17:12:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 904C23C56BE
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 17:12:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 521EA3C12A1
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 17:12:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CB5D61400E45
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 17:12:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 138F2ABCC;
 Mon, 24 Aug 2020 15:12:42 +0000 (UTC)
Date: Mon, 24 Aug 2020 17:12:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200824151210.GA30969@dell5510>
References: <1598250984-5141-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598250984-5141-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] travis: Add centos7 build
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> I have this idea when I meet ALG_SET_AEAD_ASSOCLEN undefined error on centos7.
> Add centos7 travis target, it is more friendly for centos7 user and it is more
> meaningful than centos6.

OK, how about replacing CentOS 6 with CentOS 7?

Kind regards,
Petr

> I have tested this patch on my ltp fork:
> https://travis-ci.org/github/xuyang0410/ltp/jobs/720541105

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  .travis.yml | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/.travis.yml b/.travis.yml
> index e8e3189af..281ec9e96 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -47,6 +47,10 @@ matrix:
>            env: DISTRO=centos:6 TREE=out
>            compiler: gcc

> +        - os: linux
> +          env: DISTRO=centos:7 TREE=out
> +          compiler: gcc
> +
>          - os: linux
>            env: DISTRO=debian:testing
>            compiler: gcc

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
