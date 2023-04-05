Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC1A6D7A70
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Apr 2023 12:54:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D4BA3CC77F
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Apr 2023 12:54:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F14C73C18B6
 for <ltp@lists.linux.it>; Wed,  5 Apr 2023 12:54:19 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E9CA660087F
 for <ltp@lists.linux.it>; Wed,  5 Apr 2023 12:54:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A58FC21F5A;
 Wed,  5 Apr 2023 10:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1680692057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TCUyGFqSo6d4O1Fa2luAAd6pHwa3LGW76XvOOx8ZD08=;
 b=iSJYTPZo0BvquEL/SaitqWRsfCml5m3zhQx5Bm4MuY39D+XAlQ7uaHKiOvIsKOr/l6jiB4
 btNL7p/dLBUEhRwwLEYhdreC/vgLThGLUFvJ1gnHkTOfurfQneZoz7XippYZvxK8BkPW6D
 2S3Klfmbu0CGKyuXFl/Brx2J3heNS3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1680692057;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TCUyGFqSo6d4O1Fa2luAAd6pHwa3LGW76XvOOx8ZD08=;
 b=Rqbt6G705MVoXQJxTPCVv7xNptorv0iWbWATbXCm1NHIyqVk2cyOTgtLGWgcoRgkb+q5Lg
 zh9G0z7cqPOqo/Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93BB013A10;
 Wed,  5 Apr 2023 10:54:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FZ0uI1lTLWTfEQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 05 Apr 2023 10:54:17 +0000
Date: Wed, 5 Apr 2023 12:55:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <ZC1ToUKUUSG7s6S/@yuki>
References: <20230404054448.23095-1-akumar@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404054448.23095-1-akumar@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] getpgid01.c: Rewrite using new LTP API
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
> +	pid_1 = SAFE_FORK();
> +	if (!pid_1) {
> +		child_pid = getpid();
> +		ppid = getppid();
>  
> -		if ((pgid_0 = FORK_OR_VFORK()) == -1)
> -			tst_brkm(TBROK, cleanup, "fork failed");
> -		if (pgid_0 > 0) {
> -			while ((pgid_0 = wait(&ex_stat)) != -1) ;
> +		tst_res(TINFO, "getpid() in child = %d", child_pid);
> +		tst_res(TINFO, "getppid() in child = %d", ppid);
> +		tst_res(TINFO, "Running getpgid() in child");
>  
> -			if (WEXITSTATUS(ex_stat) == 0)
> -				tst_resm(TPASS, "%s PASSED", TCID);
> -			else
> -				tst_resm(TFAIL, "%s FAILED", TCID);
> +		TST_EXP_POSITIVE(getpgid(0));
> +		TST_EXP_EQ_LI(TST_RET, ppid);

I do not think that this is correct, the previous code compared the
return value from getpgid(0) against the rest, not parent pid.

I guess that the best solution here would be to call getgid() in the
parent and save that to a variable and use that for the comparsion in
the child.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
