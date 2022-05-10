Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D250A520D32
	for <lists+linux-ltp@lfdr.de>; Tue, 10 May 2022 07:23:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D0E73CA942
	for <lists+linux-ltp@lfdr.de>; Tue, 10 May 2022 07:23:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 341263CA93A
 for <ltp@lists.linux.it>; Tue, 10 May 2022 07:23:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0003060069D
 for <ltp@lists.linux.it>; Tue, 10 May 2022 07:23:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 15C961F9F8;
 Tue, 10 May 2022 05:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652160211;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yHN2M/LpoX08wn42WsWU93aSdbUOe3VjXjfYgeYn6AQ=;
 b=u8zypzEFwGF6/aFEU5FwKje56Jd6AVAdW3685fi5xO0iFELC4RQdj162dim7svAqBY4MmZ
 xiXDGRaSQmpdlVzM+Ce7JRVZHCHMisdSAE7cM9ii7o6VaqEo3pBi6V4SnU22rh75DgxDWr
 rjylFfrdY7CuhC2r/OUqkfwbjjJMzSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652160211;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yHN2M/LpoX08wn42WsWU93aSdbUOe3VjXjfYgeYn6AQ=;
 b=9fDF23OwsvFtPgBAqiZUfCSpoUMdK/NPLuR9OaVvTy03Bxt4CYO4QGfH3RCCi///v91qSf
 ejsdVyPr/KDflrCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE78D13AA5;
 Tue, 10 May 2022 05:23:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DrjlMNL2eWLLRAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 10 May 2022 05:23:30 +0000
Date: Tue, 10 May 2022 07:23:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Ynn20aeavm2pvA3M@pevik>
References: <20220427125003.20815-1-pvorel@suse.cz>
 <20220427125003.20815-5-pvorel@suse.cz> <YnU0XII0YSf0CUnb@yuki>
 <d4552f0b-9f73-ec2b-0c81-3d86eeb36fc1@suse.cz>
 <Ynkftw55rbyVFXb0@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ynkftw55rbyVFXb0@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/5] tst_test.sh: Cleanup getopts usage
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

> Hi!
> > >> +. netns_helper.sh
> > >> +
> > >> +PROG=$1
> > >> +IP_VER=$2
> > >> +COM_TYPE=$3

> > > Can't we just keep these at the top along with the rest of the
> > > variables? I do not see them redefined anywhere but maybe I miss
> > > something.

> > tst_test.sh has to process command line arguments before these variables
> > can be set. Otherwise you'd have to put all command line switches
> > *AFTER* the positional arguments.

> I did sleep on this and I guess that the cleanest solution for this is
> to pass the positional arguments to the test setup function instead.
> What do you think?

Sure. That's what I already did in "[v2,3/3] netns: Rewrite to use tst_net.sh"
[1]. That's why I didn't care in this patchset. I plan to send rebased "shell:
Fixes for disabled IPv6" patchset today or tomorrow.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20220204194648.32165-4-pvorel@suse.cz/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
