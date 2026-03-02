Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJjVCCl8pWm6CAYAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 13:01:45 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C48B61D7FED
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 13:01:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 454343D7704
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2026 13:01:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B94AF3CF08F
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 13:01:34 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5044F600AA1
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 13:01:34 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE47F5BD34;
 Mon,  2 Mar 2026 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772452893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NRPFy8Gb0URtLINwnPswlJQqGAzy2Fdhyjj1owP6mG0=;
 b=pyelfoxg91tbCoXz8qhzBLfHUbfQvLhgU0GKh5ieT8y7jeeDi8f2V8ryUP8G4LTfmDPmq4
 IpNSxS3Jsvhym6UBolpSqwL0EbHrrqobmgyeSS+28hw4XJWaxq9BazK5k+z6Wcc31a0Til
 4629ULSgAjsyoJHjLG2d+WDFZBAHwDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772452893;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NRPFy8Gb0URtLINwnPswlJQqGAzy2Fdhyjj1owP6mG0=;
 b=mRJ6gZev8eA50kxiO9Vx8WCfSimjsc4y1uT8TJNuuzmOS2kw8WMLeF6osejSatWDGOA7QG
 nefl51L4v34dWwDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772452893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NRPFy8Gb0URtLINwnPswlJQqGAzy2Fdhyjj1owP6mG0=;
 b=pyelfoxg91tbCoXz8qhzBLfHUbfQvLhgU0GKh5ieT8y7jeeDi8f2V8ryUP8G4LTfmDPmq4
 IpNSxS3Jsvhym6UBolpSqwL0EbHrrqobmgyeSS+28hw4XJWaxq9BazK5k+z6Wcc31a0Til
 4629ULSgAjsyoJHjLG2d+WDFZBAHwDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772452893;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NRPFy8Gb0URtLINwnPswlJQqGAzy2Fdhyjj1owP6mG0=;
 b=mRJ6gZev8eA50kxiO9Vx8WCfSimjsc4y1uT8TJNuuzmOS2kw8WMLeF6osejSatWDGOA7QG
 nefl51L4v34dWwDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEE783EA69;
 Mon,  2 Mar 2026 12:01:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ddfFKR18pWlhGgAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 02 Mar 2026 12:01:33 +0000
Date: Mon, 2 Mar 2026 13:01:43 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <aaV8Jz9uILMKTA_J@yuki.lan>
References: <20260123-stream_refactoring-v1-0-281b85f6ab02@suse.com>
 <20260123-stream_refactoring-v1-3-281b85f6ab02@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123-stream_refactoring-v1-3-281b85f6ab02@suse.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 3/6] fs: rewrite stream02 test using new API
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,suse.cz:email,yuki.lan:mid]
X-Rspamd-Queue-Id: C48B61D7FED
X-Rspamd-Action: no action

Hi!
> +	for (size_t i = 0; i < ARRAY_SIZE(modes); i++) {
> +		stream = SAFE_FOPEN(FILENAME, modes[i]);

This will TBROK instead of TFAIL if the open fails.

Maybe we need:

#define TST_EXP_PASS_PTR_NULL(SCALL, ...) \
	TST_EXP_PASS_PTR_(SCALL, #SCALL, NULL, ##__VA_ARGS__)

So that we can use that as:

	TST_EXP_PASS_PTR_NULL(fopen(FILENAME, modes[i]);

	if (TST_PASS)
		SAFE_FCLOSE(TST_RET_PTR);

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
