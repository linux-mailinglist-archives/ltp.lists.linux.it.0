Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7F2BC1DF3
	for <lists+linux-ltp@lfdr.de>; Tue, 07 Oct 2025 17:11:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26BF33C5556
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Oct 2025 17:11:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D7FBD3C5556
 for <ltp@lists.linux.it>; Tue,  7 Oct 2025 17:10:58 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4C85C200934
 for <ltp@lists.linux.it>; Tue,  7 Oct 2025 17:10:57 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6D9151F788;
 Tue,  7 Oct 2025 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759849857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YRW7X0hgK5PCDtPNY74wtZOH2YO2wr44MCYb5p6BQVA=;
 b=kaxQH5IJyNmPM8fFJvcqlrBWAZg15buJpSooGkfW0cqzxbtjdiAf0EYARlz0h8QdabO/kT
 T4VP9T6pCqRDZgcVtPyiiuAi6c/Ujic+A/3Jgrd5PzsbIqBNzcYPCDoeze9k4TRyUvMVdB
 59L7vzE9bmLQHcMmS463u3h+HI7WVfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759849857;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YRW7X0hgK5PCDtPNY74wtZOH2YO2wr44MCYb5p6BQVA=;
 b=Kvl0HwNOutm8GWsk5vogVJv8mkq/vL3OfOOA17b8r1bYl+utxpOR4kEldxZGe+A2k0wF3X
 id0KcMTerG65TSCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759849857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YRW7X0hgK5PCDtPNY74wtZOH2YO2wr44MCYb5p6BQVA=;
 b=kaxQH5IJyNmPM8fFJvcqlrBWAZg15buJpSooGkfW0cqzxbtjdiAf0EYARlz0h8QdabO/kT
 T4VP9T6pCqRDZgcVtPyiiuAi6c/Ujic+A/3Jgrd5PzsbIqBNzcYPCDoeze9k4TRyUvMVdB
 59L7vzE9bmLQHcMmS463u3h+HI7WVfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759849857;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YRW7X0hgK5PCDtPNY74wtZOH2YO2wr44MCYb5p6BQVA=;
 b=Kvl0HwNOutm8GWsk5vogVJv8mkq/vL3OfOOA17b8r1bYl+utxpOR4kEldxZGe+A2k0wF3X
 id0KcMTerG65TSCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C43113693;
 Tue,  7 Oct 2025 15:10:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mSh2FoEt5WjeSQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 07 Oct 2025 15:10:57 +0000
Date: Tue, 7 Oct 2025 17:11:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <aOUts89VLGU3uMoq@yuki.lan>
References: <20251007-xattrat-v2-0-bf458fa66358@suse.com>
 <20251007-xattrat-v2-5-bf458fa66358@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251007-xattrat-v2-5-bf458fa66358@suse.com>
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email]
X-Spam-Level: 
X-Spam-Score: -8.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 05/10] setxattr03: add setxattrat variant
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
>  	if (!TST_RET) {
>  		tst_res(TFAIL, "%s succeeded unexpectedly", tc[i].desc);
> @@ -143,10 +156,15 @@ static void setup(void)
>  	if (set_append_on(append_fd))
>  		tst_brk(TBROK | TERRNO, "Set %s append-only failed",
>  			APPEND_FILE);
> +
> +	tmpdir_fd = SAFE_OPEN(tst_tmpdir_path(), O_DIRECTORY);

Here as well. Maybe we should use AT_FDCWD in one test and return value
from SAFE_OPEN(".", O_DIRECTORY) in the other, so that we test different
codepaths in the kernel.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
