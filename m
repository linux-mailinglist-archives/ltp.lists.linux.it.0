Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AA97A74FF
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Sep 2023 09:56:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F5703CBE45
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Sep 2023 09:56:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D120B3CA5D9
 for <ltp@lists.linux.it>; Wed, 20 Sep 2023 09:56:38 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 46E4E1A00920
 for <ltp@lists.linux.it>; Wed, 20 Sep 2023 09:56:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7D38022676;
 Wed, 20 Sep 2023 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695196597;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iwYvGaibmVneVx8tQ21yhrkpsTmNHUVZ3/1XawEbh1k=;
 b=e7UxOpV/f399Fhx3iBxb64bweGPLKQTNAe9YxsS+vc63RQXEND01GhH1VP32uo8V+yPD9T
 LF72GHInaCduLlhQtKzQvOtKELAonwTQcrUSWN69sDbGa+A1OwbrLig6v2paVQDLuqNVFN
 5w3AtYLTMaowrpfC+HapkHGhjjQuGeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695196597;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iwYvGaibmVneVx8tQ21yhrkpsTmNHUVZ3/1XawEbh1k=;
 b=da72aeVFCU8kULWl+1UotLcqDjWr9oXQu9n0dz5igu3YQ2ztl5k1YQuitZUSQVAUQPklJa
 xUe0nAH5JOyUSzCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56BAA132C7;
 Wed, 20 Sep 2023 07:56:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q7SIE7WlCmUvQwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 20 Sep 2023 07:56:37 +0000
Date: Wed, 20 Sep 2023 09:56:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20230920075635.GA281462@pevik>
References: <20230919083827.8423-1-rpalethorpe@suse.com>
 <a2aa6bf8-2299-daad-2291-750c7db6e143@suse.cz>
 <87sf79ffw9.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sf79ffw9.fsf@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kvm: Fix Nix build failure by moving
 -fno-stack-protector to CFLAGS
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

Hi Richie,

> Hello,

> Martin Doucha <mdoucha@suse.cz> writes:

> > Hi,
> > pvorel should have a look whether it doesn't break the other systems
> > where -fno-stack-protector is needed, but otherwise:

> > Reviewed-by: Martin Doucha <mdoucha@suse.cz>

> Compilation appears to be fine:
> https://github.com/richiejp/ltp/actions/runs/6232857602/job/16916865952

> The tests just TCONF on my hardware, but I guess the risk of breaking
> the test at runtime is low?

I'll test tonight Buildroot toolchains, which usually find errors which aren't
spot by our github CI.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
