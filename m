Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 869706D6312
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Apr 2023 15:36:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3C423CAD4B
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Apr 2023 15:36:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B33CE3C98FB
 for <ltp@lists.linux.it>; Tue,  4 Apr 2023 15:36:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0E4DF600693
 for <ltp@lists.linux.it>; Tue,  4 Apr 2023 15:36:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4CF7F22B1E;
 Tue,  4 Apr 2023 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1680615412;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xY/T00c/+UKh5R4TJ8JSCHEQaTmC3bkgQfoEB+5KH9A=;
 b=my3PgxqKd6/xghcbr7KGiMiJuupP/dCDAvRzT89KNa/syYz0LQHqoK3lLP1GyCNwqXmOzL
 HLP98O2Q/k5wCiMCJO4FlBknid02t8MT+WP61Hm546zeB05VRQEzWGK04whrdVmxPyl+mU
 5uH5z0e4fxGZFqawfaijmapE+61tmvo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1680615412;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xY/T00c/+UKh5R4TJ8JSCHEQaTmC3bkgQfoEB+5KH9A=;
 b=sgJHbpAdATzJkGlB5ZDuLYj2P3StAMezSuEGh2V4oE9RDiqUxuQj+eRm+DrFMC4F5GzaBV
 oRQk2FFYOqbuFWAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D2C01391A;
 Tue,  4 Apr 2023 13:36:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +C1UCfQnLGQhSQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 04 Apr 2023 13:36:52 +0000
Date: Tue, 4 Apr 2023 15:36:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Hao Zeng <zenghao@kylinos.cn>
Message-ID: <20230404133650.GA1283114@pevik>
References: <20230404022808.925841-1-zenghao@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404022808.925841-1-zenghao@kylinos.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] testcases:Fix the failure of shell script to get
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> For example, in the file testcases/kernel/controllers/cpuset/cpuset_funcs.sh, if the path is obtained by
> find "$CPUSET" -type d | sort | sed -n '2,$p' | tac | while read subdir, the escaped characters will be lost,
> and by adding the -r option, the escaped characters will be kept as they are without escaping
> The errors are as follows:
> /opt/ltp/testcases/bin/cpuset_funcs.sh:line178: /dev/cpuset/machine.slice/machine-qemux2d157x2dzhx2dsxf.scope/vcpu7/tasks: The file or directory is not available

Could you print the path how it looks like with ls:

ls -l /dev/cpuset/machine.slice/

FYI cgroup tests written in shell are broken by design, we write new tests in C.
Not sure if these old tests are relevant enough to be rewritten into C.

...
> +++ b/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
> @@ -312,7 +312,7 @@ generate_locate_test_makefile buildonly '.test' "$buildonly_compiler_args"
>  generate_locate_test_makefile runnable '.run-test'
>  generate_locate_test_makefile test-tools ''

> -find . -name Makefile.1 -exec dirname {} \; | while read dir; do
> +find . -name Makefile.1 -exec dirname {} \; | while read -r dir; do
I don't think it's needed for open posix.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
