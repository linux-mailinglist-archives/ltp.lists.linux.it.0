Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C944AAC902B
	for <lists+linux-ltp@lfdr.de>; Fri, 30 May 2025 15:27:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28C793C9298
	for <lists+linux-ltp@lfdr.de>; Fri, 30 May 2025 15:27:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 301713C9298
 for <ltp@lists.linux.it>; Fri, 30 May 2025 15:27:48 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5E13E1400777
 for <ltp@lists.linux.it>; Fri, 30 May 2025 15:27:47 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BFB7C21CA6;
 Fri, 30 May 2025 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1748611666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5nC+0fv0sKDl/zG7NRZlB7bYMJ3GFFePe2278bGh3k=;
 b=gcBXaMuYZEDAcKMdwh+XfX5q2T0ZrcDB1QeG45r9fCrisma9MchhYOurDZTXhCw8BRkjjM
 m2fX7RqLU37Nk+3OI39ZpxivVm8ftuNsZJinA2EAl6amCOWygrGMZngIjT/cOHvO6TvNXX
 9GotuOlj/55O6V1lU45YvienK1rPT0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1748611666;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5nC+0fv0sKDl/zG7NRZlB7bYMJ3GFFePe2278bGh3k=;
 b=TCYAa+h8ye9xIIHtqpQx5DhscI9wnNoDCkbTNzEn0pmz5Yrmg6oVhoUbflyfhHKMMJdmqy
 ff0qwYT6Ii6fn0Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1748611666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5nC+0fv0sKDl/zG7NRZlB7bYMJ3GFFePe2278bGh3k=;
 b=gcBXaMuYZEDAcKMdwh+XfX5q2T0ZrcDB1QeG45r9fCrisma9MchhYOurDZTXhCw8BRkjjM
 m2fX7RqLU37Nk+3OI39ZpxivVm8ftuNsZJinA2EAl6amCOWygrGMZngIjT/cOHvO6TvNXX
 9GotuOlj/55O6V1lU45YvienK1rPT0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1748611666;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5nC+0fv0sKDl/zG7NRZlB7bYMJ3GFFePe2278bGh3k=;
 b=TCYAa+h8ye9xIIHtqpQx5DhscI9wnNoDCkbTNzEn0pmz5Yrmg6oVhoUbflyfhHKMMJdmqy
 ff0qwYT6Ii6fn0Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE18413889;
 Fri, 30 May 2025 13:27:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rHEKKVKyOWhxNwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 30 May 2025 13:27:46 +0000
Date: Fri, 30 May 2025 15:28:08 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <aDmyaH-IeNlo9E9b@yuki.lan>
References: <20250530-fix_irqbalance-v1-1-6509384f52db@suse.com>
 <aDmWlN_BJxhQsUJS@yuki.lan>
 <42cacf3d-148a-46f9-9044-3c573779a8b9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42cacf3d-148a-46f9-9044-3c573779a8b9@suse.com>
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] irq: informative TINFO for irqbalance01 result
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
> > This looks like an abuse of the tst_res() interface. I would have kept
> > the TFAIL message as it was and added the hints with tst_printf(), which
> > is used in the test to print debug information anyways.
> 
> The debug information is useful, but the error message is really vague, 
> even if correct.
> The meaning of the patch is to add information so the user knows what's 
> going on, even if he/she doesn't know the test really well.

That's why I suggested to print the hints with tst_printf() instead of
tst_res().

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
