Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 808363F7197
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:20:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 447203C3015
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:20:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1DC613C2F5A
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:20:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7628C1400188
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:20:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C87AA1FDEA;
 Wed, 25 Aug 2021 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629883215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nYVM1iklmD/qSkyb3YHYrdhpq2taf5E8jXqljCsFJpw=;
 b=Piq4SZYsLip5bDrEnohXe5d9b3JcMRP2DcYkLR+O+oTYt5km1pz4GOgIy6ZOy/QhFjUg5l
 ijkFZiwkt7mcYZgbSb+u1k4ZerGMPZ5cKStTSYtGJbgjj0ntjWsyoZJ4D/5uD46c48LaEK
 zZnykxt3DoZcCSZy21/IZ2DLhIqlP98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629883215;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nYVM1iklmD/qSkyb3YHYrdhpq2taf5E8jXqljCsFJpw=;
 b=qFiXUwALaJg7B3QM4mh93wFenvFrulgeItH+Ob7l/X+YiB9G7yQkxal7+TGNUTsOi4k0ZR
 xkUazzkCgFtXWgAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87C9513B88;
 Wed, 25 Aug 2021 09:20:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SPR1Hk8LJmHSGQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 25 Aug 2021 09:20:15 +0000
Date: Wed, 25 Aug 2021 11:20:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YSYLVsq/UshH9wFx@yuki>
References: <20210825080933.12949-1-pvorel@suse.cz> <YSYGy3cewt9Sseb/@yuki>
 <YSYIt9TqTBU0AVKk@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSYIt9TqTBU0AVKk@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > As it is it's pretty clear where the environment variable comes from, if
> > we rename it to TST_IPC_PATH it's not obvious that this has been
> > exported by LTP test.
> I was thinking about it as well (just forget to write that into cover letter).
> 
> > Generally things that are visible on the running system tends to be
> > prefixed with LTP_ or ltp_ rather than TST_ or tst_...
> Sure. I just thought that LTP_ is for variables which are expected to be set by
> user. But let's keep the old name. How about the first commit (cleanup)?

There is no such rule I guess.

It has been case by case, for instance we do have KCONFIG_PATH which we
agreed on with the testing community to be a canonical variable name
that is shared between different frameworks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
