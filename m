Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 876FE3CF9FB
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:01:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEA3E3C81A5
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:01:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E04E73C2174
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:01:06 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 504A51400DE5
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:01:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B63222472;
 Tue, 20 Jul 2021 13:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626786065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=igoxvEcKTWX7quSgzhhcTcIIAkv3Kh/GYz+dg8Rgu4M=;
 b=2yLzW4oK5vuALtlLqKUWKfrPq7HCVipGxQY6ABRrV07YyTS4VpU+tFpmsj4wf3P7O7Mg8o
 r8jp3VBWv8aLmilVHp5Gj4DdhHZBPDqW+7I6t17ILLYYq22nkr/ORXV00q0guVoIroUxzi
 U184QvBgZRCYFoZVYmurb947TtLDkh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626786065;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=igoxvEcKTWX7quSgzhhcTcIIAkv3Kh/GYz+dg8Rgu4M=;
 b=aXkb/YtorGR73NGrPDsI/Doj2zNKI/LTVqm1qIkD5ubwUP2jpKxX/wYZ1pRamEz/0y86K9
 sF+yoRw2RQS1GWDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58EFF13D68;
 Tue, 20 Jul 2021 13:01:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k/kcFRHJ9mBdcQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 20 Jul 2021 13:01:05 +0000
Date: Tue, 20 Jul 2021 14:35:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YPbDGQ3vIRpF87vD@yuki>
References: <20210712162208.2396-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712162208.2396-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] userns08,
 CVE-2018-18955: Broken id mappings in nested namespaces
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
> +#include "tst_test.h"
> +#include "tst_clone.h"
> +#include "lapi/clone.h"
> +#include "tst_safe_file_at.h"
> +
> +static pid_t clone_newuser(void)
> +{
> +	const struct tst_clone_args cargs = {
> +		CLONE_NEWUSER,
> +		SIGCHLD };

I would have put the closing curly brace on a separate line here, but
that is very minor.

> +	return SAFE_CLONE(&cargs);
> +}
> +
> +static void write_mapping(const pid_t proc_in_ns,
> +			  const char *const id_mapping)
> +{
> +	char proc_path[PATH_MAX];
> +	int proc_dir;
> +
> +	sprintf(proc_path, "/proc/%d", (int)proc_in_ns);
> +	proc_dir = SAFE_OPEN(proc_path, O_DIRECTORY);
> +
> +	TEST(faccessat(proc_dir, "uid_map", F_OK, 0));
> +	if (TST_RET && TST_ERR == ENOENT)
> +		tst_brk(TCONF, "No uid_map file; interface was added in v3.5");
> +
> +	SAFE_FILE_PRINTFAT(proc_dir, "setgroups", "%s", "deny");
> +	SAFE_FILE_PRINTFAT(proc_dir, "uid_map", "%s", id_mapping);
> +	SAFE_FILE_PRINTFAT(proc_dir, "gid_map", "%s", id_mapping);
> +
> +	SAFE_CLOSE(proc_dir);
> +}
> +
> +static void ns_level2(void)
> +{
> +	if (prctl(PR_SET_DUMPABLE, 1, 0, 0, 0))
> +		tst_res(TINFO | TERRNO, "Failed to set dumpable flag");
> +	TST_CHECKPOINT_WAKE(20);
> +	TST_CHECKPOINT_WAIT(21);

We do have TST_CHECKPOINT_WAKE_AND_WAIT() especially for this purpose.

Also the id passed to checkpoints is really offset to a memory, so it
makes sense to allocate them starting at 0 and increase by one.

It's not a big problem as long as the numbers are small enough, we have
nearly whole page for checkpoints, so everything should work fine as
long as the numbers are less than 1000 at the moment, but it may become
one if we attempt to stuff more test library stuff into the shared page
later on.

> +	TST_EXP_FAIL(open("restricted", O_WRONLY), EACCES,
> +		     "Denied write access to ./restricted");
> +
> +	exit(0);
> +}
> +
> +static void ns_level1(void)
> +{
> +	const char *const map_over_5 = "0 0 1\n1 1 1\n2 2 1\n3 3 1\n4 4 1\n5 5 990";
> +	pid_t level2_proc;
> +
> +	TST_CHECKPOINT_WAIT(10);
> +
> +	SAFE_SETGID(0);
> +	SAFE_SETUID(0);
> +
> +	level2_proc = clone_newuser();
> +	if (!level2_proc)
> +		ns_level2();
> +
> +	TST_CHECKPOINT_WAIT(20);
> +
> +	write_mapping(level2_proc, map_over_5);
> +
> +	TST_CHECKPOINT_WAKE(21);
> +	tst_reap_children();
> +
> +	exit(0);
> +}
> +
> +static void run(void)
> +{
> +	pid_t level1_proc;
> +
> +	SAFE_SETEGID(100000);
> +	SAFE_SETEUID(100000);
> +
> +	level1_proc = clone_newuser();
> +	if (!level1_proc)
> +		ns_level1();
> +
> +	SAFE_SETEGID(0);
> +	SAFE_SETEUID(0);
> +
> +	write_mapping(level1_proc, "0 100000 1000");
> +
> +	TST_CHECKPOINT_WAKE(10);
> +	tst_reap_children();
> +}
> +
> +static void setup(void)
> +{
> +	int fd = SAFE_OPEN("restricted", O_CREAT, 0700);
                                          ^
					  huh no |O_WRONLY?

> +	SAFE_WRITE(fd, 1, "\n", 1);
> +	SAFE_CLOSE(fd);
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test_all = run,
> +	.needs_checkpoints = 1,
> +	.needs_tmpdir = 1,
> +	.needs_root = 1,
> +	.forks_child = 1,
> +	.needs_kconfigs = (const char *[]) {
> +		"CONFIG_USER_NS",
> +		NULL
> +	},
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "d2f007dbe7e4"},
> +		{"CVE", "CVE-2018-18955"},
> +		{}
> +	},
> +};
> -- 
> 2.31.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
