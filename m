Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 638B545904A
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 15:34:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35A2E3C8D01
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 15:34:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC9EB3C0D0B
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 15:34:07 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0D9F3200B9C
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 15:34:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2335B218F0;
 Mon, 22 Nov 2021 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637591646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YUx1FrId5RWALv0Fw7xvXOz2x9vJRW7FAp0yeHennL8=;
 b=LKnp9pQFcRJt6uLqPW4jbzRuh9toKuPhuCAP1KSzoG7xmt/Jgxf3S1TL1vltkDujNfkW8N
 0Fx64KOtsKBc27lwgOq23JDZT0hHH2f0LutrRWm56dzFwRn5kkPqRGgLZ1LnLzR65fVP8r
 EbUTOE4jW05Wkiod4r8H4OjtaF8aJp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637591646;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YUx1FrId5RWALv0Fw7xvXOz2x9vJRW7FAp0yeHennL8=;
 b=ow35gLBV3OBTKfIbmw5MjDhFSd/ZZVUG3sgF73qirh2nH5QMSCXPmycg3d4G6GRvNmcir7
 KT0ZvlGIP08AYdCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CC3C13B44;
 Mon, 22 Nov 2021 14:34:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9EBWAV6qm2GMdwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 22 Nov 2021 14:34:06 +0000
Date: Mon, 22 Nov 2021 15:35:11 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Ankita Anil Kulkarni <Ankita.AN@exaleapsemi.com>
Message-ID: <YZuqn+GfTlX2sRPB@yuki>
References: <BM1PR01MB46281E563C5D07544F965202FA9F9@BM1PR01MB4628.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BM1PR01MB46281E563C5D07544F965202FA9F9@BM1PR01MB4628.INDPRD01.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] Netns tests failure
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> ???What could be the reason of failure?
> How do I proceed on this issue?
> 
> TBROK: unable to create veth pair devices
> ip: can't find device 'veth0'
> 
> TBROK: don't obtain valid iproute version

That sounds like the ip command is not from the iproute package but
rather than that supplied by busybox or something similar and that it
does not support adding veth pairs.

What does 'ip -V' return for you?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
