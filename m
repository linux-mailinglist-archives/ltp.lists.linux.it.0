Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B718A3F86A3
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 13:43:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 664683C2F12
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 13:43:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 95B663C2E42
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 13:43:09 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B7E9A100116D
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 13:43:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1D5F222AE;
 Thu, 26 Aug 2021 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629978187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KbYL4O8yRdH194BlFjhAsovOPpH1MrUJVga81u0Im+w=;
 b=L8nxvZJl6ULtiGQxVbsJrYJQNgeRzfb1Y/kmty9xuaWc8Hmf/j0mdZthBZv6bIk33T8NEK
 zmikKn0ByBfyROiZ3thce8rxRr8k3Dmd5A6Kkx4RPuSIiqjzIpHQN0faiOr9ya/FX4icY3
 TYagANn1LF7FhabALv/KmiPGWUPJHH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629978187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KbYL4O8yRdH194BlFjhAsovOPpH1MrUJVga81u0Im+w=;
 b=GkrJVjwWR3x19uRxtSoBi4L72TFSGXT4OB4PDUkLoVg6U0hcrWl/i5Uwhuuw5hLJVPTrQh
 8+ScRpp1QbX/QIBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC420134B0;
 Thu, 26 Aug 2021 11:43:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iZDcMUt+J2EnRAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 26 Aug 2021 11:43:07 +0000
Date: Thu, 26 Aug 2021 13:43:16 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YSd+VBltKIv32SlI@yuki>
References: <20210825104300.15255-1-mdoucha@suse.cz>
 <20210825104300.15255-3-mdoucha@suse.cz> <87k0k9lpld.fsf@suse.de>
 <025997b0-e0a8-d450-e387-f1a2e8a720e9@suse.cz>
 <YSY1oaE3794Asrp8@yuki>
 <57a4f942-a97e-c82b-8a63-1da862eca168@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57a4f942-a97e-c82b-8a63-1da862eca168@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] Add test for CVE 2021-3609
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
> > Then I guess that we have to remove the needs_kconfig before pushing,
> > right?
> 
> Yes, please. I forgot to remove needs_kconfig after rewriting setup()
> and cleanup() 5 times...

Pushed with the namspace requirements removed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
