Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE37DF658
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Nov 2023 16:26:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A90623CE993
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Nov 2023 16:26:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 547593CBEF6
 for <ltp@lists.linux.it>; Thu,  2 Nov 2023 16:26:41 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D43C410009A3
 for <ltp@lists.linux.it>; Thu,  2 Nov 2023 16:26:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C99051F8C1
 for <ltp@lists.linux.it>; Thu,  2 Nov 2023 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698938799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzDpKMtA2T+lpRTem/VFNifIbqR2J82oWfv2cWpbfeo=;
 b=miHzAZTmD0FVHGwi6DWM7CU/AVgd/qgMmEE+Bl34RJhs/k1Qigt/BS4jt09I5594j44K7b
 m5c6R5edXkKMcp4UcSID5qpCdx2hjvcu3Lxa7pI8k14kTlRySm7OjfN+3AvcdW0BTr7S/b
 sIXAs0dGoZ7CpryxZX30xt+KwK11wnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698938799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzDpKMtA2T+lpRTem/VFNifIbqR2J82oWfv2cWpbfeo=;
 b=MrRcZUt2YKMXUdFj1O3ev08I6MAtck5SYRwRK8Ivc7lLOWAd5z2f4pJQ/J6vuxEb9ZGnc7
 Ry0uzB6ljmxrVeAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF2AD13584
 for <ltp@lists.linux.it>; Thu,  2 Nov 2023 15:26:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iFS1Ka+/Q2WOLQAAMHmgww
 (envelope-from <mkittler@suse.de>)
 for <ltp@lists.linux.it>; Thu, 02 Nov 2023 15:26:39 +0000
From: Marius Kittler <mkittler@suse.de>
To: ltp@lists.linux.it
Date: Thu, 02 Nov 2023 16:26:39 +0100
Message-ID: <3276161.44csPzL39Z@linux-9lzf>
In-Reply-To: <ZUOjeXGrVZizSLBi@yuki>
References: <20231026114716.17545-1-mkittler@suse.de>
 <1880149.tdWV9SEqCh@linux-9lzf> <ZUOjeXGrVZizSLBi@yuki>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v9 4/4] Extend ioctl02 to test termio and termios
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Am Donnerstag, 2. November 2023, 14:26:17 CET schrieb Cyril Hrubis:
> And that what macros are for, avoiding repetitive parameters, my
> soulution would be to add a macro that just prepares the parameters
> for the function and then keep all the code in a function, i.e.
> 
> #define CMP_ATTR(term_exp, term, attr) \
>         cmp_attr((term_exp)->attr, (term)->attr, #attr)

That makes sense and turned out to be a very good suggestion, indeed. I 
implemented this change and could even apply it to the other macro (after a 
bit of simplification). I pushed this change as a new patch set because the 
preceding patches of this one have already been merged.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
