Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BC36590EF46
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2024 15:43:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 826703D0DD4
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2024 15:43:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 69F893CFE8C
 for <ltp@lists.linux.it>; Wed, 19 Jun 2024 15:43:31 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 25D071A011DF
 for <ltp@lists.linux.it>; Wed, 19 Jun 2024 15:43:30 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0CC9421A68;
 Wed, 19 Jun 2024 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1718804610;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUWXAEJO1rhua17iQN19urxaGwjg2Dthnk5gayxTFAg=;
 b=g1jZcEwVGHDxyTrg+fOOVrYzGF6RlquT/tADHZuslYB0/GD+Z8XvxP+NSSdtFp530zKxwT
 MIc1jVx3lWH3hUUDVsvGwcb8eBPSQv3Hl6nCIZY1ZF4D2FiPlAsF9x2x/ryPLt+OCJGhqg
 Ino452nslj7XjuPisXl5Fo9hCmHTdxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1718804610;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUWXAEJO1rhua17iQN19urxaGwjg2Dthnk5gayxTFAg=;
 b=NQpR/UoB0ILFizw5Si4nHZFVSCj9KADDyLzJ9JxCjo/DK/kdpePCFmR+EDgAReGzv5X0Ex
 nuNiW/o0C6zd3yCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1718804610;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUWXAEJO1rhua17iQN19urxaGwjg2Dthnk5gayxTFAg=;
 b=g1jZcEwVGHDxyTrg+fOOVrYzGF6RlquT/tADHZuslYB0/GD+Z8XvxP+NSSdtFp530zKxwT
 MIc1jVx3lWH3hUUDVsvGwcb8eBPSQv3Hl6nCIZY1ZF4D2FiPlAsF9x2x/ryPLt+OCJGhqg
 Ino452nslj7XjuPisXl5Fo9hCmHTdxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1718804610;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUWXAEJO1rhua17iQN19urxaGwjg2Dthnk5gayxTFAg=;
 b=NQpR/UoB0ILFizw5Si4nHZFVSCj9KADDyLzJ9JxCjo/DK/kdpePCFmR+EDgAReGzv5X0Ex
 nuNiW/o0C6zd3yCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E874713ABD;
 Wed, 19 Jun 2024 13:43:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ldW/N4HgcmZwfwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 19 Jun 2024 13:43:29 +0000
Date: Wed, 19 Jun 2024 15:43:28 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <20240619134328.GA460868@pevik>
References: <20240423083723.66575-1-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423083723.66575-1-xuyang2018.jy@fujitsu.com>
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -3.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] unlink09: Add _GNU_SOURCE feature macro to
 workaround the compile error
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

Hi Yang Xu,

> In CI environment, unlink09 compiling failed on alpine/latest because loff_t
> type is not declared. Add _GNU_SOURCE feature macro to enable GNU extension
> to solve the problem.

For a record, this has been fixed by b4970ae94 ("lapi/fs: Replace loff_t with long long") [1]
thus closing this in patchwork as handled elsewhere.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/commit/b4970ae949d15b4b05b81b5ba72bef12d59dcf2d
...
> +++ b/testcases/kernel/syscalls/unlink/unlink09.c
> @@ -13,6 +13,8 @@
>   * - EROFS when target file is on a read-only filesystem.
>   */

> +#define _GNU_SOURCE
> +

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
