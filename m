Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D33CA41AC9
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2025 11:23:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0ECBE3C98E4
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2025 11:23:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E60223C090A
 for <ltp@lists.linux.it>; Mon, 24 Feb 2025 11:22:49 +0100 (CET)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3E59D1BD5BFF
 for <ltp@lists.linux.it>; Mon, 24 Feb 2025 11:22:48 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3814C1F385;
 Mon, 24 Feb 2025 10:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1740392568;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a05ktJSnka5fO6OdYEhLVc4as7b+EIgBHVgl1Zz50ic=;
 b=IOr7YaXJ/r45220u+HVmYInG7Vaza8WRA10TgtTbyFWvyG1UkxJ9dX3JvGj5GzT7TzyC/9
 bDhToAywAkggK487r5vQKjZLknln2m/ihbBcGwr7GM687cx8HtFoZe7mNRhV445zUM4pMk
 77gpdinlsaZFJ7QtTe1Tm2YO+yB7rzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1740392568;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a05ktJSnka5fO6OdYEhLVc4as7b+EIgBHVgl1Zz50ic=;
 b=gu3391klijhh9u4cRRJPQ0eKjUgcDOWVEbyx2ehjtZ07UqDovfPKlvPvXFdMXLksAOUs60
 J03CdWQ23sKLo2Bg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=IOr7YaXJ;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=gu3391kl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1740392568;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a05ktJSnka5fO6OdYEhLVc4as7b+EIgBHVgl1Zz50ic=;
 b=IOr7YaXJ/r45220u+HVmYInG7Vaza8WRA10TgtTbyFWvyG1UkxJ9dX3JvGj5GzT7TzyC/9
 bDhToAywAkggK487r5vQKjZLknln2m/ihbBcGwr7GM687cx8HtFoZe7mNRhV445zUM4pMk
 77gpdinlsaZFJ7QtTe1Tm2YO+yB7rzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1740392568;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a05ktJSnka5fO6OdYEhLVc4as7b+EIgBHVgl1Zz50ic=;
 b=gu3391klijhh9u4cRRJPQ0eKjUgcDOWVEbyx2ehjtZ07UqDovfPKlvPvXFdMXLksAOUs60
 J03CdWQ23sKLo2Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C97913707;
 Mon, 24 Feb 2025 10:22:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HJMWAnhIvGfydQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 24 Feb 2025 10:22:48 +0000
Date: Mon, 24 Feb 2025 11:22:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20250224102242.GB2858881@pevik>
References: <20250224100016.2857704-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224100016.2857704-1-pvorel@suse.cz>
X-Rspamd-Queue-Id: 3814C1F385
X-Spam-Level: 
X-Spamd-Result: default: False [-2.71 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUBJECT_HAS_CURRENCY(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 MISSING_XM_UA(0.00)[]; REPLYTO_EQ_FROM(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.71
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] tst_test: Add $LTP_SINGLE_ITERATION to limit
 variant
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

if accepted, LTP_SINGLE_ITERATION should be mentioned in doc/users/setup_tests.rst.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
