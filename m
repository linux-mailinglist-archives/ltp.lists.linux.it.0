Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32619A03F81
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2025 13:42:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F18213C0890
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2025 13:42:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4C0913C07B9
 for <ltp@lists.linux.it>; Tue,  7 Jan 2025 13:42:34 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3CB5314139D8
 for <ltp@lists.linux.it>; Tue,  7 Jan 2025 13:42:33 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9B409210F4;
 Tue,  7 Jan 2025 12:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736253752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JP2TIEl38ziYtoB4zpylNiZDEs8kyxbMe/LVCQscbvM=;
 b=yvnWCfdGCNwdupWs16JE7OMcUe+nePijq8m28UZZjp5bSK9aqhNFhb989EQeI5bx+GCBs/
 AGKAiyvRyMhGgM9HcsyiRE0S2AfifanyVo7iIf7tQFg04VK9j7d6l4GlMEKaZ5+UA8WCjf
 N7OWBxMYjUBpB7Phk4g7XAF/v8eR40c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736253752;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JP2TIEl38ziYtoB4zpylNiZDEs8kyxbMe/LVCQscbvM=;
 b=A//eNsv3711O0TdX3NDA/wT9fyB6twz9yUXvb9GSkmatJNN02wIXjNO2ly90drcsHTMkTW
 AVv8SKCxcqipa1AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736253752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JP2TIEl38ziYtoB4zpylNiZDEs8kyxbMe/LVCQscbvM=;
 b=yvnWCfdGCNwdupWs16JE7OMcUe+nePijq8m28UZZjp5bSK9aqhNFhb989EQeI5bx+GCBs/
 AGKAiyvRyMhGgM9HcsyiRE0S2AfifanyVo7iIf7tQFg04VK9j7d6l4GlMEKaZ5+UA8WCjf
 N7OWBxMYjUBpB7Phk4g7XAF/v8eR40c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736253752;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JP2TIEl38ziYtoB4zpylNiZDEs8kyxbMe/LVCQscbvM=;
 b=A//eNsv3711O0TdX3NDA/wT9fyB6twz9yUXvb9GSkmatJNN02wIXjNO2ly90drcsHTMkTW
 AVv8SKCxcqipa1AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BF8813763;
 Tue,  7 Jan 2025 12:42:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pCPoGzghfWddEwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 07 Jan 2025 12:42:32 +0000
Date: Tue, 7 Jan 2025 13:42:18 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <Z30hKu11NUNI_uaJ@yuki.lan>
References: <CAEemH2cXL8yu0jhHz7wefvBbDGy-wXcz8Mw1JZv8FqLAXHKm9Q@mail.gmail.com>
 <Z3gGuFHey5qgQ__6@yuki.lan>
 <CAEemH2cawEE9=-3=QUScg+K4JYe5hqhYMtUManS_8JsBfG30AQ@mail.gmail.com>
 <Z3vII4tENjV4G6GQ@yuki.lan> <20250106125255.GC302614@pevik>
 <Z3vc-PafjaXVIcRJ@yuki.lan> <20250106153624.GB323533@pevik>
 <Z3wCr3LG_ztyQYHj@yuki.lan>
 <CAEemH2c28ob0=3tq94i7AiwFZW0EyGnb=WAP3P3Qftwb6hLkuw@mail.gmail.com>
 <CAEemH2c_PLCAg4ScxCgbDvFYORfsR3R-xw5-dEWxhzdrNvmp9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c_PLCAg4ScxCgbDvFYORfsR3R-xw5-dEWxhzdrNvmp9w@mail.gmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] lib: multiply the timeout if detect slow
 kconfigsD
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
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Ah, you mean we multiply the overall test time limit results->timeout,
> right?
> e.g.
> 
>     results->timeout =  (default_30s_timeout + tst_test->timeout) *
> TIMEOUT_MUL + tst_test->runtime * RUNTIME_MUL;
>     if (tst_has_slow_kconfig())
>             results->timeout *= 4;

That would work too, but since the runtime will be always constant (once
only the test that call tst_remaning_runtime() use runtime and the rest
of the tests is moved to timeout) we may as well multiply the timeout
part.

However this detail does not matter that much, the most imporatant part
is the clear separation of the guessed upper bound and the actual
runtime that is used to controll how long should the loop in the test
spin.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
