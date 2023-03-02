Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB356A8A02
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Mar 2023 21:07:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2BB23CCE03
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Mar 2023 21:07:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1722A3CB9CF
 for <ltp@lists.linux.it>; Thu,  2 Mar 2023 21:07:47 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 317E11400053
 for <ltp@lists.linux.it>; Thu,  2 Mar 2023 21:07:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9DFBB1FFA2;
 Thu,  2 Mar 2023 20:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1677787666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=637cRAvIgPQsmtQe0IOOyfylxjbjoS67R0hdocuyXaM=;
 b=kfjItMwUhoqEz8Sb2CMrL11Vx4dDJriqBRida4YRBbA6wIqkSDu3ANSCDttEnCb0rWvldE
 ht5PfnIelOLOPPoM48CTHt0B9xOtbUeYbYarF7X9i68lK3mBaHzCL6snYSH+1RJ9hzz7Sl
 IayVux4A3OGAfG6sDyOZi4AEUWEe8O0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1677787666;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=637cRAvIgPQsmtQe0IOOyfylxjbjoS67R0hdocuyXaM=;
 b=iiZIMAdksSeMU3MrumTBNxLO4z/dUGvdTTEmDIam0sefb9LWUdyYcWCyKrTRIY7dvv6j+O
 5iBe8Ec46wgz66DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CDF113349;
 Thu,  2 Mar 2023 20:07:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id h9vCFBICAWRuDwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 02 Mar 2023 20:07:46 +0000
Date: Thu, 2 Mar 2023 21:09:10 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZAECZhVuBCX2WTl7@yuki>
References: <20230301193332.27694-1-Liam.Howlett@oracle.com>
 <20230302141956.GA20234@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230302141956.GA20234@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] mprotect: Add mprotect05 testcase
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
Cc: ltp@lists.linux.it, "Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Add a test that uses mprotect to split and combine VMAs.  Created to
> > ensure the correctness of the VMA iterator after a bug report.
> 
> LGTM, thank you.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> ...
> > +/*\
> > + * [Description]
> > + *
> > + *	Testcase to check the mprotect(2) system call split and merge
> > + *
> > + * Reference links:
> > + *  - https://bugzilla.kernel.org/show_bug.cgi?id=217061
> This would be formatted as inline in our docs.
> > + *
> > + */
> > +
> > +#include <errno.h>
> > +#include <stdio.h>
> These aren't needed.
> 
> Waiting little longer for any feedback before merging with the diff below.

Can we also add a git tag to the test? It looks like fix is in mainline
in:

commit 2fcd07b7ccd5fd10b2120d298363e4e6c53ccf9c
Author: Liam R. Howlett <Liam.Howlett@oracle.com>
Date:   Fri Feb 24 16:20:55 2023 -0500

    mm/mprotect: Fix successful vma_merge() of next in do_mprotect_pkey()


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
