Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBEB8B3548
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Apr 2024 12:30:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A2253D004C
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Apr 2024 12:30:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B5D9E3CE531
 for <ltp@lists.linux.it>; Fri, 26 Apr 2024 12:29:58 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 220F11A0BC41
 for <ltp@lists.linux.it>; Fri, 26 Apr 2024 12:29:57 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A210D5CF19;
 Fri, 26 Apr 2024 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1714127396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VMCen2riFhckCBkDmEZZ6glyUyji2dcgNfklsOVzxKE=;
 b=W8sBHpbM4T3EPWeNGkPyqWL3/4Talw1h7GibNcwULOaSkOpikJPOzXWeerfuvhQIYd4qzK
 rc0tiYSmsXg8Q9Qn7Zu1Ts3aAFHa4cSMV3dphsVuG+QU5rjZEFpxmJYU/qCkVcnZUmldxo
 3VEiosxuhHg20qJKVrEeIqoXNrvhdoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1714127396;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VMCen2riFhckCBkDmEZZ6glyUyji2dcgNfklsOVzxKE=;
 b=XlY0s9hkzz0BqZv0dH09avVSQAUh0VZ9i2mzb/Ds/FR6WxJscNGDANUZUnp2vjcITIYjb+
 UIYOTHsMOFxDRPBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1714127396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VMCen2riFhckCBkDmEZZ6glyUyji2dcgNfklsOVzxKE=;
 b=W8sBHpbM4T3EPWeNGkPyqWL3/4Talw1h7GibNcwULOaSkOpikJPOzXWeerfuvhQIYd4qzK
 rc0tiYSmsXg8Q9Qn7Zu1Ts3aAFHa4cSMV3dphsVuG+QU5rjZEFpxmJYU/qCkVcnZUmldxo
 3VEiosxuhHg20qJKVrEeIqoXNrvhdoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1714127396;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VMCen2riFhckCBkDmEZZ6glyUyji2dcgNfklsOVzxKE=;
 b=XlY0s9hkzz0BqZv0dH09avVSQAUh0VZ9i2mzb/Ds/FR6WxJscNGDANUZUnp2vjcITIYjb+
 UIYOTHsMOFxDRPBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 925F0136DB;
 Fri, 26 Apr 2024 10:29:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bxGeIiSCK2aPNAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 26 Apr 2024 10:29:56 +0000
Date: Fri, 26 Apr 2024 12:28:59 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: =?utf-8?B?6Lev5paQ?= <lufei@uniontech.com>
Message-ID: <ZiuB6-9qKfhXrRzg@yuki>
References: <20240419070717.2506101-1-lufei@uniontech.com>
 <20240421071539.2547355-1-lufei@uniontech.com>
 <Zitniv9NFio-HOGo@yuki> <tencent_42AB1A7801A243DA5A5D51C0@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_42AB1A7801A243DA5A5D51C0@qq.com>
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWO(0.00)[2]; TO_DN_ALL(0.00)[]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] (no subject)
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I tried using NULL, but met `TBROK: Test killed by SIGSEGV!`.&nbsp;

That means that the manual page is wrong and the address is not ignored.

> And the last time you mentioned in response to using
> `supported_archs`, this seems not work properly by now, the ltp
> document(section of writing_tests) says "not applicable".

The supported_archs is supposed to work. How did you set it (the value)
and what happened?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
