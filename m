Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 137AC54F890
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jun 2022 15:50:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9AC43C884D
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jun 2022 15:50:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 181DE3C72A0
 for <ltp@lists.linux.it>; Fri, 17 Jun 2022 15:50:44 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6C1F4200D34
 for <ltp@lists.linux.it>; Fri, 17 Jun 2022 15:50:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AACEB1FDD6;
 Fri, 17 Jun 2022 13:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655473843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eE+RTDwSw9aQTtfHrsThw+50yvif8ycrAYvuisQZboE=;
 b=qUlqEZpJnXlXFhADp95TyIyLRsp2w8y89EtjggDezOhepXe9cW9FQ2ItlgMBEan+4yemcY
 DtUdP044dsg+o3ss5LcAsI41I1pD7r7n3Tv1V0d5fHisyl5BT7HmPBZenY84mEzNHZJ8ow
 4C7rW0KP28NHBT57nWDhZhdPildLUQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655473843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eE+RTDwSw9aQTtfHrsThw+50yvif8ycrAYvuisQZboE=;
 b=EnN3dxAHh2sSYNwClGqb4wZQnfSmo9Ss+eV6n/SVlUKWlTVXYKZ3U2tZGpyS8IRkbbvVOD
 z4S80zDUAH8IWgCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5A2D13458;
 Fri, 17 Jun 2022 13:50:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bmZnL7KGrGI6HgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 17 Jun 2022 13:50:42 +0000
Date: Fri, 17 Jun 2022 15:52:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YqyHNFkJdC0q2Vxs@yuki>
References: <20220609214223.4608-1-pvorel@suse.cz>
 <20220609214223.4608-6-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609214223.4608-6-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/9] tst_test.sh: Add $TST_ALL_FILESYSTEMS
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
Cc: linux-nfs@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +_tst_run_iterations()
> +{
> +	local _tst_i=$TST_ITERATIONS
>  
> -	if [ "$TST_MOUNT_DEVICE" = 1 ]; then
> -		tst_mount
> -		TST_MOUNT_FLAG=1
> -	fi
> +	[ "$TST_NEEDS_TMPDIR" = 1 ] && cd "$TST_TMPDIR"
>  
> -	[ -n "$TST_NEEDS_CHECKPOINTS" ] && _tst_init_checkpoints
> +	_tst_setup_timer
>  
>  	if [ -n "$TST_SETUP" ]; then
>  		if command -v $TST_SETUP >/dev/null 2>/dev/null; then
> @@ -724,7 +741,7 @@ tst_run()
>  	fi
>  
>  	#TODO check that test reports some results for each test function call
> -	while [ $TST_ITERATIONS -gt 0 ]; do
> +	while [ $_tst_i -gt 0 ]; do
>  		if [ -n "$TST_TEST_DATA" ]; then
>  			tst_require_cmds cut tr wc
>  			_tst_max=$(( $(echo $TST_TEST_DATA | tr -cd "$TST_TEST_DATA_IFS" | wc -c) +1))
> @@ -735,9 +752,22 @@ tst_run()
>  		else
>  			_tst_run_tests
>  		fi
> -		TST_ITERATIONS=$((TST_ITERATIONS-1))
> +		_tst_i=$((_tst_i-1))
>  	done
> -	_tst_do_exit
> +
> +	if [ -n "$TST_DO_CLEANUP" -a -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
> +		if command -v $TST_CLEANUP >/dev/null 2>/dev/null; then
> +			$TST_CLEANUP
> +		else
> +			tst_res TWARN "TST_CLEANUP=$TST_CLEANUP declared, but function not defined (or cmd not found)"
> +		fi
> +	fi
> +
> +	if [ "$TST_MOUNT_FLAG" = 1 ]; then
> +		tst_umount
> +	fi
> +
> +	_tst_cleanup_timer

Generally the code looks good, there is still a minor difference between
C API and this changes though. As we do call the _tst_cleanup_timer at
the end of this function the script runs without a timeout for a short
while (which includes tst_mkfs call).

I guess that instead of stopping the timer at the end of the
_tst_run_iterations() we can simply reset it (on the top of this patch):

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index d96ce3448..f5af4c214 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -50,6 +50,8 @@ _tst_do_exit()
                rm $LTP_IPC_PATH
        fi

+       _tst_cleanup_timer
+
        if [ $TST_FAIL -gt 0 ]; then
                ret=$((ret|1))
        fi
@@ -552,6 +554,12 @@ _tst_setup_timer()
        done
 }

+_tst_reset_timer()
+{
+       _tst_cleanup_timer
+       _tst_setup_timer
+}
+
 tst_require_root()
 {
        if [ "$(id -ru)" != 0 ]; then
@@ -665,6 +673,8 @@ tst_run()
                tst_brk TBROK "Number of iterations (-i) must be >= 0"
        fi

+       _tst_setup_timer
+
        [ "$TST_NEEDS_ROOT" = 1 ] && tst_require_root

        [ "$TST_DISABLE_APPARMOR" = 1 ] && tst_disable_apparmor
@@ -729,8 +739,6 @@ _tst_run_iterations()

        [ "$TST_NEEDS_TMPDIR" = 1 ] && cd "$TST_TMPDIR"

-       _tst_setup_timer
-
        if [ -n "$TST_SETUP" ]; then
                if command -v $TST_SETUP >/dev/null 2>/dev/null; then
                        TST_DO_CLEANUP=1
@@ -767,7 +775,7 @@ _tst_run_iterations()
                tst_umount
        fi

-       _tst_cleanup_timer
+       _tst_reset_timer
 }


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
