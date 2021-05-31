Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EC9395B23
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:15:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0FFA73C80A5
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:15:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F18E3C187D
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:15:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 41A2D6009F9
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:15:27 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 677652191F;
 Mon, 31 May 2021 13:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622466927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5qkeK34KHSOy3pij0u8RZIeeVWHnBMPFWTEIRo7WoZg=;
 b=dhzEvSNW/nc5rsQu+T84AH3tUfSvX00k/tIRbJUWKgTFZVQlMVLQSMMC09abPoZa0VIkGP
 pZbN2DwqeLSKmTFbusFnJk5itkhsCHJg748SpI7o8Z4O+WvOglyqbb04QTVNIzH0UNG9/L
 BTaX+NKYl9CROLO6Y6ghNNTIRXnNb7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622466927;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5qkeK34KHSOy3pij0u8RZIeeVWHnBMPFWTEIRo7WoZg=;
 b=e6QJM+IAwv0MAtZwP9BXcKwO2EyFtBQ1TncFlPX3xTV1pj98FXAIoQ3akf6HUSemrBgcux
 KaVp4hmq/O9LXACQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D376E118DD;
 Mon, 31 May 2021 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622466926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5qkeK34KHSOy3pij0u8RZIeeVWHnBMPFWTEIRo7WoZg=;
 b=QWCF2NJHz3CyrYONW3R+K6f5J7U0V1HIJ7QlhK2/a4EIVO0+g0IPjlpqFzcif6lSeMJR5o
 yz7SI6vy3Nakl/H5YhViM+6n9NUr0DfzzYt1ZU7bjmVeOGzAgpqYJ9e5Wn3Dbh8KpbpTqY
 Qc7fKjLTaYk3sWbq/QUA1trjGECYWyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622466926;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5qkeK34KHSOy3pij0u8RZIeeVWHnBMPFWTEIRo7WoZg=;
 b=NMN7MoZ090OhVtrxWqdvahM9b9RQYFYmLMicG7BrJfwgmebJooJglE+wo8Rc+R4wW8xRJy
 uNdkovfU0f03FPAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id haVQMm7htGDrVAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 31 May 2021 13:15:26 +0000
Date: Mon, 31 May 2021 14:49:33 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YLTbXU1ZF4ZiXKdt@yuki>
References: <20210518122610.17171-1-liwang@redhat.com>
 <20210518122610.17171-2-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518122610.17171-2-liwang@redhat.com>
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.50
X-Spamd-Result: default: False [-0.50 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_test: using SIGTERM to terminate process
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
>  lib/newlib_tests/shell/test_timeout.sh | 2 +-
>  lib/newlib_tests/shell/timeout03.sh    | 1 +
>  testcases/lib/tst_test.sh              | 9 +++++----
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/newlib_tests/shell/test_timeout.sh b/lib/newlib_tests/shell/test_timeout.sh
> index b05680cb1..9f31afa32 100755
> --- a/lib/newlib_tests/shell/test_timeout.sh
> +++ b/lib/newlib_tests/shell/test_timeout.sh
> @@ -28,7 +28,7 @@ timeout02.sh|  -10|0|  |2
>  timeout02.sh| -0.1|0|  |0
>  timeout02.sh| -1.1|0|  |2
>  timeout02.sh|-10.1|0|  |2
> -timeout03.sh|     |0|12|137| | | |Test kill if test does not terminate by SIGINT
> +timeout03.sh|     |0|12|137| | | |Test kill if test does not terminate by SIGTERM
>  timeout04.sh|     |0|  |  2|0|0|1|Verify that timeout is enforced
>  timeout02.sh|    2|1| 2|   |1|0|0|Test termination of timeout process
>  "
> diff --git a/lib/newlib_tests/shell/timeout03.sh b/lib/newlib_tests/shell/timeout03.sh
> index cd548d9a2..124e96a84 100755
> --- a/lib/newlib_tests/shell/timeout03.sh
> +++ b/lib/newlib_tests/shell/timeout03.sh
> @@ -30,6 +30,7 @@ TST_TIMEOUT=1
>  
>  do_test()
>  {
> +	trap "tst_res TINFO 'Sorry, timeout03 is still alive'" TERM
>  	tst_res TINFO "testing killing test after TST_TIMEOUT"
>  
>  	sleep 2
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 3a5651c01..66ffde4eb 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -21,7 +21,8 @@ export TST_LIB_LOADED=1
>  . tst_security.sh
>  
>  # default trap function
> -trap "tst_brk TBROK 'test interrupted or timed out'" INT
> +trap "tst_brk TBROK 'test interrupted'" INT
> +trap "unset _tst_setup_timer_pid; tst_brk TBROK 'test terminated'" TERM

I've been looking at this for a while and I think that we should unset
the _tst_setup_timer_pid at the end of the _tst_timeout_process()
instead, right?

Otherwise we will leave the timeout process sleeping if someone sends
SIGTERM to the test process from the outside, or do I miss something?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
