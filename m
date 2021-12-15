Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B7447582D
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 12:50:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CD933C8E2B
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 12:50:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 091E03C104E
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 12:50:49 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 19219201094
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 12:50:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 22C0E210F9;
 Wed, 15 Dec 2021 11:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639569048;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1EoIVVgvsJZhc4BRiiuSdkoviF226zqO5/Fn4H0vNf8=;
 b=JuHWa3x2DsDWJc9mkAqadHUjLBrPN3/reX/Y6g26Y8e/E3hgRoLqrQmpOwZVT8vm1EWRRP
 9SPKfyzNTFwDyAftPEX9gljKRlUiOaSSPr6zyBBbqLs0+cUId84mMAfmjV4Yqt4LiBjzKy
 +1xz7JhRfaMbnTwv4dTJqjFtoyfnZ4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639569048;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1EoIVVgvsJZhc4BRiiuSdkoviF226zqO5/Fn4H0vNf8=;
 b=pDW8SW5kcTTNtJTp3T4MM1VkxknUqm9fwIQU2TQMZxsOxNO7oTsCYyFoHGFg+yBg1RBLJb
 b2lUuPVfnQT3OABg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEEBF13B27;
 Wed, 15 Dec 2021 11:50:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jxKgOJfWuWF0HQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 15 Dec 2021 11:50:47 +0000
Date: Wed, 15 Dec 2021 12:50:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YbnWlgK9SLTD2i5B@pevik>
References: <20211213160437.32353-1-andrea.cervesato@suse.com>
 <YbiyhLnljUy2K7Mv@pevik> <Ybi0mHK4s3X7nLlD@yuki>
 <YbjIqypOcAYAnLbl@pevik> <YbnS9OiBV0V0CwuD@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YbnS9OiBV0V0CwuD@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Refactoring dio_append.c using LTP API
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

Hi,

...
> > > That's an O_DIRECT open() EINVAL probably means that O_DIRECT is not
> > > supported. Is your /tmp/ on tmpfs?
> > Yes. As we cannot use SAFE_OPEN() in io_read_eof() [1], there should be check
> > for errno I guess.

> Maybe it would be a bit cleaner to add a check that would attempt to
> open a dummy file in the test setup and exit the O_DIRECT tests before
> they attempt to fork children...
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
