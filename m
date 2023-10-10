Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C86F57BFD42
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Oct 2023 15:22:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 731003CD68E
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Oct 2023 15:22:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 392BB3C8ACD
 for <ltp@lists.linux.it>; Tue, 10 Oct 2023 15:22:45 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2EF071A0197B
 for <ltp@lists.linux.it>; Tue, 10 Oct 2023 15:22:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C337210EB;
 Tue, 10 Oct 2023 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1696944164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bJvBBQT8/uyJPyM3NMBYOFkF4Fk/m7JTLvpOtw7nozo=;
 b=nZsS9dme73Rhs1t3UPs37v9hzkgfbgM3bIPRlbLFxLdWYJytc6FoxrIL/s0ZTevxbDeHut
 ovsBKZGDDcQl/4DVXGcde9irBX5kmyPzvJV4sMpykenHAyk+/opCNYI/V+mvLkIlCf5kkT
 qVJzOFkvZRSrWtVw8EfafiGUsvHz2i8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1696944164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bJvBBQT8/uyJPyM3NMBYOFkF4Fk/m7JTLvpOtw7nozo=;
 b=eGUPxwsBw0sE6+PcMC3HMfsYHOVic1CYRWuqmibosOIqDIsSImWOAzMcp14mCEvHynxyjS
 3wqQ+WNd99hopvBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16F4B1358F;
 Tue, 10 Oct 2023 13:22:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id StCDAyRQJWV2ZgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 10 Oct 2023 13:22:44 +0000
Date: Tue, 10 Oct 2023 15:23:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <ZSVQTs1WTxz5Bioi@yuki>
References: <20231004124712.3833-1-chrubis@suse.cz>
 <20231004124712.3833-2-chrubis@suse.cz> <87jzruzs6p.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jzruzs6p.fsf@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: Add tst_fd_iterate()
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
Cc: mszeredi@redhat.com, brauner@kernel.org, Jan Kara <jack@suse.cz>,
 Matthew Wilcox <willy@infradead.org>, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I don't wish to over complicate this, but how many potential fd types
> could there be 100, 1000? Some could have complicated init logic.

I'm at 25 at the moment, suprisingly all of them so far are a syscall
with a few parameters, sometimes packed in a struct.

> I'm wondering if at the outset it would be better to define an interface
> struct with name, setup and teardown for each FD type, plus whatever
> other meta-data might be useful for filtering.
> 
> Then instead of a case statement, we put the structs in an array etc.

I guess that we can, but we would have to add some private data area to
the tst_fd, so that we can tear down things cleanly, but we would need
that if we want to convert the tst_iterate_fd() to be iterator-like
anyways.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
