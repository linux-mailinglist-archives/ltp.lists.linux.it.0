Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA8D4ACB1A
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Feb 2022 22:18:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C450A3C9B10
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Feb 2022 22:18:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 642503C9179
 for <ltp@lists.linux.it>; Mon,  7 Feb 2022 22:18:28 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 609211A00A26
 for <ltp@lists.linux.it>; Mon,  7 Feb 2022 22:18:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0D0E7210FF;
 Mon,  7 Feb 2022 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644268707;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YAoYktXXRGq6qGB9vv83O2AXGbjyqAxnu/RvR2I4ANQ=;
 b=SUj251bhhyb7ruMUOGkvhGI6/RYwZOvqltbqfcUF6qbRYV2wQ6JLTAOv5BdUO+04WTxjU8
 tidhzaquCCuG54X23njJyPQkA/2+FZMVAMrgBpL3UwuEsVlbxcpZrQhPFaCqW8Iw1fyxWV
 YvYNEfb5VLE5pvLHOl6DNFf7/rVIgtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644268707;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YAoYktXXRGq6qGB9vv83O2AXGbjyqAxnu/RvR2I4ANQ=;
 b=7xyhd85UlWEP5b+JzYcLYn9j9g4SRlaXEeO/lyorrVM2RjUbAkRLFtFrHBA4RQMeN27HjO
 9Ge7fs1CRmDSkxDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C62C613C53;
 Mon,  7 Feb 2022 21:18:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tdUaLqKMAWJEcgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 07 Feb 2022 21:18:26 +0000
Date: Mon, 7 Feb 2022 22:18:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YgGMoRqNwGJl16Az@pevik>
References: <20220203061222.625948-1-amir73il@gmail.com>
 <YgDsIaf5z2rg5tCH@pevik> <YgEw2/ev3gQ05B2Q@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgEw2/ev3gQ05B2Q@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/inotify: New test for IN_DELETE
 regression
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
Cc: Ivan Delalande <colona@arista.com>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > > +	/* Kill the child creating / deleting files and wait for it */
> > > +	SAFE_KILL(pid, SIGKILL);
> > > +	pid = 0;
> > > +	SAFE_WAIT(NULL);
> > Interesting. I didn't figure out why kill and wait cannot be done just in
> > cleanup.

> I guess that we want to stop the child in the case that we happened to
> open the deleted file and did abort the testing.

> Technically we send a signal to a zombie process in the case that the
> bug was not reproduced (as the child exits the verify_inotify() with
> return it will just do exit(0) once it reaches test library code). But
> that should be harmless.

> On the other hand I guess that it may make the code a bit more readable
> if we moved the SAFE_KILL() just after opened = 1 in the inner loop.

Yes, it'd be probably more readable if the code was in after opened = 1.
But I'm sorry I already merged the original version.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
