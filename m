Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE3A55506
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Mar 2025 19:31:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E5AE3CA0D8
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Mar 2025 19:31:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF74B3C8E8C
 for <ltp@lists.linux.it>; Thu,  6 Mar 2025 19:31:19 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8C3671000463
 for <ltp@lists.linux.it>; Thu,  6 Mar 2025 19:31:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E028E211BA;
 Thu,  6 Mar 2025 18:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1741285877;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/iYOkWBHidRdXCGRjOnZXAorPTiIkQDXH2XJWOnBs2E=;
 b=JQ1iI3SDMyncMLzt9Dx9o8skpayl/eWUypUf/DrISAJ+WG/dyzXUW8R5DQZHkfbcbL75eQ
 F7JlwntI+ryHuE5qCy+zGdTN946qo2AmU2e8T2QAmCCtTE7+VVo0/xm26L8r9gxdPN8kIb
 Y5J7vQwMAywt8r32qfsc93H0z+L6mfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1741285877;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/iYOkWBHidRdXCGRjOnZXAorPTiIkQDXH2XJWOnBs2E=;
 b=CKpA1uTFu6oCLQpk+DPX+ptB8MtIDySAQWAWabpqXyHP07ITeEFPPA6i9Z9j2x7GRI3TDu
 Dng54kmNKB8ycWCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=zCC3EJ0v;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="8/ZczX6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1741285876;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/iYOkWBHidRdXCGRjOnZXAorPTiIkQDXH2XJWOnBs2E=;
 b=zCC3EJ0vALksLqrRg8TieDr7lCaSRr3tQp9RijJf7KaYmQBB5As8i/dKsy/WN3480SZmnZ
 7ZE793KCto5tJrGCewd6OBt7yCN1NY53tDzd93RvjRHoMvHFvgll6H+vGQq8X1UreaFXdU
 36zYg5V7tn3nvZz+oe7IQd+BhpZjQoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1741285876;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/iYOkWBHidRdXCGRjOnZXAorPTiIkQDXH2XJWOnBs2E=;
 b=8/ZczX6a/CV4WU4dzaTf9UcHZPdiAmz3fPqM9on0ZwlVTJJcWmperjDNqBG7Hpz6ZHnele
 TRfRjXDzBHIZyJBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAEE513676;
 Thu,  6 Mar 2025 18:31:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Ow9MLPTpyWeWTgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 06 Mar 2025 18:31:16 +0000
Date: Thu, 6 Mar 2025 19:31:15 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Wei Gao <wegao@suse.com>
Message-ID: <20250306183115.GA219691@pevik>
References: <20240930135809.9300-1-wegao@suse.com>
 <20241209060117.16870-1-wegao@suse.com>
 <20241209060117.16870-3-wegao@suse.com>
 <20250227160450.GE3130282@pevik> <Z8fTRRWqoVU74qh0@wegao>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8fTRRWqoVU74qh0@wegao>
X-Rspamd-Queue-Id: E028E211BA
X-Spam-Level: 
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 URIBL_BLOCKED(0.00)[cpuset_memory_testset.sh:url,suse.cz:dkim,suse.cz:replyto,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+];
 MISSING_XM_UA(0.00)[]; REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.71
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 2/2] cpuset_memory_testset.sh: Remove test6
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Thu, Feb 27, 2025 at 05:04:50PM +0100, Petr Vorel wrote:
> > Hi Wei,

> > > Signed-off-by: Wei Gao <wegao@suse.com>
> > > ---
> > >  .../cpuset_memory_testset.sh                  | 37 +------------------
> > >  1 file changed, 2 insertions(+), 35 deletions(-)

> > You're supposed to remove cpuset_memory_testset.sh entry from
> > runtest/controllers.
> This patch is hack for remove error which happen on our openqa micro test
> product.

> If we need remove full cpuset_memory_testset.sh, i suppose we need convert all
> sub cases within cpuset_memory_testset.sh to c case.

I'm sorry I overlook we convert only test6.

Kind regards,
Petr

> > Kind regards,
> > Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
