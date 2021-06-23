Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB53B192F
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:43:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3AB73C6FDA
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:43:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B20FD3C2E72
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:43:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 28348200759
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:43:46 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 72DE01FD65;
 Wed, 23 Jun 2021 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624448626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+AtNOYHflFJ82SBAC/3EG5DgDKjDdgQlj6ZXjKuqYQ=;
 b=K7wCd9swKTX7o7ZCEYcIgqMhlccFOz+jTuGYgTs4ldasVIt8vP0rqlgbtV9NQddg9HJFHD
 /96mA4FJm+Rv9DcOUgZmA5pMF+oBoFw63o4NAhFS2F/LrBI62UXG8MNvILg/MMe1Wy5H4w
 s4fVGGQ72uTaYjX97miLjK63myyfFjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624448626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+AtNOYHflFJ82SBAC/3EG5DgDKjDdgQlj6ZXjKuqYQ=;
 b=nr4fj1i3lfQdoK54rR175y088R6LaDHzHpMk3aC/l+/iyNnO25826TOrFroiM9nfFgsX6z
 /06QN4OJcmTT14DQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 504B111A97;
 Wed, 23 Jun 2021 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624448626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+AtNOYHflFJ82SBAC/3EG5DgDKjDdgQlj6ZXjKuqYQ=;
 b=K7wCd9swKTX7o7ZCEYcIgqMhlccFOz+jTuGYgTs4ldasVIt8vP0rqlgbtV9NQddg9HJFHD
 /96mA4FJm+Rv9DcOUgZmA5pMF+oBoFw63o4NAhFS2F/LrBI62UXG8MNvILg/MMe1Wy5H4w
 s4fVGGQ72uTaYjX97miLjK63myyfFjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624448626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+AtNOYHflFJ82SBAC/3EG5DgDKjDdgQlj6ZXjKuqYQ=;
 b=nr4fj1i3lfQdoK54rR175y088R6LaDHzHpMk3aC/l+/iyNnO25826TOrFroiM9nfFgsX6z
 /06QN4OJcmTT14DQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id xDZOEnIe02CCBAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 23 Jun 2021 11:43:46 +0000
Date: Wed, 23 Jun 2021 13:18:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YNMYc6EiyQrvl7Ss@yuki>
References: <20210622111440.74722-1-krzysztof.kozlowski@canonical.com>
 <YNMOr/9X8J3NaAMZ@yuki>
 <7e086a3e-afd5-7b54-e04f-2db7893f3778@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e086a3e-afd5-7b54-e04f-2db7893f3778@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/msgstress03: fix fork failure on
 small memory systems
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
> > This is quite generic functionality so we may as well put it into the
> > include/tst_pid.h and lib/tst_pid.c as tst_get_pids_limit().
> 
> Sure, I can move it there.
> 
> > And we do already have tst_get_free_pids_() in there so we can substract
> > that as well if applicable to make it a bit more precise.
> 
> I can just merge the code into tst_get_free_pids_(). It's basically the
> same purpose - how many processes can we have more.

Yes actually that would make a lot of sense.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
