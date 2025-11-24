Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F4BC7F88B
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Nov 2025 10:17:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E8493C7B94
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Nov 2025 10:17:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 30CCB3C20B5
 for <ltp@lists.linux.it>; Mon, 24 Nov 2025 10:17:41 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C111D10007AB
 for <ltp@lists.linux.it>; Mon, 24 Nov 2025 10:17:40 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3BBB5BD77;
 Mon, 24 Nov 2025 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1763975860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uYN/dsRlh5LCR7/gk1otSOVWZsqlZC/VfRev8UCVaLc=;
 b=vRmtEXMm/M2jAvmUTed1sk2thyp+Jb8/x4JsZADf5fsJF04WX2RSNJcgJRy5Wz+jafoVg6
 eDKbvr4flsOnIMBmN80kCuRByibr5GXXvyh3ThJOWKMQEi+gDYfSqiooOSM3cxchcXH+hP
 7hWqtYpkGX9UVf6V1sM9X8BQPpXzVC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1763975860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uYN/dsRlh5LCR7/gk1otSOVWZsqlZC/VfRev8UCVaLc=;
 b=6E+sMGwbt9VlHutdVE630K5sPDyLjDEdkcMLHRO57NP9u18FyFt5xMPA5/M/T4Mzt2HQ+8
 vNyvv9poGfVWTaAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1763975860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uYN/dsRlh5LCR7/gk1otSOVWZsqlZC/VfRev8UCVaLc=;
 b=vRmtEXMm/M2jAvmUTed1sk2thyp+Jb8/x4JsZADf5fsJF04WX2RSNJcgJRy5Wz+jafoVg6
 eDKbvr4flsOnIMBmN80kCuRByibr5GXXvyh3ThJOWKMQEi+gDYfSqiooOSM3cxchcXH+hP
 7hWqtYpkGX9UVf6V1sM9X8BQPpXzVC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1763975860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uYN/dsRlh5LCR7/gk1otSOVWZsqlZC/VfRev8UCVaLc=;
 b=6E+sMGwbt9VlHutdVE630K5sPDyLjDEdkcMLHRO57NP9u18FyFt5xMPA5/M/T4Mzt2HQ+8
 vNyvv9poGfVWTaAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E57AD3EA61;
 Mon, 24 Nov 2025 09:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DiYfN7MiJGkBXwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 24 Nov 2025 09:17:39 +0000
Date: Mon, 24 Nov 2025 10:18:33 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <aSQi6XRFfh8ZEEy8@yuki.lan>
References: <20251120163550.333241-1-pvorel@suse.cz>
 <aSBBzVaq4gJ6JfrK@yuki.lan> <20251121104506.GA25561@pevik>
 <aSBQDg8PRXFK8GxB@yuki.lan>
 <CAASaF6x+U0V52-=YVTRj__C7-nTzx-ScfQUCTwPzEmdP=7b1Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6x+U0V52-=YVTRj__C7-nTzx-ScfQUCTwPzEmdP=7b1Kg@mail.gmail.com>
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email]
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] readahead02: Sleep 1.5 msec to fix problem on
 bare metal
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
> If readahead doesn't initiate within those first 5ms, this aborts
> immediately, right?
> I'd use higher value for SHORT_SLEEP, say 50ms or more. That's still small
> overhead for the test.

What about doing 50ms sleep first, then use the 5ms in the loop?


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
