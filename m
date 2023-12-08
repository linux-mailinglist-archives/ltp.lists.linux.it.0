Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09483809DF8
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Dec 2023 09:16:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2C0A3CBA67
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Dec 2023 09:16:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4143E3CB9E5
 for <ltp@lists.linux.it>; Fri,  8 Dec 2023 09:16:22 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E5A792010FD
 for <ltp@lists.linux.it>; Fri,  8 Dec 2023 09:16:21 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 898E01FDB4;
 Fri,  8 Dec 2023 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1702023380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sNaX8Jd0tVQz+KZNncpZr5fXHyz7msb9hu+p0qdhP5E=;
 b=b8m/QVo+VxVmz2964mc6K06Wzw/P83x3dNmGWaUncKW/BJYOEZdIxIcW56qcgBQcywIxru
 LiNP91zeJ/cSpfJVZRDnGz/Is4tK+gj4Bn7RLF1QXiMxfsoLz0b0eCVN7TqfDRMP5M/7iR
 dosidCf/NAVu5Y+BsxlKKIaljP1x3nU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1702023380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sNaX8Jd0tVQz+KZNncpZr5fXHyz7msb9hu+p0qdhP5E=;
 b=CFkgzNSemgRYjoUoR5FlIFNNB2WynhwwABvOPXcY7ecqkk7SS0xVLCL6GoZyQTXtkORqBy
 rKFjDzDIfIP8KTCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1702023380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sNaX8Jd0tVQz+KZNncpZr5fXHyz7msb9hu+p0qdhP5E=;
 b=b8m/QVo+VxVmz2964mc6K06Wzw/P83x3dNmGWaUncKW/BJYOEZdIxIcW56qcgBQcywIxru
 LiNP91zeJ/cSpfJVZRDnGz/Is4tK+gj4Bn7RLF1QXiMxfsoLz0b0eCVN7TqfDRMP5M/7iR
 dosidCf/NAVu5Y+BsxlKKIaljP1x3nU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1702023380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sNaX8Jd0tVQz+KZNncpZr5fXHyz7msb9hu+p0qdhP5E=;
 b=CFkgzNSemgRYjoUoR5FlIFNNB2WynhwwABvOPXcY7ecqkk7SS0xVLCL6GoZyQTXtkORqBy
 rKFjDzDIfIP8KTCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74AF512FF7;
 Fri,  8 Dec 2023 08:16:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id S20XGNTQcmU3ewAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 08 Dec 2023 08:16:20 +0000
Date: Fri, 8 Dec 2023 09:17:11 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <ZXLRB46ZqzBN6laS@yuki>
References: <20231207212739.302374-1-pvorel@suse.cz>
 <20231207212739.302374-3-pvorel@suse.cz>
 <CAASaF6yheXD4w07K1xUVXrqoS6jdX6PUjG64UXQbE_hQR9cW7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6yheXD4w07K1xUVXrqoS6jdX6PUjG64UXQbE_hQR9cW7w@mail.gmail.com>
X-Spam-Level: 
X-Spam-Score: 0.26
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.94
X-Spamd-Result: default: False [-0.94 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.14)[68.21%]
X-Spam-Flag: NO
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] lib: Add support for TDBUG tst_res() flag
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
> My first impression was it's some kind of new BUG type :-)
> I'd suggest making it TDEBUG or TDBG.

Naming things is hard, I suppose that the least confusing is probably
the full spelling, i.e. TDEBUG. I suppose that having it one letter
longer is not a big deal.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
