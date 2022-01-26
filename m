Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ABE49CC9A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jan 2022 15:44:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E22563C970D
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jan 2022 15:44:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A3ED3C8D84
 for <ltp@lists.linux.it>; Wed, 26 Jan 2022 15:44:50 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 918401A00FBC
 for <ltp@lists.linux.it>; Wed, 26 Jan 2022 15:44:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C00AD21128;
 Wed, 26 Jan 2022 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643208288;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2bHF1yWz6hbNV9/KEf3kP9Xp4iPmWXuuxesCg71lMAQ=;
 b=L4p5H4W0iLw8mJN9miBzBRCp0SS67V8VOLFBLsUN+z6QVs0BB9jNrYJ9Wdb37TkKPS2grk
 DCQjcf6PuORiCGACNA1kWhf/LpQZL7J6BFDCxScRlSUFZPE1qDzvP5uAP8z6JPFcS/qEqy
 Lbo048mUw7Z5/dIfnTS7TV7sqlu5FUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643208288;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2bHF1yWz6hbNV9/KEf3kP9Xp4iPmWXuuxesCg71lMAQ=;
 b=C0lpoTK+cMcgSDng0RiBh7aXbVfnpecFp7d/1eGeueU48O9XPaICTPQ9vX/aL6ST1lmfHx
 twL1fvqWUdlIERDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8ED9B13E1E;
 Wed, 26 Jan 2022 14:44:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id F6AbIGBe8WEaBwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 26 Jan 2022 14:44:48 +0000
Date: Wed, 26 Jan 2022 15:44:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YfFeXoHL5iTx4QNh@pevik>
References: <20220126141152.6428-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126141152.6428-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib: Rename array used for .all_filesystems
 flag
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

> Although fs_type_whitelist[] is also used for whitelisting with
> .skip_filesystems, the main purpose is to be used for .all_filesystems.

> Thus rename it to all_filesystems[].

NOTE: the main purpose of this change is to increase code readability.
https://lore.kernel.org/ltp/CAEemH2fNfFes-eUtiQKX9JJxqEQUQ+O5nWQM8G-yNyTo8sxviw@mail.gmail.com/

That's why I added doc.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
