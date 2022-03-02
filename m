Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC654CA9A2
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Mar 2022 16:50:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96C503CA30F
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Mar 2022 16:50:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4664A3C9FE9
 for <ltp@lists.linux.it>; Wed,  2 Mar 2022 16:50:58 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8CEC9600F89
 for <ltp@lists.linux.it>; Wed,  2 Mar 2022 16:50:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A112A2198B;
 Wed,  2 Mar 2022 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646236256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0uq268kelTY7J8/FNu5uzfriLwC2GCfH7VBQN+cYpa4=;
 b=GsU9V8NaguhhzWuGXbNn/apet8UFpiG0k2Ctl5yA1baHqrisjOmYCP17Rm8pGav8rTgssO
 yPNRPabk6P9G/sLCykngFpg9uj5uPXB42xxdLzYE3OANM3EjzoEg5CA/UjCT/Ri2yUoXe5
 f0nkaQnLB+Q8VO2npDpqrLVhGrca0jM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646236256;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0uq268kelTY7J8/FNu5uzfriLwC2GCfH7VBQN+cYpa4=;
 b=4b9TDHFc+aiuGqk26Tp+kVDURNNGJtlWIE9WOLe71b0OC4RjLk1mPFI1MUf0eY5Qasp7BW
 RsTqg+vvvBsHh6Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88B1E13A84;
 Wed,  2 Mar 2022 15:50:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uTWZIWCSH2JkIQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 02 Mar 2022 15:50:56 +0000
Date: Wed, 2 Mar 2022 16:53:16 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yael Tzur <yaelt@google.com>
Message-ID: <Yh+S7JD2q8oalRoM@yuki>
References: <20220223200731.1859670-1-yaelt@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220223200731.1859670-1-yaelt@google.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/keyctl09: test encrypted keys with
 provided decrypted data.
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
Cc: linux-integrity@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
The test looks good to me now.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Looking at the kernel counterpart it is still in the next tree. We
usually wait until the kernel functionality is part of a kernel release
in order to make sure that there are no changes done to the
kernel-userspace API.

I this case I guess that in this case the change is so minimal that we
can add this test into LTP once it reaches Linus tree.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
