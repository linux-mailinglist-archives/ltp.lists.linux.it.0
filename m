Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 546D96E8E5F
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Apr 2023 11:41:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2C513CBF7F
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Apr 2023 11:41:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 841003C288D
 for <ltp@lists.linux.it>; Thu, 20 Apr 2023 11:41:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DE99B6002E8
 for <ltp@lists.linux.it>; Thu, 20 Apr 2023 11:41:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D46F219DB;
 Thu, 20 Apr 2023 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1681983710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9rj52wue4tfeqqiqhf+nScAb7kYaFAWT5lJy9kjCofI=;
 b=ky6A5/JIdr+qTtJLsrwaqdV3r76KOWorsc/5lsvgSWeFro+cmMYuXqAGCndrZ3gQ7b0foY
 hUUxF/mPkR17H0CdfpYAFNwvQog0FlTTX+lKCMMMA69/G9xyXbPOXz4YCFjGMwuB6q+cNV
 mCwXjsZBqr9nX4lFQwxN0/5CLoDPd3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1681983710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9rj52wue4tfeqqiqhf+nScAb7kYaFAWT5lJy9kjCofI=;
 b=ZrqoGU/1271p11zU/yRwN7bQ4BQU/6MKarvPR4gL+84C+wzBrsQbrnEbsT1OaJfRHvnZIM
 wZVwzzg6f91Zl7Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1EEF113584;
 Thu, 20 Apr 2023 09:41:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r22nBt4IQWRpGQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 20 Apr 2023 09:41:50 +0000
Date: Thu, 20 Apr 2023 11:42:53 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <ZEEJHWcnXLgTGrf6@yuki>
References: <20230413054952.14607-1-akumar@suse.de> <ZD/P71dlmvBbRhpb@yuki>
 <6279343.jONZJM60Ip@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6279343.jONZJM60Ip@localhost>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] getpgid01.c: Rewrite using new LTP API
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
> > Actually I did remmmeber that we do have TST_EXP_PID() which should be
> > more fitting here, since getpgid() returns a PID. Do you agree with
> > changing these in the two tests before applying?
> Ah, I missed finding that. Please apply in both tests.

Applied, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
