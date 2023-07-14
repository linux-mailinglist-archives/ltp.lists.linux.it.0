Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D074F753A1C
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jul 2023 13:49:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 497053CDE81
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jul 2023 13:49:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E88843C036A
 for <ltp@lists.linux.it>; Fri, 14 Jul 2023 13:49:48 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 66AB3200392
 for <ltp@lists.linux.it>; Fri, 14 Jul 2023 13:49:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 365E122124;
 Fri, 14 Jul 2023 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689335387;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d3Q2Ahol9o7JjeGxLVNcxmcRWP3KK/YlwtL2iXOEwNc=;
 b=rrziVxDpfBavmCn3WkW3Tio5nsHvqbNqZPCHa1oT/Dea6/fBlk2Cz0k8/yVybDkcnPuQ64
 k0z6Lu2qoMXSJ0o69w4z5DBIlw4+RhO+aVoq3PeZNQ5huZyAtwCB+VWN01m35blUdxZRHQ
 oQXIt003Xni7NGqpjAccqySrRKyTaAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689335387;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d3Q2Ahol9o7JjeGxLVNcxmcRWP3KK/YlwtL2iXOEwNc=;
 b=xD1Qeyk1AJcHd1Lx/aunJuobqT/uG6ofMcXinR73mh+qBUllsxbR3ffulmSpC0vM+02YnM
 GcMHH9ND8eBy62Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 104FD138F8;
 Fri, 14 Jul 2023 11:49:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P5GIAls2sWQoPgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 14 Jul 2023 11:49:47 +0000
Date: Fri, 14 Jul 2023 13:49:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>, ltp@lists.linux.it
Message-ID: <20230714114945.GC958548@pevik>
References: <20230713132901.28660-1-mdoucha@suse.cz>
 <20230714034048.GA913@sol.localdomain>
 <20230714114719.GB958548@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230714114719.GB958548@pevik>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] statx09: Reduce fs-verity blocksize to 1024
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

Hi Eric, Martin,

> Yes kernels < 6.3 TCONF on current master:
> statx09.c:124: TCONF: fs-verity not supported on loopdev
I forget to write the behavior is the same on older kernels with Martin's
patch.

Kind regards,
Petr

> And 6.3 fails:
> statx09.c:109: TBROK: ioctl(3, FS_IOC_ENABLE_VERITY) failed: EINVAL (22)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
