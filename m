Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 23422FDA4E
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 11:03:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4F713C237F
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 11:03:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B1C123C234D
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 11:03:23 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E24B1200048
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 11:03:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 34388B232;
 Fri, 15 Nov 2019 10:03:22 +0000 (UTC)
Date: Fri, 15 Nov 2019 11:03:21 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Dylan Chung <dylan@andestech.com>
Message-ID: <20191115100321.GB18488@rei.lan>
References: <20191115052906.2643-1-dylan@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115052906.2643-1-dylan@andestech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pan/ltp-pan.c: Add file parsing protection
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
Cc: alankao@andestech.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> A segmentation fault occurs given the wrong format in test cases file.
> for example:
>     name  command line
>     ----- -----------------
>     dio10 diotest4 -b 65536    (O)
>     dio10                      (X)
>     dio10    diotest4 -b 65536 (X)
> This patch adds protection and print warning when the command part
> of the tests is empty or multiple whitespaces.

And the expected action here is that we return empty collection when the
file is wrongly formatted and ltp-pan aborts, right?

You should probably write something along these lines here as well.

> Signed-off-by: Dylan Chung <dylan@andestech.com>
> ---
>  pan/ltp-pan.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/pan/ltp-pan.c b/pan/ltp-pan.c
> index 8ac484ec6..470bcbfc5 100644
> --- a/pan/ltp-pan.c
> +++ b/pan/ltp-pan.c
> @@ -1200,6 +1200,14 @@ static struct collection *get_collection(char *file, int optind, int argc,
>  				n->pcnt_f[1] = 's';
>  			}
>  			n->name = strdup(strsep(&a, " \t"));
> +			while (a != NULL && isspace(*a))
> +				a++;
> +			if (a == NULL || strlen(a) == 0) {
                                           ^
					   Maybe just || a[0] == 0 there is
					   no point in using strlen for
					   checking for empty string...
> +				fprintf(stderr,
> +					"pan(%s): Testcase '%s' requires a command to execute.\n",
> +					panname, n->name);
> +				return 0;
                                       ^
				       This should be NULL
> +			}
>  			n->cmdline = strdup(a);
>  			n->next = NULL;

Otherwise it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
