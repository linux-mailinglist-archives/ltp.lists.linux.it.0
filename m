Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B64C22D731D
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 10:53:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 532C83C61BA
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 10:53:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EEB753C5865
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 10:53:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 590E9600C73
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 10:53:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1ACCAC10;
 Fri, 11 Dec 2020 09:53:35 +0000 (UTC)
Date: Fri, 11 Dec 2020 10:54:31 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Message-ID: <X9NB12pkaskYs8+l@yuki.lan>
References: <20201211094416.26616-1-bogdan.lezhepekov@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211094416.26616-1-bogdan.lezhepekov@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] openposix/fork/7-1.c: A bug fix
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
> The function output interferes with the variable errno, that leads to
> the false positive result on limited test setups. The issue fixed.
> 
> Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
> ---
>  .../open_posix_testsuite/conformance/interfaces/fork/7-1.c    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
> index c3db90c00..4249d713d 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
> @@ -53,12 +53,14 @@ static void read_catalog(nl_catd cat, char *who)
>  {
>  	char *msg = NULL;
>  	int i, j;
> -	errno = 0;
>  
>  #if VERBOSE > 0
>  	output("Reading the message catalog from %s...\n", who);
>  #endif
>  
> +	/* the output function interferes with errno */ 
> +	errno = 0;
> +
>  	for (i = 1; i <= 2; i++) {
>  		for (j = 1; j <= 2; j++) {

This is obviously correct, but I would avoid adding the comment, it's
kind of obvious that anything that calls to libc may and will interfere
with errno.

Also the first line of the commit description could be a bit more
description, half of the commits pushed to LTP are bugfixes. So maybe
something as:

openposix/fork/7-1.c: Clear errno correctly

...

I can push the patch with these changes if it's okay with you.


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
