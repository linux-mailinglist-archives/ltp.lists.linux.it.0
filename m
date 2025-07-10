Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BBDAFFD51
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jul 2025 11:00:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3C1F3CAD81
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jul 2025 11:00:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C97173CACD1
 for <ltp@lists.linux.it>; Thu, 10 Jul 2025 11:00:11 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0C8552005DA
 for <ltp@lists.linux.it>; Thu, 10 Jul 2025 11:00:10 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F283021169;
 Thu, 10 Jul 2025 09:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752138010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8qaOSpRsDEiiuBRd+aBavWkMk5jkGR9Y2Tz4ck6eikE=;
 b=G2xqXDgLRhUcmo5LVsMlNBqT5aIO+MuT2UQmi8VLarEQuVO00hMZdpDHK0D3UVlSx+qp2d
 XYlLG5AkAItkyHmlibr0F+roPUilI/gXJw4awHzPdvasduKRq/0ZsgT0KKQwdEaS86EgWW
 7X5SDmU47WOfETA5u5NEksyUetjSPBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752138010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8qaOSpRsDEiiuBRd+aBavWkMk5jkGR9Y2Tz4ck6eikE=;
 b=tmk2cWSaHFPlUOBQ4+vAwz+pyQgnTRdH/dTHtQC3b68y7vsUmMSTy0vVhmgldQiTQQcNu0
 udrL3rtjH7P9YkCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752138009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8qaOSpRsDEiiuBRd+aBavWkMk5jkGR9Y2Tz4ck6eikE=;
 b=YnCXsZo26+hKpYcqACckW00VwHb+EspB9csJgxjRSwDl1b+T8abv4384MpScsb0lx9MxGJ
 KZnXdhAHKLo/eTc+HfsdFjQ39iyVCx9PTwhTJTjwaTfxI/SYQA4cY/r53t484u47eKrppZ
 Z7gwf+EyMGHPZkvkqaRizizHLyayPJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752138009;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8qaOSpRsDEiiuBRd+aBavWkMk5jkGR9Y2Tz4ck6eikE=;
 b=KxGOIhHkjsO6SNmx+ZZ9F96w2/jFub/jO8ktyEOsEySsnNONmmFl/x+UCSt3pRgf7P34bi
 ttk3qSAx9PujjVBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E225D136CB;
 Thu, 10 Jul 2025 09:00:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jxCHNhmBb2gUQwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 10 Jul 2025 09:00:09 +0000
Date: Thu, 10 Jul 2025 11:00:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <aG-BOM0OEKrp-GHm@yuki.lan>
References: <20250710082000.11641-1-akumar@suse.de>
 <12708664.O9o76ZdvQC@thinkpad>
 <581805f2-0633-4e94-9252-b1be2bd47112@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <581805f2-0633-4e94-9252-b1be2bd47112@suse.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -8.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] cgroup_regression_test: Use unique names for
 hierarchies in each test
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
Cc: mkoutny@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I forgot to mention that I also tried to use
> > tst_umount() helper routine, but that did not help as umount does not
> > really report any failures here.
> 
> The solution doesn't really convince me. If it's true that a util-linux 
> upgrade to v2.41 is causing this issue, we should probably research why 
> this is happening in there and (eventually) fix it. Or, if it's not a 
> library bug, we should fix tst_umount() in order to recognize when a 
> cgroups folder hasn't been fully unmounted.
> 
> @Cyril WDYT ?

This indeed looks like a workaround for a bug either in the test or in
the system.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
