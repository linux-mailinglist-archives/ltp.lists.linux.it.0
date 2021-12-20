Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C393D47B401
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Dec 2021 20:54:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F27C3C91A8
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Dec 2021 20:54:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 309523C9192
 for <ltp@lists.linux.it>; Mon, 20 Dec 2021 20:54:41 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 709D760013B
 for <ltp@lists.linux.it>; Mon, 20 Dec 2021 20:54:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8587A218FE;
 Mon, 20 Dec 2021 19:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640030080;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FmoP5KYbhjhkLalWYDpXKKyMQn7mDbMlrqwbEStQuRw=;
 b=OCY0wbio65m8b4bat3p1y8HXndzDz8FjSIwsDfwnKMo+jdEDlN7htpb8fsL4V3jBdg4tY6
 pnNxJIuiYa5JmIwQl+enYlaDbzaIz424fj6yPKDs+koVrY45rCqqALkfntsj5dFwq+ZtNk
 +A5T8BejT5fyEuA0KW8xMhdBdfWhTQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640030080;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FmoP5KYbhjhkLalWYDpXKKyMQn7mDbMlrqwbEStQuRw=;
 b=Xo6KuOyqeAMmmPb2z+0jg2PsQFPjjiOhmO+fjTo7ZJeJXf4aF+dzNLQBc2FbmgKjXPaFfg
 sy3wcKGHVFspdGAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4DE9213DBD;
 Mon, 20 Dec 2021 19:54:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DHSzEIDfwGEjJgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 20 Dec 2021 19:54:40 +0000
Date: Mon, 20 Dec 2021 20:54:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: sujiaxun <sujiaxun@uniontech.com>, ltp@lists.linux.it
Message-ID: <YcDffj8+zqY3SNCz@pevik>
References: <20211217062637.29720-1-sujiaxun@uniontech.com>
 <YbxUx8mz7ejCjp7W@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YbxUx8mz7ejCjp7W@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [v2,
 1/2] syscalls/sched_get_priority_max01: Convert to new
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

Hi sujiaxun,

merged. Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
