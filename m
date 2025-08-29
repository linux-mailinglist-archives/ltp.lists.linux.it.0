Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B21ADB3B872
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Aug 2025 12:17:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6AE2D3C0294
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Aug 2025 12:17:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 87F763C64AD
 for <ltp@lists.linux.it>; Fri, 29 Aug 2025 12:16:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C8659200772
 for <ltp@lists.linux.it>; Fri, 29 Aug 2025 12:16:50 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0CC7420BDC;
 Fri, 29 Aug 2025 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1756462610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g/5QSfkJj4MXkZmM6C/DnlSUsoHOuh4CC5MTX6y+BEk=;
 b=eSGB2FSyieMBZq4wwKraedh60v9HFAnFSGE04t7pPaojJtQvM7hl0i+eG2CTihQiXGJw4Y
 3U27fwkPueeah6QUjf8he9lFJknYdjyiKpSSK1C2qk/44HzahUApP1ZQRy9z5ite+3kqHT
 DHa41oC5UDJumFS+9tKwGl6OuxSWOLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1756462610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g/5QSfkJj4MXkZmM6C/DnlSUsoHOuh4CC5MTX6y+BEk=;
 b=6nZ3SUeIzznvPcgBp8Ei6+Gu0aAOYW/6meZvdx7pXAPMYTUmAMB2T5OF4seVYf4H+bddvA
 2xAScIaJtbf9DGDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=eSGB2FSy;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=6nZ3SUeI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1756462610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g/5QSfkJj4MXkZmM6C/DnlSUsoHOuh4CC5MTX6y+BEk=;
 b=eSGB2FSyieMBZq4wwKraedh60v9HFAnFSGE04t7pPaojJtQvM7hl0i+eG2CTihQiXGJw4Y
 3U27fwkPueeah6QUjf8he9lFJknYdjyiKpSSK1C2qk/44HzahUApP1ZQRy9z5ite+3kqHT
 DHa41oC5UDJumFS+9tKwGl6OuxSWOLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1756462610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g/5QSfkJj4MXkZmM6C/DnlSUsoHOuh4CC5MTX6y+BEk=;
 b=6nZ3SUeIzznvPcgBp8Ei6+Gu0aAOYW/6meZvdx7pXAPMYTUmAMB2T5OF4seVYf4H+bddvA
 2xAScIaJtbf9DGDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEF1313A3E;
 Fri, 29 Aug 2025 10:16:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ofEqNRF+sWgjQwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 29 Aug 2025 10:16:49 +0000
Date: Fri, 29 Aug 2025 12:17:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Wei Gao <wegao@suse.com>
Message-ID: <aLF-MWTH-qEwnB7c@yuki.lan>
References: <20250630125509.22775-1-chrubis@suse.cz>
 <aHf1BWUqSOEYIe5D@MiWiFi-CR6608-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aHf1BWUqSOEYIe5D@MiWiFi-CR6608-srv>
X-Spam-Level: 
X-Rspamd-Queue-Id: 0CC7420BDC
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MISSING_XM_UA(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] syscalls/statmount{04,05}: Enable on FUSE
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
> > These tests works fine for me fine on NTFS mounted via FUSE on 6.14
> I guess we need remove second "fine" ?

Yes, done and pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
