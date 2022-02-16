Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4344B8B67
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 15:28:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 366DC3CA0A8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 15:28:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 73C5B3C5F90
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 15:28:39 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 45489201083
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 15:28:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FAAC212BB;
 Wed, 16 Feb 2022 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645021718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zgIAkxrDAl+U/qmeNRHWV7tQFMiCZcL6zvjnP28Rn4=;
 b=aiuNHuc8Jee7gJe32nQchjTs3bNtv4WP5mvOicS2tObUOLtMSqujLdk6Wyg3KvT5mr/ZtR
 2yxjVkqjl4YjVtAP4rWNI4TgqLqs4f/Nm7FDevOAOTafMNEaOHitMhV5619ofWFSm0Cti8
 vOFawmP+JcqGtr47SOrORi4vMCwjboI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645021718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zgIAkxrDAl+U/qmeNRHWV7tQFMiCZcL6zvjnP28Rn4=;
 b=RWXfZ0Qeg8wWGqhCWGlP8Yz/L2lYH3gNgUhirBUW9CfBkc8iR06UM5yEzFzZvTci6Kt8V+
 zxGluXINA00+vEDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3936613B24;
 Wed, 16 Feb 2022 14:28:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IMyqDBYKDWJNEgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 16 Feb 2022 14:28:38 +0000
Date: Wed, 16 Feb 2022 15:28:27 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <Yg0KC4UnuzSnjD04@rei>
References: <20220128094653.18500-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128094653.18500-1-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Rewrite sighold02.c using new LTP API
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
Can you please format the documentation comment so that it renders
nicely in asciidoc?

(just install asciidoc and perl/JSON the make in the top level directory
will render docparse/metadata.html)

>  /* _XOPEN_SOURCE disables NSIG */
>  #ifndef NSIG
> -# define NSIG _NSIG
> +#define NSIG _NSIG
>  #endif
>  
>  /* ensure NUMSIGS is defined */
>  #ifndef NUMSIGS
> -# define NUMSIGS NSIG
> +#define NUMSIGS NSIG
>  #endif
>  
> -char *TCID = "sighold02";
> -int TST_TOTAL = 2;
> -
> -static int pid;
> -static void do_child(void);
> -static void setup(void);
> -static void cleanup(void);
> -
>  static int sigs_catched;
>  static int sigs_map[NUMSIGS];
>  
> @@ -88,57 +50,13 @@ static int skip_sig(int sig)
>  	}
>  }
>  
> -int main(int ac, char **av)
> -{
> -	int sig;
> -	int lc;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -#ifdef UCLINUX
> -	maybe_run_child(&do_child, "");
> -#endif
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		if ((pid = FORK_OR_VFORK()) < 0) {
> -			tst_brkm(TBROK | TERRNO, NULL, "fork() failed");
> -		} else if (pid > 0) {
> -			TST_SAFE_CHECKPOINT_WAIT(NULL, 0);
> -
> -			for (sig = 1; sig < NUMSIGS; sig++) {
> -				if (skip_sig(sig))
> -					continue;
> -				SAFE_KILL(NULL, pid, sig);
> -			}
> -
> -			TST_SAFE_CHECKPOINT_WAKE(NULL, 0);
> -			tst_record_childstatus(cleanup, pid);
> -		} else {
> -
> -#ifdef UCLINUX
> -			if (self_exec(av[0], "") < 0) {
> -				tst_brkm(TBROK | TERRNO, NULL,
> -					 "self_exec() failed");
> -			}
> -#else
> -			do_child();
> -#endif
> -		}
> -	}
> -
> -	cleanup();
> -	tst_exit();
> -}
> -
>  static void handle_sigs(int sig)
>  {
>  	sigs_map[sig] = 1;
>  	sigs_catched++;
>  }
>  
> -void do_child(void)
> +static void do_child(void)
>  {
>  	int cnt;
>  	int sig;
> @@ -148,55 +66,60 @@ void do_child(void)
>  		if (skip_sig(sig))
>  			continue;
>  
> -		if (signal(sig, handle_sigs) == SIG_ERR) {
> -			tst_resm(TBROK | TERRNO, "signal() %i(%s) failed",
> -				 sig, tst_strsig(sig));
> -		}
> +		SAFE_SIGNAL(sig, handle_sigs);
>  	}
>  
>  	/* all set up to catch signals, now hold them */

No need to keep comments commeting the obvious like this one.

>  	for (cnt = 0, sig = 1; sig < NUMSIGS; sig++) {
>  		if (skip_sig(sig))
>  			continue;
> +
>  		cnt++;

The cnt is actually unused.

> -		TEST(sighold(sig));
> -		if (TEST_RETURN != 0) {
> -			tst_resm(TBROK | TTERRNO, "sighold() %i(%s) failed",
> -				 sig, tst_strsig(sig));
> -		}
> +
> +		if (sighold(sig))
> +			tst_brk(TBROK, "sighold() %i(%s) failed", sig,
> +				tst_strsig(sig));

Please add | TERRNO to print errno in the case of the failure as well.

Also I woudl have simplified the message just to:

	tst_brk(TBROK | TERRNO, "sighold(%s %i)", tst_strsig(sig), sig);

>  	}
>  
> -	TST_SAFE_CHECKPOINT_WAKE_AND_WAIT(NULL, 0);
> +	TST_CHECKPOINT_WAKE_AND_WAIT(0);
>  
>  	if (!sigs_catched) {
> -		tst_resm(TPASS, "All signals were hold");
> -		tst_exit();
> +		tst_res(TPASS, "all signals were hold");
> +	} else {
> +		tst_res(TFAIL, "signal handler was executed");
> +
> +		for (sig = 1; sig < NUMSIGS; sig++)
> +			if (sigs_map[sig])
> +				tst_res(TINFO, "Signal %i(%s) catched", sig,
> +					tst_strsig(sig));
>  	}


We can get rid of the else and make the code nices by doing return in
the if as:

	if (!sigs_caught) {
		tst_res(TPASS, ...)
		return;
	}

	tst_res(TFAIL, ...);

	for (...)

> +}
>  
> -	tst_resm(TFAIL, "Signal handler was executed");
> +static void run(void)
> +{
> +	pid_t pid_child;
> +	int signal;
>  
> -	for (sig = 1; sig < NUMSIGS; sig++) {
> -		if (sigs_map[sig]) {
> -			tst_resm(TINFO, "Signal %i(%s) catched",
> -			         sig, tst_strsig(sig));
> -		}
> +	pid_child = SAFE_FORK();
> +	if (!pid_child) {
> +		do_child();
> +		return;
>  	}
>  
> -	tst_exit();
> -}
> -
> -static void setup(void)
> -{
> -	tst_sig(FORK, DEF_HANDLER, NULL);
> +	TST_CHECKPOINT_WAIT(0);
>  
> -	tst_tmpdir();
> +	for (signal = 1; signal < NUMSIGS; signal++) {
> +		if (skip_sig(signal))
> +			continue;
>  
> -	TST_CHECKPOINT_INIT(tst_rmdir);
> +		SAFE_KILL(pid_child, signal);
> +	}
>  
> -	TEST_PAUSE;
> +	TST_CHECKPOINT_WAKE(0);
>  }
>  
> -static void cleanup(void)
> -{
> -	tst_rmdir();
> -}
> +static struct tst_test test = {
> +	.test_all = run,
> +	.forks_child = 1,
> +	.needs_checkpoints = 1,
> +};
> -- 
> 2.34.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
