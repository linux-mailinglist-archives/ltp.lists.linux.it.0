Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F29952EC
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2024 17:05:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE0353C2A8F
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2024 17:05:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 264203C2191
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 17:01:50 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 42F1B208F99
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 17:01:49 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6EB61FCE4;
 Tue,  8 Oct 2024 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1728399708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JiEN7BizCfTe1HIXXYU71Ydc0/auUV9P5RAyLMPZZ4s=;
 b=uaIgQE3nQGMxSey0psM1sfus2XUYXW3bb3FQAstyOU406dv5E0D2hxSJQbJtTIz43vNxbr
 ryGl17tDACpC2Ni8qvvqxjpjhyioxPqYBvQX82/yqJrsEQflIhSXylkF+qUsB6pUVoSdJQ
 uf5lvdvid+4huLRqaeQ48zzKjEAqDd8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1728399708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JiEN7BizCfTe1HIXXYU71Ydc0/auUV9P5RAyLMPZZ4s=;
 b=tOg8miQWN3KJanFYfQdc4PF9bSAITWTuFa89273/+iZJ27ts+0QT3wlGwAl0fgSYR1C2O/
 OY5LbWvwJixFR7DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1728399707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JiEN7BizCfTe1HIXXYU71Ydc0/auUV9P5RAyLMPZZ4s=;
 b=lL8H1JguQ0qN1Gjiar3Cf4LIZgzFRAaFfw7DQgpvIBmHPTRZr4S4sHPQjo4X7zbRMlQlOX
 tZQ3A4BevvdCxioUm0z71V7oSP+0una10X6zoMMOXq/i9okBPxifLSgv8Lch8vJ0dpNLqV
 vPI6EHWjDKlZy6Desw6BGC7AueTLokQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1728399707;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JiEN7BizCfTe1HIXXYU71Ydc0/auUV9P5RAyLMPZZ4s=;
 b=3/aPwb5Rzos3lmH4TEhwkUDvlEh6PkSEzNFDwYUGX5MDQ/4i3+BsM66j0IrpYHIz28cOPF
 gIUfBUNZPZFe0HCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A77B0137CF;
 Tue,  8 Oct 2024 15:01:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 804XKFtJBWeVKwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 08 Oct 2024 15:01:47 +0000
Date: Tue, 8 Oct 2024 17:00:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <ZwVJHzkFhggPqrik@yuki.lan>
References: <20241008-listmount_statmount-v5-0-66f4e1a9e7db@suse.com>
 <20241008-listmount_statmount-v5-16-66f4e1a9e7db@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241008-listmount_statmount-v5-16-66f4e1a9e7db@suse.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.983]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,yuki.lan:mid]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 16/16] Add listmount04 test
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
> +	{
> +		.req = &request_small,
> +		.mnt_ids = mnt_ids,
> +		.nr_mnt_ids = MNT_SIZE,
> +		.flags = 0,
> +		.exp_errno = EINVAL,
> +		.msg = "request has insufficient size",
> +	},

It took me a while to realize that this is a request with .size set to
0, which is obviously rejected as invalid. Maybe it should be called
request_zero_size instead.

Also there is quite a bit more errors we can trigger, looking at
statmount kernel syscall we can easily trigger at least:

- param > 0 && param <= MNT_UNIUQE_ID_OFFSET -> EINVAL
- spare != 0 -> EINVAL
- nonexisting mnt_ns_id -> ENOENT

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
