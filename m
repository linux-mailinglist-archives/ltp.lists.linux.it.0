Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4D2AA8EB1
	for <lists+linux-ltp@lfdr.de>; Mon,  5 May 2025 10:58:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 675093CBF45
	for <lists+linux-ltp@lfdr.de>; Mon,  5 May 2025 10:58:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 78D883CB252
 for <ltp@lists.linux.it>; Mon,  5 May 2025 10:58:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 68E901A007F0
 for <ltp@lists.linux.it>; Mon,  5 May 2025 10:58:47 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7CE3821291;
 Mon,  5 May 2025 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1746435525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GxAlI1o6wsZNtat9IeMBYuzuDFdxw0bZa0mPzHsHLRw=;
 b=unapHl4sllc5dQ/Q1SEQlngZn/NpCvGHwt3ryNcdCbT6/RLzJfQvsP6BKzACl1Q7cUbql0
 IKjggltkGA9kg/VAT+jvon7j7QxaCiolw9FO/TUYia9x3QYj/SxVo5eM21hY3oRE/1cGdU
 fuQWwH41zQU+Rr4/azpb+k4PlVBjbx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1746435525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GxAlI1o6wsZNtat9IeMBYuzuDFdxw0bZa0mPzHsHLRw=;
 b=yn0iRvVwPQfJFn+323SLkr2vPyvUaZ6NP/yyAg1q43e3Yxazg0sDv6Jvl2PR34Pydxf6p3
 j0KX+ngMriqWStDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1746435524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GxAlI1o6wsZNtat9IeMBYuzuDFdxw0bZa0mPzHsHLRw=;
 b=oOvG5H51aUdCNa0JPAQPGqxCA93VvP3K58loHPb+tQtPI5j6pKuK3OtnmurGYTwMLUV+Ba
 +ND3A8/qvMVeWdDuSgku6mrta5D4LnMT3Q9s+nuTTCrN8B88cmqTGkQfhk17ZzoOkSO7vO
 ObEOI3fcfeqzCUhl1wmkKdToaYK2iwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1746435524;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GxAlI1o6wsZNtat9IeMBYuzuDFdxw0bZa0mPzHsHLRw=;
 b=WO3JS2FQ1BLnkerfph4MtUACxMljVAeBJ+U7lKjscunpJcZuWDLAJviqR1MZ3SqeK4TwG8
 nVvWKcmXu97IrSBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A5011372E;
 Mon,  5 May 2025 08:58:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +UU2GcR9GGhKYwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 05 May 2025 08:58:44 +0000
Date: Mon, 5 May 2025 10:57:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <aBh9Z4QA2YcdOFq1@rei.lan>
References: <20250429052247.GA144682@pevik> <aBSVO8uOE86UGIcp@yuki.lan>
 <4428939d-dc71-488b-9728-030accaca3e8@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4428939d-dc71-488b-9728-030accaca3e8@suse.cz>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,rei.lan:mid];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[rei.lan:mid, imap1.dmz-prg2.suse.org:helo,
 suse.cz:email]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP in valgrind :)
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
> > It also opens some interesting questions, i.e. how do we make comparing
> > results from two different tests easier. Currently they grep the test
> > results for a summary, but maybe we can do better.
> 
> One option is to extract all TPASS/TFAIL/TWARN/TBROK/TCONF messages, 
> discard any message contents past the file:line header and then compare 
> whether the sanitized output is identical. That'll take care of random 
> values in the output while ensuring that the test went through the same 
> code paths as before. We could provide a sanitizer script for that.

Maybe we can even add an option to the test library to supress the
messages in output, that would be fairly simple.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
