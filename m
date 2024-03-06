Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DFA8739C8
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Mar 2024 15:50:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B8B13CEB73
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Mar 2024 15:50:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 386C73C1354
 for <ltp@lists.linux.it>; Wed,  6 Mar 2024 15:50:11 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=akumar@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4CB46617E4E
 for <ltp@lists.linux.it>; Wed,  6 Mar 2024 15:50:09 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E70BE6B5B9;
 Wed,  6 Mar 2024 14:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709736609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJbihB4VQT/vuCsJzriSBWeQ8CT0CzbZ+9naI9yVbvg=;
 b=1e1Q+YDh5FErGSeNUYoilzcAUlOt1dTgoAq5ZcyhP+nu87LZHH4Bs2xhW8GfLdNjcUEWtu
 fOWA5sLHlOGG6WvZCLkLS25tXmYN+F+Oe6cMTvB0clhbY4DbqeL47+0NTsi4Jypp1YsdOM
 +iNk0IL7kym10iX7O8/rxE+SkrZM4C4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709736609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJbihB4VQT/vuCsJzriSBWeQ8CT0CzbZ+9naI9yVbvg=;
 b=Z2qfNLrT+aESoOVFvRV2QTnI0dtS+0UI5nOT2xY7G8a91CI0PtjlcZsSi1rwAZpvVjTlf/
 N7UdjlcavTXRP6DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709736608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJbihB4VQT/vuCsJzriSBWeQ8CT0CzbZ+9naI9yVbvg=;
 b=OxJXlI8Obg0te5QxePzp4mlPT9lLDn7rxIc4eWKcDIw4fmO+Jsq14vyd6NzsVvV0hTB2Gc
 45qFGTOjjwOo6PUp7BCceMsz5+bdwqrR41coVYX/0Jf6VoEqI6a1AkFzudO8/c4Pc3bx9P
 qz4y/228f2DpDXyhRRgTpF+45chWpN8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709736608;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJbihB4VQT/vuCsJzriSBWeQ8CT0CzbZ+9naI9yVbvg=;
 b=fRt2DbyQYYBw/rmodcf8k5vZmu0ukT3ZRWR8x1254EeoE5HaH/ic1vPa2acYfBucXdzsMu
 BapDj4wbdDNKUjCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CCD2413A67;
 Wed,  6 Mar 2024 14:50:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FyI2MaCC6GV2SwAAD6G6ig
 (envelope-from <akumar@suse.de>); Wed, 06 Mar 2024 14:50:08 +0000
From: Avinesh Kumar <akumar@suse.de>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Date: Wed, 06 Mar 2024 15:50:08 +0100
Message-ID: <2077160.YKUYFuaPT4@localhost>
Organization: SUSE
In-Reply-To: <20240227054144.27013-1-xuyang2018.jy@fujitsu.com>
References: <20240227054144.27013-1-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-0.47 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; CTE_CASE(0.50)[]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-1.37)[90.70%]
X-Spam-Level: 
X-Spam-Score: -0.47
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] munlockall01: Convert to new API
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

Hi,

Just making a note here that munlockall01.c test got completely rewritten[1],
so this patch can be changed to appropriate state in patchwork.

[1] https://patchwork.ozlabs.org/project/ltp/patch/20240306085254.534940-1-dbrendel@redhat.com/


Thanks,
Avinesh



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
