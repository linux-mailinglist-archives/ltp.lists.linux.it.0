Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A354ABFB5
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Feb 2022 14:35:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 934233C9AA5
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Feb 2022 14:35:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F296B3C06C4
 for <ltp@lists.linux.it>; Mon,  7 Feb 2022 14:35:44 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CC2B01A00456
 for <ltp@lists.linux.it>; Mon,  7 Feb 2022 14:35:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F07951F37F;
 Mon,  7 Feb 2022 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644240942;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G69Q2rNSoVj6J2ME8SSeL6AY3udcWTIFLVLQW2cCGAQ=;
 b=UTh16G0dbUOuz6JvvMP3d6dO15s15yWYxHL0ghnRGjJkrwL1yYw9meLw4gwK8sFfD1EzVT
 AP57tMGogxxshyzL/O/Oa7lAF+8W+61ljAkSsWtbKVOGY1vSAzbSAmn97OXrWfyRu5j132
 8bB8dFPc1nfgePSqnFjX7VSxzxi28+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644240942;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G69Q2rNSoVj6J2ME8SSeL6AY3udcWTIFLVLQW2cCGAQ=;
 b=GCtEMXGhg+dJsW14BH5iEfgbwT9BKhAa9uxH5gZ1GF330dWgQSb1w26XdI7nPPkwfFS0Sc
 bBC+u/bsVkSmzCBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A462413C00;
 Mon,  7 Feb 2022 13:35:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GtciJS4gAWKGJgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 07 Feb 2022 13:35:42 +0000
Date: Mon, 7 Feb 2022 14:35:40 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YgEgLNIjGOWEhEK4@pevik>
References: <20220203061222.625948-1-amir73il@gmail.com>
 <YgDsIaf5z2rg5tCH@pevik>
 <CAOQ4uxiba8GE9PtBbX5jWYTia4z_nJNvciBUB_SpTw2YjtjrDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxiba8GE9PtBbX5jWYTia4z_nJNvciBUB_SpTw2YjtjrDA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/inotify: New test for IN_DELETE
 regression
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
Cc: Ivan Delalande <colona@arista.com>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> Your fixes look fine to me.

> > Suggest to apply with this changes (unless if worth to compare nevents ==
> > CHURN_FILES).

> I wouldn't worry about this - it's not related to the regression that
> we are testing.

Thanks for your ack, going to merge with just proposed changes.

Kind regards,
Petr

> Thanks,
> Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
