Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EFB6F46D2
	for <lists+linux-ltp@lfdr.de>; Tue,  2 May 2023 17:14:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 83CB23CB91F
	for <lists+linux-ltp@lfdr.de>; Tue,  2 May 2023 17:14:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 33C7F3CB8A3
 for <ltp@lists.linux.it>; Tue,  2 May 2023 17:14:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B7D75600472
 for <ltp@lists.linux.it>; Tue,  2 May 2023 17:14:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B70151FD6E;
 Tue,  2 May 2023 15:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1683040484;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k4k333RozY+OI7aKIlGfuCXwULxWvi3CDPcyEAD7KD0=;
 b=QPEdZWF3gKu8ihagOE3kTiYDsyDdoNoPSzKgpi9REu4uOO6bnoueNeuXNWYRN9LVH5w4SY
 WLYAtw035S+jtpMqqBBZVd0w9PEiPDeTJH+nHJRqxmkeIVbU8bbO5NTOsZrwg56LVOgxkB
 DnnyARppDxX6HNNdAMbXwQJ8sz4aE6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1683040484;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k4k333RozY+OI7aKIlGfuCXwULxWvi3CDPcyEAD7KD0=;
 b=7O3QY3L4+qkddkuiIPOuZv8ZtdS/J6vlmdp1TVT6fgehyZ+gtwhpbl85MYC6D+HDqKQpJE
 V9PgBFjWyH5ZtMDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98092134FB;
 Tue,  2 May 2023 15:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TXwGJOQoUWToGgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 02 May 2023 15:14:44 +0000
Date: Tue, 2 May 2023 17:14:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
Message-ID: <20230502151457.GA3677937@pevik>
References: <ZEjsKC6ESB1+mM0H@rei>
 <20230502143711.GA3665733@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230502143711.GA3665733@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP release preparations
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

Also this one should be merged:

* nfs08.sh: Skip on vfat
https://patchwork.ozlabs.org/project/ltp/patch/20230502151348.3677809-1-pvorel@suse.cz/

> * IMHO Martin's KVM patchset should be merged
> https://patchwork.ozlabs.org/project/ltp/list/?series=351921&state=*

> * nfslock01.sh: Don't test on NFS v3 on TCP
> https://patchwork.ozlabs.org/project/ltp/patch/20230502075921.3614794-1-pvorel@suse.cz/
> => IMHO should go in to increase NFS tests stability

> * NFS: test on all filesystems
> https://patchwork.ozlabs.org/project/ltp/list/?series=352840&state=*

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
