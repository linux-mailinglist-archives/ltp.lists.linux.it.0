Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEA8627AEB
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Nov 2022 11:48:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5987E3CD221
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Nov 2022 11:48:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0BEC83C0796
 for <ltp@lists.linux.it>; Mon, 14 Nov 2022 11:48:43 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4DCF9200759
 for <ltp@lists.linux.it>; Mon, 14 Nov 2022 11:48:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 334C61FE62;
 Mon, 14 Nov 2022 10:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1668422922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R3XXGMQal2TweUmgl3Py34vOpouSJrqVvm6VljZDOJ0=;
 b=j6eAHfMkwqzsQzRTpxKADPhWkk3VoVaNrKaPe2Xm0FAgS3tR7C2pAhxCpHUyaNTyFiiND1
 y2ULCIkLgKE8cT4BajUAwWYTetAIOAHvPzrI+EMgmMaUEofQdlhELoxT9YF6Tb3GfsKtYz
 8lsoiz+yQPQ65eow6plErO3QfIW5FCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1668422922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R3XXGMQal2TweUmgl3Py34vOpouSJrqVvm6VljZDOJ0=;
 b=T5J6FNxFBiqKhf6JdSSa5OCW+0shiw86B08oVzNyQqCHDqliYDdbPtFz3qJTf6B5TiYH8t
 aHIIzwsE4Iu9kjBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 229C113A8C;
 Mon, 14 Nov 2022 10:48:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id R78YBwodcmNRZgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 14 Nov 2022 10:48:42 +0000
Date: Mon, 14 Nov 2022 11:50:05 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Y3IdXcWbV/svAUWl@yuki>
References: <20221027215808.4126148-1-edliaw@google.com>
 <20221027215808.4126148-2-edliaw@google.com>
 <8735atww9l.fsf@suse.de> <87y1slvgkm.fsf@suse.de>
 <Y25+IZDZ9/rvSH+E@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y25+IZDZ9/rvSH+E@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 1/1] mmapstress01: refactor to tst_test
 framework
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> @Metan: I wonder if this can be fixed in docparser.

For the time being I would rather keep the structures inline in the
tst_test.

Fixing this in the dumb parser would be doable, but quite an effort. We
would have to start tracking global variables the same way we track
macros.

> @Richie: If not, it would be nice to have check for it (I'll add issue with
> "check" label).

And rewrite to any other system would be even bigger effort. Sounds like
a hackweek project if anyone is interested.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
