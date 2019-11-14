Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CE2FC466
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 11:42:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 13DB33C1CA4
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 11:42:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E5D9B3C183D
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 11:42:25 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C797F200B78
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 11:42:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE06FAE15;
 Thu, 14 Nov 2019 10:42:23 +0000 (UTC)
Date: Thu, 14 Nov 2019 11:42:22 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191114104221.GB30308@rei>
References: <51aabb2e4680d830b5ba7b7623e0c7697bcb6338.1573675056.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51aabb2e4680d830b5ba7b7623e0c7697bcb6338.1573675056.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mbind04: terminate child processes
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
> verify_policy() forks a child, which continues to run
> pass end of function and into same loop in verify_mbind()
> as parent, effectively creating fork bomb. With 2 nodes,
> there's 45 forked children. With 4 nodes, 765 processes.
> 
> Terminate child process at the end of verify_policy();

Good catch, thanks for fixing this.

> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/syscalls/mbind/mbind04.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/mbind/mbind04.c b/testcases/kernel/syscalls/mbind/mbind04.c
> index 6a7a2a2321a8..aaad8a988bad 100644
> --- a/testcases/kernel/syscalls/mbind/mbind04.c
> +++ b/testcases/kernel/syscalls/mbind/mbind04.c
> @@ -47,6 +47,7 @@ static void verify_policy(unsigned int node, int mode, unsigned flag)
>  	struct bitmask *bm = numa_allocate_nodemask();
>  	unsigned int i;
>  	void *ptr;
> +	pid_t child;
>  	unsigned long size = PAGES_ALLOCATED * page_size;
>  
>  	numa_bitmask_setbit(bm, node);
> @@ -69,7 +70,8 @@ static void verify_policy(unsigned int node, int mode, unsigned flag)
>  
>  	const char *prefix = "child: ";
>  
> -	if (SAFE_FORK()) {
> +	child = SAFE_FORK();
> +	if (child) {
>  		prefix = "parent: ";
>  		tst_reap_children();
>  	}
> @@ -104,6 +106,9 @@ static void verify_policy(unsigned int node, int mode, unsigned flag)
>  
>  	if (fail)
>  		tst_nodemap_print_counters(nodes);
> +
> +	if (!child)
> +		exit(0);
>  }

I find the name for the variable quite confusing here, because it
suggests that the parent exits here, while the opposite is true. Can we
please just use pid or something less confusing for the variable name?

Other than that it's fine.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
