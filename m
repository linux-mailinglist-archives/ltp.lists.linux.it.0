Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CABF6A0484
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Feb 2023 10:10:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8DBE3CBB8E
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Feb 2023 10:10:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 327E73CB01D
 for <ltp@lists.linux.it>; Thu, 23 Feb 2023 10:10:39 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 37F1E1000A2B
 for <ltp@lists.linux.it>; Thu, 23 Feb 2023 10:10:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 237C62047B;
 Thu, 23 Feb 2023 09:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1677143436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PnemGsQ4c/gPC+URHmS6PHL7AGfzNmcIBoLnhw9IeSA=;
 b=yi015y2Z+bFfsbSqe5+lZkswAwluzmIWOSkeVkmXhScVhhJSUwZU8qJw7mV63F/9+9VXuI
 VyzgwknHZjNhfOhB3+U7aJI1xoeKy4dT5jml+XHvotZG9L9itzcdatPeyBQmydiyLTI6j3
 t4pij9nAaMpgPeKKO4C7eRRjgljoHA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1677143436;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PnemGsQ4c/gPC+URHmS6PHL7AGfzNmcIBoLnhw9IeSA=;
 b=qlPLg2wKgzs4hzn89xri2PIwRsdMIkTo7kQ6Sd4cGyj3mxbhCzSsnLQtpu1j2u8ogkH9D/
 /8e6EfmxIV8BpYAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE191139B5;
 Thu, 23 Feb 2023 09:10:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PsH/NYst92N+XwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 23 Feb 2023 09:10:35 +0000
Date: Thu, 23 Feb 2023 10:09:32 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Edward Liaw <edliaw@google.com>
Message-ID: <Y/ctTPK22LgAcHzK@rei.mediaserver.passengera.com>
References: <20230223012839.1857976-1-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230223012839.1857976-1-edliaw@google.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscall01: use 32bit syscalls if available
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> For 32-bit applications, the getuid/getgid syscalls return 16-bit ids,
> and the getuid32 and getgid32 syscalls return 32-bit ids.  When
> CONFIG_UID16 is disabled in the kernel, getuid/getgid (16-bit UIDs) are
> no longer available.  Thus this test will fail when compiled as 32-bit
> and with CONFIG_UID16 disabled.  For 64-bit applications, this is not an
> issue because getuid/getgid return 32-bit ids and getuid32/getgid32 are
> not defined.
> 
> The fix for this is to use getuid32/getgid32 if they are available to
> match the behavior of glibc.

Sounds reasonable, since we are attempting to test syscall() and not the
getuid implementation. Also this probably fixes the case where the test
would be executed with UID that does not fit into 16 bits as well.

Pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
