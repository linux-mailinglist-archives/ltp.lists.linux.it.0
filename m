Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEnUB5DOqmkNXQEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 13:54:40 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4876221199
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 13:54:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4018B3D06A6
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2026 13:54:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7E0B03CE1F7
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 13:54:29 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C44A71000DF9
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 13:54:28 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 578B53E6C8;
 Fri,  6 Mar 2026 12:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772801667;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AMgKvCs30fIS1Q7TdYrtSDRc8zm843dCbfoCJTjGBlc=;
 b=nCuYkuhELTEc9mF+r11Exw7RSaqDMXGtd/Q6no+ZBijogo5im0EKqA9UMfbSgEVMGYv8/y
 F3j1CHvL016qMMUc4/w6eeR4zfzBt8FdidjLUfHwI6JHE+nVRj6GNHYsGBrzYmIX6V4xQQ
 EcFtJSsPFUFCZma2IpDn+bt7g/HBjEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772801667;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AMgKvCs30fIS1Q7TdYrtSDRc8zm843dCbfoCJTjGBlc=;
 b=Jk9hfVgyJ3ZrhA4vbaoq1z0Rib2Fr497kIAcJiToyjgAvOA+OrcwOGTonY759DUhOF7ckL
 ZXD5c9V16BGjJsAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=nCuYkuhE;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Jk9hfVgy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772801667;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AMgKvCs30fIS1Q7TdYrtSDRc8zm843dCbfoCJTjGBlc=;
 b=nCuYkuhELTEc9mF+r11Exw7RSaqDMXGtd/Q6no+ZBijogo5im0EKqA9UMfbSgEVMGYv8/y
 F3j1CHvL016qMMUc4/w6eeR4zfzBt8FdidjLUfHwI6JHE+nVRj6GNHYsGBrzYmIX6V4xQQ
 EcFtJSsPFUFCZma2IpDn+bt7g/HBjEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772801667;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AMgKvCs30fIS1Q7TdYrtSDRc8zm843dCbfoCJTjGBlc=;
 b=Jk9hfVgyJ3ZrhA4vbaoq1z0Rib2Fr497kIAcJiToyjgAvOA+OrcwOGTonY759DUhOF7ckL
 ZXD5c9V16BGjJsAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A3F53EA75;
 Fri,  6 Mar 2026 12:54:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mLkrDYPOqmkhVAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 06 Mar 2026 12:54:27 +0000
Date: Fri, 6 Mar 2026 13:54:17 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20260306125417.GA528953@pevik>
References: <20260304144424.10101-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304144424.10101-1-chrubis@suse.cz>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] syscalls: ulimit01; Convert to the new library
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
X-Rspamd-Queue-Id: B4876221199
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:rdns,picard.linux.it:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.555];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Hi Cyril,

> Linux does not implement UL_GMEMLIM, UL_GDESLIM and UL_GSHMEMLIM so we
> keep only the UL_GETFSIZE and UL_SETFSIZE.
...

LGTM, thanks for the cleanup.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

> +/*\
> + * Tests the basic functionality of ulimit() with UL_GETFSIZE and UL_SETFSIZE.
nit: Could you please change before merge ulimit() to
:manpage:`ulimit(3)`
so that we get link to https://man7.org/linux/man-pages/man3/ulimit.3.html ?

FYI kernel uses automarkup to recognise various things e.g. git hash [1].
Maybe we could employ it for git kernel commits.
But for man page it can have false positives [2].

[1] https://lore.kernel.org/linux-doc/87a4ydo1hf.fsf@trenco.lwn.net/
[2] https://lore.kernel.org/linux-doc/aWqg5XwPRXlzq4FI@devuan/

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
