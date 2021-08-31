Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB1F3FC26E
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 08:09:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4EDA3C9A44
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 08:09:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 08E4C3C013D
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 08:09:52 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EF11A10009E6
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 08:09:51 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E495C22069;
 Tue, 31 Aug 2021 06:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630390190;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rZ7i+9iISzg5cwEfjfYfwSW6XoRbo+A+ckENe8ja1RA=;
 b=zQDB9AYjZK0GT5cTOHRTXhZC6GNGaJaKmgXHTTlRWMpVWyRZwzXpefut7/ek7LE+jpQG99
 0ZYC+OHBQ32HJ5QGtCopJcd6wC5iJMNKIrPcgiRK+RIWA1qJIKezKO2vudzWH35QyzSeGg
 aVlwIz4P+1PSHLS6EVy2FYHiw+fNk3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630390190;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rZ7i+9iISzg5cwEfjfYfwSW6XoRbo+A+ckENe8ja1RA=;
 b=VXCBuRxTmT9/39uLs/tIw3s5qqzCQhDwL1kf1gLlzAmZ0ebf3BFX3NxY+PnQJvKGG03OQK
 ytPXq+xmjp5/aADQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AEDFA13299;
 Tue, 31 Aug 2021 06:09:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id fUsXJ67HLWFBOAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 31 Aug 2021 06:09:50 +0000
Date: Tue, 31 Aug 2021 08:09:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YS3Hnn6b4QAWAaPa@pevik>
References: <20210827123254.16883-1-pvorel@suse.cz> <YSjhgaJE3v8odUhF@pevik>
 <YSzYSkufvSNNwZQP@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSzYSkufvSNNwZQP@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] scripts: Remove legacy script tests
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

> Hi!
> > and I suppose, we could remove also detect_distro.sh (we have lsb-release
> > nowadays) and git2changelog.sh (we write release notes manually).

> Looks good.
Thanks, merged!

I'll send another patch to remove detect_distro.sh and git2changelog.sh.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
