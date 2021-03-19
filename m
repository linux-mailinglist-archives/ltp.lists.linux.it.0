Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A27341837
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:28:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8B6A3C6087
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:28:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DC3CC3C5FBB
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:28:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 53C8520103E
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:28:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B336EAE05;
 Fri, 19 Mar 2021 09:28:12 +0000 (UTC)
Date: Fri, 19 Mar 2021 10:30:07 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YFRvH6y+vwosiWfh@yuki.lan>
References: <20210318181641.2062-1-pvorel@suse.cz>
 <20210318181641.2062-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318181641.2062-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] doc: Document test tags
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
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> + add URL for checkpatch.pl script and slightly reword related text.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  doc/test-writing-guidelines.txt | 62 +++++++++++++++++++++++++++++----
>  1 file changed, 56 insertions(+), 6 deletions(-)
> 
> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
> index 50696e14a..16715b841 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -47,10 +47,12 @@ LTP adopted Linux kernel coding style. If you aren't familiar with its rules
>  locate 'linux/Documentation/CodingStyle' in the kernel sources and read it,
>  it's a well written introduction.
>  
> -There is also a checkpatch (see 'linux/scripts/checkpatch.pl') script that can
> -be used to check your patches before the submission.
> +There is also
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl[checkpatch.pl]
> +script from kernel git tree which can be used to check your patches before the
> +submission.  Please use reasonably recent one.
>  
> -NOTE: If checkpatch does not report any problems, the code still may be wrong
> +NOTE: If checkpatch.pl does not report any problems, the code still may be wrong
>        as the tool only looks for common mistakes.
>  
>  1.3.2 Shell coding style
> @@ -2213,6 +2215,53 @@ struct tst_test test = {
>  Some tests require more than specific number of CPU. It can be defined with
>  `.min_cpus = N`.
>  
> +2.2.38 Test tags
> +^^^^^^^^^^^^^^^^
> +
> +Test tags are name-value pairs that can hold any test metadata.
> +
> +We have additional support for CVE entries, or git commit in mainline kernel,
                                               ^        ^
					       |      commits?
					       |
					       This or should probably
					       be removed since we have
					       another one later in the
					       sentence.

> +stable kernel or glibc git repository.  If a test is a regression test it
> +should include these tags.  They are printed when test fails and added in
> +docparse documentation.
   ^
   Not sure if we should name it docparse, maybe just "... and exported
   into documentation."

> +CVE, mainline and stable kernel git commits in a regression test for a kernel bug:
> +[source,c]
> +-------------------------------------------------------------------------------
> +struct tst_test test = {
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "9392a27d88b9"},
> +		{"linux-git", "ff002b30181d"},
> +		{"linux-stable-git", "c4a23c852e80"},
> +		{"CVE", "2020-29373"},
> +		{}
> +	}
> +};
> +-------------------------------------------------------------------------------
> +
> +Glibc git commit in a regression test for a glibc bug:
> +[source,c]
> +-------------------------------------------------------------------------------
> +struct tst_test test = {
> +	...
> +	.tags = (const struct tst_tag[]) {
> +		{"glibc-git", "574500a108be"},
> +		{}
> +	}
> +};
> +-------------------------------------------------------------------------------
> +
> +[source,c]
> +-------------------------------------------------------------------------------
> +struct tst_test test = {
> +	...
> +	.tags = (const struct tst_tag[]) {
> +		{"glibc-git", "574500a108be"},
> +		{}
> +	}
> +};
> +-------------------------------------------------------------------------------
> +
>  2.3 Writing a testcase in shell
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> @@ -3005,10 +3054,11 @@ skips 'atexit(3)' callbacks.
>  4. Test Contribution Checklist
>  ------------------------------
>  
> -1. Test compiles and runs fine (check with -i 10 too)
> -2. Checkpatch does not report any errors
> +1. Test compiles and runs fine (check with `-i 10` too)
> +2. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl[checkpatch.pl]
> +   does not report any errors
>  3. The runtest entires are in place
> -4. Test files are added into corresponding .gitignore files
> +4. Test files are added into corresponding '.gitignore' files
           ^
	   Can we fix this to say binaries since we are fixing things?

>  5. Patches apply over the latest git

Here as well, looks great minus the few minor things.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
