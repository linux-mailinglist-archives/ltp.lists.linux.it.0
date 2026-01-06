Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB0CF8C7E
	for <lists+linux-ltp@lfdr.de>; Tue, 06 Jan 2026 15:29:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D74A03C2B7D
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jan 2026 15:29:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C52A83C0756
 for <ltp@lists.linux.it>; Tue,  6 Jan 2026 15:29:07 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E8CCB1A00163
 for <ltp@lists.linux.it>; Tue,  6 Jan 2026 15:29:06 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AF7F25BCD0;
 Tue,  6 Jan 2026 14:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767709745;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Ib/Q/rC+TIgWKPbOuoG344x+mi8KFq7onoZFeUumRo=;
 b=CeztIrMkisozw4vpv89jWHR1Y8La6nw6lt8TWwbhGNjRMM38knxMcXFJ2LpgxwluDKz1E1
 Fc1ft7GO8ko4ClOd1U18vJwIBy7kvEoYJa0jG0+sm39m2AHlPViryiiYb7VLvrXJ89f0lU
 91w+Xbung7wirGEW57v8Ltf5dTCLXJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767709745;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Ib/Q/rC+TIgWKPbOuoG344x+mi8KFq7onoZFeUumRo=;
 b=pGgKfbYKwNQx8afqf5Vg08YVRrifZH9POpKhppA/vI4kkTt7Bqi9s3Btd8jWKsT49XTMIl
 W3wLRmluW2WJ/OAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767709745;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Ib/Q/rC+TIgWKPbOuoG344x+mi8KFq7onoZFeUumRo=;
 b=CeztIrMkisozw4vpv89jWHR1Y8La6nw6lt8TWwbhGNjRMM38knxMcXFJ2LpgxwluDKz1E1
 Fc1ft7GO8ko4ClOd1U18vJwIBy7kvEoYJa0jG0+sm39m2AHlPViryiiYb7VLvrXJ89f0lU
 91w+Xbung7wirGEW57v8Ltf5dTCLXJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767709745;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Ib/Q/rC+TIgWKPbOuoG344x+mi8KFq7onoZFeUumRo=;
 b=pGgKfbYKwNQx8afqf5Vg08YVRrifZH9POpKhppA/vI4kkTt7Bqi9s3Btd8jWKsT49XTMIl
 W3wLRmluW2WJ/OAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F4373EA63;
 Tue,  6 Jan 2026 14:29:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4ToMGjEcXWmBcwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 06 Jan 2026 14:29:05 +0000
Date: Tue, 6 Jan 2026 15:28:55 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <20260106142855.GB714081@pevik>
References: <20260105130359.647879-1-pvorel@suse.cz>
 <20260105130359.647879-2-pvorel@suse.cz>
 <DFHG5E7ZNVQB.1R4YPIZ6X5603@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DFHG5E7ZNVQB.1R4YPIZ6X5603@suse.com>
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.989]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,imap1.dmz-prg2.suse.org:helo,suse.com:email];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MISSING_XM_UA(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Score: -3.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] checkpatch.pl: spelling.txt: Update to
 next-20260105
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

> Hard to review :-D I guess it's a copy/paste, isn't it?

Yes, copy pasted + cherry-picked and squashed these 2 our commits:

27a08ddba1 ("scripts/checkpatch.pl: Replace kstrto with tst_parse_")
76d0c09aa1 ("scripts/checkpatch.pl: Ignore TST_* in constant checks")

> Acked-by: Andrea Cervesato <andrea.cervesato@suse.com>

Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
