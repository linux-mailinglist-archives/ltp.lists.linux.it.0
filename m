Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7C4AC4A1E
	for <lists+linux-ltp@lfdr.de>; Tue, 27 May 2025 10:23:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B45873C5372
	for <lists+linux-ltp@lfdr.de>; Tue, 27 May 2025 10:23:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 23F8F3C0294
 for <ltp@lists.linux.it>; Tue, 27 May 2025 10:23:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 22FEA600867
 for <ltp@lists.linux.it>; Tue, 27 May 2025 10:23:46 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48C531F7F9;
 Tue, 27 May 2025 08:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1748334226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G0qazEqthBEoILc1zxWU1MhGPJyJUsz8jmkBBPs2++I=;
 b=0JL6hppXvUbSlKvApHZc4RAodqWxODfxTK5Ygum04jtSg0QwRYNGHgIBbx7MPOSRPQkkiL
 daEtDxjmSk16rtTKbG5ncwtzX9ZzGsp+L3o844e+HJh0J3tGVYXCLM/5qf5UfuSiqxge8w
 4+ISN3Ap/EGT2I5jSjpUrtITavB36Hk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1748334226;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G0qazEqthBEoILc1zxWU1MhGPJyJUsz8jmkBBPs2++I=;
 b=/XcH6aNYqVn70b9ZlE+kMNVIJ+GvQrfS5lDD6UwmNINWS+cPqeFxs8ptGy5YttXqD2slmM
 2IxHRCIanm8Ep7DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1748334226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G0qazEqthBEoILc1zxWU1MhGPJyJUsz8jmkBBPs2++I=;
 b=0JL6hppXvUbSlKvApHZc4RAodqWxODfxTK5Ygum04jtSg0QwRYNGHgIBbx7MPOSRPQkkiL
 daEtDxjmSk16rtTKbG5ncwtzX9ZzGsp+L3o844e+HJh0J3tGVYXCLM/5qf5UfuSiqxge8w
 4+ISN3Ap/EGT2I5jSjpUrtITavB36Hk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1748334226;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G0qazEqthBEoILc1zxWU1MhGPJyJUsz8jmkBBPs2++I=;
 b=/XcH6aNYqVn70b9ZlE+kMNVIJ+GvQrfS5lDD6UwmNINWS+cPqeFxs8ptGy5YttXqD2slmM
 2IxHRCIanm8Ep7DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37AC91388B;
 Tue, 27 May 2025 08:23:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IsReDJJ2NWjbQgAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 27 May 2025 08:23:46 +0000
Date: Tue, 27 May 2025 10:24:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <aDV2pqgZGmKKeJWC@yuki.lan>
References: <20250516151028.1254207-1-wegao@suse.com>
 <20250526143551.1321709-1-wegao@suse.com>
 <20250526095456.GA118123@pevik> <aDRkbKVKCawsnBlR@yuki.lan>
 <20250526161309.GA152789@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250526161309.GA152789@pevik>
X-Spam-Score: -7.30
X-Spamd-Result: default: False [-7.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; NEURAL_HAM_SHORT(-0.20)[-0.996];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] fsconfig04.c: Check FSCONFIG_SET_PATH
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
> Thanks! I forget the rewrite allows this nice syntax.
> 
> We should have (after the release) some examples somewhere (not sure if
> the docs in @filesystems in include/tst_test.h could be extended or we can dare
> to have static page with examples as we had in the old API - might be easier to
> search).

I would say that the documentation for the tst_test structure is already
too long.

> And/or C API tests in lib/newlib_tests/.

Having small C examples in newlib_tests and then rendering them into
examples section into the documentation would be awesome.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
