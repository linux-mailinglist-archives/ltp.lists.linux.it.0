Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB1BE35FB
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Oct 2025 14:31:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 114723CEE02
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Oct 2025 14:31:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 483F63CB05D
 for <ltp@lists.linux.it>; Thu, 16 Oct 2025 14:31:23 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B8CD21400E0B
 for <ltp@lists.linux.it>; Thu, 16 Oct 2025 14:31:22 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 557B821E73;
 Thu, 16 Oct 2025 12:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760617881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MmG1Q3N9zGYro7omU1DDSWczYmCGTdSdyvQNr3ucxfQ=;
 b=ulE4b8yqEeJvxVaIetMD99kkEcEKDVgN7i0ifMmBcvpKfxFRsDe+BxwoaH8KfaHl3Ubxas
 cyYPrrhHp9u1CCFDrUmHFPVF1evgW9TCmv2jTu/TxHeNe2/8RAWvn0DeK10wsoOq1TgbrO
 Xpk+DFY4Z05Ijnk1/nSK3Rc8sIaCrV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760617881;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MmG1Q3N9zGYro7omU1DDSWczYmCGTdSdyvQNr3ucxfQ=;
 b=s0G3xsNubJyFWQpp8JMW1Q47eIJEsBbrKvU4Yy8CVHTrxBXUpcadV0yWE6W6JxItRWUEum
 zCv+lpJ3aCPnw0Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760617881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MmG1Q3N9zGYro7omU1DDSWczYmCGTdSdyvQNr3ucxfQ=;
 b=ulE4b8yqEeJvxVaIetMD99kkEcEKDVgN7i0ifMmBcvpKfxFRsDe+BxwoaH8KfaHl3Ubxas
 cyYPrrhHp9u1CCFDrUmHFPVF1evgW9TCmv2jTu/TxHeNe2/8RAWvn0DeK10wsoOq1TgbrO
 Xpk+DFY4Z05Ijnk1/nSK3Rc8sIaCrV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760617881;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MmG1Q3N9zGYro7omU1DDSWczYmCGTdSdyvQNr3ucxfQ=;
 b=s0G3xsNubJyFWQpp8JMW1Q47eIJEsBbrKvU4Yy8CVHTrxBXUpcadV0yWE6W6JxItRWUEum
 zCv+lpJ3aCPnw0Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45BD21376E;
 Thu, 16 Oct 2025 12:31:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PQ3UD5nl8GjWCwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 16 Oct 2025 12:31:21 +0000
Date: Thu, 16 Oct 2025 14:32:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <aPDlzuox-54oxTtp@yuki.lan>
References: <20250917102737.GA336745@pevik>
 <aa769509-d4b8-46eb-b02d-699a573b0080@suse.com>
 <20250929083156.GA199802@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250929083156.GA199802@pevik>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC] 'nobody' user for testing
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
> Short term solution will be Jan's suggestion to write simple "sudo" binary or
> even just let testers to fix the setup (i.e. fix it for us in openQA).

I guess that having a small helper to execute commands as a selected
user would be reasonable. We already have tst_sleep because the sleep
commands in different shells behaves differently.

Adding tst_sudo that would take an user and command to execute does make
sense here I suppose. And I think that the question if we need a
separate user for LTP testing is orthogonal.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
