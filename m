Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE12D4110AC
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 10:08:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 647043C8640
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 10:08:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5D4EF3C1DDF
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 10:08:43 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B11371A01068
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 10:08:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C5ECF1FE4E;
 Mon, 20 Sep 2021 08:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632125321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j+QW+QBxFWA0WXrI18IAs0z/44xn66rRShrvYMshzgM=;
 b=KM8QW0ngoVPN7pZFnJBVmZsBpZ49b/7EHu2j9mQcMyTyXpyccfS5cUzwN8c4eir29LmwLC
 W3VHaPMDXyn6W+TC562Au+FxS604EQicRsF9PxRBPuJxgfI4G6j6UDoiCd24CB5YmY30zY
 d//X/SK2eYfGxY7+XYArV5BP2ass3Hw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632125321;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j+QW+QBxFWA0WXrI18IAs0z/44xn66rRShrvYMshzgM=;
 b=Ed/2AjEiwmbjJnc33anK145trH6PY5KkLjcXMg8p3MJEn3rHvSiT8Gbyyjusf+8Ug7FhVz
 PqWuyW/QDeC6ruBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B45E613ACC;
 Mon, 20 Sep 2021 08:08:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZAkqKolBSGFLEQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 20 Sep 2021 08:08:41 +0000
Date: Mon, 20 Sep 2021 10:09:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YUhBpt+PEnYjPojN@yuki>
References: <YTim11sKKT8ioZBe@yuki> <YUCPJlim3QFcoibU@yuki>
 <f8854610-bf63-be57-bdb8-e4e16345e34a@jv-coder.de>
 <YUg6smoADvGb+zTI@yuki>
 <714a9a19-d002-26aa-8226-401ab167a805@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <714a9a19-d002-26aa-8226-401ab167a805@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP release planning
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
> >> Late reply, because of my vacation for the last two weeks.
> > That one is already in:
> >
> > https://github.com/linux-test-project/ltp/commit/80659d062575912c6e589d42d53d3259e0f74571
> Sorry, I was only looking for "merged" message on the mailing list. I 
> guess I need another vacation :D

Who doesn't :-).

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
