Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6430A443175
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 16:22:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35A3D3C712D
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 16:22:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 417103C701C
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 16:22:10 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B742F60080C
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 16:22:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC8D1212C8;
 Tue,  2 Nov 2021 15:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635866528;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eIfs8o2OYyvojPALYLP8CDJsWdIYv/AFHCGAETRvgo4=;
 b=cGy3BX+uN8FfRT2HrO0B31jvGK/Pp0WQU3K8x7pb3ENXbo0FA2sPRs8txnmHVN9bHFfj5e
 no6xLjbpDB1dGKHPxnHlkfvSjYxBdA9+AsOWgbe3hyP0L8wbn/mnxynDkhZAOufy9eLE6u
 Vm41J/NW8lAF7gsmuPdMOCa51AAAsWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635866528;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eIfs8o2OYyvojPALYLP8CDJsWdIYv/AFHCGAETRvgo4=;
 b=XWawGrb6orcnNAeLTfDRxVQEli82wPwQe90PKDPA64lN60cYuVpzla5ZjCWHf9yF4uZb/w
 aNXVdHGYIOdLRTBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E60D13D66;
 Tue,  2 Nov 2021 15:22:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id H3zhJKBXgWHRSAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 02 Nov 2021 15:22:08 +0000
Date: Tue, 2 Nov 2021 16:22:06 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YYFXns53AsnQQg6w@pevik>
References: <20211101145342.7166-1-chrubis@suse.cz>
 <20211101145342.7166-8-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211101145342.7166-8-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> That way the metadata are build and installed unconditionally as they
> are going to be integral part of the test execution framework.

> The metadata file is also renamed to ltp.json and installed into
> $DESTDIR/metadata/ltp.json.

> The docparse build is triggered from the metadata Makefile since it has
> to be done once the ltp.json is fully generated.
While I agree with this, there is a dependency loop. Or am I missing something?

ltp.git/metadata $ make
HOSTCC metadata/metaparse
ltp.git/metadata/parse.sh > ltp.json
ltp.git/metadata/parse.sh: line 33: ltp.git/metadata/../docparse/docparse: No such file or directory
# => OK let's go to docparse and make first

ltp.git/metadata $ cd ../docparse/
ltp.git/docparse $ make
docparse/testinfo.pl ../metadata/ltp.json
'"' expected, at character offset 294 (before "(end of string)") at docparse/testinfo.pl line 461.
# => OK, let's cleanup docparse first

ltp.git/docparse $ cd ../metadata
ltp.git/metadata $ rm -rf *; git reset --hard
ltp.git/metadata $ cd ../docparse/
ltp.git/docparse $ make
make: *** No rule to make target '../metadata/ltp.json', needed by 'txt'.  Stop.
# => huh, dependency loop?

And indeed CI confirms that:
https://github.com/pevik/ltp/actions/runs/1412787433

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
