Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D737563E9
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jul 2023 15:11:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74AFE3CEB77
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jul 2023 15:11:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CFC7D3C999C
 for <ltp@lists.linux.it>; Mon, 17 Jul 2023 15:11:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B20C6600ECD
 for <ltp@lists.linux.it>; Mon, 17 Jul 2023 15:11:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 00E5A21961;
 Mon, 17 Jul 2023 13:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689599489;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NsLwY5BZpUVQ3/QhX9w76XXyNP0gu23Bya+524Grqr8=;
 b=uTFvrTBKO1W9FWllNblpLeYfEoTlmzTnndFj9xbl2Rq9dnPRRyQM6IYP6gcCJxGqUruzUt
 N/0hoFu8anriHXgg0mtRlfjpS/o81orHMvHJfJxtEoIjRy3Bwq0syLj9JErGJnS/rs/En8
 AexnJygH5Juv2FMLoyhj/QO5L8llKsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689599489;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NsLwY5BZpUVQ3/QhX9w76XXyNP0gu23Bya+524Grqr8=;
 b=eG3u9vfEsQJBW19pRL6aTpIlelnWx2GGqROBtbw3Nq+mjwL2pei7MNhsS9mjyLd4eOIRl0
 WZBkhF4qotDcYOCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B5A3813276;
 Mon, 17 Jul 2023 13:11:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5FDHJQA+tWQ+RAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 17 Jul 2023 13:11:28 +0000
Date: Mon, 17 Jul 2023 15:11:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Yang Xu (Fujitsu)" <xuyang2018.jy@fujitsu.com>
Message-ID: <20230717131127.GA1124942@pevik>
References: <1688637954-17765-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1688637954-17765-2-git-send-email-xuyang2018.jy@fujitsu.com>
 <20230707090148.GC571797@pevik>
 <11e524a2-c775-b68e-aa05-29b50fe6e38b@fujitsu.com>
 <4ede938a-64f1-33aa-f4ba-5c88dade0371@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ede938a-64f1-33aa-f4ba-5c88dade0371@fujitsu.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/geteuid02: Convert into new api
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> Hi Petr,

> Kindly ping,

I'm sorry, I thought I replied, but obviously I forget.
Go ahead and merge, please.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> This case references getuid03,
> the URL for providing modification suggestions is as follows:
> https://patchwork.ozlabs.org/project/ltp/patch/20211109085745.21531-2-tangmeng@uniontech.com/

Thanks for this info.

Kind regards,
Petr
...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
