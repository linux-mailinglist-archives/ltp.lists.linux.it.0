Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 699212DD16E
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 13:21:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35DB03C57D0
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 13:21:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6AC233C57C7
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 13:21:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EFA49200B2D
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 13:21:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E563ACF9
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 12:21:33 +0000 (UTC)
Date: Thu, 17 Dec 2020 13:22:31 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <X9tNhwYzPyXpOEfx@yuki.lan>
References: <20201217121520.25713-1-pvorel@suse.cz>
 <20201217121520.25713-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217121520.25713-3-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] docparse/parse.sh: Fix running with relative
 path
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> that's not needed for build, but useful for debugging.
> 
> Running as ./parse.sh fails:
> cat: ./../VERSION: No such file or directory
> 
> top_srcdir must be absolute path.
> 
> Fixes: a069cd36b ("docparse: Add test documentation parser")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  docparse/parse.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docparse/parse.sh b/docparse/parse.sh
> index 172eab702..79011bc10 100755
> --- a/docparse/parse.sh
> +++ b/docparse/parse.sh
> @@ -5,7 +5,7 @@
>  set -e
>  
>  top_builddir=$PWD/..
> -top_srcdir="$(dirname $0)/.."
> +top_srcdir="$(cd $(dirname $0)/..; pwd)"
>  
>  cd $top_srcdir

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
