Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D51398762F
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 11:33:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 970523C1D00
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 11:33:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C6F273C136E
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 11:33:58 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 500F42005C3
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 11:33:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4C88CAC45;
 Fri,  9 Aug 2019 09:33:56 +0000 (UTC)
Date: Fri, 9 Aug 2019 11:33:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190809093354.GA13178@rei.lan>
References: <20190806164523.557-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806164523.557-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/4] build: Move
 -Werror-implicit-function-declaration from make to build.sh
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
> Previously it was passed only to Android build. Generally Werror flags
> should be on for development but disabled for releases and production.
> We don't have any configure flag stating development build, so using it
> in build.sh should be sufficient as it can be used in both Travis CI
> builds and local development.
> 
> + respect CC variable in build.sh (for these lazy to pass it via -c flag)
> 
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Change v2->v3:
> * move flag to build.sh, so it can be reused for local development
> * respect CC
> 
>  build.sh               | 4 +++-
>  include/mk/env_post.mk | 4 ----
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/build.sh b/build.sh
> index 3da2adf55..78845bf95 100755
> --- a/build.sh
> +++ b/build.sh
> @@ -9,6 +9,9 @@
>  
>  set -e
>  
> +CFLAGS="${CFLAGS:--Werror-implicit-function-declaration}"

Shouldn't this be -Werror=implicit-function-declaration ?

Hmm, looks like both variants actually work, but the gcc manual speaks
only about -Werror= one.


Otherwise it looks good, acked.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
