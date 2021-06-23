Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF3A3B1D28
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:06:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA44E3C945B
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:06:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E482F3C6FD6
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:06:34 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 161BC1A01464
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:06:33 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8DCD01FD36;
 Wed, 23 Jun 2021 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624460793;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UFt3N6Z8DodJZ2Lj7uPHkigZjg0/2dihIlUh26z2XbQ=;
 b=VNoOgtPPXC+cdDevXWynXWvB0Iu4z+TEO03lCXohdvZiXubybTGj2Kr4RRKeDioKFTXche
 RS8/NrY231fMf0IoWomMiPgfphRzyYMez9GCNjftXm+LEYAh7/9GaOv7yqlVZyyg8dJp8R
 r4YlxdQXy3PPqPEakjNCHC9qdSjmIZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624460793;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UFt3N6Z8DodJZ2Lj7uPHkigZjg0/2dihIlUh26z2XbQ=;
 b=iTAugGEG3Ruf8Q41EzDH3eb/IzK/ChNqE5LHlWVOFLFxutdTsE2Djb/JO2Bv032sZsp+G/
 UBk/+3asoFWIeLCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5F12E11A97;
 Wed, 23 Jun 2021 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624460793;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UFt3N6Z8DodJZ2Lj7uPHkigZjg0/2dihIlUh26z2XbQ=;
 b=VNoOgtPPXC+cdDevXWynXWvB0Iu4z+TEO03lCXohdvZiXubybTGj2Kr4RRKeDioKFTXche
 RS8/NrY231fMf0IoWomMiPgfphRzyYMez9GCNjftXm+LEYAh7/9GaOv7yqlVZyyg8dJp8R
 r4YlxdQXy3PPqPEakjNCHC9qdSjmIZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624460793;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UFt3N6Z8DodJZ2Lj7uPHkigZjg0/2dihIlUh26z2XbQ=;
 b=iTAugGEG3Ruf8Q41EzDH3eb/IzK/ChNqE5LHlWVOFLFxutdTsE2Djb/JO2Bv032sZsp+G/
 UBk/+3asoFWIeLCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id wE61FflN02D0cwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 23 Jun 2021 15:06:33 +0000
Date: Wed, 23 Jun 2021 17:06:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YNNN92A2LfT8GhOd@pevik>
References: <20210622161753.32550-1-mdoucha@suse.cz>
 <YNMMoXqTJpDc7LcU@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNMMoXqTJpDc7LcU@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_rtnetlink: pass error codes using
 rtnl_errno variable
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

Hi all,

> Hi!
> This is fine as well.

Merged, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
