Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0798241D4
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jan 2024 13:34:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B9D93CE6E2
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jan 2024 13:34:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1AFED3CBDFB
 for <ltp@lists.linux.it>; Thu,  4 Jan 2024 13:34:39 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4B2A9201DBF
 for <ltp@lists.linux.it>; Thu,  4 Jan 2024 13:34:38 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 116E5220AB;
 Thu,  4 Jan 2024 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1704371678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o1W0U+Bb/oooZHBZp1o9O6S5n1/Gc6rSd/bLUs/qC0Q=;
 b=S8zNMhVZhVlHVuOHn6pF9TW3MexIg5T89YNF35Qzg7Gl1k5qwzzajJRyK2C6fTmeCponLU
 C4lchQxfy47f6qWPP6jdLp73MHXWqSXSyhgzLYSD1UvSxTAXLzA+efXg4gbLtS/2pInnRN
 p33bd734I25CSYDIE/9l2Zz+4w0C4Wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1704371678;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o1W0U+Bb/oooZHBZp1o9O6S5n1/Gc6rSd/bLUs/qC0Q=;
 b=2nw7Vz7DSFEUwOWs3xdIFvl8fOkvUoxWDHmtDIh1eclc6Q4qX/vQf264C6cc8hgDV3Voc7
 Lei+gZBodV3zANCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1704371678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o1W0U+Bb/oooZHBZp1o9O6S5n1/Gc6rSd/bLUs/qC0Q=;
 b=S8zNMhVZhVlHVuOHn6pF9TW3MexIg5T89YNF35Qzg7Gl1k5qwzzajJRyK2C6fTmeCponLU
 C4lchQxfy47f6qWPP6jdLp73MHXWqSXSyhgzLYSD1UvSxTAXLzA+efXg4gbLtS/2pInnRN
 p33bd734I25CSYDIE/9l2Zz+4w0C4Wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1704371678;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o1W0U+Bb/oooZHBZp1o9O6S5n1/Gc6rSd/bLUs/qC0Q=;
 b=2nw7Vz7DSFEUwOWs3xdIFvl8fOkvUoxWDHmtDIh1eclc6Q4qX/vQf264C6cc8hgDV3Voc7
 Lei+gZBodV3zANCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECFEF137E8;
 Thu,  4 Jan 2024 12:34:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7gUnON2llmV/HAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 04 Jan 2024 12:34:37 +0000
Date: Thu, 4 Jan 2024 13:35:03 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZZal905JgrW0ns_E@yuki>
References: <ZZQHPkwg-W2R1ejJ@yuki>
 <20240104122647.GB1146860@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240104122647.GB1146860@pevik>
X-Spam-Level: *
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.19 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.cz:+]; MX_GOOD(-0.01)[];
 TO_DN_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[42.99%];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=S8zNMhVZ;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=2nw7Vz7D
X-Spam-Score: 0.19
X-Rspamd-Queue-Id: 116E5220AB
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP Release preparations
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > If you have any patches that should be reviewed before the release,
> > please let me know.
> 
> Could anybody have look on:
> 
> * swapon01: Test on all filesystems
> https://patchwork.ozlabs.org/project/ltp/list/?series=377167&state=*
> https://lore.kernel.org/ltp/20231011162428.583911-1-pvorel@suse.cz/
> (already reviewed by Marius)
> 
> * v2 net: tst_netload_compare(): Ignore performance failures
> https://lore.kernel.org/ltp/20240104121001.1155491-1-pvorel@suse.cz/
> https://patchwork.ozlabs.org/project/ltp/patch/20240104121001.1155491-1-pvorel@suse.cz/
> 
> * Cleanup environment variables prefixes (TST_ => LTP_)
> https://lore.kernel.org/ltp/20240104122308.1158487-1-pvorel@suse.cz/
> https://patchwork.ozlabs.org/project/ltp/list/?series=388855&state=*

I will, I'm currently cleaning up github issues and merging stuff that
has been ready and waiting there for quite some time.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
