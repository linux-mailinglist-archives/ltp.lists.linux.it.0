Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E9260A09479
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2025 15:57:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84BCB3C4C78
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2025 15:57:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6A1003C02C4
 for <ltp@lists.linux.it>; Fri, 10 Jan 2025 15:57:35 +0100 (CET)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D84DA1BE43BC
 for <ltp@lists.linux.it>; Fri, 10 Jan 2025 15:57:34 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B7701F37C;
 Fri, 10 Jan 2025 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736521052;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P09BXdQGgSJdE5U6+6X+XePMBOC3rEXivLvjOX3dW7Q=;
 b=gjDD24OgNfz6zzG9g1sVGA0byAlltPTZJILYuu+KCj/59UwTtscOHG7rjbSyW0woIQrpZA
 Q+9QspcnA6GOxABrchrj39HEOQLjgVzxWB68Hij6/XtxvvSWLf+rBkCW0iaF6uph/eUOQI
 dlbozdQA5DZQm9dRzwHaF9OBFmTZ3zA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736521052;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P09BXdQGgSJdE5U6+6X+XePMBOC3rEXivLvjOX3dW7Q=;
 b=jZv8sVtQISKtG2kfPavOVWF/VWRT8zHtkVTrYcCtIDS4bcLerD1cFhFy43N+INUifG7wRk
 HrBH/7GcsyE//NDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736521052;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P09BXdQGgSJdE5U6+6X+XePMBOC3rEXivLvjOX3dW7Q=;
 b=gjDD24OgNfz6zzG9g1sVGA0byAlltPTZJILYuu+KCj/59UwTtscOHG7rjbSyW0woIQrpZA
 Q+9QspcnA6GOxABrchrj39HEOQLjgVzxWB68Hij6/XtxvvSWLf+rBkCW0iaF6uph/eUOQI
 dlbozdQA5DZQm9dRzwHaF9OBFmTZ3zA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736521052;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P09BXdQGgSJdE5U6+6X+XePMBOC3rEXivLvjOX3dW7Q=;
 b=jZv8sVtQISKtG2kfPavOVWF/VWRT8zHtkVTrYcCtIDS4bcLerD1cFhFy43N+INUifG7wRk
 HrBH/7GcsyE//NDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 310EF13763;
 Fri, 10 Jan 2025 14:57:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id m7MQCVw1gWccfQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 10 Jan 2025 14:57:32 +0000
Date: Fri, 10 Jan 2025 15:57:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <20250110145726.GA413134@pevik>
References: <20250109132334.212281-1-pvorel@suse.cz>
 <20250109132334.212281-2-pvorel@suse.cz>
 <a8437881-a652-4847-9907-41922126bece@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8437881-a652-4847-9907-41922126bece@suse.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.996]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:replyto,imap1.dmz-prg2.suse.org:helo];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -3.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] macros: Add basic docs
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

Hi Andrea,

> Hi Petr,

> thanks for this documentation. It's really needed.

Yes, I had it long time in my mind. Thanks for the review.
...
> > +++ b/include/tst_test_macros.h
> > @@ -1,7 +1,11 @@
> >   // SPDX-License-Identifier: GPL-2.0-or-later
> >   /*
> >    * Copyright (c) 2015-2024 Cyril Hrubis <chrubis@suse.cz>
> > - * Copyright (c) Linux Test Project, 2021-2022
> > + * Copyright (c) Linux Test Project, 2021-2024
> > + */
> > +
> > +/**
> > + * DOC: tst_test_macros.h -- helpers for testing syscalls
> >    */
> Is this really needed?

Well, IMHO throwing just functions description to users is not enough.
I would even add a short description about the goal of these macros.

And because sooner or later as we increase sphinx doc in the headers the list
will be quite long. Therefore for the start I added just a title (short
paragraph with a description would be of curse  better).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
