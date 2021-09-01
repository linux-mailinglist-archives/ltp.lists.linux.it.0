Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C5A3FD492
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 09:41:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBDFB3CAA7C
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 09:41:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B02EB3C4BED
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 09:40:56 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CD8EA601239
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 09:40:55 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE9D720291;
 Wed,  1 Sep 2021 07:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630482054;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0LK4rpNhuKqYdWx+wesuxT+bSH4SSB5sJ2992Pm3bU=;
 b=cNEAnmnusls9JlEnuMFf4ZhvyA4idALv48njktY964fHxtW9lIZFkH76K5b5bMtglO98Vm
 AUdMjKhGbJjSsqu3SQBpZVCVlGgkjdi1lm4wmZ3ESqwoVbJjR+nBBxcf7WDmEQo1nwO6Ur
 nXFSh9+2ZQttdfjFTORyCxWRBoYVKb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630482054;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0LK4rpNhuKqYdWx+wesuxT+bSH4SSB5sJ2992Pm3bU=;
 b=cmjpzD8Ck3qoKUKU5RE4gK/finBbRUewvctwUNSA0Q+Vf62R1r7dS8VRJBDIjnBHZMzdbY
 s7om7nnkgE6DwTBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 94E6713996;
 Wed,  1 Sep 2021 07:40:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 0eIhIoYuL2H1fQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 01 Sep 2021 07:40:54 +0000
Date: Wed, 1 Sep 2021 09:40:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YS8uhRO5R3RqlMCy@pevik>
References: <20210831122554.14590-1-rpalethorpe@suse.com>
 <20210831122554.14590-2-rpalethorpe@suse.com>
 <YS4lnU77U1oTvxPd@pevik> <YS4sU32QLRZVaaL7@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YS4sU32QLRZVaaL7@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] docs: Fix typo 'entires' -> 'entries'
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie, Cyril,

thanks, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
