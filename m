Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DA58F4431B3
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 16:27:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAB4A3C712C
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 16:27:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 649143C701C
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 16:27:52 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 61E521A00F26
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 16:27:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 806E4212C6;
 Tue,  2 Nov 2021 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635866870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IB7ucg98aV67g/bx/z2/+N1kNLHnsUwhAckJ7mXhuRY=;
 b=sgb/owUZ5D9LDFW2wR5MXTSimS7nb5YJbas1AB5IJDMzArAFCf3XjfiCLnYKaVlUHwnRZC
 4nxiLQMMuP9CkoaDe0MM+ou58d35LDMgaJ5DTz8Z6y0ejPgsFr+2xfAq+HAQYKFnKTe3p9
 WMtf7+3KDFgDVYYNV/h7x1iNB0zWZto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635866870;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IB7ucg98aV67g/bx/z2/+N1kNLHnsUwhAckJ7mXhuRY=;
 b=1Ird3H6asj4/GGPmeMtP59cIl8+2IlCtgqdf0JzYM5GMAACxsYo3LWXew1Tuqv4iomswps
 VmvyOUrHcgzk2uCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6284F13D66;
 Tue,  2 Nov 2021 15:27:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7qPgFvZYgWFjSwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 02 Nov 2021 15:27:50 +0000
Date: Tue, 2 Nov 2021 16:28:45 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YYFZLdb91Tz9h6vN@yuki>
References: <20211101145342.7166-1-chrubis@suse.cz>
 <20211101145342.7166-8-chrubis@suse.cz> <YYFXns53AsnQQg6w@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYFXns53AsnQQg6w@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 7/7] docparse: Split into metadata and docparse
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
> ltp.git/metadata $ make
> HOSTCC metadata/metaparse
> ltp.git/metadata/parse.sh > ltp.json
> ltp.git/metadata/parse.sh: line 33: ltp.git/metadata/../docparse/docparse: No such file or directory
> # => OK let's go to docparse and make first

The docparse build should be triggered from the metadata directory,
since the ltp.json has to be generated first.

But I have forgotten to update the parse.sh script. Have you seen the
reply to this patch?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
