Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6693F72E9
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 12:23:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE8883C30BC
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 12:23:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2A8DE3C2F77
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 12:23:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5F80C200ACF
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 12:23:47 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B9F8322155;
 Wed, 25 Aug 2021 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629887026;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nRFZ+PjbHz5KebZfHYBJeBd9B5zMu8u9aE0mODmzMco=;
 b=jasmNqmI1yQeu73VzJeCazsGHOMppYf7IabmpAEceJNrXln2BQRjB6vNKS9R2x/6EHFL5k
 LNgguFQmVf98iGYneG8SsBWUj5CZOcn5k/HlyBlGYsY0qIWj1NqhXKORpI4FcJUPZ4+5Y3
 G9JuIwPUbkH7u22OYGSncrjEKFZLbVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629887026;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nRFZ+PjbHz5KebZfHYBJeBd9B5zMu8u9aE0mODmzMco=;
 b=Le/GpEZMUFlk1ZbctKkMmHynxKiFyfxoULTc1baMWBrQNYvtu4DdzOF+gFbpQuXuoDf+NS
 iUA46Qr/z7Kg4QDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 84BB613732;
 Wed, 25 Aug 2021 10:23:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id uwTLHTIaJmEtEAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 25 Aug 2021 10:23:46 +0000
Date: Wed, 25 Aug 2021 12:23:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YSYaMDCCTwwC8NW+@pevik>
References: <20210825080933.12949-1-pvorel@suse.cz> <YSYGy3cewt9Sseb/@yuki>
 <YSYIt9TqTBU0AVKk@pevik> <YSYLVsq/UshH9wFx@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSYLVsq/UshH9wFx@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

Hi Cyril, Joerg,

> Hi!
> > > As it is it's pretty clear where the environment variable comes from, if
> > > we rename it to TST_IPC_PATH it's not obvious that this has been
> > > exported by LTP test.
> > I was thinking about it as well (just forget to write that into cover letter).

> > > Generally things that are visible on the running system tends to be
> > > prefixed with LTP_ or ltp_ rather than TST_ or tst_...
> > Sure. I just thought that LTP_ is for variables which are expected to be set by
> > user. But let's keep the old name. How about the first commit (cleanup)?

> There is no such rule I guess.

> It has been case by case, for instance we do have KCONFIG_PATH which we
> agreed on with the testing community to be a canonical variable name
> that is shared between different frameworks.

Ah, thanks for info. Obviously there cannot be rules for everything :).
Thanks both for your time.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
