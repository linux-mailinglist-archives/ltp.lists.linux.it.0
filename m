Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E40A425F0
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2025 16:16:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C5503C9A3C
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2025 16:16:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2876C3C990A
 for <ltp@lists.linux.it>; Mon, 24 Feb 2025 16:16:29 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8046A20007A
 for <ltp@lists.linux.it>; Mon, 24 Feb 2025 16:16:28 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D029D21170;
 Mon, 24 Feb 2025 15:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1740410187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UPjCeUlMDX73qeljM4hvP2yk7T2PTC2BkFO/0wLKMQU=;
 b=itD+KrHiX+qyqJGd9b0pjZy7HX2eKEw5hX34ZWZ4K8DA91qNfRQK+yWuF2796ikNm7kvDZ
 FQWfvQ3vRoV6B+Q2z3V0eqs0NKfsIfXkwF+twb5ldbIGTJA7GZZsgeFwIvgd/6v8XnmNw3
 FvJfwqi3ZbtAIeYdaeDkN4ugtLPH79U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1740410187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UPjCeUlMDX73qeljM4hvP2yk7T2PTC2BkFO/0wLKMQU=;
 b=s3Cj2W23BtEiz/xIQQz0T8/aO62GfwttISUitFeJHSD+NLfbSk/dgAMtQW3OC4Aj0DqyiQ
 UTFs5dquyghpmNCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1740410186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UPjCeUlMDX73qeljM4hvP2yk7T2PTC2BkFO/0wLKMQU=;
 b=u4WpGMz764E6SthKLOtkyd946DPUj1jhfE83x6wNxqgIqZwRdMtZ4rDa1u8v0ZNtoAZFAl
 ux1cZax0Ikc/V0JF2Mz5U83vHnx3NIxN+Ktdkh8vp84zPJrDJhcwdqHeGILiUuPWyRTQl1
 M4OoXkQdvuVraqRgAScXixhAuSs8YC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1740410186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UPjCeUlMDX73qeljM4hvP2yk7T2PTC2BkFO/0wLKMQU=;
 b=jbzfIu14TDdIGLlkMSh4f1RMUKFQhKOtZwIcEz/GuZu/37P2q678pHBBvHYaz9JB6F61rg
 CDLCX4AjbHFoazDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C148213332;
 Mon, 24 Feb 2025 15:16:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JTZRLkqNvGd+VwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 24 Feb 2025 15:16:26 +0000
Date: Mon, 24 Feb 2025 16:16:37 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Z7yNVQAnQ5NPTtaz@yuki.lan>
References: <20250224100016.2857704-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224100016.2857704-1-pvorel@suse.cz>
X-Spam-Score: -7.06
X-Spamd-Result: default: False [-7.06 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUBJECT_HAS_CURRENCY(1.00)[];
 NEURAL_HAM_LONG(-0.76)[-0.759];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] tst_test: Add $LTP_SINGLE_ITERATION to limit
 variant
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
>  	lib_pid = getpid();
>  	tst_test = self;
> @@ -1899,7 +1901,6 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
>  
>  	tst_res(TINFO, "LTP version: "LTP_VERSION);
>  
> -
>  	uname(&uval);
>  	tst_res(TINFO, "Tested kernel: %s %s %s", uval.release, uval.version, uval.machine);
>  
> @@ -1908,10 +1909,20 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
>  
>  	set_overall_timeout();
>  
> -	if (tst_test->test_variants)
> +	if (tst_test->test_variants) {
>  		test_variants = tst_test->test_variants;
> +		only_variant = getenv("LTP_SINGLE_VARIANT");
> +		if (only_variant && only_variant[0] != '\0') {
> +			tst_variant = MIN(SAFE_STRTOL((char *)only_variant, 0, INT_MAX),
> +							  test_variants - 1);
> +			tst_res(TINFO, "WARNING: testing only variant %d of %d",
> +					tst_variant, test_variants - 1);
> +			test_variants = tst_variant + 1;
> +		}
> +	}
> +
> +	for (; tst_variant < test_variants; tst_variant++) {
>  
> -	for (tst_variant = 0; tst_variant < test_variants; tst_variant++) {
>  		if (tst_test->all_filesystems || count_fs_descs() > 1)
>  			ret |= run_tcases_per_fs();
>  		else

Can we instead add a function that would set two integer variables,
first_variant and last variant as:

static void setup_variants(unsigned int *first_variant, unsigned int *last_variant)
{
	//setup the defaults and parse the variables here
}

And the we can do:

diff --git a/lib/tst_test.c b/lib/tst_test.c
index e2803f04a..d19fe9aba 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1885,7 +1885,7 @@ unsigned int tst_variant;
 void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
 {
        int ret = 0;
-       unsigned int test_variants = 1;
+       unsigned int first_variant, last_variant;
        struct utsname uval;

        lib_pid = getpid();
@@ -1908,10 +1908,9 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)

        set_overall_timeout();

-       if (tst_test->test_variants)
-               test_variants = tst_test->test_variants;
+       setup_variants(&first_variant, &last_variant);

-       for (tst_variant = 0; tst_variant < test_variants; tst_variant++) {
+       for (tst_variant = first_variant; tst_variant <= last_variant; tst_variant++) {
                if (tst_test->all_filesystems || count_fs_descs() > 1)
                        ret |= run_tcases_per_fs();
                else
diff --git a/testcases/kernel/syscalls/pause/pause01.c b/testcases/kernel/syscalls/pause/pause01.c
index adce0ddcf..74a7e514e 100644
--- a/testcases/kernel/syscalls/pause/pause01.c
+++ b/testcases/kernel/syscalls/pause/pause01.c
@@ -20,6 +20,8 @@ static void do_child(void)
        SAFE_SIGNAL(SIGINT, sig_handler);
        TST_EXP_FAIL(pause(), EINTR);
        TST_CHECKPOINT_WAKE(0);
+
+       tst_res(TPASS, "Process resumed from pause()");
 }

 static void run(void)


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
