Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C862E277003
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 13:33:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94D643C4D55
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 13:33:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 475C13C28E3
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 13:33:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E0EAC600041
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 13:33:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0EDF7ACD0;
 Thu, 24 Sep 2020 11:33:49 +0000 (UTC)
Date: Thu, 24 Sep 2020 13:33:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20200924113347.GA12565@dell5510>
References: <20200924111124.5666-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924111124.5666-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_cgroup: Don't try to use V2 if V1 controllers
 are mounted
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
Cc: pvorel@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

> It is not possible to use a controller in V2 cgroups if it has been
> mounted as a V1 controller. So if V1 is mounted we use it regardless
> of if V2 is available.

> We have to include a space in tst_is_mounted so that we do not match
> cgroup2.

Acked-by: Petr Vorel <pvorel@suse.cz>

Thanks for your fix.

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  lib/tst_cgroup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index ba413d874..73ddd4b82 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -44,7 +44,7 @@ enum tst_cgroup_ver tst_cgroup_version(void)
>          enum tst_cgroup_ver cg_ver;

>          if (tst_cgroup_check("cgroup2")) {
> -                if (!tst_is_mounted("cgroup2") && tst_is_mounted("cgroup"))
> +                if (tst_is_mounted("cgroup "))
On first look the space looks like typo. But people can use git blame.

>                          cg_ver = TST_CGROUP_V1;
>                  else
>                          cg_ver = TST_CGROUP_V2;

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
