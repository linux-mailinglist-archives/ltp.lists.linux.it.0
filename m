Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 919688D3B12
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2024 17:35:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40DC13D0682
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2024 17:35:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6623E3D03E9
 for <ltp@lists.linux.it>; Wed, 29 May 2024 17:34:55 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C7BAB1001F24
 for <ltp@lists.linux.it>; Wed, 29 May 2024 17:34:54 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 138CD22591;
 Wed, 29 May 2024 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1716996893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=crBk3Zkj6pxprkKCIEOEyqy0PWPXSz8zorumCzRfJuw=;
 b=xBv8CozdLPQ4R/C1XPjwDhHm/NbGxVc92tX0DFb7QermvQUFgOa1jp2lMQB8o1n7wSPdU5
 MXGTy1xBkpgcA1raUoZ0hj/DyU8m+tOAi/c7qZv35hlSlWVkAbBWJS1Jy0DkHo9rEeTpda
 5E1D2Ytc7+59+1j1YRFwiOxEC4w8QxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1716996893;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=crBk3Zkj6pxprkKCIEOEyqy0PWPXSz8zorumCzRfJuw=;
 b=vd9W+uRonfbPlQiRwynozRNfEe+mXaUF3xtfIW1Ztk/ZoEii+sY54IqnPJCdPVKqLLWdBp
 JUys7nmgdax/ldCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1716996893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=crBk3Zkj6pxprkKCIEOEyqy0PWPXSz8zorumCzRfJuw=;
 b=xBv8CozdLPQ4R/C1XPjwDhHm/NbGxVc92tX0DFb7QermvQUFgOa1jp2lMQB8o1n7wSPdU5
 MXGTy1xBkpgcA1raUoZ0hj/DyU8m+tOAi/c7qZv35hlSlWVkAbBWJS1Jy0DkHo9rEeTpda
 5E1D2Ytc7+59+1j1YRFwiOxEC4w8QxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1716996893;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=crBk3Zkj6pxprkKCIEOEyqy0PWPXSz8zorumCzRfJuw=;
 b=vd9W+uRonfbPlQiRwynozRNfEe+mXaUF3xtfIW1Ztk/ZoEii+sY54IqnPJCdPVKqLLWdBp
 JUys7nmgdax/ldCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E16DE13A6B;
 Wed, 29 May 2024 15:34:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bES9NRxLV2Y/dgAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 29 May 2024 15:34:52 +0000
Date: Wed, 29 May 2024 17:34:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZldLFAP5vAAecFv8@yuki>
References: <20240527202858.350200-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240527202858.350200-1-pvorel@suse.cz>
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] tst_device: Print info about acquiring device
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
> +	tst_resm(TINFO, "Acquiring loop device %u MB", acq_dev_size);
                         ^
			 Maybe "Preallocating device size=%uMB" ?

Since we are at the file preallocation step at this point in the code.

>  	if (tst_prealloc_file(filename, 1024 * 1024, acq_dev_size)) {
> -		tst_resm(TWARN | TERRNO, "Failed to create %s", filename);
> +		tst_resm(TWARN | TERRNO, "Failed to create %s%s", filename,
> +			 errno == ENOSPC ? " (not enough space in $TMPDIR?)" : "");

I guess that we could print the $TMPDIR value here as well with:

		tst_resm(TWARN | TERRNO, "Failed to create %s", filename);

		if (errno == ENOSPC)
			tst_resm(TWARN, "Not enough space at '%s'?", tst_get_tmpdir())


This leaks the memory though, that's because the tst_get_tmpdir() is ugly
function from the old library...

>  		return NULL;
>  	}
>  
> -- 
> 2.43.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
