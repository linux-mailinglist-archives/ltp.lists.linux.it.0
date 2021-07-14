Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5A73C88D9
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 18:43:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA9C83C8719
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 18:43:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 76AED3C60E0
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 18:43:17 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B2702200119
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 18:43:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3A551FD7C;
 Wed, 14 Jul 2021 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626280996;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m02F8oUjvdDSIz9xvsJUkGTz0K/xqLYpdPzdVLuzjgM=;
 b=OwUZRxH9a1iMGWCLeP7rvjqFCNbv7OAT1BtZ7UNnuRVosLTdiJXOArZ3Ul+q59LOuuMZEP
 RcqpQjmtrnWUEN4cPCHFJA4zOfSFBgOXlkvcnn7U+r0MjOFApDUU/skJlq775NVwyg8WMw
 fQc0RTVCOiM1Gb7EU2ngkXsgljkynvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626280996;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m02F8oUjvdDSIz9xvsJUkGTz0K/xqLYpdPzdVLuzjgM=;
 b=cDe36/7oRPXWzufcHyekW5KzlQypeLUjq56mJUkNpJ79a5SF801+JYgJOsxRTUeI7xiyx8
 tprJW8egWfXAzlCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFC6F13C0A;
 Wed, 14 Jul 2021 16:43:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P3fQMyIU72AOIgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 14 Jul 2021 16:43:14 +0000
Date: Wed, 14 Jul 2021 18:43:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YO8UIP310jsAmq8I@pevik>
References: <20210714142001.20566-1-pvorel@suse.cz> <YO70PiTdyxzTw0k2@pevik>
 <YO77+MmmxwMewgnQ@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO77+MmmxwMewgnQ@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 0/4] Run tests in CI
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > tested:
> > https://github.com/pevik/ltp/actions/runs/1030551185

> > One thing which bothers me is mangled output of several tests together:
> > https://github.com/pevik/ltp/runs/3067600696?check_suite_focus=true#step:11:554

> > runtest TINFO: * tst_res_hexd
> > /__w/ltp/ltp/lib/tst_test.c:1344: TINFO: Timeout per run is 0h 05m 00s
> > /__w/ltp/ltp/lib/newlib_tests/tst_res_hexd.c:13: TPASS: dump1
> > /__w/ltp/ltp/lib/newlib_tests/tst_res_hexd.c:13: TPASS: 48 65 6c 6c 6f 20 66 72 6f 6d 20 74 73 74 5f 72
> > /__w/ltp/ltp/lib/newlib_tests/tst_res_hexd.c:13: TPASS: 65 73 5f 68 65 78 64 00

> > runtest TINFO: * tst_strstatus
> > /__w/ltp/ltp/lib/tst_test.c:1344: TINFO: Timeout per run is 0h 05m 00s

> > Summary:
> > passed   35
> > failed   0
> > broken   0
> > skipped  0
> > warnings 0

> > Summary:
> > passed   1
> > failed   0
> > broken   0
> > skipped  0
> > warnings 0

> That is indeed strange, you are running these in a loop, the buffers
> should have been flushed once controll returns back to the shell from
> the test.

> I guess that this is a combination of:

> * The stdout and stderr are block buffered by the gitlab CI and flushed
>   at different times

> * The summary is written into stdout in contrast with the message
>   so we end up with summary printed later than the rest that goes into
>   stderr

Yep, it could be.

> I guess this should fix it:

> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index f4d9f8e3b..084a83c9e 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -734,12 +734,12 @@ static void do_exit(int ret)
>                 if (results->broken)
>                         ret |= TBROK;

> -               printf("\nSummary:\n");
> -               printf("passed   %d\n", results->passed);
> -               printf("failed   %d\n", results->failed);
> -               printf("broken   %d\n", results->broken);
> -               printf("skipped  %d\n", results->skipped);
> -               printf("warnings %d\n", results->warnings);
> +               fprintf(stderr, "\nSummary:\n");
> +               fprintf(stderr, "passed   %d\n", results->passed);
> +               fprintf(stderr, "failed   %d\n", results->failed);
> +               fprintf(stderr, "broken   %d\n", results->broken);
> +               fprintf(stderr, "skipped  %d\n", results->skipped);
> +               fprintf(stderr, "warnings %d\n", results->warnings);
>         }

Thanks! Testing it in https://github.com/pevik/ltp/actions/runs/1031005963

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
