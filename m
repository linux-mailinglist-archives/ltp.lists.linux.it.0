Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F353F7179
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:09:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E7A63C301F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:09:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DEE853C2F5A
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:09:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DFD79600838
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:09:13 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1E2D322118;
 Wed, 25 Aug 2021 09:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629882553;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZpUl5BRmnARYuphKn6+J6nGY1A5McI8W7oNMg8emcF4=;
 b=KrlJk1mOwKkocvAsxfUMuZk25uP519QPqAE6bnvcuG1hZCkdZrojyywM4KkBvhvqpuwzXK
 Bdhg25oAZs/sN6jlbVb7ZT3NCWD+xvNM6Gwn65D+ddfYGhQ4Uz3M/6nm9NRxe0FYlvzyzS
 G/FCF+D/4eCPkUXJ8T2+CHLW8gLLrxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629882553;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZpUl5BRmnARYuphKn6+J6nGY1A5McI8W7oNMg8emcF4=;
 b=cEWJE/jRe0lnhfR1xSSvud3FQMbsuxFOQ4zu7sPh7CAMhXm8YROQgTJrOpkqlo+exXOCOP
 ONN5xJyn+APcDKBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E3FEE13887;
 Wed, 25 Aug 2021 09:09:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id OXfoNbgIJmHMfgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 25 Aug 2021 09:09:12 +0000
Date: Wed, 25 Aug 2021 11:09:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YSYIt9TqTBU0AVKk@pevik>
References: <20210825080933.12949-1-pvorel@suse.cz>
 <YSYGy3cewt9Sseb/@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSYGy3cewt9Sseb/@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] New API: Rename LTP_IPC_PATH -> TST_IPC_PATH
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

> Hi!
> > Petr Vorel (3):
> >   lib: Move IPC_ENV_VAR definition into header
> >   C API: Rename LTP_IPC_PATH -> TST_IPC_PATH
> >   shell API: Rename LTP_IPC_PATH -> TST_IPC_PATH

> Is this really a good idea?

> As it is it's pretty clear where the environment variable comes from, if
> we rename it to TST_IPC_PATH it's not obvious that this has been
> exported by LTP test.
I was thinking about it as well (just forget to write that into cover letter).

> Generally things that are visible on the running system tends to be
> prefixed with LTP_ or ltp_ rather than TST_ or tst_...
Sure. I just thought that LTP_ is for variables which are expected to be set by
user. But let's keep the old name. How about the first commit (cleanup)?

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki/User-Guidelines

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
