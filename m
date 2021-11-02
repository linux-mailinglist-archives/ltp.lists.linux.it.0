Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A124431EA
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 16:40:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 661823C712D
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 16:40:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E4DDB3C1314
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 16:40:02 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E21B21400F2A
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 16:40:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 292E3218F6;
 Tue,  2 Nov 2021 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635867601;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wRSkJ7dWRi1N6P589NLfw/bi7vbjCs32VnpbRhIrhcQ=;
 b=f8rufHbbIzaU4SxKu+aqEFjBsllVqmSp0QBfqcKzQt9wBUpqkCs/JLiwljCkmHX+YO4yIA
 lO+f9JoPDH7Ec2USPqW7HabGzvQDcBanbNuLhTCOJ+ZMJdt6006atp8E1MgM46MUFkUdPz
 e1le7QBdehyGMIftxx5m5K3QXPx93TI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635867601;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wRSkJ7dWRi1N6P589NLfw/bi7vbjCs32VnpbRhIrhcQ=;
 b=qN3PD39fMnWUpWbsjhw4u0x/TweWb7hjHbBZmauwdRYAIj1oaUWdbTyFY8TUJv54YmS2sZ
 cvmk+EiTjBo3XADg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0414713D66;
 Tue,  2 Nov 2021 15:40:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x8ALO9BbgWHxUQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 02 Nov 2021 15:40:00 +0000
Date: Tue, 2 Nov 2021 16:39:59 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YYFbz0LCHPiY+MNB@pevik>
References: <20211101145342.7166-1-chrubis@suse.cz>
 <20211101145342.7166-8-chrubis@suse.cz> <YYFXns53AsnQQg6w@pevik>
 <YYFZLdb91Tz9h6vN@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYFZLdb91Tz9h6vN@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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

> Hi!
> > ltp.git/metadata $ make
> > HOSTCC metadata/metaparse
> > ltp.git/metadata/parse.sh > ltp.json
> > ltp.git/metadata/parse.sh: line 33: ltp.git/metadata/../docparse/docparse: No such file or directory
> > # => OK let's go to docparse and make first

> The docparse build should be triggered from the metadata directory,
> since the ltp.json has to be generated first.

> But I have forgotten to update the parse.sh script. Have you seen the
> reply to this patch?

I see, thx!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
