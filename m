Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5C367073
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 15:48:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D60363C1D0C
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 15:48:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 250743C1C94
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 15:48:50 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1B836604831
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 15:48:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D26CAF47;
 Fri, 12 Jul 2019 13:48:48 +0000 (UTC)
Date: Fri, 12 Jul 2019 15:48:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190712134833.GA21258@dell5510>
References: <20190411233115.32744-1-pvorel@suse.cz>
 <20190411233115.32744-4-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190411233115.32744-4-pvorel@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 3/3] make: Add
 -Werror-implicit-function-declaration for all targets
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
Cc: Sandeep Patil <sspatil@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Previously it was passed only to Android build, but it's good to check
> it for all.

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Tested in travis:
> https://travis-ci.org/pevik/ltp/builds/518886113
> ---
>  include/mk/env_post.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

> diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
> index 913bdf5d1..3ffdd0b7f 100644
> --- a/include/mk/env_post.mk
> +++ b/include/mk/env_post.mk
> @@ -41,11 +41,9 @@ ifeq ($(UCLINUX),1)
>  CPPFLAGS			+= -D__UCLIBC__ -DUCLINUX
>  endif

> -ifeq ($(ANDROID),1)
> -# There are many undeclared functions, it's best not to accidentally overlook
> -# them.
>  CFLAGS				+= -Werror-implicit-function-declaration

> +ifeq ($(ANDROID),1)
>  LDFLAGS				+= -L$(top_builddir)/lib/android_libpthread
>  LDFLAGS				+= -L$(top_builddir)/lib/android_librt
>  endif

Ping, please. Drop it or merge?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
