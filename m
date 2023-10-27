Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4797C7D9B3F
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Oct 2023 16:23:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 097033CEB8F
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Oct 2023 16:23:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5BEB23CCA74
 for <ltp@lists.linux.it>; Fri, 27 Oct 2023 16:23:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5D8B61A00F64
 for <ltp@lists.linux.it>; Fri, 27 Oct 2023 16:23:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 90A3821B6C;
 Fri, 27 Oct 2023 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1698416602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TLgX8y37/RquRMerdpAbYt1/1yd6W1Pt00EmJTNVx5o=;
 b=VqLxdbpck694k/VyywTsMdROiM5rGnF5QWtMcK0AED0G9ZmAei0rG2rihHQ4lINJ1F+KXv
 vMKbiQ1XOrI4C1kQDlCiwkeo6Kaa554+Mtn8DoTuNrnY4HnqZP+FiYfDzFDeiDNM4TRDxb
 xBhQoVQKRM5+MUs3NZ/XdSPAS2JDXuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1698416602;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TLgX8y37/RquRMerdpAbYt1/1yd6W1Pt00EmJTNVx5o=;
 b=srGkRoamdwRyDx+uwVJouBJBqKi0q5dmwSO3C8Gh/PFX9Qdjj1XLwwoLUKo8C1Hip8SdF/
 2pu/vaKXOdi/GyBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77C2313524;
 Fri, 27 Oct 2023 14:23:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9BeiHNrHO2WOeQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 27 Oct 2023 14:23:22 +0000
Date: Fri, 27 Oct 2023 16:23:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZTvH_DptjIrZJx-A@yuki>
References: <20231027104951.32464-1-rpalethorpe@suse.com>
 <20231027110116.GA649751@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027110116.GA649751@pevik>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.73
X-Spamd-Result: default: False [-4.73 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-1.13)[88.55%]
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cpuset: Make mount failure TCONF
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > It appears that if the subsystem is available under V2 then mounting
> > the V1 can fail. Probably when the V2 has processes assigned to a
> > group it controls.
> 
> Sounds likely, but it would be good to check this in the kernel code or with
> kernel cgroup developers.

I'm pretty sure that controller can be used either in v1, or in v2 but
not from both at the same time by choice. Some of the changes between v1
and v2 are incompatible so this couldn't work either way.

I think that once the controller name is written to
/sys/fs/cgroup/unified/cgroup.subtree_controll mounting it to v1 should
fail, so maybe we should just try to grep the fail instead and exit the
test with TCONF if we found the controller bound to v2 already.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
