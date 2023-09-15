Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D927A7A23B8
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Sep 2023 18:42:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D6B33CE681
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Sep 2023 18:42:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 20D153CB148
 for <ltp@lists.linux.it>; Fri, 15 Sep 2023 18:42:21 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 12D6A1A01019
 for <ltp@lists.linux.it>; Fri, 15 Sep 2023 18:42:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 581BB1FD6E;
 Fri, 15 Sep 2023 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1694796139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bDhkZBbM10v03HBipowpjQRvFirjCbAaFrD7ObPgzR4=;
 b=tfhpWhjep1vKJq3Hfu+TYTHx+GwJsYFGLqC1WR06vfg8GgA4L2rMZZjwaFfe+JunwJESdJ
 iU1eQE28L4PG1+IshJYOt3HlzB11draScyuxVuiTV0pAqkjQVdJ9+M9Am+54O9/ML8NYWv
 a7jzIKcVRDClstKovn8odU1hos5+lMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1694796139;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bDhkZBbM10v03HBipowpjQRvFirjCbAaFrD7ObPgzR4=;
 b=qbYcJwkpv0kdnUkwDhfcHp4CPTsWvlEjUudOh4cs0xc3aIx+tIj5oDBwfLvUp3US2k+fri
 4VoRMZQIyhyIfeCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45E2013251;
 Fri, 15 Sep 2023 16:42:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6q8REGuJBGUnPQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 15 Sep 2023 16:42:19 +0000
Date: Fri, 15 Sep 2023 18:43:05 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZQSJmZe2gPO8sHSY@yuki>
References: <20230915144156.22380-1-andrea.cervesato@suse.de>
 <20230915144156.22380-2-andrea.cervesato@suse.de>
 <20230915152744.GA73280@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915152744.GA73280@pevik>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] Replace runltp-ng with kirk framework
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > +Subproject commit 805c56c2a69b2e9f24ba13f64eab1bdad5885678
> Why not add the master HEAD c7419dd ("Fix qemu login prompt recognition")?
> 
> https://github.com/linux-test-project/kirk/commit/c7419dd6f73d90f3f02aa17d30270e895e30c88e
> 
> IMHO it'd be better to use it, instead of 805c56c (HEAD~).

That is a mistake that should be fixed.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
