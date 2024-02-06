Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C81E384B2F6
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Feb 2024 12:00:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7519C3CC64A
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Feb 2024 12:00:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F09FA3C8912
 for <ltp@lists.linux.it>; Tue,  6 Feb 2024 12:00:49 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 55C2D1000A1A
 for <ltp@lists.linux.it>; Tue,  6 Feb 2024 12:00:48 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 730101FB73;
 Tue,  6 Feb 2024 11:00:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F64E132DD;
 Tue,  6 Feb 2024 11:00:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EWw/BmARwmUcDAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 06 Feb 2024 11:00:48 +0000
Date: Tue, 6 Feb 2024 12:00:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20240206110046.GB270992@pevik>
References: <20240130162813.20278-1-mdoucha@suse.cz>
 <20240205173452.GB218023@pevik>
 <868916ef-de27-4512-a395-f7be5aa4c97d@suse.cz>
 <20240206104440.GA270992@pevik>
 <e5ba15b7-da35-42bf-919d-160d6622b7c1@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5ba15b7-da35-42bf-919d-160d6622b7c1@suse.cz>
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 730101FB73
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] waitpid01: Test all standard deadly signals
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

> On 06. 02. 24 11:44, Petr Vorel wrote:
> > Hi Martin,

> > > On 05. 02. 24 18:34, Petr Vorel wrote:
> > > diff --git a/testcases/kernel/syscalls/waitpid/waitpid01.c
> > > b/testcases/kernel/syscalls/waitpid/waitpid01.c
> > > index 367f7875c..a42b7e8ac 100644
> > > --- a/testcases/kernel/syscalls/waitpid/waitpid01.c
> > > +++ b/testcases/kernel/syscalls/waitpid/waitpid01.c
> > > @@ -94,6 +94,9 @@ static void run(unsigned int n)
> > >          int status;
> > >          const struct testcase *tc = testcase_list + n;

> > > +       if (tc->sig != SIGKILL)
> > > +               SAFE_SIGNAL(tc->sig, SIG_DFL);
> > > +

> > Ah, reset the signal, thanks!

> > It works on the current master, but because different patch would broke your
> > waiting waitpid01 patch, so that I'll review and merge it first.

> > Will you send this as a patch or should I merge this as your Suggested-by: ?

> You can add it to the waiting waitpid01 patch and push it together as a
> single commit.

Ideally this would be a separate fix in case of revert, but yeah, I'll add it to
your next patch. Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
