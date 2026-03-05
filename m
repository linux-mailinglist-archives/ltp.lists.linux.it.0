Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMrOLWOSqWkqAQEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Mar 2026 15:25:39 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 554472134CB
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Mar 2026 15:25:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C78993D816B
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2026 15:25:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1C5183C2EA3
 for <ltp@lists.linux.it>; Thu,  5 Mar 2026 15:25:35 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7A2AF14001F4
 for <ltp@lists.linux.it>; Thu,  5 Mar 2026 15:25:34 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 65FC83F9D0;
 Thu,  5 Mar 2026 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772720734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8c/x4ZODDF8JWAgrS/fK2pqid6y8dDAiDUweBmjrPFw=;
 b=nl8NcjM88o9Ps6FEVYHycdXYTjQ69Po5yjg1iNKKsQC+BW1iO7bv1QfPK6miZ7n56dD/Kd
 sfc4hMyoZ3k/NccsQsAjbnTJarfOoxk2wB72VKrOhEY7d2U/CI+rlQyh4xw8Hf5GVH5iIM
 +ewVke8zdafzsaqNxU0Bt1A/aX9P5X8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772720734;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8c/x4ZODDF8JWAgrS/fK2pqid6y8dDAiDUweBmjrPFw=;
 b=xpBnyKYNOEHSO9bWNzjJYTHxxq2C0emkOQ3qwBBEU030B+KfHNU3alWZ66I++kWMoa0GOn
 kUuEsLNDPMsf/YCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=nl8NcjM8;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=xpBnyKYN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772720734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8c/x4ZODDF8JWAgrS/fK2pqid6y8dDAiDUweBmjrPFw=;
 b=nl8NcjM88o9Ps6FEVYHycdXYTjQ69Po5yjg1iNKKsQC+BW1iO7bv1QfPK6miZ7n56dD/Kd
 sfc4hMyoZ3k/NccsQsAjbnTJarfOoxk2wB72VKrOhEY7d2U/CI+rlQyh4xw8Hf5GVH5iIM
 +ewVke8zdafzsaqNxU0Bt1A/aX9P5X8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772720734;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8c/x4ZODDF8JWAgrS/fK2pqid6y8dDAiDUweBmjrPFw=;
 b=xpBnyKYNOEHSO9bWNzjJYTHxxq2C0emkOQ3qwBBEU030B+KfHNU3alWZ66I++kWMoa0GOn
 kUuEsLNDPMsf/YCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56D7E3EA68;
 Thu,  5 Mar 2026 14:25:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FKSjFF6SqWl0cQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 05 Mar 2026 14:25:34 +0000
Date: Thu, 5 Mar 2026 15:25:44 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <aamSaHica1WmVDIT@yuki.lan>
References: <20260304161425.12461-1-chrubis@suse.cz>
 <aajhsZYkb9WqTho2@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aajhsZYkb9WqTho2@redhat.com>
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] syscalls: newuname01: Convert to the new library.
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
X-Rspamd-Queue-Id: 554472134CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.650];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.cz:-]
X-Rspamd-Action: no action

Hi!1
> > +	SAFE_FILE_SCANF("/proc/sys/kernel/hostname", "%1023[^\n]", proc_val);
> > +	TST_EXP_EQ_STR(name->nodename, proc_val);
> >  
> > -	tst_parse_opts(ac, av, NULL, NULL);
> > +	SAFE_FILE_SCANF("/proc/sys/kernel/osrelease", "%1023[^\n]", proc_val);
> > +	TST_EXP_EQ_STR(name->release, proc_val);
> >  
> > -	setup();
> > +	SAFE_FILE_SCANF("/proc/sys/kernel/version", "%1023[^\n]", proc_val);
> > +	TST_EXP_EQ_STR(name->version, proc_val);
> 
> We'd better clear proc_val between reads:
> 
>   proc_val[0] = '\0';

I'm looking at safe_file_scanf() code and it calls tst_brkm_() in any
case that no conversion was done. So the buffer should be either be
filled with new data or the test should exit with an error. Do I miss
something?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
