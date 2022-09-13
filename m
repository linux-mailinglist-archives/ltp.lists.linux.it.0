Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 150235B693F
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 10:12:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CAF1E3CAAEA
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 10:12:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9AD3D3C01CC
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 10:12:40 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 33304601323
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 10:12:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 713525BFA9;
 Tue, 13 Sep 2022 08:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663056759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zIBuabKt+ZcaTlByUF76lg1u2DZWf/aXJljzy+h4ye8=;
 b=AQdVDNxXfyWeBDdYnbZA5xZs2sMAi2FOmDyNaZ4d27TMa+54OAlgFIS1MU4qc9RbqY2ou6
 VGTQVr604/R88CQsWBrER1kep47RxMeNueHnxoH8JBx/rY2hM0gC2GQQ6j6y56wrkYruPl
 8OFBxYUoKbk/tZIB9p55gwGfA4MlJEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663056759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zIBuabKt+ZcaTlByUF76lg1u2DZWf/aXJljzy+h4ye8=;
 b=+oEvAANwnsnFFpQD8Zq3oOQ8oSAkhUyIle2UBcdzNnLp8Y2Emy8zNmpij/BUKRwGxa8Fne
 Orp5+wJRdRTMlTAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E47F13AB5;
 Tue, 13 Sep 2022 08:12:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Sci7FXc7IGN0EgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 13 Sep 2022 08:12:39 +0000
Date: Tue, 13 Sep 2022 10:14:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YyA763/Rx1Do8DHx@yuki>
References: <20220909141840.18327-1-pvorel@suse.cz>
 <20220909141840.18327-6-pvorel@suse.cz> <Yx9JPQimBEpXFa4+@yuki>
 <Yx+YtBZOKje6FbWS@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yx+YtBZOKje6FbWS@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 05/10] tst_supported_fs: Support skip list when
 query single fs
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
> > Shouldn't this one go before the addition of the functionality to the wrapper used by shell?
> Do you mean to put this ("tst_supported_fs: Support skip list when query single
> fs") before the previous ("tst_supported_fs: Implement skip list")?

Yes, as far as I can tell this commit implement function that is called
from the previous patch.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
