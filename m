Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7437743C6D8
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 11:51:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 308063C68AE
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 11:51:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B31FB3C21FD
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 11:51:15 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3686E1A01A52
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 11:51:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8083D218B0;
 Wed, 27 Oct 2021 09:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635328274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zVQinHEShTtdK7iicFl1g1MI4djDCQXJzhdsOhy1GcE=;
 b=GSD6xFdFet2aX2zpMxvtWgAS2eJGO9/mXsLCWPS1ehwwUj7cyP19V2JBe5RTW3wjrLupG0
 GaeuvjosOb8LLN+Lmj1o7172XuHjJ0rTpPMEh4RYyXXVRTzRpg9G+q0QmnpnsO98KeGhaS
 HwLnqWj3J0kgidihXIGut8O5WJtDQBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635328274;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zVQinHEShTtdK7iicFl1g1MI4djDCQXJzhdsOhy1GcE=;
 b=484uFljUxqKqcJ0zgBLMi4LjgfdatX5Es0zPX/Vh5j/50p22AOXmGJ9jlijTVm8QskVX+g
 5ho+iGhIwQkbRuAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60C8E13B85;
 Wed, 27 Oct 2021 09:51:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OftpFhIheWH8NgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 27 Oct 2021 09:51:14 +0000
Date: Wed, 27 Oct 2021 11:52:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YXkhQ86Oal0KuI0K@yuki>
References: <20211027092027.7124-1-pvorel@suse.cz>
 <YXkfDEFLUkOO+70q@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXkfDEFLUkOO+70q@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] CI: Reenable Tumbleweed
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
> >      container:
> >        image: ${{ matrix.container }}
> >        env: ${{ matrix.env }}
> > +      options: --security-opt seccomp=unconfined
> Alternatively 'options: --privileged' could be used (to run privileged
> container), IMHO does not matter which of these we take.

Looking at docker documentation it looks like --privileged disables much
more than just the seccomp filtering. I do not think that this is a good
idea. Let's go with just disabling seccomp for affected distros.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
