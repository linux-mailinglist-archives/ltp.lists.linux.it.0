Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFF3C99BA
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 09:38:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60A9B3C8628
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 09:38:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB3603C65CD
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 09:38:22 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 141FE1000D13
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 09:38:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D99F1FDE8;
 Thu, 15 Jul 2021 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626334701;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uT//BsDCNvPJe5gKwSwnUMuTj2odrLAWEgshPI/9Blc=;
 b=GATcu8zQEjDiLbZn/S3LspJkJBt4JSducHVpGGOjePHRm0G34JkPvL/uNMMOjbazMMXlOi
 p2lzVST2kdtV2jjNtmFwSZEDDJAGs9G2aY6tAav7DxH7PfFLa9mnTK9S0XTfhwMfmnv8tM
 OpnuLUAj27hUFU1nwlm9wkhywrNfjCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626334701;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uT//BsDCNvPJe5gKwSwnUMuTj2odrLAWEgshPI/9Blc=;
 b=v/Chrddjb013AnZ25/+6nS48Pi2nNhJfD9JC2NUJMMUtwE2Hjd7zMi25knTN17WBEwRRqa
 L1LTeIHeDrgNHSCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2FCD413C2C;
 Thu, 15 Jul 2021 07:38:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UfMPCe3l72DsZgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 07:38:21 +0000
Date: Thu, 15 Jul 2021 09:38:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it,
 Li Wang <liwang@redhat.com>, Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YO/l6yni/AAOGhn9@pevik>
References: <20210714142001.20566-1-pvorel@suse.cz> <YO70PiTdyxzTw0k2@pevik>
 <YO77+MmmxwMewgnQ@yuki> <YO8UIP310jsAmq8I@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO8UIP310jsAmq8I@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

...
> > I guess this should fix it:

> > diff --git a/lib/tst_test.c b/lib/tst_test.c
> > index f4d9f8e3b..084a83c9e 100644
> > --- a/lib/tst_test.c
> > +++ b/lib/tst_test.c
> > @@ -734,12 +734,12 @@ static void do_exit(int ret)
> >                 if (results->broken)
> >                         ret |= TBROK;

> > -               printf("\nSummary:\n");
> > -               printf("passed   %d\n", results->passed);
> > -               printf("failed   %d\n", results->failed);
> > -               printf("broken   %d\n", results->broken);
> > -               printf("skipped  %d\n", results->skipped);
> > -               printf("warnings %d\n", results->warnings);
> > +               fprintf(stderr, "\nSummary:\n");
> > +               fprintf(stderr, "passed   %d\n", results->passed);
> > +               fprintf(stderr, "failed   %d\n", results->failed);
> > +               fprintf(stderr, "broken   %d\n", results->broken);
> > +               fprintf(stderr, "skipped  %d\n", results->skipped);
> > +               fprintf(stderr, "warnings %d\n", results->warnings);
> >         }

> Thanks! Testing it in https://github.com/pevik/ltp/actions/runs/1031005963

The result is much better but still not correct:
https://github.com/pevik/ltp/runs/3068932859?check_suite_focus=true#step:11:707

runtest TINFO: * shell/net/tst_ipaddr_un.sh

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
tst_ipaddr_un 1 TINFO: timeout per run is 0h 5m 0s

Could you please merge your fix? And I'll try sync after each test.
https://github.com/pevik/ltp/actions/runs/1033070696

What is worse is that tests are green, but I see TBROK and TWARN which are not
reflected by results:

tst_check_driver 1 TBROK: Test still running, sending SIGKILL
...
tst_rhost_run 1 TCONF: (null)      0  TWARN  :  tst_kernel.c:105: expected file /lib/modules/5.8.0-1036-azure/modules.dep does not exist or not a file

veth(null)      0  TWARN  :  tst_kernel.c:105: expected file /lib/modules/5.8.0-1036-azure/modules.builtin does not exist or not a file driver not available
Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0

runtest TINFO: === SHELL TEST RESULTS ===
runtest TINFO: 1x TPASS: shell/net/tst_ipaddr_un.sh
runtest TINFO: 0x TFAIL:
runtest TINFO: 0x TBROK:
runtest TINFO: 0x TWARN:
runtest TINFO: 2x TCONF: shell/tst_check_driver.sh shell/net/tst_rhost_run.sh

Kind regards,
Petr

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
